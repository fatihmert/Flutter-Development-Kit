# Flutter - Development Kit

It is in beta stage yet, thank you for your understanding in advance. I advise you to read the entire document so that you do not receive any errors resulting from the shortcomings.
If you think any issue/advice please open issue like your want. Do not think that I will hurt, write.

## File Structure

* app: _You can develop your business logic_
  * **colors.dart:** A simple static class for reading fixed colors and css hex colors in the application. 
  * **themes.dart:** ThemeTable use, defined `lib/themes/<name>.dart` files. More info [stacked_themes](https://github.com/FilledStacks/stacked/tree/master/packages/stacked_themes) package.
  * **constants.dart:** Not yet beta. A shredded static class that holds the percent values of the dimensions for responsive designs.
  * **enums.dart:** Objective programming approach.
  * **helper.dart:** `Facade` type static class. Static class with access to classes with `Singleton` design patterns under the *helpers* folder.
  * **locator.dart:** More info [get_it ](https://pub.dev/packages/get_it) package. You should define services objects here. (`Singleton` pattern)
  * **config.dart:** It contains fixed information such as listing type settings of logs and API address. It should be `DevelopmentMode.PRODUCTION` in release mode.
  * **validates.dart:** It contains regex some main validations for inputs.
* helpers
  * responsive.dart: (Example for `app/helper.dart`, examine that)
* **models**: For parsing JSON objects and other object oriented approaches.
* **services**: Dividing clean API service requests under this folder. Ex; *auth_service*, *product_service* etc. 
  * Don't forget to define the services under this folder to the locator as *registerLazySingleton*.
* ui
  * views
    * page_name: MVVM based UI model, more info [stacked](https://pub.dev/packages/stacked) package.
      * **hooks**: ViewModel connected to View's hook widget.
      * **_view**: Only UI. **Don't use any execute operation in here**
      * **_viewmodel**: Model file with the actions of the relevant screen. Extends `BaseViewModel` via _Provider_. So you can use `notifyListeners` in it.
  * **widgets**:  User-defined custom widgets

## Animation

You can not use `SingleTickerProviderStateMixin` with `stacked` module, [simple_animation](https://pub.dev/packages/simple_animations) module solve this problem. 

## Change package name

If you want use this package your projects, see [rn](https://pub.dev/packages/rn) on pubdev. You can change your project information by making the necessary adjustments from the **build.env** file and running the `dart rename.dart` command on CLI. _You will find the relevant explanations in the file._

```dotenv
# pubspec.yaml -> name
FLUTTER_PACKAGE_NAME=flutterarch

# App name appearing on the device
APPLICATION_NAME=Flutter Arch

# pubspec.yaml -> description
APPLICATON_DESCRIPTION=A new Flutter architecture.

# Package name; com.google.flutter etc.
DOMAIN_NAME=fatihmert.dev.flutterarch
```

## Special Comments

There are comments lines that you should not delete, starting with `cmt::`, which comes with the project. I thought of it as a practical solution without manipulating the dart code. For now, only our `artisan helper` command set uses them.

## Artisan

You can create models, views, widgets through this structure like _Laravel_ artisan. You can find the *artisan* related templates in the path of `./templates`.

### Create View

Creates blank pages suitable for the stacked architecture.

`dart artisan view <view-name> [--reactive]` example `dart artisan view test`  command run then auto generated view files in `lib/ui/` path.

If you use `--reactive`, you can trigger state updates using the **notifyListener()** function provided by Provider. Click for reactive [more info](https://pub.dev/packages/stacked#reactive).

### Create Widget

Create empty (so contain Text Widget) widget in to the `ui/widgets` folder.

`dart artisan widget <view-name> [--statefull]` example `dart artisan widget test` command run then auto generated widget file in `lib/widgets` path.

If you use `--statefull`, It will wrap the _Widget_ you create with State. You can also do this with Android Studio and VSCode. (See `alt + enter`) 

### Create Model

Since it is unnecessary to create a blank model from the command line; You can convert models from **.json** files using the [json_to_dart](https://javiercbk.github.io/json_to_dart/) package. 

```
dart artisan model <json-file> <model-name> [--private]
```

Example;

`dart artisan model model.json ModelName` or with private fields `dart artisan model model.json ModelName --private` command run then auto generated model file in `lib/models` path.

> To keep the project clean; I did not include this package in the project. I have compiled a program to create AOT file and run it via CLI. You can find the source of the native .aot file in the `json2dart.dart` file.

### Create Helper

Generated a empty `Singleton` pattern class in `lib/helpers` path and auto identified `app/helper.dart` file. More info [singleton-pattern](https://en.wikipedia.org/wiki/Singleton_pattern).

`dart artisan helper <helper-name>` example `dart artisan helper utils` 

## Tools

### JSON to Dart Model

[json_to_dart](https://javiercbk.github.io/json_to_dart/) or use our `artisan model` command.

## Basic Use

### Colors

`ColorTable.<colorName>` or `ColorTable.fromHex('#FF0000')`. It is return `Color` object. So you can manipulate any Color methods from come Dart. 

### Navigation

[get](https://pub.dev/packages/get) package use for navigation. Example use; `Get.to(HomeScreen())`. You can passing any parameters this method, so it is supported don't worry.

> I needed this package as I wanted to divide the navigation operations into the viewmodel. The get package can provide navigation without BuildContext. You don't have to use it for your special animated route transitions.

# Let's create the best flutter dev kit together.

**If you have any think development progresses for this repository, please share on issue panel or mail to me (fmdogancan95@gmail.com), so shortly if you want.**

# TODO

- [ ] I think should be little sqlite for this kit control for some operations. Like for from save constant comment template.
