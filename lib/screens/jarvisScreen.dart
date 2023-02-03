import 'package:flutter/material.dart';   
import 'package:flutter/services.dart';
import 'package:jarvis/providers/jarvis_provider.dart';
import 'package:provider/provider.dart'; 
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class JarvisScreen extends StatelessWidget {
  const JarvisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController  textToJarvisSpeechTextEditingController = TextEditingController();
    JarvisProvider jarvisProvider = Provider.of<JarvisProvider>(context);

    Future.delayed(Duration.zero, () async {
      await jarvisProvider.initSpeech();  
    },);
    

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Jarvis'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            (jarvisProvider.speechEnabled)
            ?ElevatedButton(
              child: jarvisProvider.ButtonJarvis(
                jarvisProvider.startTalk,
                jarvisProvider.isListening
              ),
              
              onPressed: () async {
                await jarvisProvider.startListening();

              },
            )
            :Container(),
            const Text('Texto desde la voz'),
            Text(jarvisProvider.lastWords)
            /* SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                controller: textToJarvisSpeechTextEditingController,
                maxLines: 5,
                decoration: InputDecoration(
                  
                  hintText: "Texto desde tu voz",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height.toDouble() * 0.040),
                  ),
                ),
              ),
            ), */
          ],
        )
      ),
    );
  }
}

/* import 'package:flutter/material.dart';   
import 'package:flutter/services.dart';
import 'package:jarvis/providers/jarvis_provider.dart';
import 'package:provider/provider.dart'; 
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class JarvisScreen extends StatefulWidget {
  @override
  _JarvisScreenState createState() => _JarvisScreenState();
}

class _JarvisScreenState extends State<JarvisScreen> {
  TextEditingController  textToJarvisSpeechTextEditingController = TextEditingController();
  late JarvisProvider jarvisProvider;
  String words = "";

  @override
  void initState() {
    super.initState();
    jarvisProvider = Provider.of<JarvisProvider>(context, listen: false);
    Future.delayed(Duration.zero, () async {
      await jarvisProvider.initSpeech();
      /* await jarvisProvider.startListening();
      words = jarvisProvider.lastWords;
      setState(() {}); */
      
    },);
  
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Jarvis'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            (jarvisProvider.speechEnabled)
            ?ElevatedButton(
              child: const Text('Hablarle a Jarvis'),
              onPressed: () async {
                await jarvisProvider.startListening();
                textToJarvisSpeechTextEditingController.text = jarvisProvider.lastWords;
                setState(() {
                  
                });
                /* words = jarvisProvider.lastWords;
                setState(() {
                  
                });
                print(jarvisProvider.lastWords); */

              },
            )
            :Container()
            ,
            const Text('Texto desde la voz'),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                controller: textToJarvisSpeechTextEditingController,
                maxLines: 5,
                decoration: InputDecoration(
                  
                  hintText: "Texto desde tu voz",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height.toDouble() * 0.040),
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
    
  }


  
}
 */
