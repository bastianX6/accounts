fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios all_checks

```sh
[bundle exec] fastlane ios all_checks
```

All iOS lanes

### ios run_all_test_ios

```sh
[bundle exec] fastlane ios run_all_test_ios
```

Run all test for iOS modules

### ios create_sonar_reports

```sh
[bundle exec] fastlane ios create_sonar_reports
```

Create SonarQube test and coverage reports

### ios create_sonar_test_execution_reports

```sh
[bundle exec] fastlane ios create_sonar_test_execution_reports
```

Create test execution reports (SonarQube)

### ios lint

```sh
[bundle exec] fastlane ios lint
```

Lint all files

### ios beta

```sh
[bundle exec] fastlane ios beta
```

Push a new beta build to TestFlight

----


## Mac

### mac all_checks

```sh
[bundle exec] fastlane mac all_checks
```

All macOS lanes

### mac run_all_test_macos

```sh
[bundle exec] fastlane mac run_all_test_macos
```

Run all test for macOS modules

### mac coverage_macos

```sh
[bundle exec] fastlane mac coverage_macos
```

Calculate the code coverage for macOS packages

### mac lint

```sh
[bundle exec] fastlane mac lint
```

Lint all files

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
