import 'package:flutter/material.dart';

import '../../common/extensions/extensions.dart';

class NewAlbumScreen extends StatelessWidget {
  const NewAlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Đặt tên cho thư mục của bạn',
              style: context.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: TextField(
                textAlign: TextAlign.center,
                  controller: TextEditingController(

                      text: 'Danh sách phát thứ 4 của tôi')),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Tạo'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                minimumSize: const Size(50, 30),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            )
          ],
        ),
      ),
    );
  }
}
