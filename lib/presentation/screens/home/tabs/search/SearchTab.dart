import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/assets_manager.dart';
import 'package:movie_app/core/colors_manager.dart';
import 'package:movie_app/core/constant_manager.dart';
import 'package:movie_app/data/api/api_manager/api.dart';
import 'package:movie_app/presentation/screens/home/tabs/home_screen/home_details/home_details.dart';
import '../../../../../data/api/model/movie.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final TextEditingController _controller = TextEditingController();
  List<Movie> _searchResults = [];
  bool _isLoading = false;

  Future<void> _searchMovies(String text) async {
    if (text.isEmpty) {
      setState(() => _searchResults = []);
      return;
    }

    setState(() => _isLoading = true);

    try {
      final results = await Api().searchMovies(text);
      setState(() => _searchResults = results);
    } catch (e) {
      print('Error: $e');
      setState(() => _searchResults = []);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: (text) => _searchMovies(text), // يتم البحث عند تغيير النص
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white30),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: ColorsManager.searchBar,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0.r),
                  borderSide: BorderSide(color: Colors.white70),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : _searchResults.isEmpty
                  ? Center(
                child: Image.asset(
                  AssetsManager.searchNoMoviesFound,
                  height: 200.h,
                ),
              )
                  : ListView.separated(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final movie = _searchResults[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeDetails(movie: movie),
                        ),
                      );
                    },
                    child: ListTile(
                      contentPadding: REdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      leading: movie.posterPath != null
                          ? Image.network(
                        '${ConstantManager.imagePath}${movie.posterPath}',
                        fit: BoxFit.cover,
                        width: 50,
                      )
                          : Icon(Icons.image_not_supported),
                      title: Text(movie.title, style: TextStyle(color: Colors.white)),
                      subtitle: Text(movie.releaseDate, style: TextStyle(color: Colors.grey)),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.white30, // تغيير اللون إذا لزم الأمر
                    height: 10.h, // يمكن تغيير المسافة بين العناصر
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
