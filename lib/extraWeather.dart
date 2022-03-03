import 'package:flutter/material.dart';
import 'dataset.dart';
import 'package:flutter/cupertino.dart';

class ExtraWeather extends StatelessWidget {
    final Weather temp;

    ExtraWeather(this.temp);
  @override
  Widget build(BuildContext context) {
     /////////////////////////The Row Which have the  (Wind, Humidity,Rain ) ////////////////////////////
    return  
           Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                  ///////////////////Wind//////////////////////////////
                      Column(
                        children: [
                          Icon(CupertinoIcons.wind,
                           color: Colors.white,),
                           SizedBox(height:10,),
                           Text(temp.wind.toString() +"Km/h",
                           style: TextStyle(
                             fontWeight: FontWeight.w700,
                             ),
                             ),
                             SizedBox(height: 10,),
                             Text("Wind",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                 ),
                                 ),
                                 
                        ],
                      ),
                      /////////////////////////End OF wind////////////////////////
                      ///
                  ///////////////////// Humidity///////////////////////////////////
                       Column(
                        children: [
                          Icon(CupertinoIcons.wind,
                           color: Colors.white,),
                           SizedBox(height:10,),
                           Text(temp.humidity.toString() +"%",
                           style: TextStyle(
                             fontWeight: FontWeight.w700,
                             ),
                             ),
                             SizedBox(height: 10,),
                             Text("Humidity",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                 ),
                                 ),    
                        ],
                      ),

                      ///////////////////////////End OF Humidity///////////////////////////////
                      ///
              /////////////////////Rain////////////////////////////////////////////////////////
                       Column(
                        children: [
                          Icon(CupertinoIcons.wind,
                           color: Colors.white,),
                           SizedBox(height:10,),
                           Text(temp.chanceRain.toString() +"%",
                           style: TextStyle(
                             fontWeight: FontWeight.w700,
                             ),
                             ),
                             SizedBox(height: 10,),
                             Text("Rain",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                 ),
                                 ),
                        ],
                      ),
               ///////////////////////End Of Rain////////////////////////////////////       
                       ],
                   );
      
    
  }
}