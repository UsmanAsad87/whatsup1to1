import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsup1to1/app/seller/seller_chat/widgets/contacts_list.dart';
import 'package:whatsup1to1/app/user_auth/controllers/auth_controller.dart';
import 'package:whatsup1to1/colors.dart';

import '../../common/common_libs.dart';

class SellerHome extends ConsumerStatefulWidget {
  const SellerHome({Key? key}) : super(key: key);

  @override
  ConsumerState<SellerHome> createState() => _SellerHomeState();
}

class _SellerHomeState extends ConsumerState<SellerHome> with WidgetsBindingObserver{

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch(state){
      case AppLifecycleState.resumed:
        ref.read(authControllerProvider.notifier).setUserState(true);
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.inactive:
        ref.read(authControllerProvider.notifier).setUserState(false);
        break;

    }
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appBarColor,
          centerTitle: false,
          title: const Text(
            'WhatsUp Seller Side',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            PopupMenuButton(itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                    'logout'
                ),
                onTap: (){
                  ref
                      .watch(authControllerProvider.notifier)
                      .logout(context: context);
                },
              ),
            ])
          ],
        ),
        body: const ContactsList(isWeb: false,),
      ),
    );
  }
}

