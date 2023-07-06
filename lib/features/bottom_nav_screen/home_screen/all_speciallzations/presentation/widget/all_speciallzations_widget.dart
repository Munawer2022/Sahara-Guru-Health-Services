import 'package:flutter/material.dart';

import '../../../../../../config/routes/routes_names.dart';
import '../../../../../../core/utils/constants/images.dart';
import '../../data/models/all_speciallzations_model.dart';

class AllSpeciallzationsWidget extends StatelessWidget {
  final value;

  AllSpeciallzationsWidget({
    super.key,
    required this.value,
  });
  List iamges = [
    brainstorm,
    baby,
    neurology,
    skin,
    hospital,
  ];
  String getImageForIndex(int index) {
    if (index < iamges.length) {
      return iamges[index];
    } else {
      return medical_team; // Default image for new department names
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return FutureBuilder<AllSpeciallzationsModel>(
        future: value.baseAllSpeciallzations(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return snapshot.data!.departments!.isEmpty
                ? const Center(child: Text('Empty'))
                : GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2.8, crossAxisCount: 2),
                    itemBuilder: (_, index) {
                      return Card(
                        elevation: 0,
                        child: Center(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RoutesName.catagoryDoctor,
                                  arguments: {
                                    'department_id':
                                        snapshot.data!.departments![index].id,
                                    'name':
                                        snapshot.data!.departments![index].name,
                                  });
                            },
                            child: ListTile(
                              leading: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: [0.0, 1.0],
                                      colors: [
                                        Colors.blue.shade100,
                                        Colors.grey.shade200
                                      ],
                                    ),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Image(
                                      image:
                                          AssetImage(getImageForIndex(index)),
                                      height: 30,
                                      width: 30,
                                    ),
                                  )),
                              title: Text(
                                  snapshot.data!.departments![index].name
                                      .toString(),
                                  style: theme.textTheme.subtitle2),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: snapshot.data!.departments!.length,
                  );
          }
        });
  }
}
