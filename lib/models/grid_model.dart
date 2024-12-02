import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:makeny/screens/consultation_screens/user_consultations.dart';
import 'package:makeny/screens/danger_measure_screens/danger_measure_screen.dart';
import 'package:makeny/screens/quality_of_life_measure_screen.dart';
import 'package:makeny/screens/user_pages/medical_file.dart';

class GridModel {
  final String image;
  final String titlekey;
  // final Function() onTap;
  final Widget screen;

  GridModel({
    required this.image,
    required this.titlekey,
    // required this.onTap,
    required this.screen,
  });

  String get title => tr(titlekey);
}

GridModel grid1 = GridModel(
  image: "assets/grid_images/image 23-2.png",
  titlekey: "your_consultations",
  screen: UserConsultations(),
);
GridModel grid2 = GridModel(
  image: "assets/grid_images/image 23-1.png",
  titlekey: "quality_of_life_measurement",
  screen: const QualityOfLifeMeasureScreen(),
);
GridModel grid3 = GridModel(
  image: "assets/grid_images/image 23.png",
  titlekey: "measure_the_degree_of_risk",
  screen: DangerMeasureScreen(
    appbar: tr("severity_scale"),
    shortTest: true,
  ),
);
GridModel grid4 = GridModel(
  image: "assets/grid_images/image 50-2.png",
  titlekey: "cardiometer",
  screen: DangerMeasureScreen(
    appbar: tr("cardiac_equalization_scale"),
    testNumber: 5,
    shortTest: true,
  ),
);
GridModel grid5 = GridModel(
  image: "assets/grid_images/image 50-1.png",
  titlekey: "dyspnea_scale",
  screen: DangerMeasureScreen(
    appbar: tr("multidimensional_dyspnea_scale"),
    testNumber: 6,
    shortTest: true,
  ),
);
GridModel grid6 = GridModel(
  image: "assets/grid_images/image 50.png",
  titlekey: "choke_step_measurement",
  screen: DangerMeasureScreen(
    appbar: tr("choking_hazard"),
    testNumber: 3,
    shortTest: true,
  ),
);
// GridModel grid7 = GridModel(
//   image: "assets/grid_images/graident-ai-robot-vectorart 1.png",
//   titlekey: "المساعد الذكي",
//   screen: AIChatPage(),
// );

GridModel grid8 = GridModel(
  image: "assets/grid_images/image 16.png",
  titlekey: "accountPage.my_medical_file",
  screen: const MedicalFile(),
);
List<GridModel> gridModelList = [
  grid1,
  grid2,
  grid3,
  grid4,
  grid5,
  grid6,
  // grid7,
  grid8,
];
