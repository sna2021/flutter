import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage(
    this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.launch)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _getCocktailImage(cocktail.drinkThumbUrl),
            _getInformationAboutCoctail(),
            _getIngredientsWidget(),
            _getInstructionWidget(),
            _rateCocktail(),
          ],
        ),
      ),
    );
  }

  Container _getInformationAboutCoctail() {
    return Container(
      width: double.infinity,
      color: Color(0xff1a1927),
      padding: const EdgeInsets.only(left: 32, right: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 33,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${cocktail.name}',
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
              IconButton(
                icon: SvgPicture.asset('assets/images/icon_hart.svg'),
                onPressed: () {},
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Id: ${cocktail.id}',
            style: TextStyle(color: Colors.white54),
          ),
          const SizedBox(
            height: 20,
          ),
          _getNameForInformationAboutCocktail('Категория коктейля', 14),
          const SizedBox(
            height: 8,
          ),
          _getNameTypeForInformationAboutCocktail('${cocktail.category.value}'),
          const SizedBox(
            height: 8,
          ),
          _getNameForInformationAboutCocktail('Тип коктейля', 14),
          const SizedBox(
            height: 8,
          ),
          _getNameTypeForInformationAboutCocktail(
              '${cocktail.cocktailType.value}'),
          const SizedBox(
            height: 8,
          ),
          _getNameForInformationAboutCocktail('Тип стекла', 14),
          const SizedBox(
            height: 8,
          ),
          _getNameTypeForInformationAboutCocktail(
              '${cocktail.glassType.value}'),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Image _getCocktailImage(String path) => Image.network(path);

  Container _getIngredientsWidget() {
    var list = <Widget>[];
    list.add(
      const SizedBox(
        height: 24,
      ),
    );
    list.add(
      const Text(
        'Ингрeдиенты:',
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
    cocktail.ingredients.forEach((ingredientDefinition) {
      list.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${ingredientDefinition.ingredientName}',
              style: const TextStyle(
                  color: Colors.white, decoration: TextDecoration.underline),
            ),
            Text(
              '${ingredientDefinition.measure}',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      );

      list.add(
        const SizedBox(
          height: 16,
        ),
      );
    });

    list.add(const SizedBox(
      height: 8,
    ));

    return Container(
      color: Colors.black,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 32, right: 36),
      child: Column(
        children: [
          ...list,
        ],
      ),
    );
  }

  Container _getInstructionWidget() {
    List<String> elementsInsturction =
        cocktail.instruction.substring(2).split('- ');
    List<Widget> list = [];
    list.add(
      const SizedBox(
        height: 24,
      ),
    );
    list.add(const Text(
      'Инструкция для приготовления',
      style: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
    ));

    list.add(const SizedBox(
      height: 24,
    ));

    elementsInsturction.forEach((element) {
      list.add(Text(
        '- $element',
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
      ));
      list.add(const SizedBox(
        height: 16,
      ));
    });
    list.add(const SizedBox(
      height: 32,
    ));

    return Container(
      color: Color(0xff201f2c),
      width: double.infinity,
      padding: EdgeInsets.only(left: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...list,
        ],
      ),
    );
  }

  Widget _rateCocktail() {
    var list = <Widget>[];
    for (var i = 1; i <= 5; i++) {
      list.add(_createRoundRateButton(Icon(
        Icons.grade,
        size: 32,
      )));
      list.add(const SizedBox(
        width: 16,
      ));
    }

    return Container(
      color: Color(0xFF1A1927),
      padding: EdgeInsets.only(left: 35, right: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 24,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...list,
            ],
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  InkWell _createRoundRateButton(Icon icon) {
    return InkWell(
      onTap: () {
      },
      child: CircleAvatar(
        radius: 24.0,
        backgroundColor: Color(0xFF2A293A),
        child: icon,
      ),
    );
  }

  Text _getNameForInformationAboutCocktail(String name, double fontSize) =>
      Text(
        '$name',
        style: _getStyleForInformaitonAboutCocktail(fontSize),
      );

  Container _getNameTypeForInformationAboutCocktail(String name) => Container(
        //color: Colors.black,
        padding: EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
        child: Text(
          '$name',
          style: _getStyleForInformaitonAboutCocktail(15),
        ),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
      );

  TextStyle _getStyleForInformaitonAboutCocktail(double fontSize) => TextStyle(
      fontSize: fontSize, fontWeight: FontWeight.w400, color: Colors.white);
}
