import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SKPage extends StatelessWidget {
  const SKPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Renkler
    const blue = Color(0xFF5393F5);
    const orange = Color(0xFFFF6F00);
    const dark = Color(0xFF102A32);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              // Başlık
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "SÜLEYMAN KOYUNCUGİL\n",
                      style: TextStyle(
                        color: blue,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        height: 1.1,
                      ),
                    ),
                    TextSpan(
                      text: "İNOVASYON ",
                      style: TextStyle(
                        color: dark,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        height: 1.1,
                      ),
                    ),
                    TextSpan(
                      text: "MERKEZİ",
                      style: TextStyle(
                        color: orange,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Açıklama 1
              const Text(
                "SÜLEYMAN KOYUNCUGİL İNOVASYON MERKEZİ, SÜLEYMAN KOYUNCUGİL’e doğum günü hediyesi olarak adını, hak ettiği biçimde; akıl, bilim, araştırma, icat ve yenilik alanında ölümsüzleştirmek için AİLESİ tarafından 23.09.2020 tarihinde açılmıştır.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: dark,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 32),
              // Açıklama 2 + Link
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  const Text(
                    "SÜLEYMAN KOYUNCUGİL İNOVASYON MERKEZİ, bağımsız AR-GE Merkezi olarak ",
                    style: TextStyle(
                      color: dark,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                      height: 1.6,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      const url = "https://www.bibyazilim.com.tr/";
                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    },
                    child: const Text(
                      "BİB Yazılım Savunma Enerji İnşaat A.Ş.",
                      style: TextStyle(
                        color: dark,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                        height: 1.6,
                      ),
                    ),
                  ),
                  const Text(
                    " bünyesinde faaliyet gösterecektir.",
                    style: TextStyle(
                      color: dark,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}