import 'package:clinic_app/screens/catalogo_especialistas.dart';
import 'package:clinic_app/screens/catalogo_pruebas.dart';
import 'package:flutter/material.dart';
import 'package:clinic_app/utils/app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //  final _menuItems = [
//    {'label':'Agregar Usuario','route':'/add'},
//    {'label':'Listar Usuarios','route':'/list'},
//    {'label':'Actualizar Usuario','route':'/update'},
//    {'label':'Eliminar Usuario','route':'/delete'},
//  ];
  final _menuItems = [
    {'label': 'Catálogo Especialistas', 'route': 0},
    {'label': 'Catálogo de Pruebas', 'route': 1},
    {'label': 'Nosotros', 'route': 2},
    {'label': 'Cerrar Sesion', 'route': 3},
  ];

  int _selectedPage = 0;

  Text titulo = Text("Inicio");

  Text tituloListTile;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _getContentWidget(),
        appBar: ClaseAppBar().metodoAppBar(titulo),
        drawer: Drawer(
          child: ListView(children: _menu(context)),
        ),
      ),
    );
  }

  ListTile listTile(Text tituloList, Icon icon) {
    return ListTile(
      title: tituloList,
      trailing: icon,
    );
  }

  Widget _menuHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(
        //color: Colors.deepOrange,
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.2, 0.5, 0.8, 0.9],
            colors: [Colors.blue, Colors.green, Colors.orange, Colors.red]),
      ),
      child: Center(
        child: CircleAvatar(
            radius: 60.0,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage('https://previews.123rf.com/images/gmast3r/gmast3r1711/gmast3r171101312/91026619-female-doctor-icon-clinic-medical-worker-profile-flat-vector-illustration.jpg'))),
    );
  }

  Widget menuItem(BuildContext context, Map item) {
    return ListTile(
      title: Text(item['label']),
      leading: Icon(Icons.add),
      onTap: () {
        setState(() {
         // print(item['route']);
          _selectedPage = item['route'];
          Navigator.pop(context);
        });
        Navigator.pop(context);
        Navigator.pushNamed(context, item['route']);
      },
    );
  }

  List<Widget> _menu(BuildContext context) {
    List<Widget> list = List<Widget>();
    list..add(_menuHeader());
    for (Map it in _menuItems) {
      list.add(menuItem(context, it));
    }
    return list;
  }

  Widget _getContentWidget() {
    switch (_selectedPage) {
      case 0:
        return CatalogoEspecialistas();
      case 1:
        return CatalogoPruebas();

      default:
        return Center(
            child: Text(
          "Error",
          style: TextStyle(fontSize: 32.0, color: Colors.red),
        ));
    }
  }
}
