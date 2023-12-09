import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchCategory(String search, int product, int imgLength, int varLength) async {
  final String apiKey = 'your-shopify-api-key';
  final String password = 'your-shopify-password';

  final url = 'https://3d6a19.myshopify.com/admin/api/2023-10/graphql.json';
  final String query = '''
    query {
      collection(id: "gid://shopify/Collection/$search") {
        title
        products(first: $product) {
          edges {
            node {
              id
              title
              tags
              description
              images(first: $imgLength) {
                edges {
                  node {
                    src
                  }
                }
              }
              variants(first: $varLength) {
                edges {
                  node {
                    price
                    title
                    compareAtPrice
                    id
                  }
                }
              }
            }
          }
        }
      }
    }
  ''';

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'X-Shopify-Access-Token': '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',
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode({'query': query}),
    );

    if (response.statusCode == 200) {
      // Parse and handle the response data
      final Map<String, dynamic> data = json.decode(response.body);
      print(data);
      return data;
    } else {
      // Handle errors
      print('Error: ${response.statusCode}');
      print(response.body);
    }
  } catch (error) {
    // Handle exceptions
    print('Exception: $error');
  }

  return {}; // Return an empty map in case of failure
}