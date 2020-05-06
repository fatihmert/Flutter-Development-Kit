# Flutter - Boilerplate

It is in beta stage yet, thank you for your understanding in advance. I advise you to read the entire document so that you do not receive any errors resulting from the shortcomings.

## File Structure

* app
  * **colors.dart:** A simple static class for reading fixed colors and css hex colors in the application. 

  * **constants.dart:** Not yet beta. A shredded static class that holds the percent values of the dimensions for responsive designs.

  * **enums.dart:** Objective programming approach.

  * **helper.dart:** Chainable type static class. Static class with access to classes with `Singleton` design patterns under the *helpers* folder.

  * **locator.dart:** More info [get_it ](https://pub.dev/packages/get_it) package

  * **config.dart:** It contains fixed information such as listing type settings of logs and API address. It should be `DevelopmentMode.PRODUCTION` in release mode.
* helpers
  * responsive.dart: (Example for `app/helper.dart`)
* **log**: My log manager class, not yet beta.
* **models**: For parsing JSON objects and other object oriented approaches.
* **services**: Dividing clean API service requests under this folder. Ex; *auth_service*, *product_service* etc. 
  * Don't forget to define the services under this folder to the locator as *registerLazySingleton*.
* ui
  * views
    * page_name: MVVM based UI model, more info [stacked](https://pub.dev/packages/stacked) package.
      * **_view**: Only UI
      * **_viewmodel**: Model file with the actions of the relevant screen. Extends `BaseViewModel` via _Provider_. So you can use `notifyListeners` in it.
  * **widgets**:  User-defined custom widgets

## Change package name

I optimized the [rename](https://pub.dev/packages/rename) package. You can change your project information by making the necessary adjustments from the **build.env** file and running the `dart rename.dart` command on CLI. _You will find the relevant explanations in the file._

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

> For now, if you change the **FLUTTER_PACKAGE_NAME** key value; You will also need to change the `include 'package: flutterarch';` module inclusion from all of your code. 

## Artisan

You can create models, views, widgets through this structure like _Laravel_ artisan. For now, only **view** and **widget** is defined.

### Create View

Creates blank pages suitable for the stacked architecture.

`dart artisan.dart view <view-name>` example `dart artisan.dart view test`

### Create Widget

Create empty (so contain Text Widget) widget in to the `ui/widgets` folder.

`dart artisan.dart widget <view-name>` example `dart artisan.dart widget test`

### Create Model

> TODO

## Tools

### JSON to Dart Model

If you are working locally, you can automatically convert your JSON files to model files with the `tools/package/json_to_dart` path or at [json_to_dart](https://javiercbk.github.io/json_to_dart/). 


## Basic Use

### Colors

`ColorTable.<colorName>` or `ColorTable.fromHex('#FF0000')`

### Navigation

[get](https://pub.dev/packages/get) package use for navigation. Example use; `Get.to(HomeScreen())`.

> I needed this package as I wanted to divide the navigation operations into the viewmodel. The get package can provide navigation without BuildContext. You don't have to use it for your special animated route transitions.
