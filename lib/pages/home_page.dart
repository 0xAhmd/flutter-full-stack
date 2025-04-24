import 'dart:io';

import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../constants.dart';
import '../services/fetch_manga.dart';
import '../models/manga_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<MangaModel>> _mangaFuture;

  @override
  void initState() {
    super.initState();
    _mangaFuture = fetchAndCacheManga();
  }

  Future<void> _refreshManga() async {
    final newData = await fetchAndCacheManga();
    setState(() {
      _mangaFuture = Future.value(newData); // assign the result properly
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.navy,
      body: LiquidPullToRefresh(
        height: 160,
        backgroundColor: MyColors.white,
        color: const Color.fromARGB(255, 27, 34, 45),
        onRefresh: _refreshManga,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 155.0,
              pinned: true,
              backgroundColor: MyColors.navy,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  '漫画シリーズ DB',
                  style: TextStyle(color: MyColors.white),
                ),
                centerTitle: false,
                background: Container(
                  decoration: const BoxDecoration(
                    color: MyColors.navy,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return FutureBuilder<List<MangaModel>>(
                  future: _mangaFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No manga found.'));
                    }

                    final mangaList = snapshot.data!;

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.6,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                      itemCount: mangaList.length,
                      itemBuilder: (context, index) {
                        final manga = mangaList[index];
                        return Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: MyColors.white,
                          ),
                          child: GridTile(
                            footer: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: MyColors.navy.withOpacity(0.7),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              child: Text(
                                manga.name,
                                style: const TextStyle(
                                  height: 1.3,
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            child: Hero(
                              tag: manga.id,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: MyColors.navy,
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: AspectRatio(
                                  aspectRatio: 695 / 900,
                                  child:
                                      manga.localImagePath != null &&
                                              manga.localImagePath!.isNotEmpty
                                          ? Image.file(
                                            File(manga.localImagePath!),
                                            fit: BoxFit.cover,
                                          )
                                          : manga.image.isNotEmpty
                                          ? FadeInImage.assetNetwork(
                                            fit: BoxFit.cover,
                                            placeholder:
                                                'assets/images/loading2.gif',
                                            image: manga.image,
                                          )
                                          : Image.asset(
                                            'assets/images/placeholder.png',
                                          ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }, childCount: 1),
            ),
          ],
        ),
      ),
    );
  }
}
