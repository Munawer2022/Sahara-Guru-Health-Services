import '../../../../core/network/NetworkApiService.dart';

class SearchDoctorRespository {
  final _apiService = NetworkApiService();

  Future getsearchdoctor(url) async {
    try {
      dynamic response = await _apiService.searchDoctorApiResponse(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
