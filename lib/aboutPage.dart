import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class aboutPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _aboutPage();
  }
}

class _aboutPage extends State<aboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Color(0xfffdb9c4),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'O que é a aplicação Salva?',
                    style: new TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffDE3163),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0, left: 5.0, right: 0, bottom: 20.0),
                    child: Text(
                      'Especialmente desenvolvida para mulheres, Salva tem o intuito de fornecer uma aplicação'
                          ' que assegure a proteção e defesa quando alguém se sente numa situação de perigo.',
                      style: new TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  Text(
                    'Como funciona?',
                    style: new TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffDE3163),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0, left: 5.0, right: 0, bottom: 20.0),
                    child: Text(
                      "Na página principal, tens disponíveis 5 funcionalidades. Caso te sintas em perigo podes clicar em: "
                          " 'Clica para emitir o som de sirene' para que o som de uma sirene da polícia comece a ecuar e chame à atenção;"
                          " 'Clica para veres sítios perto de ti' para teres um mapa com os locais seguros mais próximos;"
                          " 'Clica para enviares a tua localização' para enviares a tua localização atual aos teus contactos"
                          " de emergência (podes adicionar os contactos ao clicar no ícon de definições); 'Clica para começar a gravar' para aceder à câmara e começar a gravar,"
                          " sendo que os vídeos ficam guardados na tua galeria; 'SOS' para ligarmos automaticamente para o 112 e enviar mensagem com a tua localização"
                          "aos teus contactos de emergência.",
                      style: new TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
                    child: Text(
                      "Perguntas Frequentes",
                      style: new TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffDE3163),
                      ),
                    ),
                  ),

                  Text(
                    'O que devo fazer se alguém me estiver a seguir?',
                    style: new TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffDE3163),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0, left: 5.0, right: 0, bottom: 20.0),
                    child: Text(
                      "Fica com a aplicação aberta no teu telemóvel e clica em 'Clica para enviares a tua localização', para que "
                          " o sítio onde te encontras seja conhecido. Podes também fazer uma chamada normal a um familiar ou amigo"
                          " para comunicares a situação. Clica no mapa para veres sítios seguros próximos de ti e dirige-te a um deles."
                          " Se te sentires especialmente em perigo clica no botão SOS, emite o som da sirene e começa a gravar.",
                      style: new TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  Text(
                    'O que devo fazer se não poder falar ao ligar para o 112?',
                    style: new TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffDE3163),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0, left: 5.0, right: 0, bottom: 20.0),
                    child: Text(
                      'Os operadores de chamadas de emergência estão prontos para qualquer situação e vão assumir que não estás'
                          ' em posição para comunicar. Basta deixares a chamada ligada'
                          ' e a polícia será enviada para a tua localização.',
                      style: new TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
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