import 'package:flutter/cupertino.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import '../startup_viewmodel.dart';

class SampleHook extends HookViewModelWidget<StartupViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, StartupViewModel model) {
    return Text(model.title);
  }
}
