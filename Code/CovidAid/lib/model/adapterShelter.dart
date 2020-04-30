import 'package:CovidAid/model/shelter_info.dart';

List<Shelter_Info> getShelter(){

  List<Shelter_Info> shelter = new List<Shelter_Info>();
  Shelter_Info shelter_infoModel = new Shelter_Info();

  //1
  shelter_infoModel.location = "Kolkata";
  shelter_infoModel.id = 1;
  shelter_infoModel.image = "assets/cough.png";
  shelter.add(shelter_infoModel);

  shelter_infoModel = new Shelter_Info();

  //2
  shelter_infoModel.location = "Bhubaneshwar";
  shelter_infoModel.id = 2;
  shelter_infoModel.image = "assets/virus.png";
  shelter.add(shelter_infoModel);

  shelter_infoModel = new Shelter_Info();

  //3
  shelter_infoModel.location = "Nagpur";
  shelter_infoModel.id = 3;
  shelter_infoModel.image = "assets/heart.png";
  shelter.add(shelter_infoModel);

  shelter_infoModel = new Shelter_Info();

  return shelter;
}