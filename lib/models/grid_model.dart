import 'package:flutter/widgets.dart';
import 'package:makeny/screens/estesharatick_screen.dart';
import 'package:makeny/screens/user_consultations.dart';

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
  screen: EstesharatickScreen(),
);
GridModel grid3 = GridModel(
  image: "assets/grid_images/image 23.png",
  title: "قياس مدى الخطورة",
  screen: EstesharatickScreen(),
);
GridModel grid4 = GridModel(
  image: "assets/grid_images/image 50-2.png",
  title: "مقياس عضلة القلب",
  screen: EstesharatickScreen(),
);
GridModel grid5 = GridModel(
  image: "assets/grid_images/image 50-1.png",
  title: "مقياس ضيق التنفس",
  screen: EstesharatickScreen(),
);
GridModel grid6 = GridModel(
  image: "assets/grid_images/image 50.png",
  title: "قياس خطوة الاختناق",
  screen: EstesharatickScreen(),
);
GridModel grid7 = GridModel(
  image: "assets/grid_images/graident-ai-robot-vectorart 1.png",
  title: "المساعدالذكي",
  screen: EstesharatickScreen(),
);

GridModel grid8 = GridModel(
  image: "assets/grid_images/image 16.png",
  title: "ملفى الطبي",
  screen: EstesharatickScreen(),
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
