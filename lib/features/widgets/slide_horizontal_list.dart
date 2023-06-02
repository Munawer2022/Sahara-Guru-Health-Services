import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sahara_guru_health_services/core/utils/constants/images.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/home_screen/all_speciallzations/data/models/all_speciallzations_model.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/home_screen/all_speciallzations/data/repositories/all_speciallzations_repository.dart';

import '../../config/routes/routes_names.dart';
import '../bottom_nav_screen/home_screen/all_speciallzations/presentation/provider/all_speciallzations_provider.dart';

class SlideHorizontalList extends StatelessWidget {
  SlideHorizontalList({
    super.key,
  });

  AllSpeciallzationsRespository allSpeciallzationsRespository =
      AllSpeciallzationsRespository();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Consumer<AllSpeciallzationsProvider>(builder: (context, value, _) {
      return FutureBuilder<AllSpeciallzationsModel>(
          future: value.baseAllSpeciallzations(),
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
                        Navigator.pushNamed(context, RoutesName.skinspecialists,
                            arguments: {
                              'department_id':
                                  snapshot.data!.departments![index].id,
                              'name': snapshot.data!.departments![index].name
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
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.2),
                                    blurRadius: 10,
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Image(image: AssetImage(category))),
                          SizedBox(
                            height: mediaQuery.height * 0.01,
                          ),
                          Text(
                              snapshot.data!.departments![index].name
                                  .toString(),
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
                itemCount: 5,
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
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        SizedBox(
                          height: mediaQuery.height * 0.01,
                        ),
                        Container(
                          height: 15,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(12)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
    });
  }
}
