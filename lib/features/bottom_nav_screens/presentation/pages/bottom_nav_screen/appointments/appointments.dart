import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/routes/routes_names.dart';
import '../../../provider/appointments_controller.dart';

class Appointments extends StatelessWidget {
  const Appointments({super.key});

  @override
  Widget build(BuildContext context) {
    print('Appointments');
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer<AppointmentController>(
              builder: (context, value, child) {
                print('ChoiceChip');
                return Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) => Card(
                        elevation: 0,
                        child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RoutesName.appointmentsdetails);
                            },
                            trailing: TextButton(
                                onPressed: () {}, child: const Text('status')),
                            contentPadding: EdgeInsets.zero,
                            title: SizedBox(
                              width: double.infinity,
                              height: 80,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: ChoiceChip(
                                      label: SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Center(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text('Today'),
                                            Text('15'),
                                          ],
                                        )),
                                      ),
                                      selected: value.value == index,
                                      onSelected: (bool selected) {
                                        value.changeTabIndex(index);
                                      },
                                    )),
                              ),
                            ),
                            subtitle: Wrap(
                                spacing: 8.0,
                                children: List<Widget>.generate(3, (int index) {
                                  print('ChoiceChip1');
                                  return ChoiceChip(
                                    label: const Text(
                                      '01:40 PM',
                                    ),
                                    selected: value.value1 == index,
                                    onSelected: (bool selected) {
                                      value.changeTabIndex1(index);
                                    },
                                  );
                                })))),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
