import 'dart:ui';

import 'package:essays/dataset.dart';
import 'package:essays/extraWeather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';



class DetailPage extends StatelessWidget {
      Weather  tomorrowTemp;
         List<Weather>   sevenDay;

  DetailPage(this.sevenDay, this.tomorrowTemp);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff030317),
        body: Column(
          children: [
            TomorrowWeather(tomorrowTemp),
            SevenDays(sevenDay),
          ],
        ),
    );
  }
}
////////////////// The Glow Container of the 7 days Tap 
class  TomorrowWeather extends StatelessWidget {
  
       Weather  tomorrowTemp;
       TomorrowWeather(this.tomorrowTemp);

  
  @override
  Widget build(BuildContext context) {


//////////////////////The GlowConatiner which Has tommrow weather//////////////

    return GlowContainer(
          color: Color(0xff00A1FF),
          glowColor: Color(0xff00A1FF),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 20, 
                  right: 30,
                   left: 30, 
                   bottom: 8),
                      //////////////////// The Row which have The 3 icons //////////////
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            }, 
                            child: Icon(Icons.arrow_back_ios,
                            color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                 color: Colors.white,
                                 ),
                                 Text('7 days', 
                                 style: TextStyle(
                                   fontSize: 25,
                                   fontWeight: FontWeight.bold,
                                    
                                 ),
                                 ),
                            ],
                          ),
                          Icon(Icons.more_vert, color: Colors.white,),
                     ],
                   ),
                   ///////////////////////////////End of List Icons/////////////////////////////////////////////////////
                   ),
                   Padding(padding: EdgeInsets.all(8),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       //////////////The Container which have The Weather Image////////////
                        Container(
                          width: MediaQuery.of(context).size.width /2.3,
                          height: MediaQuery.of(context).size.width /2.3,
                          decoration: BoxDecoration(
                             image: DecorationImage(
                               image: AssetImage(tomorrowTemp.image!)
                             ),
                          ),
                        ),
                        ///////////////////////End of The Container/////////////////////////
                        Column(
                             mainAxisSize: MainAxisSize.min,
                             crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /////////////////////Tommororw text//////////////////
                               Text('Tomorrow',
                               style: TextStyle(
                                 fontSize: 30,
                                 height: 0.1,
                                
                               ),
                                ),
                /////////////////////////The Conatiner which have Tomorrow Min AND Max Temperature/////////////////////////
                                Container(
                                  height: 100,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                       GlowText(
                                        tomorrowTemp.max.toString(),
                                        style: TextStyle(
                                          fontSize: 100,
                                          fontWeight: FontWeight.bold,

                                        ),
                                       ), 
                                       Text('/'+tomorrowTemp.min.toString()+'\u00B0', 
                                       style: TextStyle(
                                           color: Colors.black54.withOpacity(0.3),
                                           fontSize: 40, 
                                            fontWeight: FontWeight.bold
                                       ),
                                       ),  
                                    ],
                                  ),
                                ),
/////////////////////////////////////// End of the Container////////////////////////////////////////////////
                             
                                SizedBox(height: 10,),
                //////////////// Weather Name /////////////////////////////////
                                Text(""+tomorrowTemp.name!,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                ),
                          ],
                        ),
                     ],
                   ),
                   ),
                   Padding(
                     padding: EdgeInsets.only(
                      bottom: 8,
                      right: 8,
                      left: 8,    
                     ),
                     child:
                      Column(
                       children: [
                         Divider(color: Colors.white,),
                         SizedBox(height: 10,),

                         /////////////////The widget which have 
                         ExtraWeather(tomorrowTemp),
                       ],
                     )
                     ),
            ],
          ), 
    );
  }
}


/////// 7 days forecast Weather

class SevenDays extends StatelessWidget {

       List<Weather>  sevenDay;

       SevenDays(this.sevenDay);
  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 20, 
                      right: 20,
                      bottom: 25,
                    ),

                    //////////// List of Days///////////
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(sevenDay[index].day!,
                        style: TextStyle(fontSize: 20),
                         ),
///////////////////////List of Weather Icons and Names [rainy, thunder, sunny ...etc]
                         Container(
                           width: 135,
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage(sevenDay[index].image!),
                                width:40,
                                ),
                                SizedBox(width: 15,),
                                Text(
                                  sevenDay[index].name!,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                            ],
                           ),
                         ),
                         ///////////////////////List of Min AND Max temeprature during 7 days//////////////////
                         Row(
                           children: [
                              Text("+"+sevenDay[index].max.toString()+"\u00B0",
                            style: TextStyle(
                                fontSize: 20,
                             ),
                              ),
                              SizedBox(width: 5,),
                              Text("+"+sevenDay[index].min.toString()+"\u00B0",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                              ),
                              
                           ],
                         ),
                      ],
                    ) ,
                    );

            },
            itemCount: sevenDay.length,
            ),
    );
  }
}