import 'package:flutter/material.dart';
import 'package:irbid/ImageContainer.dart';
import 'package:irbid/generated/l10n.dart';


class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);
  final double widthImage = 150;
  final List<String> IMGs = const <String>[
    'https://www.saaih.com/files/styles/gallery/public/gallery/%D8%A7%D9%84%D8%A3%D8%B1%D8%AF%D9%86/%D8%A5%D8%B1%D8%A8%D8%AF/Umm-Qais-Jordan-3.jpg',
    'https://www.saaih.com/files/styles/gallery/public/gallery/%D8%A7%D9%84%D8%A3%D8%B1%D8%AF%D9%86/%D8%A5%D8%B1%D8%A8%D8%AF/Umm-Qais-Jordan-2.jpg',
    'https://www.saaih.com/files/styles/gallery/public/gallery/%D8%A7%D9%84%D8%A3%D8%B1%D8%AF%D9%86/%D8%A5%D8%B1%D8%A8%D8%AF/Umm-Qais-Jordan-1.jpg',
    'https://www.sa2eh.com/site-images/sites/default/files/sa2eh-prod/article/c/f/0/aaa3bb577144875e53960279a10e292a27036a6f-241119132255.jpg?preset=v3.0_DYNxDYN&rnd=12344&save-png=1',
    'https://www.sa2eh.com/site-images/sites/default/files/sa2eh-prod/article/c/f/0/27a2679904a34a01143a992de0a3f1995536b2cf-241119132256.jpg?preset=v3.0_DYNxDYN&rnd=12344&save-png=1',
    'https://www.sa2eh.com/site-images/sites/default/files/sa2eh-prod/article/c/f/0/2d7209ccfc1ba90e7f4520f1472c47cb64c72d44-241119132256.jpg?preset=v3.0_DYNxDYN&rnd=12344&save-png=1',
  ];

  Widget _createImagesBar() {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: IMGs.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Row(children: [
          createImage(IMGs[index]),
          const SizedBox(
            width: 7,
          )
        ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Column(
            children: <Widget>[
        Row(
          children: <Widget>[
            createImage("assets/irbid_0.jpg"),
          return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              _buildParallaxBackground(context),
              _buildGradient(),
              _buildTitleAndSubtitle(),
            ],
          ),
          const Divider(),
          const Text(
              style: TextStyle(fontSize: 16),
              "تُمثل إربد في ثنايها موروثاً حضارياً تعاقبت عليها الإمبراطوريات والأُمم السابقة، والتي خلّفت ورائها آثارها ومُقتنياتها وكنوزها التي ما زالت شامِخةً على أراضيها. ويوجد فيها مقامات الصحابةِ رضوان الله عليهم، والتي فتحت مجالاً للسياحة الدينية في زيارةٍ الى أضرحة هؤلاء الصحابة. منهم مقام سيدنا معاذ بن جبل في الشونة الشمالية، فهو من ابرز مقامات صحابة رسول الله في المنطقة لمكانة صاحبه عند رسول الله والذي وصفه صلى الله عليه وسلم بأعلم أُمته في الحلال والحرام وأوفده قاضياً لليمن لتعليمهم احكام الشريعة والقران الكريم، ثم توفي في طاعون. ويضم المقام مسجدا للرجال واخر للنساء ومكتبة والمركز الثقافي الاسلامي للرجال وحديقة ومواقف سيارات ومدرسة نموذجية للقران الكريم استحدثتها وزارة الاوقاف والمرافق الاخرى لزيادة الخدمات الدينية. وهناك الصحابي شرحبيل بن حسنة ومقامه في وادي الريان، وقد تمييز الصحابي بالشجاعة والتضحية والكرم والذكاء وحسن الادارة ما دفع بالخليفة عمر بن الخطاب رضي الله عنه الى توليته على ربع الشام، وشارك صاحب المقام رضي الله مع الرسول العظيم صلى الله عليه وسلم الهجرتين وفي معارك الشام. ثم توفي في طاعون عمواس في السنة الثامنة للهجرة. مقامُه يضم مصلى للرجال ومكتبة وحديقة ومواقف للسيارات وقبة ومأذنة. وهناك موقع معركة اليرموك بالقرب من نهر اليرموك والتي كانت سنة (15 هـ - 636م) بين المسلمين والإمبراطورية البيزنطية، يعتبرها بعض المؤرخين من أهم المعارك في تاريخ العالم لأنها كانت بداية أول موجة انتصارات للمسلمين خارج جزيرة العرب، وأدت لتقدم الإسلام السريع في بلاد الشام. المعركة حدثت بعد وفاة الرسول صلى الله عليه وسلم عام 632م بأربع سنوات. "),
          const Divider(
            color: Colors.white,
          ),
          const Divider(
            height: 4,
            color: Colors.black,
          ),
          SizedBox(height: 150.0, child: _createImagesBar()),
        ],
      ),
    );
  }

  Widget createImage(String src) {
    return ImageFullScreenWrapperWidget(
        child: Image.network(
      src,
      width: widthImage,
    ));
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(seconds: 2),
      child: Image.network(
        "https://www.saaih.com/files/styles/gallery/public/gallery/%D8%A7%D9%84%D8%A3%D8%B1%D8%AF%D9%86/%D8%A5%D8%B1%D8%A8%D8%AF/Umm-Qais-Jordan-1.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle() {
    return const Positioned(
      right: 20,
      bottom: 10,
      child: Text(
        "تاريخ مدينة إربد",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
