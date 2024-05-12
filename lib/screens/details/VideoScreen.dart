import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../widget/themes.dart';

class VideoScreen extends StatefulWidget {
  final String option;

  VideoScreen({required this.option});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    var sourceVideo = '';
    if (widget.option == 'PETA MATERI') {
      sourceVideo = 'assets/videos/vc_peta_materi.mp4';
    } else if (widget.option == 'Video Sapa Belajar') {
      sourceVideo = 'assets/videos/vc_sapa_belajar.mp4';
    } else if (widget.option == 'Video Materi') {
      sourceVideo = 'assets/videos/vc_materi.mp4';
    } else {
      sourceVideo = 'assets/videos/vc_soal_19.mp4';
    }
    _controller = VideoPlayerController.asset(sourceVideo);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {});
    });
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _playPauseButton() {
    return InkWell(
      onTap: () {
        setState(() {
          if (_controller.value.isPlaying) {
            _controller.pause();
          } else {
            _controller.play();
          }
        });
      },
      child: Icon(
        _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        color: _controller.value.isPlaying ? Color(primaryColor) : Colors.grey,
      ),
    );
  }

  Widget _videoProgressIndicator() {
    return Slider(
      min: 0,
      max: _controller.value.duration.inSeconds.toDouble(),
      value: _controller.value.position.inSeconds.toDouble(),
      onChanged: (value) {
        _controller.seekTo(Duration(seconds: value.toInt()));
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.option),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: [
                      FutureBuilder(
                        future: _initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return Column(
                              children: [
                                AspectRatio(
                                  aspectRatio: _controller.value.aspectRatio,
                                  child: VideoPlayer(_controller),
                                ),
                                _videoProgressIndicator(),
                                _playPauseButton(),
                              ],
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
