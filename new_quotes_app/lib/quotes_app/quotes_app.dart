import 'package:flutter/material.dart';
import 'package:new_quotes_app/quotes_app/pages/quotes_add_form.dart';
import 'package:new_quotes_app/quotes_app/pages/quotes_list.dart';
import 'package:new_quotes_app/quotes_app/pages/quotes_view.dart';



class QuotesApp extends StatefulWidget {
  const QuotesApp({super.key});

  @override
  State<QuotesApp> createState() => _QuotesAppState();
}

class _QuotesAppState extends State<QuotesApp> {
  int _selectedIndex = 0;
  final List<Widget>pages=[const QuotesView(),const QuotesAddForm(),const QuotesList()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Quotes App')),
        ),
        body:  Center(
          child: pages[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Data',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}