import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:new_flutter_assignment/models/blog.dart';
import 'package:uuid/uuid.dart';

class InitialDummyBlog {
  Future<List<Blog>> initializeListBlog() async {
    Uuid uuid = Uuid();

    //source - https://stackoverflow.com/questions/57264397/how-to-convert-image-to-uint8list-in-flutter-without-using-async
    //source - https://stackoverflow.com/questions/51609421/how-to-use-rootbundle-in-flutter-to-load-images
    //source foodblog - https://pinchofyum.com/
    Uint8List _image0 =
        (await rootBundle.load('assets/images/picture1_foodblog.jpg'))
            .buffer
            .asUint8List();
    Uint8List _image1 =
        (await rootBundle.load('assets/images/picture2_foodblog.jpg'))
            .buffer
            .asUint8List();
    Uint8List _image2 =
        (await rootBundle.load('assets/images/picture3_foodblog.jpg'))
            .buffer
            .asUint8List();

    Uint8List _image3 =
        (await rootBundle.load('assets/images/picture4_foodblog.jpg'))
            .buffer
            .asUint8List();

    return [
      Blog(
        id: uuid.v1(),
        title: "Bacon-Wrapped Dates with Goat Cheese",
        subtitle:
            'Bacon-Wrapped Dates with Goat Cheese – a simple 3-ingredient appetizer that will blow you away! Enjoy with a crowd of friends!',
        content:
            "Well well well well well. What have we here? To my hungry eyes, this looks like bacon-wrapped dates: soft, sweet Medjool dates stuffed with creamy, tangy goat cheese wrapped in salty, smoky bacon and baked to crispy-soft perfection.Years ago I decided to start a dinner club. I invited a few friends over for dinner, and we all made or brought something delicious and then got overly personal in the best way by talking for hours through dinner and drinks and dessert, and then I invited everyone to do it all over again the next month. Repeat x forever because I love it that much. If you’ve ever thought about doing something like this, let me just say: now is your time. Invite, eat, connect, and be glad you did it.The soft, melty goat cheese inside the warm, plumped up date (how much do you like it when I say plumped up date? mixed feelings here) wrapped in the little bite-sized pieces of bacon was the absolute perfect three-way combo for our food-cray group of girls.",
        date: "January 1, 2021",
        image: _image0,
      ),
      Blog(
        id: uuid.v1(),
        title: "The Very Best Chocolate Cookies",
        subtitle:
            'These are really the very best Chocolate Cookies! Thick, soft-centered, and crispy-edged. All your basic cookie ingredients here plus dark cocoa powder and ground cardamom to make things extra festive!',
        content:
            "Let no Holiday Series pass without cookies! Really, let nothing pass without cookies. Especially thick, soft-centered, crispy-edged, dark, rich, melt-in-your-mouth chocolate cookies. Laced with espresso powder and with a snowy sprinkle of cardamom sugar on top (optional, but such a wintery treat). They’re beautiful, festive, deeply delicious, and you’re going to be lucky if they last a day in your house. Be prepared when you set them out. People will come in droves…family, friends, neighbors, the Amazon delivery person may wander in and grab one for the road.They are truly remarkable. So put some in your pockets before they’re gone.The larger size of the cookie also helps achieve that perfectly thick sunken soft middle. The kind you just want to curl up in, the kind that pull apart at each craggy little crack. The kind that makes you think, “Maybe I should eat just one of these”, but you know it will probably be two. Or ten.",
        date: "January 2, 2021",
        image: _image1,
      ),
      Blog(
        id: uuid.v1(),
        title: "Caramelized Onion Dip",
        subtitle:
            'This caramelized onion dip is a total crowd pleaser! Serve with chips, pita or bagel crisps, or on sandwiches and burgers. YUM.',
        content:
            "Can you look past outward appearances to the soul of the caramelized onion dip which is, above all else, extremely luscious, totally delicious, and wonderful to share with friends? Can you envision a future for this caramelized onion dip that includes appetizers, burgers, sandwich spreads, and maybe even a little something to help you get extra with your eggs?Okay, so this is where you’ll spend approximately 90% of your time in this recipe. Caramelized onions take some time but they are WORTH IT. Oh so worth it. Okay, so this is where you’ll spend approximately 90% of your time in this recipe. Caramelized onions take some time but they are WORTH IT. Oh so worth it. And how do you know when your onions are *officially* caramelized? They’ll be golden brown, very soft, and sticky/ jammy.",
        date: "January 3, 2021",
        image: _image2,
      ),
      Blog(
        id: uuid.v1(),
        title: "Sopa Tarasca (Pinto Bean Soup) with Jalapeño Corn Fritters",
        subtitle:
            'Let’s make Sopa Tarasca! It’s a creamy, silky Mexican-inspired soup made with pinto beans, warm chili spices, and whole tomatoes. And you NEED a big pile of the jalapeño corn fritters on top. Drooling over this one!',
        content:
            "This soup is a hug in a bowl. It’s got a tomato and pinto bean base, with warm chili spices, a creamy silky thickness – and once you add in that generous pile of crispy, sweet, spicy melt-in-your-mouth corn fritters on top, the whole thing is going to have you coming back for more. And more. And then, okay, more again because this one just keeps getting better. Sopa Tarasca (“Tarascan soup”) originated in the Michoacán state of Mexico and was given the name in honor of the indigenous peoples of that area, the Purépechas or Tarascos. It is made with tomatoes, garlic, onion, and our favorite little friend, pinto beans! It is also made with fresh or dried chiles native to that region, which help give it its warm smoky flavor. We made some ever so slight swaps based on availability and preference, like using ancho chili powder instead, cooking the onion rather than adding it raw, and tossing in some extra cumin, to come up with this cozy-as-all-get-out nod to a more traditional sopa tarasca.",
        date: "January 3, 2021",
        image: _image3,
      ),
    ];
  }
}
