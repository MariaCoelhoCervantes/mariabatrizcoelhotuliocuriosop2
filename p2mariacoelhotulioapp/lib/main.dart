import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'singin.dart';

void main() {
  runApp(Inicia());
}

class Inicia extends StatefulWidget {
  @override
  _IniciaState createState() => _IniciaState();
}

class _IniciaState extends State<Inicia> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tulio, o curioso',
        debugShowCheckedModeBanner: false,
        initialRoute: "/login",
        routes: <String, WidgetBuilder>{
          "/login": (BuildContext context) => TelaLogin(),
          "/menu": (BuildContext context) => Menu(),
          "TelaDiarios": (BuildContext context) => TelaDiarios(),
          "/TelaDiario": (BuildContext context) => TelaDiario(),
          "/sobre": (BuildContext context) => TelaSobre(),
          //"/ajuda": (BuildContext context) => TelaAjuda,
        },
        home: Scaffold(
            body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        )));
  }
}

String user = 'Maria Coelho';
String pass = 'cenourinha';
String textinU;

bool conferesenha = false;
bool confereuser = false;

int count = 1;
String textino;
String nomeD;
String anota;

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                signInWithGoogle().whenComplete(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return Menu();
                      },
                    ),
                  );
                });
              },
            ),
            body: Container(
              width: 2400,
              height: 800,
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      color: Colors.pink[100],
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      child: Image.asset('assets/images/Presente mãe.png',
                          scale: 20.0),
                    ),
                    Container(
                      height: 100,
                      width: 400,
                      color: Colors.cyan[200],
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      child: TextField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(fontSize: 20.0),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            icon: Icon(Icons.face),
                            labelText: 'Nome de usuário:',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                          onChanged: (String val) {
                            textinU = val;
                            debugPrint('Usuário: $val');
                            if (textinU == user) {
                              confereuser = false;
                            } else {
                              confereuser = true;
                            }
                          }),
                    ),
                    Container(
                      height: 100,
                      width: 400,
                      color: Colors.cyan[200],
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      child: TextField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(fontSize: 20.0),
                          decoration: InputDecoration(
                            labelText: 'Senha: o que o pequeno coelho gosta?',
                            icon: Icon(Icons.remove_red_eye),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          ),
                          onChanged: (String val) {
                            textinU = val;
                            debugPrint('Senha: $textinU');
                            if (textinU == user) {
                              conferesenha = false;
                            } else {
                              conferesenha = true;
                            }
                          }),
                    ),
                    Container(
                        height: 100,
                        width: 400,
                        color: Colors.cyan[200],
                        child: RaisedButton(
                          color: Colors.lightBlue[400],
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          onPressed: () {
                            Navigator.pushNamed(context, '/menu');
                            if (confereuser && conferesenha) {
                              Navigator.pushNamed(context, '/menu');
                            } else {
                              SnackBar(content: Text('Epa! Você errou ouo.'));
                            }
                          },
                          child: const Text('Entrar'),
                        ))
                  ]),
            )));
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tulio, o curioso',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: Scaffold(
          body: Container(
              width: 2000,
              height: 2000,
              color: Color(0xFFb3cdd4),
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/Presente mãe.png', scale: 20.0),
                    RaisedButton(
                      onPressed: () {
                        if (count == 0) {
                          Navigator.pushNamed(context, '/TelaDiario');
                        } else {
                          Navigator.pushNamed(context, '/TelaDiarios');
                        }
                      },
                      child: Text("Diarios"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sobre');
                      },
                      child: Text("Sobre"),
                    )
                  ])),
        ));
  }
}

class TelaSobre extends StatefulWidget {
  @override
  _TelaSobreState createState() => _TelaSobreState();
}

class _TelaSobreState extends State<TelaSobre> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Sobre este app",
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  iconSize: 5,
                  alignment: (Alignment.centerLeft),
                  autofocus: true,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            body: Container(
                height: 800,
                width: 2400,
                color: Color(0xFFffe5c4),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                          "Seja muito bem vindo ao aplicativo Tulio, o curioso! Por algum tempo, vim observando como a geração atual de crianças entre 3 e 12 anos tem se apegado demasiadamente e com facilidade a tecnologia, muitas vezes o fazendo ficar dependente psicologicamente de tais aparatos, como celulares, tablets e consoles para jogos, até mesmo dentro do próprio ambiente doméstico. Isso os priva de querer descobrir as coisas como nossos pais faziam por exemplo, com explorações ao jardim ou a biblioteca em busca de conhecimento. A leitura no papel consequentemente se torna vista como algo massivo pela geração mais recente, enquanto foca todo seu entretenimento de interesse nas telas luminosas com a interação por simples botões, gestos ou toques. Com uma certa disponibilidade de tempo, vontade de auxiliar o público infanto-juvenil e vivências possuídas, vejo como oportunidade utilizar deste projeto para estimular toda essa vontade de aprender sobre o mundo que está adormecida. A base de todo aprendizado é realizada através dos primeiros estímulos do bebê e todo o seu desenvolvimento intelectual conforme se desenvolve até ter a idade adequada para ingressar em uma escola. Se antes disso, os pequenos apenas tivessem como incentivo brincadeiras que não levassem a nenhum tipo de aquisição de independência para entender como algo funciona ou a perguntar para quem sabe, claramente a escola não será vista de forma positiva por eles. Já ouvi muitas vezes assimilações da escola como um tipo de prisão para os pequenos, que só sairiam se tivessem acertado determinado número de perguntas nas provas e tirado nota, mas pouquíssimas quando realmente tinham interesse em aprender o que lhes era ensinado, discutir com os responsáveis e não ver como algo forçado, e sim para o próprio bem e desenvolvimento intelectual. Isto é o que mais me preocupa, que futuramente, o número de desistentes antes de finalizar o colegial continue a aumentar, e as consequências são inúmeras, do desemprego a desestabilização psicológica completa."),
                    ]))));
  }
}

class TelaDiarios extends StatefulWidget {
  @override
  _TelaDiariosState createState() => _TelaDiariosState();
}

class _TelaDiariosState extends State<TelaDiarios> {
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  iconSize: 5,
                  alignment: (Alignment.centerLeft),
                  autofocus: true,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            body: Container(
                height: 800,
                width: 2400,
                color: Color(0xFFffe5c4),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/menu');
                              },
                              child: Icon(Icons.arrow_back),
                            ),
                            GridView.count(
                                primary: false,
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                crossAxisCount: 2,
                                cacheExtent: 300,
                                addAutomaticKeepAlives: true,
                                addRepaintBoundaries: true,
                                semanticChildCount: count,
                                addSemanticIndexes: true,
                                scrollDirection: Axis.vertical,
                                controller: ScrollController(
                                  initialScrollOffset: 0,
                                  keepScrollOffset: true,
                                ),
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    height: 240,
                                    width: 80,
                                    color: Colors.cyan[200],
                                    child: RaisedButton(
                                        child: Image.asset(
                                          '1.png',
                                          scale: 2,
                                          alignment: Alignment.center,
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, "/TelaDiario");
                                        }),
                                  )
                                ]),
                          ])
                    ]))));
  }
}

class TelaDiario extends StatefulWidget {
  @override
  _TelaDiarioState createState() => _TelaDiarioState();
}

class _TelaDiarioState extends State<TelaDiario> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  iconSize: 5,
                  alignment: (Alignment.centerLeft),
                  autofocus: true,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            body: Container(
                width: 2000,
                height: 2000,
                color: Color(0xFFb3cdd4),
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 2000,
                        height: 50,
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        child: TextField(
                          autocorrect: true,
                          textAlign: TextAlign.left,
                          textInputAction: TextInputAction.continueAction,
                          enableInteractiveSelection: true,
                          onEditingComplete: toString,
                          onChanged: (val) {
                            nomeD = val;
                          },
                        ),
                      ),
                      Container(
                        width: 2000,
                        height: 100,
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        child: TextField(
                          autocorrect: true,
                          textAlign: TextAlign.left,
                          textInputAction: TextInputAction.continueAction,
                          enableInteractiveSelection: true,
                          onEditingComplete: toString,
                          onChanged: (vol) {
                            anota = vol;
                          },
                        ),
                      ),
                      Container(
                        width: 2000,
                        height: 300,
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        child: TextField(
                          autocorrect: true,
                          textAlign: TextAlign.left,
                          textInputAction: TextInputAction.continueAction,
                          enableInteractiveSelection: true,
                          onEditingComplete: toString,
                          onChanged: (tos) {
                            textino = tos;
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 2000,
                              height: 50,
                              color: Colors.cyan[200],
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              child: RaisedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/menu');
                                  },
                                  textColor: Colors.grey,
                                  color: Colors.cyan[200],
                                  child: Container(
                                    width: 300,
                                    height: 100,
                                    padding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    child: Text('Salvar'),
                                  ))),
                          RaisedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/menu');
                              },
                              textColor: Colors.grey,
                              color: Colors.cyan[200],
                              child: Container(
                                width: 300,
                                height: 100,
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                child: Text('Volta'),
                              ))
                        ],
                      ),
                    ]))));
  }
}

//class TelaAjuda extends StatelessWidget {}

class InfoDiario {
  String nomeDiario;
  String topico;
  String descricao;
  int indice;

  void criaDiario(
    String a,
    String b,
    String c,
    int d,
  ) {
    a = this.nomeDiario;
    b = this.topico;
    c = this.descricao;
    d = this.indice;
    fileWriter();
  }

  fileWriter() {}
}
