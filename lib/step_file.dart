
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lane_guide/page_indicator.dart';
import 'package:lane_guide/page_body.dart';

class StepForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StepFormState();
  }
}

class _StepFormState extends State<StepForm> {

  final _stepFormController = PageController();
  var _page = 0;

  List _pagesList = [
    pageBody('assets/images/wild_rift.png',
              'Entrando em Summoner Rift',
              'Wild Rift trouxe o time de campeões que ja conhecemos de League of Legends'
              ' agora adaptados para as plataformas mobile com a mesma jogabilidade.'
              ),//Apresentação linha 0
    pageBody('assets/images/support_icon.png',
              'Suporte',
              'Para garantir que o seu adc consiga avançar na lane e conseguir uma boa vantagem,'
              ' ele precisa de um auxílio para se curar do dano recebido ou que alguem possa tankar os oponentes.'
              ),//Suporte linha 1
    pageBody('assets/images/Bottom_icon.png',
              'ADC',
              'Se o seu forte é avançar e causar o máximo de dano possível, sua rota é a bottom lane.'
              'Dê preferência para um campeão com dano alto e que possa atacar a distancia.'),//ADC linha 2
    pageBody('assets/images/mid_icon.png',
              'Mid',
              'Seu posicionamento aqui fará toda a diferença para puxar ou segurar as waves.'
              ' Fique atento ao mapa para dar auxílio nas disputas pelo Baron e pelos Dragões elementais'
              ),//Mid linha 3
    pageBody('assets/images/jungle_icon.png',
              'Jungle',
              'Garantir os buffs e gold pra o seu time, além de ter ataques rápidos e letais nas ganks.'
              ' Ataques rápidos e combos letais podem fazer toda a diferença para garantir a partida.'),//Jungler linha 4
    pageBody('assets/images/top_icon.png',
              'Top',
              'Sua rota é a Top Lane, próxima ao Baron. Sua função aqui é garantir o controle das waves '
              'e ajudar na conquista das torres. Campeões guerreiros dominam esta lane.'),//Top linha 5 e última pagina
   ];

  void _changeStep(bool nextPage) {
    if ( _page <5 && nextPage) {
      setState(() {
      _page++;
    });
      _stepFormController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn);
    }else if (_page > 0 && !nextPage){
      setState(() {
        _page--;
      });
      _stepFormController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn);}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wild Rift: Onde Jogar'),
            ),
      body: PageView.builder(
        controller: _stepFormController,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
          return _pagesList[index];
          }),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(onPressed: () => _changeStep(false), child: Text('Anterior'),),
          pageIndicator(_page == 0),
          pageIndicator(_page == 1),
          pageIndicator(_page == 2),
          pageIndicator(_page == 3),
          pageIndicator(_page == 4),
          pageIndicator(_page == 5),
          TextButton(onPressed: () => _changeStep(true), child: Text('Próximo'),),
        ],
      ),
    );
  }
}
