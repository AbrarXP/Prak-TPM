class API {
  static const String baseUrl = 'https://tpm-api-tugas-872136705893.us-central1.run.app';
  static const String getUrl = '$baseUrl/api/clothes';
  static const String postUrl = '$baseUrl/api/clothes';

  // URL builder untuk update dan delete berdasarkan ID
  static String getByIDUrl(String id) => '$baseUrl/api/clothes/$id';
  static String putUrl(String id) => '$baseUrl/api/clothes/$id';
  static String deleteUrl(String id) => '$baseUrl/api/clothes/$id';
}