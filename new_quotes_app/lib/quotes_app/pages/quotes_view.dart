import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_quotes_app/quotes_app/models/quote_model.dart';
import 'package:new_quotes_app/quotes_app/repo/quotes_repo.dart';
import 'package:card_swiper/card_swiper.dart'; 


class QuotesView extends StatefulWidget {
  const QuotesView({super.key});

  @override
  _QuotesViewState createState() => _QuotesViewState();
}

class _QuotesViewState extends State<QuotesView> {
  final QuotesRepo quotesRepo = QuotesRepo();
  List<Quote> quotes = [];

  @override
  void initState() {
    super.initState();
    _loadQuotes();
  }

  Future<void> _loadQuotes() async {
    final List<Quote> loadedQuotes = await quotesRepo.getAllQuotes();
    setState(() {
      quotes = loadedQuotes;
    });
  }

  Color _getBackgroundColor(int index) {
    // Generate different background colors based on the index
    final List<Color> colors = [
      Colors.blue,
      Colors.green,
      Colors.red,
      Colors.yellow,
      Colors.orange,
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: quotes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Swiper(
              itemCount: quotes.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: _getBackgroundColor(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          quotes[index].text,
                         style: GoogleFonts.anton( 
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '- ${quotes[index].author}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
              pagination: const SwiperPagination(),
            ),
    );
  }
}
