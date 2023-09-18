import 'package:flutter/material.dart';

class PinchZoomImage extends StatefulWidget {
  String? image;
  PinchZoomImage({super.key, required this.image});

  @override
  State<PinchZoomImage> createState() => _PinchZoomImageState();
}

class _PinchZoomImageState extends State<PinchZoomImage>
    with SingleTickerProviderStateMixin {
  final double minScale = 1;
  final double maxScale = 4;
  late TransformationController controller;
  late AnimationController animationCOntroller;
  Animation<Matrix4>? animation;
  OverlayEntry? entry;
  double scale = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TransformationController();
    animationCOntroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() => controller.value = animation!.value)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          removeOverlay();
        }
      });
  }

  void removeOverlay() {
    entry?.remove();
    entry = null;
  }

  @override
  void dispose() {
    controller.dispose();
    animationCOntroller.dispose();
    super.dispose();
  }

  void resetAnimation() {
    animation = Matrix4Tween(begin: controller.value, end: Matrix4.identity())
        .animate(
            CurvedAnimation(parent: animationCOntroller, curve: Curves.ease));
    animationCOntroller.forward(from: 0);
  }

  Widget buildImage() {
    return Builder(builder: (context) {
      return InteractiveViewer(
        transformationController: controller,
        clipBehavior: Clip.none,
        panEnabled: false,
        maxScale: maxScale,
        minScale: minScale,
        onInteractionStart: (details) {
          if (details.pointerCount < 2) return;
        },
        onInteractionUpdate: (details) {
          if (entry == null) return;
          scale = details.scale;
          entry!.markNeedsBuild();
        },
        onInteractionEnd: (details) {
          resetAnimation();
        },
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              "${widget.image}",
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    });
  }

  void showOverlay(BuildContext context) {
    final renderBox = context.findRenderObject()! as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = MediaQuery.of(context).size;
    entry = OverlayEntry(
      builder: (context) {
        final opacity =
            ((scale - 1) / (maxScale - 1)).clamp(0.2, 0.8).toDouble();
        return Stack(
          children: [
            Positioned.fill(
                child: Opacity(
              opacity: opacity,
              child: Container(
                color: Colors.black,
              ),
            )),
            Positioned(
              left: offset.dx,
              top: offset.dy,
              width: size.width,
              child: buildImage(),
            ),
          ],
        );
      },
    );

    final overlay = Overlay.of(context);
    overlay.insert(entry!);
  }

  @override
  Widget build(BuildContext context) {
    return buildImage();
  }
}
