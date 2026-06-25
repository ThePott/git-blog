# accessing with index is moving backward and accessing

## access by index

```c
Projectiles[30].Damage = 60;
```

```zig
projectile_many.damage = 60;
```

## let compiler calculate offset

```c
projectile *ProjectilePointer = Projectiles; // point to first element of array
(ProjectilePointer + 30)->Damage = 100; // from the pointing address, offset 30 projectile amount, then change damage
```

```zig
const projectile_many_pointer: [*]Projectile = &projectile_many; // like slice, but no length. (array is array in zig)
(projectile_many_pointer + 30)[0].damage = 100; // offset 30 amount, and it is still many-pointer, so you need to access 1st element of it
```

## you calculate offset

```c
((projectile *)((char *)ProjectilePointer + 30*sideof(projectile)))->Damage = 100;
// 1. cast pointer to byte
// 2. offset by 30 projectiles amount
// 3. cast the result address to pointer of projectile
// 4. access damage and change value
```

```zig
const projectile_many_casted: [*]u8 = @ptrCast(projectile_many_pointer);
// 1. cast pointer to byte
const offset = 30 * @sizeOf(Projectile);
// 2. offset by 30 projectiles amount
const projectile_casted: *Projectile = @ptrCast(@alignCast(projectile_many_casted + offset));
// 3. cast the result address to pointer of projectile
// Do they align correctly? yes -> align cast (always cast when casting up)
// then cast pointer to projectile
projectile_casted.damage = 80;
// 4. access damage and change value
print("30th damage: {any}\n", .{projectile_many[30].damage}); // prints 70
```
