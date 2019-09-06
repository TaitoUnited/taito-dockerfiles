# Miscellanous dockerfiles

## Releasing a new version

1. Release tagged version by creating a git tag `NAME-VERSION` either with git or taito. For example:

    ```
    taito tag: cypress-3.3.1
    ```

2. Release latest version of all dockerfiles by merging dev branch to master either with git or taito. For example:

    ```
    taito env merge
    ```

    > Alternatively you can also release latest version of a single dockerfile by creating a git tag `NAME-latest`.
