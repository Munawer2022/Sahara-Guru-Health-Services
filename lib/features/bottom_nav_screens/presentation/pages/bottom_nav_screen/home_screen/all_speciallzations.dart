import 'package:flutter/material.dart';
import 'package:sahara_guru_health_services/core/utils/constants/images.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screens/presentation/pages/bottom_nav_screen/home_screen/skin_specialists/book_appointment/get_list_doctor_model.dart';

import '../../../../../../config/routes/routes_names.dart';
import '../../../../../../core/utils/constants/padding.dart';
import '../../../../../../core/utils/resources/components/app_bar.dart';
import '../../../../data/repositories/list_doctor_respository.dart';

class AllSpeciallzations extends StatelessWidget {
  AllSpeciallzations({
    super.key,
  });

  ListDoctorRespository demoRespository = ListDoctorRespository();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
        appBar: MyAppBarWidget(
          readOnly: true,
          ontap: () {
            Navigator.pushNamed(context, RoutesName.searchdoctor);
          },
          bottom: true,
          bottomText: 'Find Dectors, Specialities, Disease and Hospital',
          arrow_back: true,
          title: 'All Speciallzations',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<Getlistdoctor>(
                  future: demoRespository.getlistdoctor(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 2.8, crossAxisCount: 2),
                        itemBuilder: (_, index) => Card(
                          elevation: 0,
                          child: Center(
                            child: ListTile(
                              
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutesName.skinspecialists,
                                    arguments: {
                                      'department_id':
                                          snapshot.data!.departments![index].id
                                    });
                              },
                              leading: Container(
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
                              title: Text(
                                  snapshot.data!.departments![index].name
                                      .toString(),
                                  style: theme.textTheme.subtitle2),
                            ),
                          ),
                        ),
                        itemCount: snapshot.data!.departments!.length,
                      );
                    }
                    return Center(child: LinearProgressIndicator());
                  })
              // FutureBuilder<Getlistdoctor>(
              //     future: demoRespository.getlistdoctor(),
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {
              //         return SizedBox(
              //           height: double.infinity,
              //           child: ListView.builder(
              //               itemCount: snapshot.data?.departments?.length,
              //               itemBuilder: (context, index) => SizedBox(
              //                     width: double.infinity,
              //                     height: 80,
              //                     child: Card(
              //                       child: Center(
              //                         child: ListTile(
              //                           onTap: () {
              //                             Navigator.pushNamed(
              //                                 context, RoutesName.skinspecialists,
              //                                 arguments: {
              //                                   'department_id': snapshot
              //                                       .data!.departments![index].id
              //                                 });
              //                           },
              //                           leading: Container(
              //                               height: 50,
              //                               width: 50,
              //                               decoration: BoxDecoration(
              //                                 boxShadow: <BoxShadow>[
              //                                   BoxShadow(
              //                                     color: Colors.black.withOpacity(.2),
              //                                     blurRadius: 10,
              //                                   ),
              //                                 ],
              //                                 color: Colors.white,
              //                                 borderRadius: BorderRadius.circular(50),
              //                               ),
              //                               child:
              //                                   Image(image: AssetImage(category))),
              //                           title: Text(
              //                               snapshot.data!.departments![index].name
              //                                   .toString(),
              //                               style: theme.textTheme.subtitle2),
              //                         ),
              //                       ),
              //                     ),
              //                   )

              //               ),
              //         );
              //       }
              //       return SizedBox(
              //         width: double.infinity,
              //         height: 80,
              //         child: ListView.builder(
              //           scrollDirection: Axis.horizontal,
              //           itemCount: snapshot.data?.departments?.length,
              //           itemBuilder: (context, index) => SizedBox(
              //             width: double.infinity,
              //             height: 80,
              //             child: Card(
              //               child: InkWell(
              //                 onTap: () {},
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     Container(
              //                       height: 50,
              //                       width: 50,
              //                       decoration: BoxDecoration(
              //                           color: Colors.grey.shade200,
              //                           borderRadius: BorderRadius.circular(50)),
              //                     ),
              //                     SizedBox(
              //                       height: mediaQuery.height * 0.01,
              //                     ),
              //                     Container(
              //                       height: 15,
              //                       width: 70,
              //                       decoration: BoxDecoration(
              //                           color: Colors.grey.shade200,
              //                           borderRadius: BorderRadius.circular(12)),
              //                     )
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       );
              //     }),
            ],
          ),
        ));
  }
}
