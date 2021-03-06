import 'package:flutter/material.dart';
import 'package:lets_cook/components/main_drawer.dart';
import 'package:lets_cook/models/settings.dart';

class SettingsScreen extends StatefulWidget {

  final Settings settings;
  final Function(Settings) onSettingsChanged;

  SettingsScreen(this.settings,this.onSettingsChanged);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  Settings settings = Settings();

  @override
  void initState(){
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(String title, String subtitle, bool value, Function(bool) onChanged){
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações', 
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                'Sem Gluten', 
                'Só exibe refeições sem Glúten', 
                settings.isGlutenFree, 
                (value) => setState(() => settings.isGlutenFree = value),
              ),
                 _createSwitch(
                'Sem Lactose', 
                'Só exibe refeições sem Lactose', 
                settings.isLactoseFree, 
                (value) => setState(() => settings.isLactoseFree = value),
              ),
                 _createSwitch(
                'Vegano', 
                'Só exibe refeições Veganas', 
                settings.isVegan, 
                (value) => setState(() => settings.isVegan = value),
              ),
                 _createSwitch(
                'Vegetariano', 
                'Só exibe refeições Vegetarianas', 
                settings.isVegetarian, 
                (value) => setState(() => settings.isVegetarian = value),
              ),
            ],
            ),
          )
        ],
      )
    );
  }
}