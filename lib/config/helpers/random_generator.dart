import 'package:random_name_generator/random_name_generator.dart';



class RandomGenerator {

  static String getRandomName() {
    final randomNames = RandomNames(Zone.spain);
    return randomNames.fullName();
  }

  static Stream<String> randomNamesStream() {
    
    return Stream.periodic(
      const Duration(seconds: 2),
      ( i ) {
        print('Stream new value');
        return getRandomName();
      }
    );

  }


}
