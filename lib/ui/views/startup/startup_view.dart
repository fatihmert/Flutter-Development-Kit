import 'package:flutter/material.dart';
import 'package:flutterarch/ui/views/startup/hooks/sample_hook.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends ViewModelBuilderWidget<StartupViewModel> {
  const StartupView({Key key}) : super(key: key);

  @override
  bool get reactive => false;

  @override
  bool get createNewModelOnInsert => false;

  @override
  bool get disposeViewModel => true;

  @override
  Widget builder(BuildContext context, StartupViewModel model, Widget child) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          children: [
            Text(
              'Startup View',
              style: Theme.of(context).textTheme.headline1,
            ),
            SampleHook(),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.brush),
            onPressed: () async {
              model.changeTheme();
              model.updateTitle('Test hook');
            },
          ),
          SizedBox(
            width: 5,
          ),
          FloatingActionButton(
            child: Icon(Icons.arrow_right),
            onPressed: () async {
              model.navigateToHome();
            },
          ),
        ],
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) {
    return StartupViewModel();
  }
}
