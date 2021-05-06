import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;
import 'package:InfoApp/module/model.dart';
import 'package:mailer2/mailer.dart';
import 'package:ndialog/ndialog.dart';
/*import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';*/

Model model = Model();
String email = model.email;
String firstName = '';
String lastName = '';
String info = '';
String infoSupp = '';
bool isSent = false;

class TestForm extends StatefulWidget {
  @override
  _TestFormState createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  final _formKey = GlobalKey<FormState>();
  //Model model = Model();

  @override
  Widget build(BuildContext context) {
    //final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  width: 600,
                  child: MyTextFormField(
                    hintText: 'Votre prénom',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Veuillez entrer votre prénom';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      model.firstName = value;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: 600,
                  child: MyTextFormField(
                    hintText: 'Votre nom',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Veuillez entrer votre nom';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      model.lastName = value;
                    },
                  ),
                )
              ],
            ),
          ),
          MyTextFormField(
            hintText: 'Votre email',
            isEmail: true,
            validator: (String value) {
              if (!validator.isEmail(value)) {
                return 'Veuillez entrer votre email';
              }
              return null;
            },
            onSaved: (String value) {
              model.email = value;
            },
          ),
          MyTextFormField(
            hintText: 'Problème repérer',
            validator: (String value) {
              if (value.isEmpty) {
                return 'Veuillez entrer le problème';
              }

              _formKey.currentState.save();

              return null;
            },
            onSaved: (String value) {
              model.info = value;
            },
          ),
          MyTextFormField(
            hintText: 'Lieu (Salle, ...)',
            onSaved: (String value) {
              model.infoSupp = value;
            },
          ),
          ElevatedButton(
            onPressed: () {
              email = model.email;
              firstName = model.firstName;
              lastName = model.lastName;
              info = model.info;
              infoSupp = model.infoSupp;

              //print(model.email);
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                sendMail();
                if (isSent = true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Merci de votre aide :)')));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'Votre email n\'a pas été envoyé (can\'t reack network)')));
                }
              }
            },
            child: Text(
              'Soumettre',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;

  MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 90, 10, 10),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(40.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
        ),
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}

sendMail() {
  // If you want to use an arbitrary SMTP server, go with `new SmtpOptions()`.
  // This class below is just for convenience. There are more similar classes available.
  var options = new GmailSmtpOptions()
    ..username = 'MAILUSR'
    ..password =
        'MAILPASS'; // Note: if you have Google's "app specific passwords" enabled,
  // you need to use one of those here.

  // How you use and store passwords is up to you. Beware of storing passwords in plain.

  // Create our email transport.
  var emailTransport = new SmtpTransport(options);

  // Create our mail/envelope.
  var envelope = new Envelope()
    ..from = 'foo@bar.com'
    ..recipients.add('TARGETMAIL')
    ..bccRecipients.add('CCMAIL')
    ..subject = 'Nouveau rapport d\'incident par ' +
        model.firstName +
        " " +
        model.lastName
    ..text = "Un incident de type : " +
        model.info +
        " a été repéré\nInfo complémentaire : " +
        model.infoSupp +
        "\n\nBesoin de précision envoyer un mail a la personne qui a déclarer l\'incident : " +
        model.email;

  // Email it.
  emailTransport
      .send(envelope)
      .then((envelope) => isSent = true)
      .catchError((e) => isSent = false);
}
