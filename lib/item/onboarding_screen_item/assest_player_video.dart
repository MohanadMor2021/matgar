import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AssestPlayerWidget extends StatefulWidget {
  const AssestPlayerWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AssestPlayerWidgettState createState() => _AssestPlayerWidgettState();
}

class _AssestPlayerWidgettState extends State<AssestPlayerWidget> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  @override
  void initState() {
    super.initState();

    _videoPlayerController =
        VideoPlayerController.asset('assets/video/horse.mp4')
          ..addListener(() => setState(() {}))
          ..setLooping(true)
          ..initialize().then((_) {
            return _chewieController = ChewieController(
              videoPlayerController: _videoPlayerController!,
              autoPlay: true,
              allowFullScreen: false,
              fullScreenByDefault: false,
              showControls: false,
              autoInitialize: true,
            );
          });
  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          child: _chewieVideoPlayer(),
        ),
      );
  Widget _chewieVideoPlayer() {
    return _chewieController != null && VideoPlayerController != null
        ? Chewie(controller: _chewieController!)
        : const Center(child: CircularProgressIndicator());
  }
}
