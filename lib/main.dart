import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'UI/Views/UserOrders.dart';
import 'file:///C:/Users/jit/IdeaProjects/flutterShopping/lib/UI/Views/Oreders.dart';
import 'file:///C:/Users/jit/IdeaProjects/flutterShopping/lib/models/Services/database_helper.dart';
import 'UI/Views/AuthPage.dart';
import 'UI/Views/ManageProducts.dart';
import 'UI/Views/Edit_Product.dart';
import 'models/Services/main.dart';
import 'UI/Views/Cart.dart';
import 'UI/Views/ProductDetails.dart';
import 'UI/Views/Home.dart';
import 'UI/Views/address.dart';
import 'UI/Views/AddAddress.dart';

void main() {
//  MapView.setApiKey(apiKey);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var user;
  final MainModel _model = MainModel();
  // _model.
  // bool _isAuthenticated = false;
  // session() async {
  //   user = await _model.isAuthenticated;
  //   _isAuthenticated = user.getBool('isAuthenticated') == null
  //       ? false
  //       : user.getBool('isAuthenticated');
  // }

  createDatabase() async {
    // var dbs = DatabaseHelper();
    // dbs.db;
  }

  @override
  void initState() {
    super.initState();
    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: _model,
      child: MaterialApp(
          title: 'flutter Shopping App',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.purple,
            buttonColor: Colors.purple,
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (BuildContext context) {
              // print(_model.isAuthenticated);
              _model.getDataUser();
              return !_model.isAuthenticated ? AuthPage() : Home(_model);
            },
            '/admin': (BuildContext context) {
              return !_model.isAuthenticated ? AuthPage() : ProductsAdminPage(_model);
            },
            '/details': (BuildContext context) =>
                !_model.isAuthenticated ? AuthPage() : Details(),
            '/cart': (BuildContext context) =>
                !_model.isAuthenticated ? AuthPage() : Cart(),
            '/address': (BuildContext context) =>
                !_model.isAuthenticated ? AuthPage() : Address(),
            '/add-address': (BuildContext context) =>
                !_model.isAuthenticated ? AuthPage() : AddAddress(),
            '/my-orders': (BuildContext context) =>
                !_model.isAuthenticated ? AuthPage() : MyOrders(),
            '/orders': (BuildContext context) =>
                !_model.isAuthenticated ? AuthPage() : Orders(),
          },
          onGenerateRoute: (RouteSettings settings) {
            if (!_model.isAuthenticated) {
              return MaterialPageRoute(
                  builder: (BuildContext context) => AuthPage());
            }
            final List<String> pathElements = settings.name.split('/');
            if (pathElements[0] != '') {
              return null;
            }
            int _id;
            if (pathElements[1] == 'product') {
              if (pathElements[2] == 'edit') {
                print(pathElements);
                _id = int.parse(pathElements[3]);
                return MaterialPageRoute(
                    builder: (BuildContext context) =>
                        !_model.isAuthenticated ? AuthPage() : ProductEditPage(_id));
              } else {
                _id = int.parse(pathElements[2]);
                print(_id);
                // return MaterialPageRoute<bool>(
                //     builder: (BuildContext context) =>
                //         !_model.isAuthenticated ? AuthPage() : ProductPage(_id));
              }
            }
            return null;
          },
          onUnknownRoute: (RouteSettings settings) {
            return MaterialPageRoute(builder: (BuildContext context) {
              _model.getDataUser();
              !_model.isAuthenticated ? AuthPage() : Home(_model);
            });
          }),
    );
  }
}

