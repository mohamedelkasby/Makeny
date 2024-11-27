import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makeny/models/services_model.dart';
import 'package:makeny/screens/about_makeny/sub_services_screen.dart';
import 'package:makeny/widgets/center_img.dart';
import 'package:makeny/widgets/defualt_appbar.dart';
import 'package:makeny/widgets/service_link_widgets.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(context, title: tr("accountPage.our_services")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            centerImge(img: "assets/logo/main_logo.png"),
            ListView.builder(
              shrinkWrap: true,
              itemCount: services.length,
              itemBuilder: (context, index) => serviseLinkWidgets(
                context: context,
                img: services[index].img,
                text: services[index].header,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubServicesScreen(
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
