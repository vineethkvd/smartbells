class hourlyba {
  int hour;
  bool status=false;
  int id=0;
 


  hourlyba({
    required this.hour,
    required this.id



  });
}
class flowlist {
  List<hourlyba> morningcount;
  List<hourlyba> afternooncount;
  List<hourlyba> nightcountho;
  List<bool> status1=[];
  int id;



  flowlist({
   required this.morningcount,
    required this.afternooncount,
    required this.nightcountho,
    required this.id


  });
}
