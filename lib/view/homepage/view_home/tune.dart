import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_manager/file_manager.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:smartbells/common/base_colors.dart';
import 'package:smartbells/view/homepage/controller/home_controller.dart';
import 'package:smartbells/view/homepage/view_home/weekly_schedule.dart';

import '../../../api_endpoints.dart';
import '../../../common/text.dart';
import 'daily_schedule.dart';
import 'folderfile.dart';

class Audio extends StatefulWidget {
  final String audio;
  const Audio({
    super.key,
    required this.audio,
  });

  @override
  State<Audio> createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  final HomeCon hcon = Get.put(HomeCon());
  int _value = 6;
  var files;
  int selectaudio = -1;
  bool isplaying = false;
  int selectindex = -1;
  int seletlist = 4;
  bool selectonlinr = false;

  List<FileSystemEntity> _songs = [];
  // void getFiles() async { //asyn function to get list of files
  //   List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
  //   var root = storageInfo[0].rootDir; //storageInfo[1] for SD card, geting the root directory
  //   var fm = FileManager(root: Directory(root)); //
  //   files = await fm.filesTree(
  //       excludedPaths: ["/storage/emulated/0/Android"],
  //       extensions: ["mp3"] //optional, to filter files, list only mp3 files
  //   );
  //   setState(() {}); //update the UI
  // }
  getrecor() {
    Directory dir = Directory('/storage/emulated/0/Download');
    String mp3Path = dir.toString();
    print(mp3Path);
    List<FileSystemEntity> _files;

    _files = dir.listSync(
      recursive: true,
      followLinks: false,
    );
    for (FileSystemEntity entity in _files) {
      String path = entity.path;

      if (path.endsWith('.mp3')) {
        _songs.add(entity);
        print(entity);
      }
    }
    print(_songs);
    print(_songs.length);
  }

  @override
  void dispose() {
    advancedPlayer.pause();
    // TODO: implement dispose
    super.dispose();
  }

  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  _playAudio(audio, index) async {
    print(audio);
    selectaudio = -1;
    if (audio != null && hcon.isPause.length > 0) {
      final play = audio;

      if (hcon.isPause[index]) {
        await advancedPlayer.resume();
        setState(() {
          hcon.isPlaying[index] = true;
          hcon.isPause[index] = false;
        });
      } else if (hcon.isPlaying[index]) {
        await advancedPlayer.pause();
        setState(() {
          for (int i = 0; i < hcon.isPlaying.length; i++) {
            hcon.isPlaying[i] = false;
          }

          hcon.isPause[index] = true;
        });
      } else {
        for (int i = 0; i < hcon.isPlaying.length; i++) {
          hcon.isPlaying[i] = false;
        }
        setState(() {
          hcon.isLoading[index] = true;
        });
        print(play);

        await advancedPlayer.stop();
        await advancedPlayer.setSourceUrl(play);
        // await advancedPlayer.resume();

        await advancedPlayer.onDurationChanged.listen((Duration d) {
          setState(() {
            for (int i = 0; i < hcon.isPlaying.length; i++) {
              hcon.duration[i] = new Duration();
            }
            hcon.duration[index] = d;
            hcon.isLoading[index] = false;
          });
        });
        print(hcon.isPause[index]);
        print(hcon.isPlaying[index]);
        if (hcon.isPause[index] == false && hcon.isPlaying[index] == false)
          await advancedPlayer.resume();
        setState(() {
          hcon.isPlaying[index] = true;
        });
      }
      advancedPlayer.onPositionChanged.listen((Duration p) {
        setState(() {
          for (int i = 0; i < hcon.isPlaying.length; i++) {
            hcon.position[i] = new Duration();
          }
          hcon.position[index] = p;
        });
      });

      advancedPlayer.onPlayerComplete.listen((event) {
        setState(() {
          hcon.isPlaying[index] = false;
          hcon.duration[index] = new Duration();
          hcon.position[index] = new Duration();
        });
      });
    }
    setState(() {});
  }

  _playsorceplay(FileSystemEntity audio, int index, bool playing) async {
    if (audio != null && hcon.isPause.length > 0) {
      final play = audio;

      if (hcon.isPause[index]) {
        await advancedPlayer.resume();
        setState(() {
          hcon.isPlaying[index] = true;
          hcon.isPause[index] = false;
        });
      } else if (hcon.isPlaying[index]) {
        await advancedPlayer.pause();
        setState(() {
          for (int i = 0; i < hcon.isPlaying.length; i++) {
            hcon.isPlaying[i] = false;
          }

          hcon.isPause[index] = true;
        });
      } else {
        for (int i = 0; i < hcon.isPlaying.length; i++) {
          hcon.isPlaying[i] = false;
        }
        setState(() {
          hcon.isLoading[index] = true;
        });

        await advancedPlayer.stop();
        // await advancedPlayer.play();

        await advancedPlayer.resume();

        await advancedPlayer.onDurationChanged.listen((Duration d) {
          setState(() {
            for (int i = 0; i < hcon.isPlaying.length; i++) {
              hcon.duration[i] = new Duration();
            }
            hcon.duration[index] = d;
            hcon.isLoading[index] = false;
          });
        });
        print(hcon.isPause[index]);
        print(hcon.isPlaying[index]);
        if (hcon.isPause[index] == false && hcon.isPlaying[index] == false)
          await advancedPlayer.resume();
        setState(() {
          hcon.isPlaying[index] = true;
        });
      }
      advancedPlayer.onPositionChanged.listen((Duration p) {
        setState(() {
          for (int i = 0; i < hcon.isPlaying.length; i++) {
            hcon.position[i] = new Duration();
          }
          hcon.position[index] = p;
        });
      });

      advancedPlayer.onPlayerComplete.listen((event) {
        setState(() {
          hcon.isPlaying[index] = false;
          hcon.duration[index] = new Duration();
          hcon.position[index] = new Duration();
        });
      });
    }
    setState(() {});
  }

  Future<void> playAudioFromLocalStorage(
      FileSystemEntity path, int index, bool playing) async {
    for (int i = 0; i < hcon.audiodata!.data.audio.length; i++) {
      // var demo = await  translator
      // .translate(audiodata!.data[i].audioTitle, to: 'ta');
      //   audioList.add(demo) ;
      hcon.duration[i] = (Duration(milliseconds: 0));
      hcon.position[i] = (Duration(milliseconds: 0));
      hcon.isPlaying[i] = (false);
      hcon.isLoading[i] = (false);
      hcon.isPause[i] = (false);
      // Fluttertoast.showToast(msg: audiodata!.msg.toString());
      //sendotp.value = data['data'];
    }
    setState(() {});
    if (selectaudio == index) {
      if (playing) {
        await advancedPlayer.pause();
        isplaying = false;
        setState(() {});
      } else {
        await advancedPlayer.resume();
        isplaying = true;
        setState(() {});
      }
    } else {
      await advancedPlayer.pause();
      Uint8List imgbytes = await File(path.path).readAsBytes();
      await advancedPlayer.play(BytesSource(imgbytes));
      isplaying = true;
      setState(() {});
    }
  }

  @override
  void initState() {
    getrecor();
    call();
    // TODO: implement initState
    super.initState();
  }

  call() async {
    await hcon.audioFunc();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 40,
              color: blackColor,
            )),
      ),
      backgroundColor: greyColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            // Center(
            //   child: InkWell(
            //     onTap: (
            //
            //
            //     ){
            //       selectonlinr=true;
            //       setState(() {
            //
            //       });
            //       // Get.to(filefolder());
            //     },
            //     child: Container(
            //         width: 350,
            //         height: 55,
            //         decoration: BoxDecoration(
            //             color: Colors.white54,
            //             borderRadius: BorderRadius.circular(10)
            //         ),
            //         child: Row(
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.all(10.0),
            //               child:Text('Online audio',style: TextStyle(fontSize: 16,color: appColor),),),
            //             SizedBox(
            //               width: 170,
            //             ),
            //             Icon(Icons.folder,color: appColor,)
            //
            //           ],
            //         )),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            selectonlinr
                ? ListView.builder(
                    itemCount: hcon.audiodata?.data.itemCount ?? 0,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () async {
                          seletlist = 1;
                          selectindex = index;
                          try {
                            Fluttertoast.showToast(msg: 'Song Downloading');
                            var response = await Dio().download(
                                API().baseImage +
                                    hcon.audiodata!.data.audio[index].audio,
                                "/storage/emulated/0/Download/" +
                                    hcon.audiodata!.data.audio[index].audName +
                                    ".mp3");
                            Fluttertoast.showToast(msg: "Song Dowloaded");
                            GetStorage().write(
                                'linktune',
                                "/storage/emulated/0/Download/" +
                                    hcon.audiodata!.data.audio[index].audName +
                                    ".mp3");
                            GetStorage().write('linkname',
                                hcon.audiodata!.data.audio[index].audName);
                            if (widget.audio == "week") {
                              Get.off(weeklySchedule());
                            } else {
                              Get.off(dailySchedule());
                            }
                          } catch (E) {
                            Fluttertoast.showToast(msg: "Dowload Failed");
                          }

                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                            color: seletlist == 1 && selectindex == index
                                ? appColor
                                : greyColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 300,
                                          child: Txt(
                                            text: hcon.audiodata!.data
                                                .audio[index].audName,
                                            fsize: 16,
                                            color: seletlist == 1 &&
                                                    selectindex == index
                                                ? greyColor
                                                : appColor,
                                            weight: FontWeight.w500,
                                          )),
                                      InkWell(
                                        onTap: () {
                                          _playAudio(
                                              API().baseImage +
                                                  hcon.audiodata!.data
                                                      .audio[index].audio,
                                              index);
                                          print(API().baseImage +
                                              hcon.audiodata!.data.audio[index]
                                                  .audio);
                                        },
                                        child: !hcon.isPlaying[index]
                                            ? Icon(
                                                Icons.play_arrow,
                                                color: seletlist == 1 &&
                                                        selectindex == index
                                                    ? greyColor
                                                    : appColor,
                                              )
                                            : Icon(
                                                Icons.pause,
                                                color: seletlist == 1 &&
                                                        selectindex == index
                                                    ? greyColor
                                                    : appColor,
                                              ),
                                      )
                                    ],
                                  ),
                                ),
                                // Bubble(
                                //   child: BubbleNormalAudio(
                                //                         color: Colors.white70,
                                //                         duration: init.duration[index].inSeconds.toDouble(),
                                //                         position: init.position[index].inSeconds.toDouble(),
                                //                         isPlaying: init.isPlaying[index],
                                //                         isLoading: init.isLoading[index],
                                //                         isPause: init.isPause[index],
                                //                         onSeekChanged: (value1) async {
                                //                           await init.advancedPlayer
                                //      .seek(Duration(seconds: value1.round()));
                                //                         },
                                //                         onPlayPauseButtonClick: () => _playAudio(
                                //    API().imgURL + init.audiodata!.data[index].audioSrc,
                                //    //"https://www.kozco.com/tech/piano2-CoolEdit.mp3",
                                //     index),
                                //                         sent: false,
                                //                       ),
                                // )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: _songs.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          seletlist = 2;
                          selectindex = index;
                          setState(() {});
                          print(selectindex);
                          print(_songs[0].path);
                          GetStorage().write('linktune', _songs[index].path);
                          GetStorage().write(
                              'linkname',
                              _songs[index]
                                  .path
                                  .split('/')
                                  .last
                                  .replaceAll(RegExp('.mp3'), ''));
                          if (widget.audio == "week") {
                            Get.offAll(weeklySchedule());
                          } else {
                            Get.offAll(dailySchedule());
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
                            color: seletlist == 2 && selectindex == index
                                ? appColor
                                : greyColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Txt(
                                          text: _songs[index]
                                              .path
                                              .split('/')
                                              .last
                                              .replaceAll(RegExp('.mp3'), ''),
                                          fsize: 16,
                                          color: seletlist == 2 &&
                                                  selectindex == index
                                              ? greyColor
                                              : appColor,
                                          weight: FontWeight.w500,
                                        ),
                                        width: 300,
                                      ),
                                      InkWell(
                                        child: selectaudio != index
                                            ? Icon(
                                                Icons.play_arrow,
                                                color: seletlist == 2 &&
                                                        selectindex == index
                                                    ? greyColor
                                                    : appColor,
                                              )
                                            : isplaying && selectaudio == index
                                                ? Icon(
                                                    Icons.pause,
                                                    color: seletlist == 2 &&
                                                            selectindex == index
                                                        ? greyColor
                                                        : appColor,
                                                  )
                                                : Icon(
                                                    Icons.play_arrow,
                                                    color: seletlist == 2 &&
                                                            selectindex == index
                                                        ? greyColor
                                                        : appColor,
                                                  ),
                                        onTap: () {
                                          // _playsorceplay( _songs[0],0);
                                          playAudioFromLocalStorage(
                                              _songs[index], index, isplaying);
                                          selectaudio = index;
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                // Bubble(
                                //   child: BubbleNormalAudio(
                                //                         color: Colors.white70,
                                //                         duration: init.duration[index].inSeconds.toDouble(),
                                //                         position: init.position[index].inSeconds.toDouble(),
                                //                         isPlaying: init.isPlaying[index],
                                //                         isLoading: init.isLoading[index],
                                //                         isPause: init.isPause[index],
                                //                         onSeekChanged: (value1) async {
                                //                           await init.advancedPlayer
                                //      .seek(Duration(seconds: value1.round()));
                                //                         },
                                //                         onPlayPauseButtonClick: () => _playAudio(
                                //    API().imgURL + init.audiodata!.data[index].audioSrc,
                                //    //"https://www.kozco.com/tech/piano2-CoolEdit.mp3",
                                //     index),
                                //                         sent: false,
                                //                       ),
                                // )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
          ],
        ),
      ),
    );
  }
}
