import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class OnRequestInterceptor extends QueuedInterceptor {
  final catApiKey = dotenv.env["CAT_API_KEY"];

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    /// Add the x-api-key header to the request
    options.headers["x-api-key"] = catApiKey;

    super.onRequest(options, handler);
  }
}
