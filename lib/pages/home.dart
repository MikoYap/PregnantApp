import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shadow_overlay/shadow_overlay.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: size.height / 3,
            backgroundColor: Color(0xFFD1B7A1),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/foetus.png",
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:15, vertical: 20),
              child: Text(
                "          Pregnancy is the term used to describe the period in which a fetus develops inside a woman's womb or uterus. "
                    "Pregnancy usually lasts about 40 weeks, or just over 9 months, as measured from the last menstrual period to delivery. "
                    "Health care providers refer to three segments of pregnancy, called trimesters. The major events in each trimester are "
                    "described below.\n\nThe events that lead to pregnancy begin with conception, in which a sperm penetrates an egg. "
                    "The fertilized egg (called a zygote) then travels through the woman's fallopian tube to the uterus, where it implants "
                    "itself in the uterine wall. The zygote is made up of a cluster of cells that later form the fetus and the placenta. "
                    "The placenta connects the mother to the fetus and provides nutrients and oxygen to the fetus.\n\nBetween 18 and 20 weeks, "
                    "the typical timing for ultrasound to look for birth defects, you can often find out the sex of your baby.\n\nAt 20 weeks, "
                    "a woman may begin to feel movement.\n\nAt 24 weeks, footprints and fingerprints have formed and the fetus sleeps and "
                    "wakes regularly.\n\nAccording to research from the NICHD Neonatal Research Network, the survival rate for babies born at "
                    "28 weeks was 92%, although those born at this time will likely still experience serious health complications, including "
                    "respiratory and neurologic problems.\n\nAt 32 weeks, the bones are soft and yet almost fully formed, and the eyes can "
                    "open and close.\n\nInfants born before 37 weeks are considered preterm. These children are at increased risk for problems "
                    "such as developmental delays, vision and hearing problems, and cerebral palsy. Infants born between 34 and 36 weeks of "
                    "pregnancy are considered to be late preterm.\n\nInfants born in the 37th and 38th weeks of pregnancy—previously considered"
                    " term—are now considered early term. These infants face more health risks than infants who are born at 39 weeks or "
                    "later, which is now considered full term. Infants born at 39 or 40 weeks of pregnancy are considered full term.\n\n"
                    "Full-term infants have better health outcomes than do infants born earlier or, in some cases, later than this period. "
                    "Therefore, if there is no medical reason to deliver earlier, it is best to deliver at or after 39 weeks to give the "
                    "infant's lungs, brain, and liver time to fully develop.\n\nInfants born at 41 weeks through 41 weeks and 6 days are "
                    "considered late term.\n\nInfants who are born at 42 weeks and beyond are considered post term.",
                textAlign: TextAlign.justify,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
