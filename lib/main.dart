import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'App Ceutec';
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    NewsList(),
    Text(
      'El cambio de dolares',
      style: optionStyle,
    ),
    Text(
      'lista de tareas',
      style: optionStyle,
    ),
    Text(
      'podcast',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 243, 1, 1),
        title: Text(widget.title),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 198, 222, 241),
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Noticias'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('El cambio de monedas'),
              selected: _selectedIndex == 1,
              onTap: () { 
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Lista de tareas'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('podcast'),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        NewsItem(
          title: 'Inicio de periodo ',
          description: 'Este siguiente periodo Inicia El 11 de octubre .',
          imageUrl: 'https://i0.wp.com/www.academica.school/news/wp-content/uploads/2020/05/960x0.jpg?fit=800%2C500&ssl=1',
        ),
        SizedBox(height: 19),
        NewsItem(
          title: 'Adiccion de Carrera',
          description: 'Licenciatura en Terapia Fisica Y ocupacional',
          imageUrl: 'https://media.istockphoto.com/id/1501185786/es/foto/hombre-haciendo-ejercicios-de-fisioterapia-usando-una-banda-el%C3%A1stica.jpg?s=612x612&w=0&k=20&c=JR5M8TsQKSHf7EeC5rXQezjcd6GeWPIkl7id1C3Bhuc=',
        ),
        SizedBox(height: 16),
        NewsItem(
          title: 'Cantidad de alumnos ',
          description: 'Cada Año se matriculan mas alumnos por lo tanto ya somos mas de 30,000 alumnos.',
          imageUrl: 'https://st2.depositphotos.com/3662505/6878/i/950/depositphotos_68789187-stock-photo-students.jpg',
        ),
      ],
    );
  }
}

class NewsItem extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const NewsItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
