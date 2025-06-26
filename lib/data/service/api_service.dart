import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../model/quote_model.dart';

class ApiService {
  // Singleton pattern
  ApiService._privateConstructor();
  static final ApiService apiService = ApiService._privateConstructor();
  factory ApiService() => apiService;

  // Base URL for API
  static const String _baseUrl = "https://dummyjson.com";

  // Endpoint paths
  static const String _quotesEndpoint = "/quotes";

  Future<List<Quotes>> fetchQuotes() async {
    try {
      final uri = Uri.parse("$_baseUrl$_quotesEndpoint");
      final response = await http.get(uri);

      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> decodedData = jsonDecode(response.body);
        final quoteModel = QuoteModel.fromJson(decodedData);
        return quoteModel.quotes ?? [];
      } else {
        throw HttpException(
          'Failed to fetch quotes. Status Code: ${response.statusCode}',
        );
      }
    } catch (e, stackTrace) {
      debugPrint('Error fetching quotes: $e');
      debugPrintStack(stackTrace: stackTrace);
      rethrow; // Let upper layer (like BLoC) decide how to handle
    }
  }
}
