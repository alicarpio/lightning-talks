# Lightning Talks

## Endpoints

### Members

- Get a list of all the members.

```
GET /api/v1/members
```

- Get a members by their id.

```
GET /api/v1/members/{id}
```

- Get a random member.

**NOTE**: This is a destructive operation.

```
GET /api/v1/members/random
```

### Lightning Talks

- Get the currently scheduled lightning talk.

```
GET /api/v1/lightning_talks
```

- Update the lightning talk's topic.

```
PATCH /api/v1/lightning_talks
```

| Name  | Description                 | In   |
| ----- | --------------------------- | ---- |
| topic | The lightning talk's topic. | Body |
