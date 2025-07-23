import 'dart:math';
import 'dart:typed_data';


class Uuid{
  static final byteSize = 13 * 8;
  final ByteData ID = ByteData(14);

  Uuid.generateRandom(){
    for(int i = 0; i < 14 ; i++){
      ID.setInt8(i, Random.secure().nextInt(128));
    }
  }

  Uuid(ByteData ID){
    for(int i = 0; i < 14 ; i++) {
      this.ID.setInt8(i, ID.getInt8(i));
    }
  }


  @override
  int get hashCode => ID.hashCode;


  @override
  bool operator ==(Object other) {
    return ID.hashCode == other.hashCode;
  }

  @override
  String toString() {
    String str = "";
    for(int i = 0; i < 14 ; i++) {
      if(i == 4 || i == 6 || i == 8){
        str += "-";
      }
      str +=  ID.getInt8(i).toRadixString(16).padLeft(2,"0").toUpperCase();
    }
    return str;
  }
  // TODO a toString function that puts the ids as hexadecimal
}


void main() {
  Uuid ID = Uuid.generateRandom();
  print(ID);
}