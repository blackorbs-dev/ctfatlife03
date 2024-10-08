import 'widgets/info.dart';
import 'widgets/add_entry.dart';
import 'history.dart';
import 'setup.dart';
import '../helpers/notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Provider.of<Notifier>(context, listen: false).isDesktop = MediaQuery.sizeOf(context).shortestSide > 600;
    return Scaffold(
      appBar: AppBar(title: const Text("CT Fatigue Life Estimator"),
        actions:  [
          isDesktop? TextButton.icon(
              onPressed: () => showAdaptiveDialog(context: context, builder: (_) => const AddEntry(), barrierDismissible: false),
              icon: const Icon(Icons.add, color: Colors.black),
              label: const Text("Add CT Entry", style: TextStyle(color: Colors.black),)
          ): const SizedBox(),
          IconButton(
              onPressed: (){
                  showDialog(context: context, builder: (_) => const InfoPage());
                },
              icon: const Icon(Icons.info_outline))
        ]
      ),
      body: isDesktop? const Row(children: [
        Expanded(flex: 2, child: HistoryPage()),
        Expanded(flex: 3, child: SetupPage())
      ],) : navigationLayout(),

      bottomNavigationBar: isDesktop? null : bottomBar(),

      floatingActionButton: isDesktop? null : FloatingActionButton(
        onPressed: () => showAdaptiveDialog(context: context, builder: (_) => const AddEntry(), barrierDismissible: false),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget navigationLayout() => Selector<Notifier, int>(
      selector: (_,notifier) => notifier.navSelectedIndex,
      builder: (context, navSelectedIndex, _) => IndexedStack(
          index: navSelectedIndex, children: const [SetupPage(), HistoryPage()]
      )
  );

  Widget bottomBar() => Selector<Notifier, ({int navIndex, Function(int index) navigate})>(
      selector: (_,notifier) => (navIndex: notifier.navSelectedIndex, navigate: notifier.navigateToPage),
      builder: (c, selectedNotifier,_) => BottomNavigationBar(onTap: selectedNotifier.navigate, currentIndex: selectedNotifier.navIndex, items: const [
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setup"),
        BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "CT Entries"),
      ])
  );
}
