import java.util.*;

class ScoreHandler{
 class Score implements Comparable<Score>{
  String name;
  int score;
  
  public int compareTo(Score o){
    return o.score - score;
  }
 }
  
ArrayList<Score> scores = new ArrayList<Score>();
  
 ScoreHandler(){
   
 }
 
 void addScore(String name, int points){
   Score score = new Score();
   score.name = name;
   score.score = points;
   scores.add(score);
 }
 
 void saveScores(String fileName){
   
   String lines[] = new String[scores.size()];
   int c = 0;
   for(Score score : scores){
       lines[c] = score.name + ";" + Integer.toString(score.score);
       c++;
   }
   saveStrings(fileName, lines);
 }
 
 void loadScores(String fileName){
   try{
     String lines[] = loadStrings(fileName);
     for (int i = 0 ; i < lines.length; i++) {
        String[] list = split(lines[i], ";");
        Score score = new Score();
        score.name = list[0];
        score.score = int(list[1]);
        scores.add(score);
     }
     Collections.sort(scores);
   }
   catch(Exception e){
     println("There was a problem loading the scores.");
   }
 }
 
 String getScoreString(){
   
   String lines = "";
   int c = 0;
   for(Score score : scores){
      lines += Integer.toString(score.score) + ", " + score.name + "\n";
      c++;
   }
   return lines;
 }
}