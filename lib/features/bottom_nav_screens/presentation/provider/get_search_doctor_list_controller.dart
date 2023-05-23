// class SearchDoctorProvider extends ChangeNotifier {
//   List<dynamic> get searchDoctorList => _searchDoctorList;
//   List<dynamic> _searchDoctorList = [];

//   void getSearchDoctor() async {
//     Response response = await get(
//       Uri.parse('https://saharadigitalhealth.in/sahara_digital_health/public/api/search/department/doctors?searchTerm=${searchTermController.text}'),
//       headers: {
//         'Accept': 'application/json',
//         'Authorization': 'Bearer ${box.read('token')}',
//       },
//     );

//     if (response.statusCode == 200) {
//       _searchDoctorList = jsonDecode(response.body.toString());
//       notifyListeners();
//     } else {
//       throw Exception('Failed to fetch search doctors.');
//     }
//   }
// }
