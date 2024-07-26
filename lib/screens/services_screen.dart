import 'package:flutter/material.dart';
import 'package:makeny/models/services_model.dart';
import 'package:makeny/screens/heart_health_screen.dart';
import 'package:makeny/widgets/center_img.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/srevise_link_widgets.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context, title: "خدماتنا"),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CenterImge(img: "assets/logo/Group 1321314641.png"),
            ListView.builder(
              shrinkWrap: true,
              itemCount: services.length,
              itemBuilder: (context, index) => serviseLinkWidgets(
                img: services[index].img,
                text: services[index].header,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HeartHealthScreen(
                      dataModel: services[index],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
