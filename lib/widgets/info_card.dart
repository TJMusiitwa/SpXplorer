import 'dart:ui';

import 'package:flutter/material.dart';

class FrostyBackground extends StatelessWidget {
  final Color? color;
  final double intensity;
  final Widget child;

  const FrostyBackground(
      {Key? key, this.color, this.intensity = 25, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: intensity, sigmaY: intensity),
        child: DecoratedBox(
          decoration: BoxDecoration(color: color),
          child: child,
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String tagID;
  final VoidCallback? onTap;
  final String title;
  final String? subtitle;
  final ImageProvider image;
  const InfoCard(
      {Key? key,
      required this.tagID,
      this.onTap,
      required this.title,
      this.subtitle,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Hero(
              tag: tagID,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: image,
                    )),
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: FrostyBackground(
                color: Color(0x90ffffff),
                intensity: 50,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headline6,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle == null
                          ? SizedBox.shrink()
                          : Text(
                              subtitle!,
                              style: Theme.of(context).textTheme.headline6,
                              overflow: TextOverflow.ellipsis,
                            ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
