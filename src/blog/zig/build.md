# zig build system

## absolute basic: only `zig build` possible

```zig
const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const exe = b.addExecutable(.{
        .name = "zig_wasm",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
        }),
    });

    b.installArtifact(exe);
}
```

## to make `run` possible, you need to add

### artifact

- where the output should be

```
Think of it like this: When you bake cookies, you
  don't eat them straight from the mixing bowl — you put them on a tray, bake them, then move them to a plate to
  actually eat them. Zig's build system works the same way:

1. zig build compiles your code (baking the cookies)
2. By default, the build system does nothing with the result — it just sits there
3. installArtifact tells Zig: "Hey, take this baked thing and copy it to the right folder so I can actually use it"
   Without installArtifact, zig build compiles your code but doesn't put the final .wasm file (or executable) anywhere
   useful. The "Install step" is just the task of copying files to their final home, and installArtifact adds your
   compiled program to that task list.
```

### run step

- add run artifact: build then run the artifact
- add run step

```zig
const run_cmd = b.addRunArtifact(exe); //NOTE: 만든 걸 run 목록에도 넣는다
const run_step = b.step("run", "Run the app"); // NOTE: 이게 있어야 zig run 이 가능해진다
run_step.dependOn(&run_cmd.step);
```

```
So usually the pattern is:
exe → installArtifact
exe → addRunArtifact → depends on installArtifact
```

```zig
fn stepRun(b: *std.Build, exe: *std.Build.Step.Compile) void {
    const run_cmd = b.addRunArtifact(exe); //NOTE: 만든 걸 run 목록에도 넣는다
    run_cmd.step.dependOn(b.getInstallStep()); // NOTE: 이게 없으면 `zig build run`을 했을 때 zig-out이 만들어지지 않는다.

    const run_step = b.step("run", "Run the app"); // NOTE: 이게 있어야 zig run 이 가능해진다
    run_step.dependOn(&run_cmd.step);
}

```

## test step

## optional step

```zig
    // NOTE: 이걸 하면 타겟을 정할 수 있게 됨
    // 안 하려면 addExecutable에 target = b.host.graph
    const target = b.standardTargetOptions(.{});

    // allow optimization step in cli
    const optimize = b.standardOptimizeOption(.{});
    // zig build -Doptimize=ReleaseSafe
    // zig build -Doptimize=Debug

    const target = b.standardTargetOptions(.{}); // NOTE: 이거 자체가 옵션이다. -Dtarget의 값
    const optimize = b.standardOptimizeOption(.{}); // NOTE: -Doptimize의 값

```

## unnecessary steps

```zig
    // NOTE: only for when you pass custom arguments to cli.
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

```

```zig
    // NOTE: export root.zig as library for others to use
    const mod = b.addModule("zig_wasm", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
    });
```

## main(as mine) vs root(as library for others)

### module related build setting is for root (library)

- it is unnecessary if you are not publishing zig library for others to use

# zig module vs artifact

## tldr: module for zig code ,artifact for c code

### ai answer

- Thought: Defining Artifacts · 2.7s In Zig's build system, Artifacts and Modules represent different stages of the
  compilation and linking process.

1. Artifact (\*std.Build.Step.Compile) An Artifact is a compiled binary output. This is typically a static library (.a,
   .lib), a shared library (.so, .dll), or an executable.

- What it represents: A concrete file that the linker needs to process.
- How it's created: Via b.addExecutable, b.addStaticLibrary, or b.addSharedLibrary.
- Usage: You use it when you need to link code together. For example, Raylib is written in C; you need to link its
  compiled binary into your program so the linker can resolve functions like InitWindow.

2. Module (\*std.Build.Module) A Module is a collection of Zig source files and their configuration. It is the unit of
   compilation that the Zig compiler uses to understand code structure.

- What it represents: Source code and its dependencies. It allows you to use @import("name") in your Zig files.
- How it's created: Via b.createModule.
- Usage: You use it when you want to import Zig code. If a library provides a Zig-native API, it will expose a Module so
  you can access its functions and types directly in your source code. Comparison Table Feature Artifact Module Output
  Binary file (.a, .so, .exe) Compiled into the consumer Primary Tool Linker Compiler Zig Code Action extern fn ...
  @import("...") Build.zig Action linkLibrary(artifact) addImport("name", module) Typical Language C, C++, or
  pre-compiled Zig Native Zig source When do I use which?
- Use an Artifact when:
- You are using a C/C++ library (like the base Raylib).
- You need to resolve symbols that are already compiled.
- The dependency's build.zig uses b.installArtifact.
- Use a Module when:
- You want to use Zig-native code from another package.
- You want to @import a library's types and functions into your .zig files.
- The dependency's build.zig uses b.addModule. In your specific case with Raylib: Raylib is a C library. By linking the
  artifact, you are telling the linker: "Take this compiled C binary and mash it into my executable." If you were using
  a Zig-specific wrapper for Raylib, you would likely use a module to get the @import functionality, and that module
  would internally link the artifact for you.

# backup

## build.zig

```zig
const std = @import("std");
const zemscripten = @import("zemscripten");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const raylib_dep = b.dependency("raylib", .{
        .target = target,
        .optimize = optimize,
    });
    const raylib = raylib_dep.artifact("raylib");

    if (target.result.os.tag == .emscripten) {
        const source_file_path = "src/main_wasm.zig";
        const wasm = b.addLibrary(.{
            .name = "zig-wasm-empty",
            .root_module = b.createModule(.{
                .root_source_file = b.path(source_file_path),
                .target = target,
                .optimize = optimize,
            }),
            .linkage = .static,
        });
        wasm.root_module.linkLibrary(raylib);
        wasm.root_module.addCMacro("PLATFORM_WEB", "");
        wasm.rdynamic = true;

        const emsdk_dep = b.dependency("emsdk", .{});
        wasm.root_module.addIncludePath(emsdk_dep.path("upstream/emscripten/cache/sysroot/include"));

        const emcc_flags = zemscripten.emccDefaultFlags(b.allocator, .{
            .optimize = optimize,
            .fsanitize = false,
        });
        var emcc_settings = zemscripten.emccDefaultSettings(b.allocator, .{
            .optimize = optimize,
            .emsdk_allocator = .emmalloc,
        });
        emcc_settings.put("USE_GLFW", "3") catch unreachable;
        // Optional: add more settings if needed, like shell.html

        const emcc_step = zemscripten.emccStep(b, wasm, .{
            .optimize = optimize,
            .flags = emcc_flags,
            .settings = emcc_settings,
            .install_dir = .{ .bin = {} },
        });

        const activate_emsdk_step = zemscripten.activateEmsdkStep(b);
        emcc_step.dependOn(activate_emsdk_step);

        b.getInstallStep().dependOn(emcc_step);

        const emrun_step = zemscripten.emrunStep(b, b.getInstallPath(.{ .bin = {} }, "zig-wasm-empty.html"), &.{});
        emrun_step.dependOn(emcc_step);
        const run_step = b.step("run", "Run with emrun");
        run_step.dependOn(emrun_step);
    } else {
        const source_file_path = "src/main_native.zig";
        const exe = b.addExecutable(.{
            .name = "zig-wasm-empty",
            .root_module = b.createModule(.{
                .root_source_file = b.path(source_file_path),
                .target = target,
                .optimize = optimize,
            }),
        });
        exe.root_module.linkLibrary(raylib);
        b.installArtifact(exe);

        const run_cmd = b.addRunArtifact(exe);
        run_cmd.step.dependOn(b.getInstallStep());
        const run_step = b.step("run", "Run the app");
        run_step.dependOn(&run_cmd.step);
    }
}

```
