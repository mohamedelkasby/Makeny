import 'package:easy_localization/easy_localization.dart';

class ServiceModel {
  final String img;
  final String headerKey;
  final List<String> dataListKeys;

  ServiceModel({
    required this.img,
    required this.headerKey,
    required this.dataListKeys,
  });
  String get header => tr(headerKey);
  List<String> get dataList => dataListKeys.map((key) => tr(key)).toList();
}

ServiceModel service1 = ServiceModel(
  img: "assets/servises_img/serviseMakeny1.png",
  headerKey: "our_services.Sr_1.header",
  dataListKeys: [
    "our_services.Sr_1.data_1",
    "our_services.Sr_1.data_2",
  ],
);

ServiceModel service2 = ServiceModel(
  img: "assets/servises_img/serviseMakeny22.png",
  headerKey: "our_services.Sr_2.header",
  dataListKeys: [
    "our_services.Sr_2.data_1",
    "our_services.Sr_2.data_2",
  ],
);

ServiceModel service3 = ServiceModel(
  img: "assets/servises_img/serviseMakeny33.png",
  headerKey: "our_services.Sr_3.header",
  dataListKeys: [
    "our_services.Sr_3.data_1",
    "our_services.Sr_3.data_2",
    "our_services.Sr_3.data_3",
    "our_services.Sr_3.data_4",
  ],
);

ServiceModel service4 = ServiceModel(
  img: "assets/servises_img/serviseMakeny44.png",
  headerKey: "our_services.Sr_4.header",
  dataListKeys: [
    "our_services.Sr_4.data_1",
    "our_services.Sr_4.data_2",
  ],
);

List<ServiceModel> services = [service1, service2, service3, service4];
