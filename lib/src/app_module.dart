import 'package:flutter_modular/flutter_modular.dart';

import 'core/services/http/http_service.dart';
import 'core/utils/constants/api_config.dart';
import 'modules/home/home_module.dart';
import 'modules/image_details/image_details_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HttpService(
          urlBase: ApiConfig.baseUrl,
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/image-details', module: ImageDetailsModule()),
  ];
}
