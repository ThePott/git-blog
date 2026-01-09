# 로컬 postgresql 설정 방법

## installation ~ launching

### install with brew

```zsh
<!-- MUST set version -->
<!-- if version is not provided, version 14 will be installed -->
brew install postgresql@18
```

### include in path -> source config

```zsh
<!-- there is some command about zshrc -->
<!-- it will be printed in console after intall -->
<!-- run it -->

source ~/.zshrc
```

### start server my default

```zsh
<!-- 마찬가지로 설치하고 나면 명령어가 나온다 -->
postgres start 어쩌구 저쩌구...
```

### go inside of

```zsh
psql postgres
```

## prisma에 연결하기 위해서 필요한 것

```
DATABASE_URL="postgresql://username:@localhost:5432/arbor_local"
```

- username: 내 맥에서의 유저 이름
- 포트 번호
- 데이터베이스 이름

### 유저 이름 확인하기

```zsh
echo $USER
```

[시스템 환경변수](../system-environment-variables.md)

### 포트 확인하기

```postgres
SHOW port;
```

### database 확인하기

```postgres
\l
```

### database 만들기

```postgres
CREATE DATABASE arbor_local
```

### prisma와 연결하기

#### migation 적용

```zsh
npx prisma migrate deploy
```

#### table 확인

```postgres
<!-- 데이터베이스 이름 보기 -->
\l

<!-- 해당 데이터베이스와 연결 -->
\c arbor_local

<!-- 해당 데이터베이스의 모든 테이블 출력 -->
\dt
```

```zsh
<!-- 전체 테이블 목록 확인하기 -->
\dt

<!-- 특정 테이블의 상위 1000개만 보기 (psql shorthand) -->
TABLE table_name;
```
