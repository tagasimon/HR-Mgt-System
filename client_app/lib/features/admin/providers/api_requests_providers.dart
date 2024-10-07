import 'package:client_app/features/admin/models/API_Request_Model.dart';
import 'package:client_app/features/admin/repos/api_requests_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiRequestRepoProvider = Provider<ApiRequestsRepo>((ref) {
  return ApiRequestsRepo(baseUrl: "https://hr-mgt-system.onrender.com");
});

// api requests future provider
final apiRequestsProvider =
    FutureProvider.autoDispose<List<ApiRequestModel>?>((ref) async {
  return ref.watch(apiRequestRepoProvider).getAllApiRequests();
});
