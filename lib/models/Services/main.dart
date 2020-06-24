import 'package:scoped_model/scoped_model.dart';
import 'file:///C:/Users/jit/IdeaProjects/flutterShopping/lib/models/Services/ManageApp.dart';
import 'ProductsDB.dart';

class MainModel extends Model with ConnectedProductsModel, UserModel, ProductsModel, UtilityModel,AppModel {}
