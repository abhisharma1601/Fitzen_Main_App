import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../main.dart';

class CreateAd {
  void getad() {
    if (adsbool) {
      print(adsbool);
      ads = BannerAd(
        size: AdSize.banner,
        adUnitId: "ca-app-pub-5418173870424245/2497040676",
        listener: BannerAdListener(
            onAdLoaded: (_) {
              adbool = true;
            },
            onAdFailedToLoad: (_, error) {
              print(error);
            },
            onAdClosed: (_) {}),
        request: AdRequest(),
      );
      ads.load();
    } else if (!adsbool) {
      print("NoAds");
    }
  }

  Widget checkforad() {
    if (adbool) {
      return Container(
        child: AdWidget(
          ad: ads,
        ),
        width: ads.size.width.toDouble(),
        height: 100,
        alignment: Alignment.center,
      );
    } else {
      print("failed!");
    }
    return Container();
  }
}
