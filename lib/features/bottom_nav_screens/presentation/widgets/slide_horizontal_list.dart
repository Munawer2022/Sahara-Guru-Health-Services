import 'package:flutter/material.dart';

import '../../../../config/routes/routes_names.dart';
import '../../../../core/utils/constants/app_url.dart';
import '../../data/repositories/get_list_doctor_respository.dart';
import '../pages/bottom_nav_screen/home_screen/skin_specialists/book_appointment/get_list_doctor_model.dart';

class SlideHorizontalList extends StatelessWidget {
  SlideHorizontalList({
    super.key,
  });

  GetListDoctorRespository demoRespository = GetListDoctorRespository();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return FutureBuilder<Getlistdoctor>(
        future: demoRespository.getlistdoctor(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              width: double.infinity,
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data?.departments?.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RoutesName.skinspecialists, arguments: {
                        'department_id': snapshot.data!.departments![index].id
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        SizedBox(
                          height: mediaQuery.height * 0.01,
                        ),
                        Text(snapshot.data!.departments![index].name.toString(),
                            style: theme.textTheme.subtitle2),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return SizedBox(
            width: double.infinity,
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data?.departments?.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.01,
                      ),
                      Container(
                        height: 15,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(12)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
