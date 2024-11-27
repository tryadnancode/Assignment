import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String? poster;
  final String year;
  const CustomContainer({super.key, required this.title, this.poster,required this.year,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 150,
              width: 120,
              child: poster == null
                  ? const Icon(
                      Icons.broken_image,
                      size: 150,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        poster!,
                        fit: BoxFit.cover,
                      ),
                    )),
          Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width,
                      //color: Colors.blue,
                      child: Column(
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,),
                          ),
                          Text(year),
                        ],
                      ),

                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
