import 'dart:html';
import 'dart:math';

import 'package:bishop/bishop.dart' as bishop;
import 'package:chess/services/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:square_bishop/square_bishop.dart';
import 'package:squares/squares.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bishop.Game game;
  late SquaresState state;
  int player = Squares.white;
  bool aiThinking = false;
  bool flipBoard = false;

  @override
  void initState() {
    _resetGame(false);
    super.initState();
  }

  void _resetGame([bool ss = true]) {
    game = bishop.Game(variant: bishop.Variant.standard());
    state = game.squaresState(player);
    if (ss) setState(() {});
  }

  void _flipBoard() => setState(() => flipBoard = !flipBoard);

  void _onMove(Move move) async {
    bool result = game.makeSquaresMove(move);
    if (result) {
      setState(() => state = game.squaresState(player));
    }
    if (state.state == PlayState.theirTurn && !aiThinking) {
      setState(() => aiThinking = true);
      await Future.delayed(
          Duration(milliseconds: Random().nextInt(4750) + 250));
      game.makeRandomMove();
      setState(() {
        aiThinking = false;
        state = game.squaresState(player);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.black),
          onPressed: () {
            // log console data
            print('Back button pressed');
            //show dialog
            Navigator.pop(context);
          },
        ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 49, 226, 217),
          title: const Text('Flutter Chess',style: TextStyle(color: Colors.black),),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh,color: Colors.black),
              onPressed: _resetGame,
            ),
            IconButton(
              icon: const Icon(Icons.flip,color: Colors.black),
              onPressed: _flipBoard,
            ),
          ]),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //opening Data
            ListTile(
              leading: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("images/stockfish_1.png"),
                // backgroundColor: Color.fromARGB(255, 49, 226, 217),
              ),
              title: Text(
                  'Player: ${player == Squares.white ? 'White' : 'Black'}'),
              subtitle: Text(
                  'Opponent: ${player == Squares.white ? 'Black' : 'White'}'),
                  trailing: const Text('04:06:00'),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: BoardController(
                state: flipBoard ? state.board.flipped() : state.board,
                playState: state.state,
                pieceSet: PieceSet.merida(),
                theme: BoardTheme.brown,
                moves: state.moves,
                onMove: _onMove,
                onPremove: _onMove,
                markerTheme: MarkerTheme(
                  empty: MarkerTheme.dot,
                  piece: MarkerTheme.corners(),
                ),
                promotionBehaviour: PromotionBehaviour.autoPremove,
              ),
            ),
            //our Data
            ListTile(
              leading: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("images/user_icon.png"),
                // backgroundColor: Color.fromARGB(255, 49, 226, 217),
              ),
              title: Text(
                  'Player: ${player == Squares.white ? 'Black' : 'White'}'),
              subtitle: Text(
                  'Opponent: ${player == Squares.white ? 'White' : 'Black'}'),
              trailing: const Text('04:06:00'),
            ),
            
          ],
        ),
      ),
    );
  }
}
