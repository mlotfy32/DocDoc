import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key, required this.doctorName});
  final String doctorName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.size.height - 150,
      width: Get.size.width - 33,
      child: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(images[index]),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      ' ${names[index]}',
                      style: AppFonts.f18w700,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      width: Get.size.width - 60.w,
                      height: 30,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        itemCount: stars[index],
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Text(
              'DR : $doctorName ${reviews[index]}',
              style: AppFonts.f14w400,
            )
          ],
        ),
      ),
    );
  }
}

List<String> reviews = [
  'has extensive experience in orthopedic surgery. He treats patients with respect and provides clear explanations of their medical conditions. I highly recommend him.',
  'is highly skilled in orthopedic surgery. He performed a knee replacement for me, and the results were fantastic. However, his bedside manner could be a bit warmer. He’s very professional but not very approachable.',
  'is amazing with kids! She has a natural ability to make children feel comfortable and calm during visits. Her advice on child development and vaccinations is always clear and helpful.',
];
List<int> stars = [5, 4, 5];
List<String> names = ['Jane Cooper', 'Jacob Jones', 'Robert Fox'];
List<String> images = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZjy__2mykLSMfBp-AdOSMoneYZ2FHpNaaMQ&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoZlRi-vNwxw5-a3kGFvkbepRDTm-Eva28Hg&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6wVWvbhXUihcqlBECrvar8ZHkaPAqHmGW3A&s'
];
