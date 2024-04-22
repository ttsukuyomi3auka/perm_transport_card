import 'package:flutter/material.dart';
import 'package:perm_transport_card/app/modules/home/widgets/custom_bottom_navigation_bar.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: const Center(child: Text("Кабинет")));
  }
}
