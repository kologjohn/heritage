import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> imageUrls;

  const ImageCarousel({Key? key, required this.imageUrls}) : super(key: key);

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  void _nextPage() {
    if (_currentIndex < widget.imageUrls.length - 1) {
      _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: widget.imageUrls.length,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return CachedNetworkImage(
              imageUrl: widget.imageUrls[index],
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              placeholder: (context, url) => Transform.scale(
                scale: 0.4,
                child: const CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.red,
                size: 40,
              ),
            );
          },
        ),
        if (_currentIndex > 0)
          Positioned(
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, size: 30),
              onPressed: _previousPage,
            ),
          ),
        if (_currentIndex < widget.imageUrls.length - 1)
          Positioned(
            right: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_forward_ios, size: 30),
              onPressed: _nextPage,
            ),
          ),
      ],
    );
  }
}
