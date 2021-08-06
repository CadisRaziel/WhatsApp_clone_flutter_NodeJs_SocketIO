import 'package:flutter/material.dart';
import 'package:nome_whatsclone/model/country_model.dart';
import 'package:nome_whatsclone/shared/theme/app_colors.dart';
import 'package:nome_whatsclone/shared/theme/text_style.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key, required this.setCountryDataFunction}) : super(key: key);
  final Function setCountryDataFunction;

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List<CountryModel> country = [
    //*tentei inserir dart runes nas bandeiras porém deu erro, com isso fiz a inclusão do emoji da bandeira como abaixo
    CountryModel(name: "Brasil", code: "+55", flag: "🇧🇷"),
    CountryModel(name: "Itália", code: "+39", flag: "🇮🇹"),
    CountryModel(name: "Estados Unidos", code: "+1", flag: "🇺🇸"),
    CountryModel(name: "Reino Unido", code: "+44", flag: "🇬🇧"),
    CountryModel(name: "China", code: "+86", flag: "🇨🇳"),
    CountryModel(name: "Russia", code: "+7", flag: "🇷🇺"),
    CountryModel(name: "Espanha", code: "+34", flag: "🇪🇸"),
    CountryModel(name: "Japan", code: "+81", flag: "🇯🇵"),
    CountryModel(name: "Chile", code: "+56", flag: "🇨🇱"),
    CountryModel(name: "India", code: "+91", flag: "🇮🇳"),
    CountryModel(name: "Paquistão", code: "+92", flag: "🇵🇰"),
    CountryModel(name: "África do Sul", code: "+27", flag: "🇿🇦"),
    CountryModel(name: "Afeganistão", code: "+93", flag: "🇦🇫"),
  ];

  Widget cardCountry(CountryModel country) {
    return InkWell(
      onTap: (){
        widget.setCountryDataFunction(country);
      },
      child: Card(
        margin: EdgeInsets.all(0.15),
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            children: [
              Text(country.flag!),
              SizedBox(
                width: 15,
              ),
              Text(country.name!),
              //* o expanded faz com que os codigos fique no canto da tela
              Expanded(
                child: Container(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        country.code!,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
            child: Icon(
          Icons.arrow_back,
          color: AppColors.accent,
        )),
        elevation: 0,
        title: Text(
          'Escolha um país',
          style: TextStyles.countryPage,
        ),
        actions: [
          //*cuidado pois o colocando somente 'Icon' ele fica muito colado na tela
          //*o IconButton ja não ele tem um espaçamento elegante
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: AppColors.accent,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: country.length,
        itemBuilder: (context, index) => cardCountry(
          country[index],
        ),
      ),
    );
  }
}
