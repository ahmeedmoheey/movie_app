import 'package:flutter/material.dart';
import 'package:movie_app/config/app_styles/app_styles.dart';
import 'package:movie_app/core/assets_manager.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 35
        ),
        title:  Text('Dora and the Lost City of Gold',style: AppStyles.screenTitle,),

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image Section
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetsManager.dramaFilm), // Replace with your background image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Center(
                  child: IconButton(
                    icon: const Icon(
                      Icons.play_circle,
                      size: 60,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Poster Image
                  Container(
                    height: 120,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image:  const DecorationImage(
                        image: AssetImage(AssetsManager.dramaFilm), // Replace with your poster image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Text Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Dora and the Lost City of Gold',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '2019  PG-13  2h 7m',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Action Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                      (index) => ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black54,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Action'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Rating Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '7.7',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // More Like This Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'More Like This',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 13,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 140,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: const DecorationImage(
                              image: AssetImage(AssetsManager.crimeFilm), // Replace with your movie poster
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'War',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 14,
                            ),
                            SizedBox(width: 4),
                            Text(
                              '7.7',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );

  }
}
