# Miscellanous dockerfiles

## Releasing new version

1. Release tagged version

Create git tag `NAME-VERSION` either with git or taito. For example:

```
taito tag: cypress-3.3.1
```

2. Release latest version of all dockerfiles

Merge dev branch to master either with git or taito. For example:

```
taito env merge
```

> Alternatively you can also release latest version of single dockerfile by creating git tag `NAME-latest`.
