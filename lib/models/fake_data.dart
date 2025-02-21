import '../gen/assets.gen.dart';
import 'blog_model.dart';
import 'dete_models.dart';

Map homePagePosterMap = {
  "imageAssets": Assets.images.posterTest.path,
  "writer": "ملیکا عزیزی",
  "date": "یک روز پیش",
  "title": "دوازده قدم برنامه نویسی یک دوره",
  "view": "265"
};
// blog fake data
List<HashTagModel> tagList = [
  HashTagModel(title: "جاوا"),
  HashTagModel(title: "کاتلین"),
  HashTagModel(title: "فلاتر"),
  HashTagModel(title: "هوش مصنوعی"),
  HashTagModel(title: "وب"),
  HashTagModel(title: "IOT"),
  HashTagModel(title: "Dart"),
];
List<HashTagModel> selectedTags = [];

List<BlogModel> blogList = [
  BlogModel(
      id: 1,
      imageUrl:
          "https://digiato.com/wp-content/uploads/2022/04/photo_2022-04-29_09-37-59.jpg",
      title: "ایلان ماسک حدود 4 میلیارد دلار از سهام تسلا را فروخت",
      writer: "جواد تاجی",
      writerImageUrl: "https://digiato.com/wp-content/uploads/2021/02/1-30.jpg",
      date: "۱ ساعت پیش",
      content: """
      بر اساس اسناد و پرونده‌های نظارتی منتشر شده، «ایلان ماسک» مدیرعامل تسلا، حدود 4.4 میلیون سهام خود از غول خودروسازی را به ارزش 4 میلیارد دلار در روز سه‌شنبه فروخته است.

طبق گزارش‌های منتشر شده، ماسک در مجموع پنج فرم 4 را به کمیسیون بورس و اوراق بهادار ایالات متحده (SEC) ارائه کرده که تمام 138 تراکنش فردی او را پوشش می‌دهد. بر اساس محاسبات TechCrunch، ارزش سهام فروخته شده، نزدیک به 4 میلیارد دلار است. به گزارش رویترز، این میزان معادل 2.6 درصد از سهام او در تسلا محسوب می‌شود
      """,
      views: "256"),
  BlogModel(
      id: 2,
      imageUrl:
          "https://digiato.com/wp-content/uploads/2022/04/photo_2022-04-29_09-06-13.jpg",
      title:
          "گزارش درآمد فصل دوم سال مالی 2022 اپل منتشر شد؛ رشد 9 درصدی درآمد",
      writer: "جواد تاجی",
      writerImageUrl: "https://digiato.com/wp-content/uploads/2021/02/1-30.jpg",
      date: "۴ ساعت پیش",
      content: """

هرچند اپل همچنان با محدودیت‌های عرضه دست و پنجه نرم می‌کند، اما در گزارش درآمد سه ماهه دوم سال مالی خود، بهترین فصل منتهی به مارس را در تاریخش گزارش کرد. غول فناوری در این سه ماهه، 97.3 میلیارد دلار درآمد داشته که نسبت به مدت زمان مشابه در سال گذشته، 9 درصد افزایش یافته است. همچنین سود این شرکت 25 میلیارد دلار و سود هر سهم آن 1.52 دلار بوده است.

      """,
      views: "256"),
  BlogModel(
      id: 3,
      imageUrl:
          "https://digiato.com/wp-content/uploads/2022/04/1200-178443098-space-exploration-risks_smaller.jpg",
      title: "کاوشگران سیاره سرخ چگونه به تولید برق در مریخ می‌پردازند؟",
      writer: "مرضیه فرجی",
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/2022/02/10897985_639437109516078_4342420382567329691_n-300x300.jpg",
      date: "",
      content: """
انرژی خورشیدی و انرژی هسته‌ای منابع انرژی هستند که تیم‌های کاوشگران در مریخ مورد استفاده قرار می‌دهند. کدام یک بهتر است؟ چطور می‌توان به تولید برق در مریخ پرداخت؟ دانشمندان به این سوالات پاسخ دادند.

محققان برای سفرهای خدمه مریخ به گزینه مختلف تولید انرژی را باهم مقایسه کردند: سلول‌های خورشیدی و انرژی‌ هسته‌ای رآکتورهای شکاف کوچک. یکی از ملاحظات کلیدی در این مطالعه، مقدار وزن یا جرم قابل حمل اجزای مورد نیاز است، زیرا لوازمی که در ماموریت‌های مریخ مورد استفاده قرار می‌گیرند، باید بهینه‌ترین وزن را داشته باشند. نتایج این مطالعه که در « Frontiers in Astronomy and Space Sciences» به چاپ رسید، نشان می‌دهد وابسته به موقعیت جغرافیایی روی سطح سیاره سرخ و شرایط آب و هوایی، روش‌های دست‌یابی به انرژی در مریخ متفاوت خواهد بود.

«آنتونی آبل» محقق دپارتمان مهندسی شیمی دانشگاه «برکلی» و یکی از نویسندگان این مطالعه می‌گوید: «برای تولید برق در مریخ، موقعیت کاوشگر در سطح سیاره عامل تعیین کننده است. اگر به خط استوا نزدیک باشد، استفاده از انرژی خورشیدی توصیه می‌شود و اگر به قطب‌ها نزدیک باشد، بهتر است از انرژی هسته‌ای استفاده شود.»
      """,
      views: "256"),
  BlogModel(
      id: 4,
      imageUrl:
          "https://digiato.com/wp-content/uploads/2022/04/13WELLREAD-CACIOPPO-superJumbo.jpg",
      title: "چگونه عشق بر عملکرد مغز ما تاثیر می‌گذارد؟",
      writer: "مرضیه فرجی",
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/2022/02/10897985_639437109516078_4342420382567329691_n-300x300.jpg",
      date: "۱۷ ساعت پیش",
      content: """
آیا می‌توانیم بدون عشق زندگی خود را پیش ببریم؟ برای سال‌ها، «استفانی اورتیگ» عصب‌شناس، معتقد بود که پاسخ این سوال مثبت است. با وجود اینکه دکتر اورتیگ در مورد علم ارتباطات انسانی تحقیق می‌کرد، موفق شد اهمیت این ارتباطات را به صورت مستقیم در زندگی خود نیز درک کند.

او در کتاب جدید خود با عنوان « I told myself that being unattached made me a more objective researcher: I could investigate love without being under its spell» می‌نویسد: « به خودم گفتم که عدم وابستگی سبب می‌شود محققی موفق‌تر باشم، می‌توانم بدون آنکه تحت تاثیر قرار بگیرم، در مورد عشق و رابطه تحقیق کنم.»

اما سپس او در سال 2011 و در سن 37 سالگی، «جان کاچیوپو» را در یک کنفرانس علوم اعصاب در «شانگهای» ملاقات کرد. دکتر کاچیوپو، که این مفهوم را رایج کرد که تنهایی طولانی مدت می‌تواند به اندازه سیگار کشیدن برای سلامتی مضر باشد، او را به خود مجذوب کرد.

این دو دانشمند به‌طرز عجیبی در زندگی باهم آشنا شدند و سپس ازدواج کردند. آن‌ها در دانشکده پزشکی «پریتزکر» در شیکاگو با یکدیگر همکار شدند و تیم تحقیقاتی خود را در آزمایشگاه تشکیل دادند.
      """,
      views: "256"),
  BlogModel(
      id: 5,
      imageUrl: "https://digiato.com/wp-content/uploads/2022/04/cghjm.jpg",
      title: "ساخت اسپیکرهای فوق باریک توسط مهندسان MIT",
      writer: "آرش تهرانی",
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/2022/04/elon-musk-4-90x90.jpg",
      date: "ساعت پیش ۴ ",
      content: """
مهندسان دانشگاه MIT به تازگی اسپیکر فوق باریکی را ساخته‌اند که می‌توان آن را مانند کاغذدیواری روی هر سطحی نصب کرد. به گفته تیم مذکور این اسپیکرها مصرف انرژی پایینی دارند و تولید انبوه آن‌ها آسان است.

اگر بخواهیم عملکرد این اسپیکر را به زبان ساده توضیح دهیم بایست بگوییم محصول مذکور از طریق مرتعش کردن دیافراگم اسپیکر، هوای روی آن را به گردش در می‌آورد تا امواج صوتی تولید کند، امری که در باقی اسپیکرها و سیستم‌های صوتی به وسیله جریان‌های الکتریکی و میدان‌های مغناطیسی انجام می‌شود.

با این وجود دانشمندان در سال‌های اخیر توانستند با ایجاد روش‌های متفاوت، در دستگاه‌های بسیار باریک به نتایج مشابهی دست پیدا کنند. برای مثال اسپیکرهای «فیلم باریک» از مواد پیزوالکتریک استفاده می‌کنند که در پاسخ به تغییر ولتاژ مرتعش می‌شود.

مشکل اما اینجاست که این دسته از اسپیکرهای باریک یا بایست حالت ایستاده و آزاد داشته باشند، یا اینکه با کمی فاصله از سطوح دیگر در جای خود قرار بگیرند زیرا نصب کردن‌شان موجب کاهش قابلیت ارتعاش و تولید صوت در آنها می‌شود.
      """,
      views: "256"),
  BlogModel(
      id: 6,
      imageUrl:
          "https://digiato.com/wp-content/uploads/2022/04/photo_2022-04-29_09-37-59.jpg",
      title: "ایلان ماسک حدود 4 میلیارد دلار از سهام تسلا را فروخت",
      writer: "جواد تاجی",
      writerImageUrl: "https://digiato.com/wp-content/uploads/2021/02/1-30.jpg",
      date: "۱ ساعت پیش",
      content: """
      بر اساس اسناد و پرونده‌های نظارتی منتشر شده، «ایلان ماسک» مدیرعامل تسلا، حدود 4.4 میلیون سهام خود از غول خودروسازی را به ارزش 4 میلیارد دلار در روز سه‌شنبه فروخته است.

طبق گزارش‌های منتشر شده، ماسک در مجموع پنج فرم 4 را به کمیسیون بورس و اوراق بهادار ایالات متحده (SEC) ارائه کرده که تمام 138 تراکنش فردی او را پوشش می‌دهد. بر اساس محاسبات TechCrunch، ارزش سهام فروخته شده، نزدیک به 4 میلیارد دلار است. به گزارش رویترز، این میزان معادل 2.6 درصد از سهام او در تسلا محسوب می‌شود
      """,
      views: "256"),
  BlogModel(
      id: 7,
      imageUrl:
          "https://digiato.com/wp-content/uploads/2022/04/photo_2022-04-29_09-06-13.jpg",
      title:
          "گزارش درآمد فصل دوم سال مالی 2022 اپل منتشر شد؛ رشد 9 درصدی درآمد",
      writer: "جواد تاجی",
      writerImageUrl: "https://digiato.com/wp-content/uploads/2021/02/1-30.jpg",
      date: "۴ ساعت پیش",
      content: """

هرچند اپل همچنان با محدودیت‌های عرضه دست و پنجه نرم می‌کند، اما در گزارش درآمد سه ماهه دوم سال مالی خود، بهترین فصل منتهی به مارس را در تاریخش گزارش کرد. غول فناوری در این سه ماهه، 97.3 میلیارد دلار درآمد داشته که نسبت به مدت زمان مشابه در سال گذشته، 9 درصد افزایش یافته است. همچنین سود این شرکت 25 میلیارد دلار و سود هر سهم آن 1.52 دلار بوده است.

      """,
      views: "256"),
  BlogModel(
      id: 8,
      imageUrl:
          "https://digiato.com/wp-content/uploads/2022/04/1200-178443098-space-exploration-risks_smaller.jpg",
      title: "کاوشگران سیاره سرخ چگونه به تولید برق در مریخ می‌پردازند؟",
      writer: "مرضیه فرجی",
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/2022/02/10897985_639437109516078_4342420382567329691_n-300x300.jpg",
      date: "",
      content: """
انرژی خورشیدی و انرژی هسته‌ای منابع انرژی هستند که تیم‌های کاوشگران در مریخ مورد استفاده قرار می‌دهند. کدام یک بهتر است؟ چطور می‌توان به تولید برق در مریخ پرداخت؟ دانشمندان به این سوالات پاسخ دادند.

محققان برای سفرهای خدمه مریخ به گزینه مختلف تولید انرژی را باهم مقایسه کردند: سلول‌های خورشیدی و انرژی‌ هسته‌ای رآکتورهای شکاف کوچک. یکی از ملاحظات کلیدی در این مطالعه، مقدار وزن یا جرم قابل حمل اجزای مورد نیاز است، زیرا لوازمی که در ماموریت‌های مریخ مورد استفاده قرار می‌گیرند، باید بهینه‌ترین وزن را داشته باشند. نتایج این مطالعه که در « Frontiers in Astronomy and Space Sciences» به چاپ رسید، نشان می‌دهد وابسته به موقعیت جغرافیایی روی سطح سیاره سرخ و شرایط آب و هوایی، روش‌های دست‌یابی به انرژی در مریخ متفاوت خواهد بود.

«آنتونی آبل» محقق دپارتمان مهندسی شیمی دانشگاه «برکلی» و یکی از نویسندگان این مطالعه می‌گوید: «برای تولید برق در مریخ، موقعیت کاوشگر در سطح سیاره عامل تعیین کننده است. اگر به خط استوا نزدیک باشد، استفاده از انرژی خورشیدی توصیه می‌شود و اگر به قطب‌ها نزدیک باشد، بهتر است از انرژی هسته‌ای استفاده شود.»
      """,
      views: "256"),
  BlogModel(
      id: 9,
      imageUrl:
          "https://digiato.com/wp-content/uploads/2022/04/13WELLREAD-CACIOPPO-superJumbo.jpg",
      title: "چگونه عشق بر عملکرد مغز ما تاثیر می‌گذارد؟",
      writer: "مرضیه فرجی",
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/2022/02/10897985_639437109516078_4342420382567329691_n-300x300.jpg",
      date: "۱۷ ساعت پیش",
      content: """
آیا می‌توانیم بدون عشق زندگی خود را پیش ببریم؟ برای سال‌ها، «استفانی اورتیگ» عصب‌شناس، معتقد بود که پاسخ این سوال مثبت است. با وجود اینکه دکتر اورتیگ در مورد علم ارتباطات انسانی تحقیق می‌کرد، موفق شد اهمیت این ارتباطات را به صورت مستقیم در زندگی خود نیز درک کند.

او در کتاب جدید خود با عنوان « I told myself that being unattached made me a more objective researcher: I could investigate love without being under its spell» می‌نویسد: « به خودم گفتم که عدم وابستگی سبب می‌شود محققی موفق‌تر باشم، می‌توانم بدون آنکه تحت تاثیر قرار بگیرم، در مورد عشق و رابطه تحقیق کنم.»

اما سپس او در سال 2011 و در سن 37 سالگی، «جان کاچیوپو» را در یک کنفرانس علوم اعصاب در «شانگهای» ملاقات کرد. دکتر کاچیوپو، که این مفهوم را رایج کرد که تنهایی طولانی مدت می‌تواند به اندازه سیگار کشیدن برای سلامتی مضر باشد، او را به خود مجذوب کرد.

این دو دانشمند به‌طرز عجیبی در زندگی باهم آشنا شدند و سپس ازدواج کردند. آن‌ها در دانشکده پزشکی «پریتزکر» در شیکاگو با یکدیگر همکار شدند و تیم تحقیقاتی خود را در آزمایشگاه تشکیل دادند.
      """,
      views: "256"),
  BlogModel(
      id: 10,
      imageUrl: "https://digiato.com/wp-content/uploads/2022/04/cghjm.jpg",
      title: "ساخت اسپیکرهای فوق باریک توسط مهندسان MIT",
      writer: "آرش تهرانی",
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/2022/04/elon-musk-4-90x90.jpg",
      date: "ساعت پیش ۴ ",
      content: """
مهندسان دانشگاه MIT به تازگی اسپیکر فوق باریکی را ساخته‌اند که می‌توان آن را مانند کاغذدیواری روی هر سطحی نصب کرد. به گفته تیم مذکور این اسپیکرها مصرف انرژی پایینی دارند و تولید انبوه آن‌ها آسان است.

اگر بخواهیم عملکرد این اسپیکر را به زبان ساده توضیح دهیم بایست بگوییم محصول مذکور از طریق مرتعش کردن دیافراگم اسپیکر، هوای روی آن را به گردش در می‌آورد تا امواج صوتی تولید کند، امری که در باقی اسپیکرها و سیستم‌های صوتی به وسیله جریان‌های الکتریکی و میدان‌های مغناطیسی انجام می‌شود.

با این وجود دانشمندان در سال‌های اخیر توانستند با ایجاد روش‌های متفاوت، در دستگاه‌های بسیار باریک به نتایج مشابهی دست پیدا کنند. برای مثال اسپیکرهای «فیلم باریک» از مواد پیزوالکتریک استفاده می‌کنند که در پاسخ به تغییر ولتاژ مرتعش می‌شود.

مشکل اما اینجاست که این دسته از اسپیکرهای باریک یا بایست حالت ایستاده و آزاد داشته باشند، یا اینکه با کمی فاصله از سطوح دیگر در جای خود قرار بگیرند زیرا نصب کردن‌شان موجب کاهش قابلیت ارتعاش و تولید صوت در آنها می‌شود.
      """,
      views: "256"),
  BlogModel(
      id: 11,
      imageUrl:
          "https://digiato.com/wp-content/uploads/2022/04/photo_2022-04-29_09-37-59.jpg",
      title: "ایلان ماسک حدود 4 میلیارد دلار از سهام تسلا را فروخت",
      writer: "جواد تاجی",
      writerImageUrl: "https://digiato.com/wp-content/uploads/2021/02/1-30.jpg",
      date: "۱ ساعت پیش",
      content: """
      بر اساس اسناد و پرونده‌های نظارتی منتشر شده، «ایلان ماسک» مدیرعامل تسلا، حدود 4.4 میلیون سهام خود از غول خودروسازی را به ارزش 4 میلیارد دلار در روز سه‌شنبه فروخته است.

طبق گزارش‌های منتشر شده، ماسک در مجموع پنج فرم 4 را به کمیسیون بورس و اوراق بهادار ایالات متحده (SEC) ارائه کرده که تمام 138 تراکنش فردی او را پوشش می‌دهد. بر اساس محاسبات TechCrunch، ارزش سهام فروخته شده، نزدیک به 4 میلیارد دلار است. به گزارش رویترز، این میزان معادل 2.6 درصد از سهام او در تسلا محسوب می‌شود
      """,
      views: "256"),
  BlogModel(
      id: 12,
      imageUrl:
          "https://digiato.com/wp-content/uploads/2022/04/photo_2022-04-29_09-06-13.jpg",
      title:
          "گزارش درآمد فصل دوم سال مالی 2022 اپل منتشر شد؛ رشد 9 درصدی درآمد",
      writer: "جواد تاجی",
      writerImageUrl: "https://digiato.com/wp-content/uploads/2021/02/1-30.jpg",
      date: "۴ ساعت پیش",
      content: """

هرچند اپل همچنان با محدودیت‌های عرضه دست و پنجه نرم می‌کند، اما در گزارش درآمد سه ماهه دوم سال مالی خود، بهترین فصل منتهی به مارس را در تاریخش گزارش کرد. غول فناوری در این سه ماهه، 97.3 میلیارد دلار درآمد داشته که نسبت به مدت زمان مشابه در سال گذشته، 9 درصد افزایش یافته است. همچنین سود این شرکت 25 میلیارد دلار و سود هر سهم آن 1.52 دلار بوده است.

      """,
      views: "256"),
  BlogModel(
      id: 13,
      imageUrl:
          "https://digiato.com/wp-content/uploads/2022/04/1200-178443098-space-exploration-risks_smaller.jpg",
      title: "کاوشگران سیاره سرخ چگونه به تولید برق در مریخ می‌پردازند؟",
      writer: "مرضیه فرجی",
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/2022/02/10897985_639437109516078_4342420382567329691_n-300x300.jpg",
      date: "",
      content: """
انرژی خورشیدی و انرژی هسته‌ای منابع انرژی هستند که تیم‌های کاوشگران در مریخ مورد استفاده قرار می‌دهند. کدام یک بهتر است؟ چطور می‌توان به تولید برق در مریخ پرداخت؟ دانشمندان به این سوالات پاسخ دادند.

محققان برای سفرهای خدمه مریخ به گزینه مختلف تولید انرژی را باهم مقایسه کردند: سلول‌های خورشیدی و انرژی‌ هسته‌ای رآکتورهای شکاف کوچک. یکی از ملاحظات کلیدی در این مطالعه، مقدار وزن یا جرم قابل حمل اجزای مورد نیاز است، زیرا لوازمی که در ماموریت‌های مریخ مورد استفاده قرار می‌گیرند، باید بهینه‌ترین وزن را داشته باشند. نتایج این مطالعه که در « Frontiers in Astronomy and Space Sciences» به چاپ رسید، نشان می‌دهد وابسته به موقعیت جغرافیایی روی سطح سیاره سرخ و شرایط آب و هوایی، روش‌های دست‌یابی به انرژی در مریخ متفاوت خواهد بود.

«آنتونی آبل» محقق دپارتمان مهندسی شیمی دانشگاه «برکلی» و یکی از نویسندگان این مطالعه می‌گوید: «برای تولید برق در مریخ، موقعیت کاوشگر در سطح سیاره عامل تعیین کننده است. اگر به خط استوا نزدیک باشد، استفاده از انرژی خورشیدی توصیه می‌شود و اگر به قطب‌ها نزدیک باشد، بهتر است از انرژی هسته‌ای استفاده شود.»
      """,
      views: "256"),
  BlogModel(
      id: 14,
      imageUrl:
          "https://digiato.com/wp-content/uploads/2022/04/13WELLREAD-CACIOPPO-superJumbo.jpg",
      title: "چگونه عشق بر عملکرد مغز ما تاثیر می‌گذارد؟",
      writer: "مرضیه فرجی",
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/2022/02/10897985_639437109516078_4342420382567329691_n-300x300.jpg",
      date: "۱۷ ساعت پیش",
      content: """
آیا می‌توانیم بدون عشق زندگی خود را پیش ببریم؟ برای سال‌ها، «استفانی اورتیگ» عصب‌شناس، معتقد بود که پاسخ این سوال مثبت است. با وجود اینکه دکتر اورتیگ در مورد علم ارتباطات انسانی تحقیق می‌کرد، موفق شد اهمیت این ارتباطات را به صورت مستقیم در زندگی خود نیز درک کند.

او در کتاب جدید خود با عنوان « I told myself that being unattached made me a more objective researcher: I could investigate love without being under its spell» می‌نویسد: « به خودم گفتم که عدم وابستگی سبب می‌شود محققی موفق‌تر باشم، می‌توانم بدون آنکه تحت تاثیر قرار بگیرم، در مورد عشق و رابطه تحقیق کنم.»

اما سپس او در سال 2011 و در سن 37 سالگی، «جان کاچیوپو» را در یک کنفرانس علوم اعصاب در «شانگهای» ملاقات کرد. دکتر کاچیوپو، که این مفهوم را رایج کرد که تنهایی طولانی مدت می‌تواند به اندازه سیگار کشیدن برای سلامتی مضر باشد، او را به خود مجذوب کرد.

این دو دانشمند به‌طرز عجیبی در زندگی باهم آشنا شدند و سپس ازدواج کردند. آن‌ها در دانشکده پزشکی «پریتزکر» در شیکاگو با یکدیگر همکار شدند و تیم تحقیقاتی خود را در آزمایشگاه تشکیل دادند.
      """,
      views: "256"),
  BlogModel(
      id: 15,
      imageUrl: "https://digiato.com/wp-content/uploads/2022/04/cghjm.jpg",
      title: "ساخت اسپیکرهای فوق باریک توسط مهندسان MIT",
      writer: "آرش تهرانی",
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/2022/04/elon-musk-4-90x90.jpg",
      date: "ساعت پیش ۴ ",
      content: """
مهندسان دانشگاه MIT به تازگی اسپیکر فوق باریکی را ساخته‌اند که می‌توان آن را مانند کاغذدیواری روی هر سطحی نصب کرد. به گفته تیم مذکور این اسپیکرها مصرف انرژی پایینی دارند و تولید انبوه آن‌ها آسان است.

اگر بخواهیم عملکرد این اسپیکر را به زبان ساده توضیح دهیم بایست بگوییم محصول مذکور از طریق مرتعش کردن دیافراگم اسپیکر، هوای روی آن را به گردش در می‌آورد تا امواج صوتی تولید کند، امری که در باقی اسپیکرها و سیستم‌های صوتی به وسیله جریان‌های الکتریکی و میدان‌های مغناطیسی انجام می‌شود.

با این وجود دانشمندان در سال‌های اخیر توانستند با ایجاد روش‌های متفاوت، در دستگاه‌های بسیار باریک به نتایج مشابهی دست پیدا کنند. برای مثال اسپیکرهای «فیلم باریک» از مواد پیزوالکتریک استفاده می‌کنند که در پاسخ به تغییر ولتاژ مرتعش می‌شود.

مشکل اما اینجاست که این دسته از اسپیکرهای باریک یا بایست حالت ایستاده و آزاد داشته باشند، یا اینکه با کمی فاصله از سطوح دیگر در جای خود قرار بگیرند زیرا نصب کردن‌شان موجب کاهش قابلیت ارتعاش و تولید صوت در آنها می‌شود.
      """,
      views: "256"),
  BlogModel(
      id: 16,
      imageUrl: "",
      title: "",
      writer: "",
      writerImageUrl: "",
      date: "",
      content: """
      """,
      views: "256")
];
List<BlogPadModel> blocPadList = [
  BlogPadModel(
      id: 1,
      imageUrl: "https://digiato.com/wp-content/uploads/2022/04/cghjm.jpg",
      title: 'ایران پادکست',
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/2022/04/elon-musk-4-90x90.jpg",
      content: 'ایران پادکست'),
  BlogPadModel(
      id: 2,
      imageUrl:
          "data:image/jpeg;base64,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",
      title: 'ایران پادکست',
      writerImageUrl:
          "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxASERUQEBAWFRUQFxUYFRUWFRUVGBUVFRYWFhgWFxUYHSggGBolGxcVITEiJSkrLi8uGB8zODMtNygtLisBCgoKDg0OGhAQGi4lHx8tMCstLy0tLS0tLS0tLS0rLS4rLS0tLS0tLS0tLS0tLS0vKy0tLS0tLS0tLS0tLS0tLf/AABEIAKgBLAMBEQACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAACAAEEBQYHAwj/xABIEAABBAADBAUHCQYEBQUAAAABAAIDEQQSIQUGMUEiUWFxgRNykaGxssEHIyQyNEJSc5IUMzVigvAlotHhFUNTg7NjdJPC8f/EABsBAQACAwEBAAAAAAAAAAAAAAABAgMEBQYH/8QANREBAAICAQEGBAQEBgMAAAAAAAECAxEEMQUSITNRcRMyQWEigbHwkaHB0QYUIzRC4SRi8f/aAAwDAQACEQMRAD8A6UVKAlAxUgSgEoBKASgAoBKACgEoAKACgAoAKAHIAKkAUAFADkAFABQAUAFB5lAJUgCgAoBKACgAoBKASpAlAJUASpDFAyDrSxhKQJQCUAlAxQAUAlAJQAUAlB5lAJQAUAFADkAFSAKACgByACgAoAKACgAoAKACpAFABQCUAFAJQCUAlSBKgCVIYoGQdZtUDIGKASgZAJQCUAFAJQAUAlABQAUAFABQC5ABUjzKACgAoAKACgAoAKACgEoAKkAUAFAJQAUAlAJUgSoAlSBQMUAoOsWqBWgEoGQMSgEoAKBig88w60DFABQAUAlABQAUAFABUgCgAoAKACgAoAKACgAoAKACpAlABQCUAFAJUgSgEoBKASgZAKDq1qga0CQMSgEoKza22ooNHW554Mbx7yeACgZjF7z4twLmiOCNv1nUZHa8A26GY9xTaWU2ltyebR0r8v4c1X2mqF+pRsVzKGo0UJT8JtXER/u8RI3szFzf0usepNoXuD31xDdJY2SDrFxu+IPoCnZpdYTfHCv+uXRH+dtj9TbHppTsXGHxMcgzRva8dbXB3sUoGUEPaGPZELdZJ4NGpPhy7ygoJNr4yU5YY2Rjm59vIHXWgHs8FG0slvJvbI13kIZXSPunP5E/hYxoA9X+igeOB3R23OPKW6K9R5STI4/0jUeICD1lwW8OD1qSVo6iJwfD6wTYPCfKO9pyYrDURxy20jvY5TsaLAb5YGagJshPKQZfXw9anaF0yRrhbXBw6wQR6QpDFABQCUAFSAKACgAoBKASgBSBKASoAlSGKAUDIOqWqBWga0DWgGr0zBv8zuA7a5qBQYmTZEJLpp3TvJs9K7PdH8SoSxO+G22zvayKMRRRjoxgAcfvOr7xr1N6kGctQHCCS3DSVeQmurWu8DgiQgoHQM2wczSWnraS0+kaoL/dzaePknjgZMHB518qMwawaucXCnaAE8VO5Rpt8YNkwuLsRivKO5gOA8MrLcPSgyW/e88Qwv0SLyTHEtZYpzzQuQ3rXSoX1P60A/JZuoxkbcfO3NLLrFm1yMPB/nO431V1lNpdEUSGKwXsyRCFtDZ0EwyzwskH87Q72jRad8016SzVpE9WT2p8mmz5bMbXwk/gdY/S6/VSwT2jenXxZP8ALVlm5/k5x0BzYPGA9luiPxafUslO2cXS0TH81LcK/wBEZ+1ttYT7ThjI0feLMw/+SPT0ro4uXiyfLaJa9sN69YSsD8oOHdpLG+M9Y6Y9WvqWxtjaDBbYw037qZjuy6P6Tqp2hLKACpAlABQCUAFAJUgSgEoBQMUAlAyDqVqga0CtAJKDMb3QiUtjPBgviR0j11x0A9KiUs5Hs3KR0dOsD2qBmtpO+dd4ey1AivcALQQMXLlou4kB1a8HgOaP0kHxrkiXngt5J4XBzAyhyLfiNU0hscLiYNoxOlhb5PEwjNLF/wBRvN7es+vkeIKJVYKBwCdALJ5ILDZ2BL892KoEajto864KULHD7OYODQPD4oKTfnDZ5sLhAdXljB/3XA34eV9SiZ1Gx2GGNrWhjRTWAADqAFAehYaXZJgZVrWREFG+iCNKIWpe+p2zVqlyvjcW2RRcNNQQC7pXXXx17VrZclLa3P1ZK1tCFjIwBdEGxY5AlgcRXEUbXH5torXfSd/023MG5nX0/wC0IlcebzLd0Jrlmw55rKl6RMIeP3ewWJvy+GjeT97Lld+ttH1r2HZ/I+JXUy4/Jx92dsrtP5J8I+zh5pITyBqRo9NO9a6bVU025+28L9nnE7RwaHa/ok09BTaEN+9WMw5y43BObyzZXMvuu2nwKnYssFvfg5NDIYz1PFf5hYVtoXMUrXi2ODh1tII9IUhFAJQCpAlAJQCUAoGKBkHT7VAkDWgVoMztW/LPIPV3aNA4KqUbUg8OB4WORQc3mfbiesqBGxIzAMH3jXp0+KCFvC75+Qf+rL6A4gegaJAguwugJvpXRrSwASL8R6Vk7k62jb12HtR+ExMeIbdxO6Q/Ew6Ob4i1SYS3W8eFbHiHBn1H1IzzJBmFdl2PBVS23yVbGjfFJiXgFxeY2k/da1rSa6rLvUFS9tL1h6b3YZrMQQw1TGcOfE8D3q1J3CtuqohzFwGhsjrHNXVZjbbs23MI08GPgrwbH8QseWdUn2Wp80OtArn0yNq1T2sk5FIqElamW7NWrzcVys+Rt0q8XFcjJebS2qxoyxrEiXjj5pGQSuhFyNjkMYq7eGktFc9aXY7K5HdyxWWny8e6zMOPbO+U7aUf13smHVIwX6WUV7NxHTNyt8mY+KV7mCJ2HoyDNbcpBIeDXDouscq7USnbv7yYTHtf5Al3kzTmvbRo3TqPFpoohH2nuPs2fV+Fa0n70dxm+vo6HxCJZbGfJSWHNgsa9h5B49HTZXsKIVs+zdvYX60QxLBzbUh8Kp/qU7Hhh98WB3k8TC+Fw42CQO8EBw9BU95DQYfEMkaHxuDmngQbCuCKASgZAJQMUDIOm2qBWga0DWgze0T86/v+AVZS8GvA4kDR3E9hQcyv4+1QALw1zXHg02fDX4IIm9WHLMTM08pXnwkOdv8AlISB4Rvt0R1ytzF3Vw1FdZ1C26ZI1ET92LUxv7q7GDpLWlkh0PbH2fAOPF2EiB7m8PaqLNp8kO1WVLhHup2byrO0Foa4DuytP9XYq2hespe+Rb+0uym+iz2K1eituqmwzwHts1qOPerKsjtNwO3cOQb+ch91iw8idYrezJi+eHWw5cSuR0JoLMrzkV7hi5a2S7JWryc5crPdtY6gXPZiRJIECsmO/ctEotG40ibQ3YwOJBM2FjcXcXBuV3620fWve8LL8XDFnn89O7eYeWyN0cJhY5ooGuAxQLX24uOXK5oAJ4AZnelbbEofk/3QxODxEsk7mloj8kzKb8oM7XB5H3aDQK7SpmdoiNN61tkAc9PSoS9ZMOWmnED6vcA4Xr4FB6YnBFhABzZuGlG+4oKzbGxYZ2mPFQNeOpw1bfU7i09oIKDle8u6k+y3HF4NzpMPfzkbtSwH8XW3qdxHPtR4CxwGNZNG2WM6OHiDzB7QsnVV7lSGQCUDIGQdKtUCtA1oFaDKbVY8zP6VC+XcFEpeMGEaTrZsHn2HqUDnP+/tUAJPYgfarmzRsdfTjYI5BzLGaRSjr6JDT2t6ioSoMzmaK+0D2bs+TEzMhjFukNXyaObj2AaqB0DfCVgnbBH9TCxRwt/oBPquvBVSgbJwmJe8PwzXZozYeCGZT5xIF9iDQzHGvN4p4DxQJGXgBp9TRTCB4PBtztLiT0m+1SM9teMN25ABw8pFX6WFa/K8m/tLLg8yvu6q1681F3WmqywmzS9ocXVfAVenpXTw8G2Wnf3rfRqZORFLd3Tx/YySRG9khbxDXtJHeOSw5uzs8fL4/v7r05WOevgo9p4qVkohYzpVZDvTXEcvatCnZ9rzMZImJ9Hd4mHFbF8W9vDp4PfBYoSMDx4jqK5PIwzivNZUzYZxXmspCwsRKAkEjDHRes7Bzd7HNJ+jkc+mrRL2XoHPJEEiT2g9GTkOa78FV4IPXGYnyji8jUgCuXtQQ5WBwLXAEOBBBFgg6EEcxSDkX7B/w/aD8GL8jiB5SC7NcejfWKc3tyt61avghclXQYoBKBkCQdHtUCtArQNaDN7RPzr+9V+qXlC7XwPsKDmagMg8ZI+YNEcD38QRzBQM3Dsd9YV325vgRZ8CPEqEr3ZWPjwrSYGgyOFZqNDtJdqT2VXbyQQsJA+eZsQJLpXauOva5xKkW28e87sOf2LAO8kyHovkbWeR/wB7pcQLvhzvkkQbStgY2SSFr5ZHSOJdbnuLnEBxA6R14KULbDnpt85vtCDNbbd/jcH5kPusWtzP9vf2lm4/m193TGvXkos7s1Qt7Np2G4Z0jo4Y4my4pzPrOYTkjhb2vcDpz6IOhIPsuN5NPaP0cDL89vdS7Rw8MTw5mBMcUbWPZiIZSMTE1zWnyjoeOhJBArRp48DmY0t2KllkEr6lfAIi9zBpLGbdFiG1ple0VY0BaeFgDncvHMXjJHT6vTdj8qlsFuNadT46390/YkRbH0hWY3XZQHwXk+fet8n4fpDe5uSL5PD6NJsjY7pwXZsrWmrq7PHhY7Fk4HZduXWbd7UR4dNuRyOXGGYjW5e+I3dlaaa5jr4C8pPgf9VmzdhZ6T+C0T/Kf3+alO0MdusTH81dicHJH+8YW9pGnp4LmZ+LmwT/AKlZj9P4trHmpk+Wdhw51XT7Cyd3kd31hq8+u8e/RKXsXGJAkCQJAkAvKmFZc9+VXD/Mw4to6WElaeroPIsfqDPSVM+qInxeYcDqOB4K6TFAxQMgSDolqgVoFaBrQZzaP713f8FEpeMR18D7CoHNSoCQM49aAWPYeD22eWZovu11RI3NINEURyKC83M0lll/6TG13uJP/wBEkZNrS57jxJcbPislKzPRWWv3esQAHkXe8VF4mJ1JC8wx6TPOb7VVLN7d/jcP5kPuMWtzP9vf2lm4/m193Rw5eNl6LSk2sQcTTvqmTA5rOmTM8VXnhq9txvJp7R+jzeXzLe8stC6Z7Y8Q6aOOeGWYB0z8geLbIWZjyD5JAb0p9WKo52Ns9jxuw+IibqGyHFxRgODh5EtbiG2QeIdnaOwdVLFm8u3tP6L4/nj3hbhy+ea8Hp2ijxTotmvex2V2bjwq3tBI7atet7J3Xhbj1lzLY65ObFbdP+lBBtR731I8l0bWljibJF3V9YOvj2Llc7NeMkX30dPJxqY6brHhPVuYpRiGOje0dIf2e8Gl0OJzY7Rpkw5K6nX7/OJeems4bRessWHVqvP9nW7nKp76djk172KWe3r3zGDLGNjEj3jMQXZQ1l0CTRJJINdx8ffy89seA3zeYhNPs3FxxkWZWxOkiA45s9A5e2lAutjbwYTFfZ5mvIFlurXAdZY4A120iVogSBFB4TuUwpLJ78MD8DiGn/pl3iynj1tCv9GPf4oZ7ZD82HhJ4mNl9+UJHRlSipDIGQJB0K1QK0DWga0GY2nJ86/v+AUSl4RP49zvYVA567ioAl1aoIO0nUcruQBPe4BzR6CPSepBHY7sUi22fKHjyZOo+pfL+W/w+zj13CV3upLT5oz9+MO7bifZFea5/oUSM5IHQzPZzBPttZ8WSaTuGO9dtPs3FOMGc6npnvNlTmyTkvNp6yUr3Y00ssAYYXDTPkNeAvj22sK7J7eP+NQ+fD7jFr8vyL+0s3H82vu6GHLx8w9Ept5IQalIOXL5OUgW5rcwcyQeY8A129i9lxJ3gpMekPOZ41ktH3lW7Whw75WuljneWgZRExvkpy453OsA5S57nZuJ07lsMSfsTM7Etz/XjM00tG2sknAjbH1WGDwylYs3l29p/RfH88e7Rgr59rwenWWOhJwLHkXGx0ufmKdWpHVoR4r2PYsb4mvvP6ufN4ryp9dQ53svFshfL85WVoMLeJcXOy0b6LTlLzqaORU5PZV8sTNekfvTP2x2lrjxqPxfvxdR3N2m92UuOYSaagW3vrna0OBi/wAryNTHjbwebx55y16qiQ6HxXBxT3c0T9/6vU3jeOY+zK7J2U3FbV8rJF5WPB4dkjo+Ie7yjgxpFGxq59fyUdCvokvMQ6ZtTCAtjyvfm/aIHN1Nhj543yxk8RpE+wCOo2LBx18JmF56RLm3yhbvf8Px2H2hhsrGyzASsZoGuc52obybJGH2OAc13XpdVumlEvTIdCRo4OIPXlv4hYpyT8WtNeEz1ambkWpkisR4Sg7FxhxDXOyhpaQON3bXO6v5V0Ofxo4t613vvMfH5sZesa8dHxzS3Q/3YtatbRMzHo2ZtEzMejJ72P8AomI/Jk90rJ9FN/ihnN3z9Fh8xqiOjOnFSGQJAkG/tUCtA1oGtBl9p/vX9/wUSl54fjXWD7CoHPXFQGYzM5jPxvY39TgPigq94X/Py/nTep5r2pAjljxVgjQHhpR0v0rJNJrrasTE9HvhpjYdzBVJhZoXYkxyx4hnGg/vu2uB86nfqUJHtPBjEjysH7xgGZnMt5EdfV4JEj32PYw3SFG3aHTmrTO0Nlj3g/svY1nttQMbt8/41D58PuMWvyvIv7M3G82vu6AHLykw9EThY7OB6teRW/xOffj17sxuv6NPkcSuWe9E6lUybCGvk5pI2ni1rhXhY0XSx9rYLfNuGjbs/LHTUrDZuDZC3IwHU2STZcesnmp5XaGCMNu7bczGo/NGHiZPiR3o1EJwcvIad1qtlQmbZ8kTPrBx066LX148F63sK9Yw+0y4nPiYzb9Yc+27sJ5kcZGFpDQWtIou0INjqqwvU49Wp4ONzM257rbbi4VokdQNBodxNB3D0n4Lg24+Kcvf14wwcK07mFUTx8V4Ppff3e51+FT/ACY4lpx+IBlyVHA7iBnax80ZabPDNLH40vov0j2eWj6ujv2NWIZNGaZndI+P7okMb2+UaORcXDMOBIDtDmLqTHjErx0mFH8qmGY7AS2Dm+acHakN8lPG/hwFguF89OyrKoeHxFq2hpsMGvw1AZnND6A4h3Squ3X1qa1jvVmfpMKZce6+MezGbtMlgY8TRuY4SRHK8FpIyv6+S3f8R5qWnFfHMTrfR53F38FN2jUxaP0lebXa0xZweAFdoJoeOv8AdLl0rFrxkrPWHa7sXtGak+Ex4sFvS76LiPypPdK2p6Jj5oUW732WHzAqx0bKeVIZAkCQby1QK0DWgVoMxtI/Ov7/AIKJS88KekPH2FQOeuUBRzBj2SEWI3see5jg74IIW92FyYmdt3Uzzf8ALL02/wCUtSB4xzeUL3H7zGtA5XmaXd1ZSfELby5IyeP2hhpTuRr3eIFErWsywvCbjj7AfRTf91VIYZHMcHMJBHAjiP8AbsOiC/jxLpmZnUHOsWBzGgNeCkWcWLc98YcGjKWDohwug1vNx6vWUFDvB/GofPi9xiwcrybezNxvNr7t4HLy8w9En4HFsaMr2lwJuuV1Vkc+A/255Md61ju2hhyY7TO6y9Q6BzR9020aWOTQSSb4Gz20pmMNo9FI+LWfUOMwmQWHXrXAdVg6HvWHPg7kbiWTFm7860ihy1JhnWGyNpywPuLXNxbRIdXYOfFZ+LycvHvvH47+nqwcjBTLX8f0+q1xG28NO5rsTh3Wzmx12ONEGrC7mD/EPcjVqzG/TxcnN2NF5iYnevyW795MK1jnRDpu5ZC0l3IuNUpydsceKTNZ3Ppop2dk72pjUerGtK8lp3Z6OZbH20MJtBmIkbmissmbxzRF9mq5tIY8DmWAL6J/xr7Q8pHWfd9F4LaMcjY3B7XDEFxiLdQ9gtwcCLH1QD/dIlgfle2+G4NsLZNca6MNjoBzRDNnkkJB+qS1jK7T2oK/A4ztWSYUW+Mx748LK6MkFwYzTjTna126V/Uuh2fjpfNWL9I3P8DtTJanBrNeszr+b3lwL45xgcxIkhbJHZJAmY0h9HkHZZLHaOpY+diry+JOWI1attflPT9XFy4LTb4HrG4946/xQH4qRrXRGwObTyIIPgdF5/i2tXJFGvwc2SmX4U9PHcMxvM76LP8AlSe6V156S7UfNCn3f+yw+YFSOjaT1ISBIEg3NqgVoGtA1oMxtM/Ov7/gFEpBhT0h4+wqBgHcVABwsUgfajvLRtcR04WCN/8ANG3Rj+9ugP8ASeRUJZ/pMPHQ8+RVtoSYdfigunHgPwivafjXgoEWaXWupSL7Yz7iHefaUFphD84zzm+0IKreL+Mw+fF7jFg5Pk29mbjebX3bkOXm5h6IWZUmAQcqTCRZutVmPUiNHDlSape0E2U5qvQj0gj4qKz3Ld5W9e9Gk39sjdZe3pFtXX3qIvSv7rqWf4uO3jePFg+Fevyz4BxQjGsbrsnS+wdl9a189MceOOWTFN58Lw8Q5a2tyyz0clxDQ4uvm4+1fR61/BET6PHzOrTpZ4LaG0cBcUOIlg1JyENc0OI1LWvaQ007Ujr7VHw4not35V0zpp5/L4mZ0ryQXOcSXHLwHUB2DTiojGd9qtn4ztVpgiW12G4TAR39bokiiWnMHseAeYc1p7armsuLJNPxR9P3MfnDfnHTkcKaT1r4/wA/BabF2PJhpGyYicS5TIIyA6x5ai97y7uOmur3G1Xtftvj4sdYis1i8xE+kaidfv7Q5HB7Py9+Ztbfd3r80nfLZjTGcS3Rzcod/MCQ0HvFjw7lpxjibxkhXPxInLGaPCY6/dzPeI/RZ/ypPdK2p6LV+aFXsD7LD5jVSOjcT1KCQJAkG2tVCtA1oFaDM7S/ev7/AIBVlIML9YePsKgYB3FQGRJtQbCCNJhgdW6dnJEPTDwZTZNkcOoIl7lEIOIFOPapgX2wz80O93tKC6wzHB0biCA9wynkacAdRzFixxFjrCCq3j/jEXnxe4xYeR5VvZm43m1921Dl53T0Tqe7OzYmYWPoNJkY17iQCSXi9e668F3uLhrXFHh1jbgcnLa2WfHp4IEsWzpHFr4Aw5nttvRssJB/dnT6pOvV3KtuPx7z41/f5M8f5mkbi2/CJ/j7q7ePdRsUZmgc4hmrmO16PMg9nbyXP5fZ9aUm+P6fRm43Ote0Uv8AVk7XJmHUHG0u0aCT2An2KIpNvCI2ibRHWRXWh079FjtXXVMTE9BBypMAnPoE9QKrWm7R7ot8suVtcbsGjdg9vFfRdeDx2/Few7cjpzH4dtPdmFU/K48XBsl5tdQ2wNa4KNLbQNpTxvfmjblBa2wfxAU43etkX2XXKzMIk+EnIKSQ1m7+Nf5RgjdTnOAabrUmhqqSyVtMdGzO1py0CXXg4EtA4tBGo7HD0rnc7gY+ZSKXmY1O/BmxZrY53CHtfbEj4RDoGg32muA7uaycDiTxsfw+/Nojpv6R6MXIzfEnetMZvAfos/5Unulb09GrX5oV2wPs0PmNVI6NxPUoJAkCQbO1UK0DWgVoM1tJ3zr+evJVnql54KQE8wQSCDxBq6PgQfFQME7ioCQJAkDoGKDxmaDxQXW77eizsJofiOcCvQSpGi2W8GJ7Sf8AnQFvnZZrrvA8co6kGe3iP+LxefD7jFiz+Vb2ZuN5tfdsgV5/T0TrOFx7IMFDI+z83CGta0uc9zmgNa1o1JJ/ul6HD5dfaHm83mW95Dhv2bEYeLGFuRj4xMC4hpYyRpec1EgaPJPEWrTWJTXNevhEpeJnjmwrpI3B8csTnNcNQ5rmEgg9RBUZY3SY+0q451ePdyNrl5TT07V7tNDYHSVqS4nuaOHt9K7nZlIri731mXE7RtM5dekMng/lKEjWun2eSHgEeTkZJQIsW14b6lv2pW3haNtKtpr0loMC7C42B0+FaWlpc0tLchD2gOLXN4ahzTY6wudyuzcV6TNI1Mejc4/NyVtEXncKPGS1E93Uxx9RXA49O9lpH3h2M893HaftLm0bCeAX0HHivknVYeOvkrSPxSMsI5KbYMletZIy0npJArEuIFBabLxZa4EHUEEd4VZhMS3eztvyEHNTi4HXhxrU1oeCxzVk28cfNmJdwzEmuNWbVoYbM9t8/RZ/ypPdKm3RSvzQgbA+zQ+Y1Ujo3E9SgkCQJBsLVQrQNaBWgq8RE3OSRr1qspRI8OM7yDwI06/m26qBzt/FQGQOgSB0DFB4vQabd2IOgaa1aXUf6rUi1ig1a0GgHA1xzOsak+AAHLXjZJDO7wfxaLz4vdYsWfyrezNxvNr7tja4WnonZth/ZoPyovcC72Ly6+0PN5vMt7yymxZBNg9m4CxUmFw8s4sawsYzLHXPyj6B0osZIOpZGNdbE/hcX/th/wCNUyfLPsvT5o93L2leY09O12wPsh/7nxXc7P8AJj3lwu0POn2hyLD7MxLIGuZ5KVseFw+IdlcQ4MlJYGUbt4LTfD4LdmdRuWk6L8lsb2w4lsjMjhiiC0kGvo+H5jQ6a+Kx48lMtIvSdxK96Wpaa26wo9vS1h5fNI9Jpee4FO9yax93d5ltce0/Zk9nR2wntPsC+jcCP9OZ+7w3Mn8cR9kgQWaAsngBqSeqlu2tFY3M6hqx4zqHlisIRYc0tcORBBHeCtbLTHmxzaup9JhnxXtjvqf4IAXEdRc7G2NJM0yBwa0GhdmyOPDktrDxbZa7hz+X2lj41opMbn9F9hsBMzjR7j/rSi/Byx0jaMfbHGt1mY94/tt7SEjQilrTS1Z1aNN2uWmWO9Sdwqdun6NP+VJ7pVbdCvzQhbA+zQ+Y1Ujo209SEgSBINbaqGtArQK0EV46RVZ6peDWdKTw/wDGFA5g/ioDIEgdAkDFEvJ6Iazdb7OPOd7VIuYm9Id49qDJbf8A4tD50XusWLP5dvZm43m1920Y1cWIehmXVdztoslwzGAjPC0Mc3nTRQPcRXrXX494tSI9HB5WOa5Jn6T4vWPdnB/s8OGlgZOzDxsjYZmMe6o2hoJJbQOl6ALYazwwWzW4LZzobHzULsxBcRYj1IzHQacFS/yyvj+aPdyiKReevTT0lbbbTd4/RD/3F1+B5P5y4vaHnflDkk+y4m4QTybOxELXYPDBssdFjpswL5pMrqDXtMZ6Y4jkaK3J39GlH3dF+S9zDFiTHI+Rv7W6nyXnPzGHvNmAOhsajksHGi0Yq96IifSOjLnmJyT3ZmY+/Vk96pqhr8TgPRr8FzOyqb5Ez6bdTtO2sER66QN2sE+YCOMW57yBfDgDZPVWq91w7xTDNp6RLxfLrNs0VjrMO2YfZGFaxjI4WAxDoPyjMDVEl3Ek2b7157tP4uXBeven8X8P/jr8WMeO1ZiOjF/KPgABG+unbmntbWYeg+8Vi/wtfLS+bBbpEb/Pp4e/9GPtnu2jHkjrvX5f9OWNXQG23cfWGZ/V77l3uFX/AEa/v6vKdpxvk2/L9IapuCiOD/afKEODshbpRfmBFf0G/BU+Nkjk/C14dfy1/dX/ACmOeJ8ffjE6199/2UmNILL6v/xRzscTi36L9lXmmfux0soNuH6NP+VJ7pXDt0emr80ImwPs0PmNVI6NtPUhIEgSDU2qh7QNaBWg8HcfSqyl5v4v81vuKByyTioDIk6IJEkiDFEvN6Iazdc/Rx5zvapF7HE4BryBRNWDYBFW06CjRB4Ub0Jo0GO27/FofOi91ixZvLt7M3H82vu3cca5NYdyZWGHwjjlMZOdxOUAchx6YOh7OrmtilPRrZMkeO+j0ftXaMN5JZSAav8AeDQ194GtfaFsV78fVqWjHP0VW3t8cbKw4eV4A++GtDS6tacerupWt3rRqVaRSs7hR4fELTy4m9iytjuttiNjXRSmmuNgnhZABB6hoPWnFz1x7pbopzOPbLq9PGQzbryPw5w2E2q8QloYI3sgxAawVTA4BrwAAALcdOtdKLVvHhO3LtS1J8Y0t93NmyYSOZ2IlY90srpnOYwsaAI446ok8o7481jx46cfF3Y6V9Vr2tmybnrLlm9k9ljO9x8dFr9kY9Ra8/Vt9q38a0T9yMR5MCUC8kjrHYWAH1Er1fFr38E1+/8AZ5Pl3+Hnrb7f3dGw+8EJ/wCZR/mBHrOixX4ltamGWnLp6s1vhjvLygh2ZsbKFcLJJJH+UX2LPw+LXBS2o1M9f6Nbk8icuSPHwhzVq5TsNzufgJZ4mxwtzOa17qsN0D64nTi4LuYM1MPGra/Tev1cDlce+bk2ikePX+UN7itmPEbcF5J1CBzmyUcrsVYkLc3Dg1wHYSFo0z1m859/8ta/9ejayca0Y44/d8O7vf07/VhcRJ0T4e0Lpc6P9C35fq5nAr/5Ffz/AEVG2z9Fm/Kk90rz1uj0lfmhG2B9mh8xqxx0baepCQJAkH//2Q==",
      content: 'ایران پادکست'),
  BlogPadModel(
      id: 6,
      imageUrl:
          "data:image/png;base64,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",
      title: 'ایران پادکست',
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/2022/04/elon-musk-4-90x90.jpg",
      content: 'ایران پادکست'),
  BlogPadModel(
      id: 3,
      imageUrl: "https://digiato.com/wp-content/uploads/2022/04/cghjm.jpg",
      title: 'ایران پادکست',
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/2022/04/elon-musk-4-90x90.jpg",
      content: 'ایران پادکست'),
  BlogPadModel(
      id: 4,
      imageUrl: "https://digiato.com/wp-content/uploads/2022/04/cghjm.jpg",
      title: 'ایران پادکست',
      writerImageUrl:
          "https://digiato.com/wp-content/uploads/2022/04/elon-musk-4-90x90.jpg",
      content: 'ایران پادکست'),
];
