import 'package:flutter/material.dart';
import '../../blocs/autocomplete/autocomplete_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';

class LocationSeachBox extends StatelessWidget {
  const LocationSeachBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<AutocompleteBloc, AutocompleteState>(
    //   builder: (context, state) {
    //     print('{$state} haha');
    //     if(state is AutocompleteLoading){
    //       return SizedBox();
    //     }
    //     if(state is AutocompleteLoaded){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter Your Location',
                suffixIcon: Icon(Icons.search),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) async {
                List<Location> locations=await locationFromAddress('2 Thanh Sơn Đà Nẵng');

                context
                    .read<AutocompleteBloc>()
                    .add(LoadAutocomplete(searchInput: value));

                print('${locations} azz');
              },
            ),
          );
    //     }else{
    //       return Text('Something went wrong');
    //     }
    //   },
    // );
  }
}