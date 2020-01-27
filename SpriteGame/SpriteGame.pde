
// this is your player, they're a blob and they're kinda boring.
Blob player;
Blob other; //creating another blob

void setup()
{
  size(500, 500);
  
  // Blob parameters are: 
  // x (px), y (px), radius (px), 
  // x-speed (px/frame), y-speed (px/frame), and color.
  player = new Blob(100, 100, 50, 1.25, 1.5, color(150, 0, 255));
  other = new Blob( 400, 200, 10, 10,2, color(128,0,200)); // this is the 2nd blob (we made another one), but you won't be able to see the other 
  //50 - size, 1.25 - speed,[ (150,0,255) (red, green blue)] -color
}

void draw()
{
  background(255,255,255);
  
  // make the player move automatically.
  player.move();
  
  // draw the player on the screen.
  player.drawSprite();
}
