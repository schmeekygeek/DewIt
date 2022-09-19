String getGreeting(){

  DateTime date = DateTime.now();

  if(date.hour >= 6 && date.hour < 12){
    return 'Morning';
  }
  else if(date.hour >= 12 && date.hour < 4){
    return 'Afternoon';
  }
  else {
    return 'Evening';
  }
}
