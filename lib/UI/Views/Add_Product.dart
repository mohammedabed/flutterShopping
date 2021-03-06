import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:scoped_model/scoped_model.dart';
import '../Widgets/image.dart';
import '../Widgets/adaptive_progress_indicator.dart';
import '../../models/Services/main.dart';

class ProductCreatePage extends StatefulWidget {
  //  final MainModel model;
  @override
  _ProductCreatePageState createState() => _ProductCreatePageState();
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, dynamic> _product = {
    'title': null,
    'description': null,
    'price': null,
    'category': null,
    'image': null,
  };

  Widget _buildTitleTextField() {
    return ListTile(
        title: TextFormField(
            onSaved: (String value) => _product['title'] = value,
            validator: (String value) {
              return value.trim().isEmpty ? 'The title cannot be empty' : null;
            },
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(labelText: 'Title')));
  }

  Widget _buildDescTextField() {
    return ListTile(
        title: TextFormField(
            onSaved: (String value) => _product['description'] = value,
            validator: (String value) {
              return value.trim().isEmpty
                  ? 'The description cannot be empty'
                  : null;
            },
            maxLines: 4,
            keyboardType: TextInputType.multiline,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(labelText: 'Description')));
  }

  Widget _buildPriceTextField() {
    return ListTile(
        title: TextFormField(
            onSaved: (String value) => _product['price'] = double.parse(value),
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'The price cannot be empty';
              } else if (double.parse(value) < 0) {
                return 'The price has to be equal or greater than 0';
              }
            },
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(labelText: 'Price')));
  }

  Widget _buildDropDwonTextField(MainModel model) {
    return ListTile(
        title: DropdownButtonFormField(
            onSaved: (var value) {
              _product['category'] = value;
            },
            items: model.listCategoiesForAddProduct
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (var value) {
              print(value);
            },
            decoration: InputDecoration(labelText: 'Choose Category')));
  }

  Widget _buildSubmitButton() {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return model.isLoading
          ? Center(child: AdaptiveProgressIndicator())
          : RaisedButton(
              onPressed: () => _submitForm(model.addProduct),
              child: Text('SAVE'),
              textColor: Colors.white);
    });
  }

  void _setImage(File image) {
    _product['image'] = image;
  }

  void _submitForm(Function addProduct) {
    if (_formKey.currentState.validate() && _product['image'] != null) {
      _formKey.currentState.save();
      addProduct(_product['title'], _product['description'], _product['price'],
              _product['category'], _product['image'])
          .then((bool success) {
        if (success) {
          Navigator.pushReplacementNamed(context, '/');
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text('Something Went Wrong.'),
                    content: Text('Please try again later.'),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('OK'))
                    ]);
              });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        // print(model.listCategoiesForAddProduct);
        return Form(
            key: _formKey,
            child: ListView(children: <Widget>[
              _buildTitleTextField(),
              _buildDescTextField(),
              _buildPriceTextField(),
              _buildDropDwonTextField(model),
              ImageInput(_setImage),
              ListTile(title: _buildSubmitButton())
            ]));
      },
    );
  }
}
