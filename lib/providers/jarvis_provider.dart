import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class JarvisProvider extends ChangeNotifier{

  SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;
  bool isListening = false;
  bool startTalk = false;
  String lastWords = '';

  Future initSpeech() async {

    speechEnabled = await speechToText.initialize();
    notifyListeners();
  }

  Future startListening() async {
    
    startTalk = true;
    await speechToText.listen(onResult: (SpeechRecognitionResult result) {
      
      if(speechToText.isNotListening){
        startTalk = false;
      }
      lastWords = result.recognizedWords;
      isListening = !speechToText.isNotListening;
      notifyListeners();
    });

  }

  Widget ButtonJarvis(bool startTalk, bool isListening){

     Widget text = const Text('');

     if(!startTalk){
      text = const Text('Hablarle a Jarvis');
     }
     if(startTalk && !isListening){
      text = const Text('Empieze hablar con Jarvis');
     }
     if(startTalk && isListening){
      text = const Text('Jarvis te esta escuchando');
     }

     return text;

  }

}