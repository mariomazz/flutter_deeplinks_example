import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoomDetailScreen extends StatelessWidget {
  final bool fixedAppBarLeading;
  const RoomDetailScreen({super.key, this.fixedAppBarLeading = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: fixedAppBarLeading
            ? IconButton(
                onPressed: context.pop,
                icon: const Icon(Icons.arrow_back_ios),
              )
            : null,
      ),
      body: const Center(
        child: Text("DEEPLINK DETAIL"),
      ),
    );
  }
}
