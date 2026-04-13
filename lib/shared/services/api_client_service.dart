import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/breed.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/features/breeds/domain/breed_image.dart';
import 'package:mobile_probeaufgabe_lucas_schmidt/util/interceptor/on_request_interceptor.dart';

class ApiClientService {
  ApiClientService() {
    _dio.interceptors.add(OnRequestInterceptor());
  }
  static const String baseUrl = "https://api.thecatapi.com/v1/";

  final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<List<Breed>> getBreeds() async {
    try {
      final response = await _dio.get("/breeds");
      return List<Breed>.from(response.data.map((e) => Breed.fromJson(e)));
    } catch (e) {
      throw Exception("Could not get breeds");
    }
  }

  Future<Breed> getBreed(String id) async {
    try {
      final response = await _dio.get("/breeds/$id");
      return Breed.fromJson(response.data);
    } catch (e) {
      throw Exception("Could not get breed with id $id");
    }
  }

  Future<BreedImage> getBreedImage(String id) async {
    try {
      final response = await _dio.get("/images/$id");
      return BreedImage.fromJson(response.data);
    } catch (e) {
      throw Exception("Could not image with id $id");
    }
  }
}

final apiClientServiceProvider = Provider<ApiClientService>(
  name: "API-Client-Service",
  (ref) => ApiClientService(),
);
