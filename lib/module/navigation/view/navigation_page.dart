import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_chat/module/chat/view/chat_page.dart';
import 'package:me_chat/module/navigation/blocs/navigation_cubit.dart';
import 'package:me_chat/module/navigation/widgets/bottom_app_bar_custom.dart';
import 'package:me_chat/module/settings/view/setting_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  static const routePath = '/navigation';

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final listWidget = const [
    ChatPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.select(
      (NavigationCubit cubit) => cubit.state.indexTab,
    );
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: listWidget,
      ),
      bottomNavigationBar: BottomAppBarCustom(
        selectedIndex: selectedIndex,
        onTap: (index) {
          context.read<NavigationCubit>().changeIndex(index);
        },
      ),
    );
  }
}
