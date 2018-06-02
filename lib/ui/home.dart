import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }

}

class HomeState extends State<Home>{

  final TextEditingController _pesoControler = new TextEditingController();
  final TextEditingController _alturaControler = new TextEditingController();
  final TextEditingController _idadeControler = new TextEditingController();

  double imcFinal = 0.0;
  String converte = '';
  String tt = '';
  String categoria = '';

  void imc (){
    setState(() {
      if ( int.parse(_pesoControler.text).toString().isNotEmpty && int.parse(_alturaControler.text).toString().isNotEmpty && int.parse(_idadeControler.text).toString().isNotEmpty ){
        imcFinal = int.parse(_pesoControler.text) / (( int.parse(_alturaControler.text)/100) * (int.parse(_alturaControler.text)/100));
        if ( imcFinal < 16 ) {
          categoria = "Magreza Grave";
        }
        if ( imcFinal < 17 && imcFinal >= 16 ) {
          categoria = "Magreza Moderada";
        }
        if ( imcFinal < 18.5 && imcFinal >= 17 ) {
          categoria = "Magreza leve";
        }
        if ( imcFinal < 25 && imcFinal >= 18.5 ) {
          categoria = "Saúdavel";
        }
        if ( imcFinal >= 25 && imcFinal < 30 ) {
          categoria = "Sobrepeso";
        }
        if ( imcFinal < 35 && imcFinal >= 30 ) {
          categoria = "Obesidade Grau 1";
        }
        if ( imcFinal < 40 && imcFinal > 35 ) {
          categoria = "Obesidade Grau 2";
        }
        if ( imcFinal < 16 ) {
          categoria = "Obesidade Grau 3";
        }
        converte = imcFinal.toStringAsFixed(2);
        tt = "O seu IMC é $converte";
      } else {
        tt = "Complete os campos acima, para calcular seu IMC!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.only(top: 20.0),
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: new Image.asset('images/exercise.png',
                  width: 64.0,
                  height: 64.0,
                ),),
                new Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: new Image.asset('images/scale.png',
                    width: 64.0,
                    height: 64.0,
                  ),),
                new Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: new Image.asset('images/speed.png',
                    width: 64.0,
                    height: 64.0,
                  ),),
             ],
            ),
            new Container(
              margin: const EdgeInsets.all(35.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _idadeControler,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Digite sua Idade',
                      fillColor: Colors.pink,
                      icon: new Icon(Icons.cake)
                    ),
                  ),
                  new TextField(
                    controller: _alturaControler,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Altura em Cm',
                        fillColor: Colors.pink,
                        icon: new Icon(Icons.person)
                    ),
                  ),
                  new TextField(
                    controller: _pesoControler,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Peso em Kg',
                        fillColor: Colors.pink,
                        icon: new Icon(Icons.swap_vert)
                    ),
                  ),
                  new Padding(padding: EdgeInsets.only(top: 30.0)),
                  new MaterialButton( onPressed: imc,
                  color: Colors.pinkAccent,
                  textColor: Colors.white,
                  minWidth: 150.0,
                  child: new Text("Calcule")
                    ),
                  new Padding(padding: EdgeInsets.only(top: 30.0)),
                  new Text("$tt",
                    style: new TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500
                    )
                  ),
                  new Padding(padding: EdgeInsets.only(top: 7.0)),
                  new Text("$categoria",
                    style: new TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}