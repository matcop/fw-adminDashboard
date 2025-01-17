import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        child: Image.network('https://media.istockphoto.com/id/1282988357/photo/benjamin-franklin-cut-from-new-100-dollars-banknote-on-white-background-fragment.jpg?s=612x612&w=0&k=20&c=H_SnZeitlnSLfa7hG0QnkfFSvLb2CGBwqwD-nUgBjxI='),
        //child: Image.network('https://fastly.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U'),

        
        width: 55,
        height: 55,
      ),
    );
  }
}