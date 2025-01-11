import 'package:flutter/material.dart';
import 'package:youtube_video_player/common/color_extension.dart';

import 'my_order_view.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  List aboutTextArr = [
    "Selamat datang di Meal Monkey, aplikasi food delivery yang dirancang untuk memudahkan Anda menikmati hidangan lezat dari berbagai restoran pilihan, langsung dari kenyamanan rumah Anda. Kami percaya bahwa makanan enak bisa membuat hari lebih baik, dan itulah yang kami hadirkan untuk Anda.",
    "Meal Monkey menghubungkan Anda dengan beragam restoran terbaik di sekitar Anda, memberikan kemudahan dalam memilih, memesan, dan menikmati makanan favorit. Dengan antarmuka yang sederhana dan layanan cepat, kami berkomitmen untuk memberikan pengalaman pemesanan yang praktis dan menyenangkan.",
    "Misi kami adalah memastikan bahwa Anda tidak perlu repot untuk menikmati hidangan yang Anda sukai. Dengan teknologi yang terus berkembang, kami selalu berusaha meningkatkan layanan kami agar sesuai dengan kebutuhan Anda.",
    "Di Meal Monkey, kami tidak hanya mengantarkan makanan, tetapi juga kebahagiaan. Kami bangga bisa menjadi jembatan antara Anda dan restoran-restoran favorit, membantu menciptakan momen spesial di setiap gigitan. Dengan berbagai pilihan menu yang terus bertambah, kami yakin ada sesuatu yang bisa memuaskan selera semua orang.",
    "Terima kasih telah mempercayakan kebutuhan kuliner Anda kepada Meal Monkey. Kami berharap dapat terus menyajikan makanan terbaik untuk Anda.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset("assets/img/btn_back.png",
                          width: 20, height: 20),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        "About Us",
                        style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyOrderView()));
                      },
                      icon: Image.asset(
                        "assets/img/shopping_cart.png",
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: aboutTextArr.length,
               
                itemBuilder: ((context, index) {
                  var txt = aboutTextArr[index] as String? ?? "";
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                              color: TColor.primary,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            txt,
                            style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
