# Struct and `self`

## first arguement with the same type as the struct can be omitted

```zig
const Vec3 = struct {
    x: f64, y: f64, z: f64,
    fn distance(self: Vec3, other: Vec3) f64 {
        // ...
    }
};

// ...
v1.distance(v2);  // self is omitted as v1
v1.distance(v1, v2);  // self can be explicit too
```

## if first arguement is the the type of the struct, the instance cannot call that method

```zig
const Vec3 = struct {
    x: f64, y: f64, z: f64,
    fn print_something() f64 {
        // ...
    }
};

// ...
v1.print_something();  // cannot be called as instance method
Vec3.print_something(); // can be called as static method
```

## two types of methods

- Instance Method: operates on created instance
- Static Method: belongs to the type
