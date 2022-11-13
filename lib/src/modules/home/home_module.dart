import 'package:flutter_modular/flutter_modular.dart';

import '../../core/services/http/http_service.dart';
import '../../core/utils/constants/api_config.dart';
import 'data/repositories/image_repository.dart';
import 'externals/datasources/image_datasource.dart';
import 'presenter/controllers/home_controller.dart';
import 'presenter/views/home_view.dart';

class HomeModule extends Module {
@override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HttpService(
          urlBase: ApiConfig.baseUrl,
        )),
    Bind.factory((i) => ImageDatasource(i.get())),
    Bind.factory((i) => ImageRepository(i.get())),
    Bind.factory((i) => HomeController(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (context, args) => HomeView(
              controller: Modular.get(),
            )),
  ];
}
