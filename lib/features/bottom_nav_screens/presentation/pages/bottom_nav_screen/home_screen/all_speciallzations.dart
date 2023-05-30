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
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutesName.skinspecialists,
                                    arguments: {
                                      'department_id':
                                          snapshot.data!.departments![index].id
                                    });
                              },
                              child: ListTile(
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
                        ),
                        itemCount: snapshot.data!.departments!.length,
                      );
                    }
                    return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 2.8, crossAxisCount: 2),
                        itemBuilder: (_, index) => Card(
                              color: Colors.grey.shade300,
                              elevation: 0,
                              child: Center(
                                child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.grey.shade400,
                                    ),
                                    title: SizedBox(
                                      height: 20,
                                      width: 80,
                                      child: Card(
                                        color: Colors.grey.shade400,
                                      ),
                                    )),
                              ),
                            ),
                        itemCount: 10
                        //  snapshot.data?.departments?.length,
                        );
                  })
            ],
          ),
        ));
  }
}
