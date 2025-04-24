import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import '../models/manga_model.dart';

const String baseUrl = 'http://192.168.100.226/manga_api/get_manga.php';
Dio dio = Dio();

Future<List<MangaModel>> fetchAndCacheManga() async {
  final box = await Hive.openBox<MangaModel>('mangaBox');

  try {
    final response = await dio.get(baseUrl);

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['data'];
      final mangaList = data.map((json) => MangaModel.fromJson(json)).toList();

      // clear old cache and save fresh data
      await box.clear();
      await box.addAll(mangaList);

      return mangaList;
    } else {
      throw Exception('Failed to fetch from API');
    }
  } catch (e) {
   // print('API fetch failed: $e');
    // fallback to cache
    final cached = box.values.toList();
    return cached;
  }
}
