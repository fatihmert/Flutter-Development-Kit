# Flutter - Boilerplate

## File Structure

* app
  * **colors.dart:** A simple static class for reading fixed colors and css hex colors in the application. 
  * **constants.dart:** Not yet beta. A shredded static class that holds the percent values of the dimensions for responsive designs.
  * **enums.dart:** Objective programming approach.
  * **helper.dart:** Chainable type static static class class with access to classes with `Singleton` design patterns under the *helpers* folder.
  * **locator.dart:** More info [get_it ](https://pub.dev/packages/get_it) package

  * **config.dart:** It contains fixed information such as listing type settings of logs and API address. It should be `DevelopmentMode.PRODUCTION` in release mode.
* helpers
  * responsive.dart: (Example for `app/helper.dart`)
* **log**: My log manager class, not yet beta.
* **services**: Dividing clean API service requests under this folder. Ex; *auth_service*, *product_service* etc. 
  * Don't forget to define the services under this folder to the locator as *registerLazySingleton*.
* ui
  * views
    * page_name: MVVM based UI model, more info [stacked](https://pub.dev/packages/stacked) package.
      * **_view**: Only UI
      * **_viewmodel**: Model file with the actions of the relevant screen. Extends `BaseViewModel` via _Provider_. So you can use `notifyListeners` in it.
  * **widgets**:  User-defined custom widgets

## Basic Use

### Colors

`ColorTable.<colorName>` or `ColorTable.fromHex('#FF0000')`

### Navigation

[get](https://pub.dev/packages/get) package use for navigation. Example use; `Get.to(HomeScreen())`.

> I needed this package as I wanted to divide the navigation operations into the viewmodel. The x package can provide navigation without BuildContext.



