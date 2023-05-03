import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsup1to1/app/user_auth/controllers/auth_controller.dart';

import '../../common/common_libs.dart';

class UserHome extends StatelessWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("usman user"),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return  FloatingActionButton(
                    onPressed: () {
                      ref.watch(authControllerProvider.notifier).logout(context: context);
                    },
                    elevation: 0,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(
                      Icons.stop,
                      color: Colors.white,
                      size: 25.spMin,
                    ),
                  );

              },
          ),
    );

        }
}
