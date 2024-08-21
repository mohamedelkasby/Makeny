import 'package:flutter/widgets.dart';
import 'package:makeny/screens/chat_screen.dart';
import 'package:makeny/screens/consulation_screens/user_consultations.dart';
import 'package:makeny/screens/danger_measure_screens/danger_measure_screen.dart';
import 'package:makeny/screens/quality_of_life_measure_screen.dart';
import 'package:makeny/screens/user_pages/medical_file.dart';

class GridModel {
  final String image;
  final String title;
  // final Function() onTap;
  final Widget screen;

  GridModel({
    required this.image,
    required this.title,
    // required this.onTap,
    required this.screen,
  });
}

GridModel grid1 = GridModel(
  image: "assets/grid_images/image 23-2.png",
  title: "استشاراتك",
  screen: UserConsultations(),
);
GridModel grid2 = GridModel(
  image: "assets/grid_images/image 23-1.png",
  title: "قياس جودة الحياة",
  screen: QualityOfLifeMeasureScreen(),
);
GridModel grid3 = GridModel(
  image: "assets/grid_images/image 23.png",
  title: "قياس مدى الخطورة",
  screen: DangerMeasureScreen(
    appbar: "مقياس الخطورة",
    shortTest: true,
  ),
);
GridModel grid4 = GridModel(
  image: "assets/grid_images/image 50-2.png",
  title: "مقياس عضلة القلب",
  screen: DangerMeasureScreen(
    appbar: "مقياس اعتدال عضلة القلب",
    testNumber: 5,
    shortTest: true,
  ),
);
GridModel grid5 = GridModel(
  image: "assets/grid_images/image 50-1.png",
  title: "مقياس ضيق التنفس",
  screen: DangerMeasureScreen(
    appbar: "مقياس ضيق التنفس متعدد الابعاد",
    testNumber: 6,
    shortTest: true,
  ),
);
GridModel grid6 = GridModel(
  image: "assets/grid_images/image 50.png",
  title: "قياس خطوة الاختناق",
  screen: DangerMeasureScreen(
    appbar: "خطورة الاختناق",
    testNumber: 3,
    shortTest: true,
  ),
);
GridModel grid7 = GridModel(
  image: "assets/grid_images/graident-ai-robot-vectorart 1.png",
  title: "المساعد الذكي",
  screen: ChatPage(),
);

GridModel grid8 = GridModel(
  image: "assets/grid_images/image 16.png",
  title: "ملفى الطبي",
  screen: MedicalFile(),
);
List<GridModel> GridModelList = [
  grid1,
  grid2,
  grid3,
  grid4,
  grid5,
  grid6,
  grid7,
  grid8,
];
