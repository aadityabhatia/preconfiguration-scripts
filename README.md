# Linux Bootstrap Scripts

This is a collection of bash scripts executed from a preseed script during an Debian/Ubuntu netboot installation.

## design guidance
* simple - limit complexity, document thoroughly
* modular - keep scripts small and simple, limit dependencies
* resilient - conduct sanity checks, handle error conditions gracefully, fail atomically
* steady - minimize changes to code, use config file for volatile parameters
* repeatable - clean up regularly, multiple invocations of same script should be expected
