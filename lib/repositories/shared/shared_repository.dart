import 'dart:async';

import 'package:unipos_flutter/models/app/shared_data_model.dart';

class SharedRepository {

  StreamController<SharedDataModel> sharedDataModelController = StreamController<SharedDataModel>.broadcast();

}