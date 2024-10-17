import 'package:flutter/material.dart';

import '../../../buttons/link_text.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        color: Colors.black,
        height: (size.width > 1000) ? size.height * 0.07 : null,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            LinkText(
              text: 'About',
              onPressed: () => print('About'),
            ),
            LinkText(
              text: 'Help Center',
              onPressed: () => print('Help'),
            ),
            LinkText(
              text: 'Terms of service',
              onPressed: () => print('Terms'),
            ),
            LinkText(
              text: 'Privacy Policy',
              onPressed: () => print('Privacy'),
            ),
            LinkText(
              text: 'Adds info',
              onPressed: () => print('Adds'),
            ),
            LinkText(
              text: 'Blog',
              onPressed: () => print('Blog'),
            ),
            LinkText(
              text: 'Status',
              onPressed: () => print('Status'),
            ),
            LinkText(
              text: 'Careers',
              onPressed: () => print('Careers'),
            ),
            LinkText(
              text: 'Brand Resources',
              onPressed: () => print('Brand'),
            ),
            LinkText(
              text: 'Advertising',
              onPressed: () => print('Advertising'),
            ),
            LinkText(
              text: 'Resources',
              onPressed: () => print('Resources'),
            ),
            LinkText(
              text: 'Profession',
              onPressed: () => print('profession'),
            ),
            LinkText(
              text: 'Brand Resources',
              onPressed: () => print('Brand'),
            ),
            LinkText(
              text: 'Copy Rigth',
              onPressed: () => print('C. Rigth'),
            ),
          ],
        )
        // child: Container(
        //   width: double.infinity,
        //   height: 50,
        // ),
        );
  }
}
