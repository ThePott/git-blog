# arrow vs dot for accessing

```c
projectile Test;
Test.Damage = 60;

projectile *Test2 = &Test;
Test2->Damage = 70;
// use -> when access to member of pointer
```

```zig
var projectile_1: Projectile = .init();
projectile_1.damage = 60;

const projectile_2: *Projectile = &projectile_1;
projectile_2.damage = 70;
// in the memory address, I have accessed to damage. no big deal
```
