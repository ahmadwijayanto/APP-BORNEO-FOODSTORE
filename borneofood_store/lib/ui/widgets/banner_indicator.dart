part of 'widgets.dart';

class BannerIndicator extends StatelessWidget {
  final int currentBanner;
  final int index;

  BannerIndicator({this.currentBanner, this.index});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      margin: EdgeInsets.only(right: 5, top: 5),
      height: 6,
      width: currentBanner == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentBanner == index ? Colors.deepOrange : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}