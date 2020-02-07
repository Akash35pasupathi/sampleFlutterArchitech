import 'package:progress_dialog/progress_dialog.dart';
import 'package:sample_flutter_app_architech/core/view_model/login_page_model.dart';
import 'package:sample_flutter_app_architech/ui/custom_widget/ui_utils.dart';
import 'package:sample_flutter_app_architech/ui/router.dart';
import 'package:sample_flutter_app_architech/ui/views/base_view.dart';
import 'package:flutter/material.dart';
import '../colors_and_images.dart';




class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

// Used for controlling whether the user is loggin or creating an account
enum FormType {
  login,
  register
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _email = "";
  String _password = "";
  FormType _form = FormType.login; // our default setting is to login, and we should switch to creating an account when the user chooses to

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      //email = emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
     // password = passwordFilter.text;
    }
  }

  // Swap in between our two forms, registering and logging in
  void _formChange (InitialPageModel model, BuildContext context) async {
    //Navigator.pushNamed(context, Router.registration);
  }

  @override
  Widget build(BuildContext context) {

      return BaseView<InitialPageModel>(
          builder: (baseContext, model, child) {
            return MaterialApp(
                onGenerateRoute: Router.createRoute,
                home: new Scaffold(
      appBar: _buildBar(context),
      body: Center(
/*        child: AspectRatio(
          aspectRatio: 3/5,
          child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: <Widget>[
                new Card(
                  child:
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            _buildTextFields(),
                            _buildButtons(model,context),
                          ],
                        ),
                      ),

                ),
              ],
          ),
        ),*/
      ),
    ),
            );
          },
      );

  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Sample Page"),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
              controller: _emailFilter,
              decoration: new InputDecoration(
                  labelText: 'Employee Id'
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(InitialPageModel model, BuildContext context ) {

      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              color: ColorAndImageData.submitColor ,
              child: new Text('Login',
                style: TextStyle(
                  color: Colors.white,
                ),),
              onPressed: (){
                _loginPressed(model,context);
              }
            ),
            new FlatButton(
              child: new Text('Dont have an account? Tap here to register.',style: TextStyle(
                color: ColorAndImageData.initialPrimaryColor,
              ),),
              onPressed: (){
                _formChange(model,context);
              },
            ),
          ],
        ),
      );

  }


  Future<void> _loginPressed (InitialPageModel model, BuildContext context) async {

    if(_emailFilter.text=='')
      {
        WepAppDialog().customDialog("Failure", "Please Enter Employee ID", context, "OK");
      }else{

      ProgressDialog pr = new ProgressDialog(context);
      pr.show();
      var res = await model.searchUser(_emailFilter.text);

      if(res==null)
      {
        WepAppDialog().customDialog("Failure", "Employee ID Not Exist", context, "OK");
      }else{


       // var resDataList = await model.registrationInfo();



       /* Navigator.pushNamed(context, Router.dashboard,
            arguments:
            DashboardPage(res));*/

      }

      pr.hide();

    }



  }




}