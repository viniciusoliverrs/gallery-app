import 'package:flutter_modular/flutter_modular.dart';

import 'core/services/http/http_service.dart';
import 'core/utils/constants/api_config.dart';
import 'home/data/repositories/image_repository.dart';
import 'home/externals/datasources/image_datasource.dart';
import 'home/presenter/controllers/home_controller.dart';
import 'home/presenter/views/home_view.dart';

class AppModule extends Module {
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
