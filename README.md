# dbt-checkpoint action

This action prints "Hello World" or "Hello" + the name of a person to greet to the log.

## Inputs

### `extra_args`

**Optional ->** Extra arguments to pass to `pre-commit run`. Default `--all-files`.

### `dbt_version`

**Optional ->** dbt-core version to install. Default `""` means latest.

### `extra_args`

**Optional ->** dbt adapter to install. Default `""` doesn't install any adapter.

## Example usage

```yaml
uses: dbt-checkpoint/action@v0.1
with:
  extra_args: --files ${{ steps.get_file_changes.outputs.files}}
  dbt_version: 1.6.3
  dbt_adapter: dbt-snowflake
```
