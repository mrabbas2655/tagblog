import 'package:tecbloc/constant/api_url_constant.dart';

class ArticleInfoModels {
  String? id;
  String? title;
  String? content;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  bool? isFavorite;

  ArticleInfoModels(
    this.title,
    this.content,
    this.image,
  );
  ArticleInfoModels.fromJson(Map<String, dynamic> element) {
    var info = element['info'];
    id = info['id'];
    title = info['title'];
    content = info['content'];
    image = ApiUrlConstant.hostDlUrl + info['image'];
    catId = info['catId'];
    catName = info['catName'];
    author = info['author'];
    view = info['view'];
    status = info['status'];
    createdAt = info['createdAt'];
    isFavorite = info['isFavorite'];
  }
}
// {
// "info": {
// "id": "1",
// "title": "۵ بازی مشابه Assassin’s Creed Valhalla که باید بازی کنید",
// "content": "آخرین بازی از فرنچایز اساسینز کرید یعنی بازی اساسینز کرید والهالا، یکی از آن بازی‌های گسترده و جهان بازی است که داستان وایکینگ‌ها را روایت می‌کند و جنبه‌های اکشن ادونچر (ماجراجویی) آن با تکیه بر المان‌های نقش‌آفرینی گیمرهای زیادی را به تحسین وا داشته است. در این بین باید اشاره کنیم که بسته الحاقی Dawn of Ragnarok هم مدتی است که عرضه شده و اگر طرفدار این بازی باشید به احتمال زیاد تا به الآن باید آن را تجربه کرده و چشم‌انتظار قسمت بعدی نشسته‌اید. پس با ویجیاتو و معرفی ۵ بازی مشابه Assassin’s Creed Valhalla همراه باشید.\r\n\r\nاز داستان‌سرایی مثال‌زدنی تا شخصیت پردازی‌ و طراحی و موسیقی‌های به کار رفته در Assassin’s Creed Valhalla همگی باعث می‌شوند تا این قسمت از مجموعه حرف‌های زیادی برای گفتن داشته باشد و هویت شکل گرفته تازه در میان این فرنچایز را به درجه بالایی برساند. یوبی‌سافت مونترال به واسطه طراحی و چینش درست مکانیزم‌های گیم‌پلی و سیستم کلی بازی سعی داشته تا این بار حس غوطه‌وری بیشتری را برای گیمر به ارمغان بیاورد و خوشبختانه اساسینز کرید والهالا حسابی به منبع ژانر خود وفادار است؛ مساله‌‎ای که بسیاری را ناخشنود و در عوض رضایت عده‌ای را به دست آورده است.",
// "image": "/Techblog/assets/upload/images/article/valhalla.jpg",
// "cat_id": "1",
// "cat_name": "اخبار و مقالات",
// "author": "بهرام امینی",
// "view": "7146",
// "status": "1",
// "created_at": "۱۴۰۱/۲/۱۶"
// },
// "isFavorite": false,
