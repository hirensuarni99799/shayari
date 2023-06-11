import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayariapp21/fourthpage.dart';

class thadpage extends StatefulWidget {
List blanck;
int index;
  thadpage(this.blanck, this.index);

  @override
  State<thadpage> createState() => _thadpageState();
}

class _thadpageState extends State<thadpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder( itemCount: widget.blanck.length,
               onPageChanged: (value) {
                 setState(() {
                   widget.index = value;
                 });
               },
                itemBuilder: (context, index) {
              return Card(
                elevation: 40,
                margin: EdgeInsets.all(50),
                child: Center(
                  child: Text("${widget.blanck[widget.index]}",textAlign: TextAlign.center ),
                ),
              );
            },),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.blueGrey,
                  height: 80,
                  width: 100,
                  child: InkWell(
                    child: Icon(Icons.copy,size: 30,),
                    onTap: () {
                      FlutterClipboard.copy('${widget.blanck[widget.index]}').then(( value ){
                        print("copy");
                        Fluttertoast.showToast(
                            msg: "copy",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blueGrey,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      },
                      );
                  },),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blueGrey,
                  height: 80,
                  width: 100,
                  child: InkWell(
                    child: Icon(Icons.arrow_back,size: 30, ),
                    onTap: () {
                      setState(() {
                        if(widget.index > 0 ){
                          widget.index--;
                        }
                      });
                    },),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blueGrey,
                  height: 80,
                  width: 100,
                  child: InkWell(
                    child: Icon(Icons.edit_off,size: 30,),
                    onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return fourthpage(widget.blanck,widget.index);
                          },));
                    },),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blueGrey,
                  height: 80,
                  width: 100,
                  child: InkWell(
                    child: Icon(Icons.arrow_forward,size: 30,),
                    onTap: () {
                      print("hiii");
                          setState(() {
                            if(widget.index < widget.blanck.length -1){
                              widget.index++;
                            }
                          });
                    },),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blueGrey,
                  height: 80,
                  width: 100,
                  child: InkWell(
                    onTap: () {
                      Share.share('${widget.blanck[widget.index]}');

                    }, child: Icon(Icons.share_outlined,size: 30),),
                ),
              ),
//             IconButton(onPressed: () {
//
//                       Share.share('${widget.blanck[widget.index]}');
//             }, icon: Icon(Icons.share))

            ],
          )
        ],
      ),
    );
  }
}
