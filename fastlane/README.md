fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios all_checks
```
fastlane ios all_checks
```
All iOS lanes
### ios run_all_test_ios
```
fastlane ios run_all_test_ios
```
Run all test for iOS modules
### ios coverage_ios
```
fastlane ios coverage_ios
```
Calculate the code coverage for iOS packages
### ios lint
```
fastlane ios lint
```
Lint all files
### ios beta
```
fastlane ios beta
```
Push a new beta build to TestFlight

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
