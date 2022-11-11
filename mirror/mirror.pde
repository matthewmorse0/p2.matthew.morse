PImage img;

int genX = 150;
int genY = 25;
int genWidth = 200;
int genHeight = 250;
int genLabelX = genX-95;
int genLabelY = genY+11;

int healthX = 450;
int healthY = 25;
int healthWidth = 200;
int healthHeight = 250;
int healthLabelX = healthX-95;
int healthLabelY = healthY+11;

int totalLabelX = healthX-95;
int totalLabelY = healthY+40;

int totalSleep = 0;
int deepSleep = 0;
int lightSleep = totalSleep - deepSleep;

int totSleep1 = 0;
int totSleep2 = 0;
int totSleep3 = 0;
int totSleep4 = 0;
int totSleep5 = 0;
int totSleep6 = 0;

String[] newsData;
String[] weatherData;
String[] weatherString;
String[] calendarData;

//Possible values = [Calendar, News, Messages, Social, Clock, Weather]
String genTab = "Calendar";
String date = "1/1/2000";
String time = "00:00:00";

void setup() {
  String[] sleepString = loadStrings("sleep_data.txt");
  String[] sleepData = split(sleepString[0], ',');
  totSleep1 = int(sleepData[0]);
  totSleep2 = int(sleepData[1]);
  totSleep3 = int(sleepData[2]);
  totSleep4 = int(sleepData[3]);
  totSleep5 = int(sleepData[4]);
  totSleep6 = int(sleepData[5]);
  totalSleep = int(sleepData[6]);
  deepSleep = int(sleepData[7]);
  lightSleep = totalSleep - deepSleep;
  
  String[] newsString = loadStrings("news.txt");
  newsData = split(newsString[0], ',');
  weatherString = loadStrings("weather.txt");
  String[] calendarString = loadStrings("calendar.txt");
  calendarData = split(calendarString[0], ',');
  
  rectMode(CENTER);
  imageMode(CENTER);
  size(700, 900);
  background(#678ca3);
  fill(#63888d);
  img = loadImage("dwayne.png");
  image(img, 350, 450, 700, 900);
  //Gen window
  rect(genX, genY+125, genWidth, genHeight);
  rect(genX, genY, genWidth, genHeight/6);
  fill(255);
  textSize(35);
  text(genTab, genLabelX, genLabelY);
  fill(#63888d);
  //Selection tabs
  rect(genX-82, genY+229, genWidth/6, genHeight/6);
  img = loadImage("calendar.png");
  image(img, genX-82, genY+229, genWidth/6, genHeight/6);
  date = str(month()) + "/" + str(day()) + "/" + str(year());
  fill(255);
  textSize(30);
  text(date, genX-96, genY+50);
  textSize(20);
  for (int i = 0; i < calendarData.length; i = i+1){
    text(calendarData[i], genX-96, genY+80+i*25);
  }
  fill(#63888d);
  rect(genX-49, genY+230, genWidth/6, genHeight/6);
  img = loadImage("news.png");
  image(img, genX-49, genY+230, genWidth/6, genHeight/6);
  rect(genX-16, genY+230, genWidth/6, genHeight/6);
  img = loadImage("texting.png");
  image(img, genX-16, genY+230, genWidth/5, genHeight/5);
  rect(genX+17, genY+230, genWidth/6, genHeight/6);
  img = loadImage("twitter.png");
  image(img, genX+17, genY+230, genWidth/6, genHeight/6);
  rect(genX+50, genY+230, genWidth/6, genHeight/6);
  img = loadImage("clock.png");
  image(img, genX+50, genY+230, genWidth/7, genHeight/7);
  rect(genX+83, genY+230, genWidth/6, genHeight/6);
  img = loadImage("weather.png");
  image(img, genX+83, genY+230, genWidth/6, genHeight/6);
  
  
  //Health window
  rect(healthX, healthY+125, healthWidth, healthHeight);
  rect(healthX, healthY, healthWidth, healthHeight/6);
  fill(255);
  textSize(35);
  text("Sleep", healthLabelX, healthLabelY);
  textSize(18);
  text("Total Hours:", totalLabelX, totalLabelY);
  text(totalSleep, totalLabelX+92, totalLabelY);
  text("Light:", totalLabelX, totalLabelY+15);
  text(lightSleep, totalLabelX+45, totalLabelY+15);
  text("Deep:", totalLabelX, totalLabelY+30);
  text(deepSleep, totalLabelX+45, totalLabelY+30);
  //Sleep Graph
  fill(0,0,0);
  line(healthX-90, healthY+230, healthX+90, healthY+230);
  line(healthX-75, healthY+245, healthX-75, healthY+80);
  textSize(12);
  text("Hrs\n10\n9\n8\n7\n6\n5\n4", healthX-93, healthY+85);
  text("SUN MON TUE WED THU FRI SAT", healthX-70, healthY+245);
  circle(healthX-60, healthY+225-(totSleep1-4)*20, 4);
  line(healthX-60, healthY+225-(totSleep1-4)*20, healthX-35, healthY+225-(totSleep2-4)*20);
  circle(healthX-35, healthY+225-(totSleep2-4)*20, 4);
  line(healthX-35, healthY+225-(totSleep2-4)*20, healthX-10, healthY+225-(totSleep3-4)*20);
  circle(healthX-10, healthY+225-(totSleep3-4)*20, 4);
  line(healthX-10, healthY+225-(totSleep3-4)*20, healthX+15, healthY+225-(totSleep4-4)*20);
  circle(healthX+15, healthY+225-(totSleep4-4)*20, 4);
  line(healthX+15, healthY+225-(totSleep4-4)*20, healthX+40, healthY+225-(totSleep5-4)*20);
  circle(healthX+40, healthY+225-(totSleep5-4)*20, 4);
  line(healthX+40, healthY+225-(totSleep5-4)*20, healthX+60, healthY+225-(totSleep6-4)*20);
  circle(healthX+60, healthY+225-(totSleep6-4)*20, 4);
  line(healthX+60, healthY+225-(totSleep6-4)*20, healthX+80, healthY+225-(totalSleep-4)*20);
  circle(healthX+80, healthY+225-(totalSleep-4)*20, 4);
  
}

void draw() {
  if (genTab == "Clock"){
    redraw();
  }
  if (mousePressed) {
    //Move windows
    if (mouseX < genX + genWidth/2 & mouseX > genX - genWidth/2 & mouseY < genY + genHeight/12 & mouseY > genY - genHeight/12) {
      genX = mouseX;
      genY = mouseY;
      genLabelX = genX-95;
      genLabelY = genY+11;
    }else if (mouseX < healthX + healthWidth/2 & mouseX > healthX - healthWidth/2 & mouseY < healthY + healthHeight/12 & mouseY > healthY - healthHeight/12) {
      healthX = mouseX;
      healthY = mouseY;
      healthLabelX = healthX - 95;
      healthLabelY = healthY + 11;
      
      totalLabelX = healthX-95;
      totalLabelY = healthY+40;
    }else
    //Choose new gen tab
    if (mouseX < genX-82 + genWidth/12 & mouseX > genX-82 - genWidth/12 & mouseY < genY + 229 + genHeight/12 & mouseY > genY + 229 - genHeight/12) {
      genTab = "Calendar";
    }else
    if (mouseX < genX-49 + genWidth/12 & mouseX > genX-49 - genWidth/12 & mouseY < genY + 229 + genHeight/12 & mouseY > genY + 229 - genHeight/12) {
      genTab = "News";
    }else
    if (mouseX < genX-16 + genWidth/12 & mouseX > genX-16 - genWidth/12 & mouseY < genY + 229 + genHeight/12 & mouseY > genY + 229 - genHeight/12) {
      genTab = "Messages";
    }else
    if (mouseX < genX+17 + genWidth/12 & mouseX > genX+17 - genWidth/12 & mouseY < genY + 229 + genHeight/12 & mouseY > genY + 229 - genHeight/12) {
      genTab = "Social";
    }else
    if (mouseX < genX+50 + genWidth/12 & mouseX > genX+50 - genWidth/12 & mouseY < genY + 229 + genHeight/12 & mouseY > genY + 229 - genHeight/12) {
      genTab = "Clock";
    }else
    if (mouseX < genX+83 + genWidth/12 & mouseX > genX+83 - genWidth/12 & mouseY < genY + 229 + genHeight/12 & mouseY > genY + 229 - genHeight/12) {
      genTab = "Weather";
    }
    //Overlapping windows
    if (genX == healthX & genY == healthY){
      genX = 150;
      genY = 25;
      genLabelX = genX-95;
      genLabelY = genY+11;
    }
    redraw();
  }
}

void redraw(){
  img = loadImage("dwayne.png");
  image(img, 350, 450, 700, 900);
  fill(#63888d);
  //Gen window
  rect(genX, genY+125, genWidth, genHeight);
  rect(genX, genY, genWidth, genHeight/6);
  fill(255);
  textSize(35);
  text(genTab, genLabelX, genLabelY);
  fill(#63888d);
  //Selection tabs
  rect(genX-82, genY+230, genWidth/6, genHeight/6);
  img = loadImage("calendar.png");
  image(img, genX-82, genY+230, genWidth/6, genHeight/6);
  rect(genX-49, genY+230, genWidth/6, genHeight/6);
  img = loadImage("news.png");
  image(img, genX-49, genY+230, genWidth/6, genHeight/6);
  rect(genX-16, genY+230, genWidth/6, genHeight/6);
  img = loadImage("texting.png");
  image(img, genX-16, genY+230, genWidth/5, genHeight/5);
  rect(genX+17, genY+230, genWidth/6, genHeight/6);
  img = loadImage("twitter.png");
  image(img, genX+17, genY+230, genWidth/6, genHeight/6);
  rect(genX+50, genY+230, genWidth/6, genHeight/6);
  img = loadImage("clock.png");
  image(img, genX+50, genY+230, genWidth/7, genHeight/7);
  rect(genX+83, genY+230, genWidth/6, genHeight/6);
  img = loadImage("weather.png");
  image(img, genX+83, genY+230, genWidth/6, genHeight/6);
  if (genTab == "Calendar"){
    rect(genX-82, genY+229, genWidth/6, genHeight/6);
    img = loadImage("calendar.png");
    image(img, genX-82, genY+229, genWidth/6, genHeight/6);
    date = str(month()) + "/" + str(day()) + "/" + str(year());
    fill(255);
    textSize(30);
    text(date, genX-96, genY+50);
    textSize(20);
    for (int i = 0; i < calendarData.length; i = i+1){
      text(calendarData[i], genX-96, genY+80+i*25);
    }
    fill(#63888d);
  }else if (genTab == "News"){
    rect(genX-49, genY+229, genWidth/6, genHeight/6);
    img = loadImage("news.png");
    image(img, genX-49, genY+229, genWidth/6, genHeight/6);
    fill(255);
    textSize(30);
    text("Top Stories", genX-96, genY+50);
    textSize(15);
    for (int i = 0; i < newsData.length; i = i+1){
      text(newsData[i], genX-96, genY+70+i*20);
    }
    fill(#63888d);
  }else if (genTab == "Messages"){
    rect(genX-16, genY+229, genWidth/6, genHeight/6);
    img = loadImage("texting.png");
    image(img, genX-16, genY+229, genWidth/5, genHeight/5);
    fill(255);
    textSize(20);
    text("* Joe - Wassup", genX-96, genY+40);
    text("Jim - 0 New Messages", genX-96, genY+70);
    text("Jill - 0 New Messages", genX-96, genY+100);
    text("Tod - 0 New Messages", genX-96, genY+130);
    fill(#63888d);
  }else if (genTab == "Social"){
    rect(genX+17, genY+229, genWidth/6, genHeight/6);
    img = loadImage("twitter.png");
    image(img, genX+17, genY+229, genWidth/6, genHeight/6);
    fill(255);
    textSize(18);
    text("James liked your post", genX-96, genY+40);
    text("Timmy liked your post", genX-96, genY+70);
    text("Friend request from Bob", genX-96, genY+100);
    text("Henry liked your post", genX-96, genY+130);
    fill(#63888d);
  }else if (genTab == "Clock"){
    rect(genX+50, genY+229, genWidth/6, genHeight/6);
    img = loadImage("clock.png");
    image(img, genX+50, genY+229, genWidth/7, genHeight/7);
    time = str(hour()) + ":" + str(minute()) + ":" + str(second());
    fill(255);
    textSize(55);
    text(time, genX-96, genY+120);
    fill(#63888d);
  }else if (genTab == "Weather"){
    rect(genX+83, genY+229, genWidth/6, genHeight/6);
    img = loadImage("weather.png");
    image(img, genX+83, genY+229, genWidth/6, genHeight/6);
    fill(255);
    textSize(25);
    text("Day  Low  High", genX-96, genY+50);
    textSize(15);
    for (int i = 0; i < weatherString.length; i = i+1){
      weatherData = split(weatherString[i], ',');
      if (i == 0){
        weatherData[1] = weatherData[1] + "'F";
      }
      text(weatherData[0], genX-96, genY+70+i*20);
      text(weatherData[1], genX-30, genY+70+i*20);
      text(weatherData[2], genX+25, genY+70+i*20);
      img = loadImage("sunny.png");
      if (weatherData[3].equals("Cloudy")){
        img = loadImage("cloudy.png");
      }else if (weatherData[3].equals("Partly")){
        img = loadImage("partly.png");
      }
      image(img, genX+70, genY+65+i*20, 15, 15);
    }
    fill(#63888d);
  }
  
  
  
  //Health window
  rect(healthX, healthY+125, healthWidth, healthHeight);
  rect(healthX, healthY, healthWidth, healthHeight/6);
  fill(255);
  textSize(35);
  text("Sleep", healthLabelX, healthLabelY);
  textSize(18);
  text("Total Hours:", totalLabelX, totalLabelY);
  text(totalSleep, totalLabelX+92, totalLabelY);
  text("Light:", totalLabelX, totalLabelY+15);
  text(lightSleep, totalLabelX+45, totalLabelY+15);
  text("Deep:", totalLabelX, totalLabelY+30);
  text(deepSleep, totalLabelX+45, totalLabelY+30);
  //Sleep Graph
  fill(0,0,0);
  line(healthX-90, healthY+230, healthX+90, healthY+230);
  line(healthX-75, healthY+245, healthX-75, healthY+80);
  textSize(12);
  text("Hrs\n10\n9\n8\n7\n6\n5\n4", healthX-93, healthY+85);
  text("SUN MON TUE WED THU FRI SAT", healthX-70, healthY+245);
  circle(healthX-60, healthY+225-(totSleep1-4)*20, 4);
  line(healthX-60, healthY+225-(totSleep1-4)*20, healthX-35, healthY+225-(totSleep2-4)*20);
  circle(healthX-35, healthY+225-(totSleep2-4)*20, 4);
  line(healthX-35, healthY+225-(totSleep2-4)*20, healthX-10, healthY+225-(totSleep3-4)*20);
  circle(healthX-10, healthY+225-(totSleep3-4)*20, 4);
  line(healthX-10, healthY+225-(totSleep3-4)*20, healthX+15, healthY+225-(totSleep4-4)*20);
  circle(healthX+15, healthY+225-(totSleep4-4)*20, 4);
  line(healthX+15, healthY+225-(totSleep4-4)*20, healthX+40, healthY+225-(totSleep5-4)*20);
  circle(healthX+40, healthY+225-(totSleep5-4)*20, 4);
  line(healthX+40, healthY+225-(totSleep5-4)*20, healthX+60, healthY+225-(totSleep6-4)*20);
  circle(healthX+60, healthY+225-(totSleep6-4)*20, 4);
  line(healthX+60, healthY+225-(totSleep6-4)*20, healthX+80, healthY+225-(totalSleep-4)*20);
  circle(healthX+80, healthY+225-(totalSleep-4)*20, 4);
  
}
