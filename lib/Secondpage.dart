import 'package:flutter/material.dart';
import 'package:shayariapp21/thadpage.dart';

class Secondpage extends StatefulWidget {
  int index;
  List name;

  Secondpage(this.index, this.name);

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  List blanck = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.index == 0) {
      blanck = Shayri.s1;
    }else if(widget.index == 1){
      blanck = Shayri.s2;
    }else if(widget.index == 2){
      blanck = Shayri.s3;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.name[widget.index]}"),
          backgroundColor: Colors.blueGrey,
        ),
        body: GridView.builder(
          itemCount: blanck.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(5),
              height: 150,
              width: 150,
              child: Card(
                elevation: 10,
                color: Colors.blueGrey,
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return thadpage(blanck,index);
                    },));
                  },
                  title: Text(
                    blanck[index],
                    textAlign: TextAlign.center,
                    maxLines: 6,
                    style:TextStyle(fontSize: 20),
                  ),
                ),
              ),
            );
          },
        ));
  }
}

class Shayri {
  static List s1 = [
    """Friend, you are your own,
        Badhale chest house.
        If I’m in trouble,
        Do it later.
        There is no river of happiness
        Sad sand char.
        You are my friend all the time
        My news .. !! """,
    """ The most precious thing in the world,
Relationships are pure friendships,
If friends are good
Then there,
There is no place for tears.  """,
    """ Friend means No Thanks No Sorry
Friend means Fun Is Very Very
Friend means I’m here
Don’t Worry  """,
    """ There is a mind inside the chest.
You are in the mind.
Become a friend in your heart,
I want to stay.  """,
    """ Friendship is Onetime,
But true friendship is lost
Survive Lifetime  """,
    """ A letter in the hand of the cloud
I sent it today,
Friends are far away,
A lot of work at hand.
Rain let you know once
Give it to him
Friend, I am by your side
In the space of a thousand jobs!  """,
        """ No matter how wrong a good friend may be,
     Never forget him.
    Because no matter how dirty the water is,
  That water to put out the fire e
   It is most useful. """,
    """Walking in the dark with a friend,
Better a poor horse than no horse at all.  """,
    """ I wrote with difficulty, friend.
Read with the mind.
Me with heart after reading
Remember.
Who is dear to you?
I don’t know,
To me than Saba
You are a dear friend. """,
    """Friend does not mean neglect,
You have to make friends,
Friend is the companion of happiness and sorrow,
Friends who do not line that
Damage to you!  """,
    """ My dear friend,
You are the best friend.
My friend is in trouble
Friends are just looking for me.
Buddy next to you
The mind does not cry, it just laughs.
My friend is smiling,
As if to live a lifetime.
I’ll be with you,
Laughter comes to cry. """,
  ];
  static List s2 = [
    """
    Tere Khayal Se Khud Ko Chhupa Ke Dekha Hai,
Dil-o-Najar Ko Rula-Rula Ke Dekha Hai,
Tu Nahi To Kuchh Bhi Nahi Hai Teri Kasam,
Maine Kuchh Pal Tujhe Bhula Ke Dekha Hai. """,
    """
    Hum Aapki Har Cheez Se Pyar Kar Lenge,
Aapki Har Baat Par Aitbaar Kar Lenge,
Bas Ek Bar Keh Do Ki Tum Sirf Mere Ho,
Hum Zindagi Bhar AapKa Intezaar Kar Lenge.
     """,
    """
    Nahi Jo Dil Mein Jagah To Najar Mein Rehne Do,
Meri Hayaat Ko Tum Apne Asar Mein Rehne Do,
Main Apni Soch Ko Teri Gali Mein Chhod Aaya Hun,
Mere Wajood Ko Khwabon Ke Ghar Mein Rehne Do.
     """,
    """ 
    Kitaab-e-Dil Mein Bhi Rakha To Tazagi Na Gayi,
Tere Khayal Ka Jalwa Gulaab Jaisa Hai.
    """,
    """ 
    Tu Haqeekat-e-Ishq Hai Ya Koi Fareb,
Zindgi Mein Aati Nahi Khwabon Se Jati Nahi.
    """,
    """
    Tera Zikr Teri Fikr Tera Ehsaas Tera Khayal,
Tu Khuda To Nahi Phir Har Jagah Kyun Hai.
     """,
    """
    Roj Wo Khwab Mein Aate Hain Gale Milne Ko,
Main Jo Sota Hun To Jaag UthhTi Hai Kismat Meri.
     """,
  ];
  static List s3 =[
    """ 
  Matlab Ki Duniya Thi
Isliye chor diya sabse milna,
Warna ye choti si umar
Thnahai ke qabil to nahin the..!
  """,
    """ 
  Agar Thak Jaao Kabhi Toh Humse Kahna
Hum Utha Lenge Tumko Apni Baahon Mein
Aap Ek Baar Pyar Karke Toh Dekho Humse
Hum Khusiyan Bichha Denge Aapki Raahon Mein..!
  """,
    """ 
  Koi kitana bhi himmatawala kyu na ho,
Hamesha koi khas insaan ki yaad rula deta hai..!
  """,
    """ 
  I don’t hurt people With a lie,
I just fu*k them With a truth..!
  """,
    """ 
  Hamne to ek sakhs par
chahat khatam kardi,
Ab mohabbat kise kahte hai
hamen malum nahi..!
  """,
    """ 
  Jindagi me har baar sahara nahi milata,
Koi pyaar se pyaara nahin milata,
Jo paas he use sambhaal ke rakho,
Kyon ki agar ek bar vah kho jaye,
To wo phir dobara nahi milata...!
  """,
    """ 
  Rab Kare Zindagi Mein Aisa Mukaam Aaye,
Meri Rooh Aur Jaan Aapke Kaam Aaye,
Har Dua Mein Bas Yehi Maangte Hain Rab Se,
Ki Agle Janam Mein Bhi Aapke Naam Ke Sath Mera Naam Aaye..!
  """,
  ];

  static List s4 = [
    """  """,
  ];
}
