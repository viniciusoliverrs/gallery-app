import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/views/image_details_view.dart';

class ImageDetailsModule extends Module {
  @override
  final List<Bind> binds = [
    // Bind.lazySingleton((i) => ImageDetailsController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ImageDetailsView(entity: args.data,)),
  ];
}