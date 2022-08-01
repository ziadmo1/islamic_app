import 'package:flutter/material.dart';
import 'package:islamic_app/my_theme.dart';
import 'package:islamic_app/providers/provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double rotate = 0;
  List<String> onSebha = ['سبحان الله','الحمدلله','لا اله الا الله','الله أكبر'];
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Stack(
           alignment: Alignment(0.2,-2.2),
            children: [
              provider.themeMode == ThemeMode.light?
              Image.asset('assets/images/head_sebha.png'):Image.asset('assets/images/head_sebha_dark.png'),
            InkWell(
              onTap: (){
                rotate++;
                onClickSebha();
                setState(() {
                });
              },
              child: Transform.rotate(
                  angle: rotate,
                  child:
                  provider.themeMode == ThemeMode.light?
                  Image.asset('assets/images/body_sebha.png') :
                  Image.asset('assets/images/body_sebha_dark.png')
              ),
            ),
            ],
          ),
        ),
          SizedBox(height: 50,),
          Text('Number of tasbeh',style: Theme.of(context).textTheme.bodyMedium,),
        SizedBox(height: 25,),
        Container(
            alignment: Alignment.center,
            width: 50,
              height: 60,
              decoration: BoxDecoration(
                color: provider.themeMode==ThemeMode.light?Color(0xCCC6B088):Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Text(rotate.toString())),
        SizedBox(height: 25,),
        Container(
          alignment: Alignment.center,
            width: 150,
            height: 50,
            decoration: BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.circular(18)
            ),
            child: Text('${onSebha[index]}',textAlign: TextAlign.center,style: TextStyle(
              fontWeight: FontWeight.bold,
              color: provider.themeMode == ThemeMode.light?Colors.white:Colors.black
            ),)),
      ],
    );
  }
  int index = 0;
  void onClickSebha(){
    if(index == 0&&rotate>=0){
      onSebha[0];
      if(rotate>=34){
        rotate = 0;
        index++;
      }
    }
   else if(index==1&&rotate>=0) {
      onSebha[1];
      if(rotate>=34){
        rotate = 0;
        index++;
      }
    }
    else if(index==2&&rotate>=0) {
      onSebha[2];
      if(rotate>=34){
        rotate = 0;
        index++;
      }
    }
    else if(index==3&&rotate>=0){
      onSebha[3];
      if(rotate>=2){
        rotate=0;
        index = 0;
      }
    }

  }
}
