import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../config/routes/routes_names.dart';
import '../../../../../../core/utils/constants/images.dart';
import '../../data/models/all_speciallzations_model.dart';

class HomeSlideHorizontalListWidget extends StatelessWidget {
  final value;
  const HomeSlideHorizontalListWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return FutureBuilder<AllSpeciallzationsModel>(
        future: value.baseAllSpeciallzations(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              width: double.infinity,
              height: 80,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (snapshot.data?.departments?.length ?? 0) > 4
                      ? 5
                      : (snapshot.data?.departments?.length ?? 0),
                  itemBuilder: (context, index) {
                    if (index < 4) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesName.catagoryDoctor,
                                arguments: {
                                  'department_id':
                                      snapshot.data!.departments![index].id,
                                  'name':
                                      snapshot.data!.departments![index].name
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
                      );
                    } else if (index == 4 &&
                        (snapshot.data?.departments?.length ?? 0) > 4) {
                      return IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RoutesName.allSpeciallzations);
                          },
                          icon: const Icon(CupertinoIcons.arrow_right));
// Return an empty widget if index exceeds 4
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
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
  }
}
