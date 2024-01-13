import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rub_face_app/components/app_bar.dart';
import 'package:rub_face_app/components/button.dart';
import 'package:rub_face_app/components/event_tile.dart';
import 'package:rub_face_app/pages/product_page.dart';
import 'package:provider/provider.dart';
import 'package:rub_face_app/pages/makerspace_page.dart';
import 'package:rub_face_app/providers/dark_mode_provider.dart';

class MenuPage extends StatefulWidget {
  final List<Map<String, dynamic>> productList;

  //const MenuPage({Key? key, required this.productList}) : super(key: key);
  const MenuPage({required this.productList});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double horizontalSpacing = screenWidth * 0.05;
    double verticalSpacing = screenWidth * 0.02;

    //Product list
    List<Map<String, dynamic>> products = [
      {
        'productName': 'Infinity Handschuh',
        'rating': '5.0',
        'imagePath': 'lib/images/glove.png',
        'images': ['lib/images/glove.png'],
        'space': 'Digitallabor + Holzwerkstatt',
        'description':
            "Schlag' ein neues Kapitel in der Wired-Welt auf mit dem ultimativen Infinity Handschuh Prototypen – hier wird nicht nur gestylt, sondern auch geschaltet! 💥🔗 Mit einem Snap lässt du nicht nur die Fashion-Welt erzittern, sondern auch die Technik. Der Wired Handschuh – wo Stil auf Schaltung trifft. Hol dir die Macht der Infinity Fashion und zeig, dass du nicht nur Trends setzt, sondern auch Verbindungen herstellst! 🚀🧤#WiredInfinity #FashionWithPower",
        'price': '27.99',
      },
      {
        'productName': 'Kirby',
        'rating': '4.6',
        'imagePath': 'lib/images/kirby_front.png',
        'images': [
          'lib/images/kirby_front.png',
          'lib/images/kirby_right.png',
          'lib/images/kirby_back.png'
        ],
        'space': 'Designlabor',
        'description':
            "Tauche ein in die fabelhafte Welt des Lilanen 3D-gedruckten Kirby – ein absolutes Must-Have für alle, die Stil und Niedlichkeit lieben! 🌈🎮 Mit diesem einzigartigen Kunstwerk bringst du nicht nur Farbe in deinen Raum, sondern auch das ikonische Lächeln von Kirby. Jeder Druck ist ein Unikat und lässt deine Liebe für Gaming und Ästhetik verschmelzen. Gönn' dir den Lilanen Kirby 3D-Druck und mach aus deinem Zuhause einen Ort voller Freude und Kreativität! 🍭👾 #KirbyArtistry #3DPrintedJoy",
        'price': '4.99',
      },
      {
        'productName': 'Kitten',
        'rating': '4.8',
        'imagePath': 'lib/images/cat_front.png',
        'images': [
          'lib/images/cat_front.png',
          'lib/images/cat_right.png',
          'lib/images/cat_left.png'
        ],
        'space': 'Designlabor',
        'description':
            "Verleih deinem Raum eine Prise Eleganz mit dem Weißen 3D-gedruckten Katzencharme – ein Kunstwerk, das Minimalismus und verspielte Raffinesse vereint! 🐾✨ Dieser einzigartige Druck fängt die Magie der Katzenwelt in klaren Linien ein und setzt einen stylischen Akzent in jedem Raum. Hol dir die Katzenfigur und lass deine Umgebung von der Schlichtheit und Anmut dieser faszinierenden Kreation durchdringen. Perfekt für Liebhaber von modernem Design und Katzenliebhaber gleichermaßen! 🌟🐱 #EleganceIn3D #CatArtistry",
        'price': '7.99',
      },
      {
        'productName': 'The Mask',
        'rating': '4.0',
        'imagePath': 'lib/images/head_front.png',
        'images': [
          'lib/images/head_front.png',
          'lib/images/head_right.png',
        ],
        'space': 'Designlabor',
        'description':
            "Bringe mit unserer roten 3D-gedruckten Maske einen Hauch von Rätselhaftigkeit und Stil in deine Raumdekoration! 🔥🎭 Diese faszinierende Maske ist mehr als nur ein Dekorationsstück – sie ist ein Statement für Eleganz und Individualität. Die lebendige rote Farbe verleiht jedem Raum einen Hauch von Leidenschaft und Klasse, während die einzigartige Struktur einen zeitgenössischen und mysteriösen Touch hinzufügt. Hol sie dir und verleihe deinem Raum eine kunstvolle Note voller Charme und Geheimnis! 💫🌹 #RoteMaskenkunst #EleganzImDekor",
        'price': '14.99',
      },
      {
        'productName': 'FACEhausen',
        'rating': '4.2',
        'imagePath': 'lib/images/face_house_front.png',
        'images': [
          'lib/images/face_house_front.png',
          'lib/images/face_house_right.png',
          'lib/images/face_house_left.png'
        ],
        'space': 'Holzwerkstatt',
        'description':
            "Entdecke die Magie von FACEhausen, deiner ganz persönlichen Schatztruhe in Form eines bezaubernden Holzhauses! 🏡🌿 Diese einzigartige Schatulle erinnert an eine kleine Oase der Gemütlichkeit. Ihr Charme liegt in den feinen Details, die eine warme und einladende Atmosphäre schaffen. Perfekt, um deine Lieblingsstücke stilvoll aufzubewahren oder einfach als dekoratives Highlight in jedem Raum. Hol dir dieses zauberhafte Holzhaus und lass FACEhausen zu deinem eigenen Ort der Magie werden! ✨ #MagischeSchatztruhe #FACEhausenCharm",
        'price': '24.99',
      },
      {
        'productName': 'Simba',
        'rating': '4.6',
        'imagePath': 'lib/images/cat_print_front.png',
        'images': [
          'lib/images/cat_print_front.png',
          'lib/images/cat_print_right.png'
        ],
        'space': 'Textillabor',
        'description':
            "Tauche ein in die Welt von 'Simba' – unser geheimnisvoller Begleiter auf einem katzigen Abenteuer durch Stoff und Stil! 🐾🌟  Dieser zauberhafte Textildruck ist mehr als nur ein Muster; er ist eine subtile Erinnerung an die spielerische Magie von Katzen. Hol dir diesen einzigartigen Aufdruck und lass Simbas elegante Präsenz deine Kleidung verzieren. Ein Hauch von katziger Kreativität, um deine Garderobe mit Stil und Persönlichkeit zu bereichern! 🐱👕 #SimbaTextilMagie #KatzigeKreativität",
        'price': '8.99',
      },
      {
        'productName': 'Print Pascal',
        'rating': '4.0',
        'imagePath': 'lib/images/tshirt_print.png',
        'images': [
          'lib/images/tshirt_print.png',
          'lib/images/tshirt_front.png'
        ],
        'space': 'Textillabor',
        'description':
            "Verleihe deiner Kleidung einen Hauch von exotischem Charme mit unserem einzigartigen Textildruck 'Pascal'. Diese kreative Mischung aus Eidechse und Chamäleon, gekrönt mit königlichem Flair und einer ausgestreckten Zunge, sorgt für einen verspielten und individuellen Look. Hol dir Pascal auf deinen Stoff und zeige deine Lust am kreativen Stil! 🦎👑👕 #PascalStyle #VerspielterAufdruck",
        'price': '8.99',
      },
    ];

    List<EventTile> eventList = products.map((product) {
      return EventTile(
        name: product['productName'],
        price: product['price'],
        imagePath: product['imagePath'],
        rating: product['rating'],
        details: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(
              product: product,
              productList: products,
            ),
          ),
        ),
      );
    }).toList();

    return Scaffold(
      backgroundColor: Provider.of<DarkModeProvider>(context).isDarkMode
          ? Color.fromARGB(255, 14, 20, 31)
          : Color.fromARGB(255, 231, 231, 231),
      appBar: MyAppBar(
        myTitle: 'M A K E R S P A C E',
        productList: products,
      ),
      body: Stack(
        children: [
          Transform.rotate(
            angle: 180 * 3.1415927 / 180,
            child: Image.asset(
              "lib/images/header2.png",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Container(
            color: Provider.of<DarkModeProvider>(context).isDarkMode
                ? Colors.black.withOpacity(0.1)
                : Colors.white.withOpacity(0.1),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(25),
                margin: EdgeInsets.symmetric(
                    horizontal: horizontalSpacing, vertical: verticalSpacing),
                decoration: BoxDecoration(
                    color: Provider.of<DarkModeProvider>(context).isDarkMode
                        ? Color.fromARGB(255, 8, 22, 35).withOpacity(0.8)
                        : Color.fromARGB(255, 0, 53, 96).withOpacity(0.95),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Color.fromARGB(255, 0, 53, 96), width: 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "10 % SALE",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: verticalSpacing),
                        MyButton(
                          myText: "Kaufen",
                          event: () {},
                        )
                      ],
                    ),
                    Image.asset(
                      'lib/images/face_house_front.png',
                      height: screenHeight * 0.15,
                    )
                  ],
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Suche",
                    hintStyle: TextStyle(
                        color: Provider.of<DarkModeProvider>(context).isDarkMode
                            ? const Color.fromARGB(255, 231, 231, 231)
                            : Color.fromARGB(255, 0, 53, 96)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 53, 96),
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.05),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  "Produkte",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Provider.of<DarkModeProvider>(context).isDarkMode
                          ? Colors.white
                          : Color.fromARGB(255, 0, 53, 96)),
                ),
              ),
              SizedBox(height: screenWidth * 0.03),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => eventList[index],
                  itemCount: eventList.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(height: screenWidth * 0.05),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  "Der Makerspace",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Provider.of<DarkModeProvider>(context).isDarkMode
                          ? Colors.white
                          : Color.fromARGB(255, 0, 53, 96)),
                ),
              ),
              SizedBox(height: screenWidth * 0.05),
              Container(
                height: screenHeight * 0.12,
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Provider.of<DarkModeProvider>(context).isDarkMode
                        ? Color.fromARGB(255, 8, 22, 35).withOpacity(0.8)
                        : Color.fromARGB(255, 0, 53, 96).withOpacity(0.95),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Color.fromARGB(255, 0, 53, 96), width: 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: screenHeight * 0.005),
                        GestureDetector(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              "lib/images/Button_Raumanfrage.jpg",
                              height: screenHeight * 0.085,
                              width: screenWidth * 0.35,
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MakerspacePage(
                                productList: products,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "https://makerspace.ruhr-uni-bochum.de",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 6.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenWidth * 0.035),
                        Text(
                          'Hier findest du Space \num deiner Kreativität \nfreien Lauf zu lassen...',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: screenWidth * 0.05),
            ],
          ),
        ],
      ),
    );
  }
}
