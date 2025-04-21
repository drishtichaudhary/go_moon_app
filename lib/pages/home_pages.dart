import 'package:flutter/material.dart';
import 'package:go_moon/widgets/custom_dropdown_button.dart';

class HomePage extends StatelessWidget{
  late double _deviceHeight, _deviceWidth;
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
            child: Container(
                height: _deviceHeight,
                width: _deviceWidth,
                padding: EdgeInsets.symmetric(horizontal: _deviceWidth*0.05),
                child: Stack(children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _pageTitle(),
                        _bookRide(),
                        _rideButton()
                      ]
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: _astroImageWidget(),
                  )
                ],
                ),
            ),
        ),
    );
  }

  Widget _pageTitle(){
    return const Text("#GoMoon",
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 70),
    );
  }

  Widget _astroImageWidget(){
    return Container(
      height: _deviceHeight*0.5,
      width: _deviceWidth*0.65,
      decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/astro_moon.png"),
          )
      ),
    );
  }

  Widget _bookRide(){
    return Container(
      height: _deviceHeight*0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _destinationDropDownWidget(),
          _travellersInformation()
        ],
      ),
    );
  }

  Widget _destinationDropDownWidget(){
    return CustomDropDownButton(
      values: const ['ISRO Station', 'Preneure'],
      width: _deviceWidth,
    );
  }

  Widget _travellersInformation(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomDropDownButton(
        values: const ['1', '2', '3', '4'],
        width: _deviceWidth*0.45,
        ),
        CustomDropDownButton(
          values: const ['Economy', 'Business', 'First Class', 'Private'],
          width: _deviceWidth*0.40,
        )
      ],
    );
  }

  Widget _rideButton(){
    return Container(
      margin: EdgeInsets.only(bottom: _deviceHeight*0.01),
      width: _deviceWidth,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
          onPressed: () {},
          child: const Text(
            "Book Ride",
            style: TextStyle(color: Colors.black),),
      )
    );
  }
}