# wonkiness of c array

## tl:dr;

- array is pointer to first element

## source

- https://youtu.be/0CB1mYS5wBc?list=PLnuhp3Xd9PYTt6svyQPyRO_AAuMWGxPzU&t=3978

## sample code

```c
projectile Projectiles[40]; // NOTE: size of Projectile: 16
// in c, array is pointer to first element

int WhichProjectile = 4;
Projectiles[WhichProjectile];

projectile *ProjectilePointer = Projectiles;
// thie pointer is pointing at first element of array.
// since array is pointer of first element by itself, you don't need & notation
int SizeOfProjectiles = sizeof(Projectiles); // 16 * 40
int SizeOfProjectilePointer = sizeof(ProjectilePointer); // 4
```
