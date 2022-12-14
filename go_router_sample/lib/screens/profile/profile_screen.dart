import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/router/route_path.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('profile screen'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('search screen'),
            // [https://docs.page/csells/go_router/parameters] パラメータまわり
            // extraはモデルも渡せるみたい
            // goNamedはpramsとqueryParamsも使える GoRouteにnameを指定する必要がある
            ElevatedButton(
              onPressed: () => context
                  .go('${RoutePath.profileEditPath}/hasegawa/test@test.com'),
              child: const Text('編集画面'),
            )
          ],
        ),
      ),
    );
  }
}
