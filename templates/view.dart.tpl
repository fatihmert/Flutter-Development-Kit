import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '{VIEW_MODEL_FILE_NAME}.dart';

class {VIEW_NAME} extends ViewModelBuilderWidget<{VIEW_MODEL_NAME}>{
  const {VIEW_NAME}({Key key}) : super(key: key);

  @override
  bool get reactive => {REACTIVE_STATUS};

  @override
  bool get createNewModelOnInsert => false;

  @override
  bool get disposeViewModel => true;

  @override
  void onViewModelReady({VIEW_MODEL_NAME} model) {
    super.onViewModelReady(model);
  }

  @override
  Widget builder(BuildContext context, {VIEW_MODEL_NAME} model, Widget child) {
    return Scaffold(
      body: Center(
        child: Text(
          model.title
        ),
      ),
    );
  }

  @override
  {VIEW_MODEL_NAME} viewModelBuilder(BuildContext context) {
    return {VIEW_MODEL_NAME}();
  }
}