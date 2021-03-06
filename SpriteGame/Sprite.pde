/* Sprite is an abstract class representing something that will move around the screen
 * a Sprite must know it's current position (x, y) and it's velocity vector <dx, dy>
 * by default a Sprite starts with <0, 0> velocity.
 * included in the Sprite class are a few standard methods that are useful--see comments
 */
abstract class Sprite
{
  Vector2 location;
  Vector2 velocity;
  // this Sprite's current location.
  
  // this Sprite's current velocity vector.
  

  // initialize a Sprite at a given coordinate.
  Sprite(float x, float y)
  {
    this.location = new Vector2 (x,y);
    this.velocity = new Vector2 (0,0);
    

    
  }
  
  // initalize a Sprite at a given coordinate with a given velocity.
  Sprite(float x, float y, float dx, float dy)
  {
    
    this.location = new Vector2 (x,y);
    this.velocity = new Vector2 (dx,dy);
    
    
  }
  
  // check to see if this Sprite is sitting on a particular color.
  boolean collidesWith(color c)
  {
    return get((int)location.x,(int)location.y)==c;
  }
  
  // make this Sprite move at the speed := |<dx, dy>| 
  // directly toward another Sprite
  void chase(Sprite other)
  {
    float speed = velocity.magnitude(); 
   // float delX = other.x - this.x;
    //float delY = other.y - this.y; //finding the magnitude of the difference between the 2 coordinates
    
    Vector2 diff = other.location.subtract(this.location);
    float mag = diff.magnitude();
    
    if(diff.x != 0) location.x += (diff.x / mag) * speed;
    if(diff.y != 0) location.y += (diff.y / mag) * speed;
  }
  
  // make this Sprite move at the speed := |<dx, dy>| 
  // directly toward another Sprite while mafloataing
  // a minimum follow distance
  void chase(Sprite other, float minFollowDistance)
  {
    float speed = sqrt(dx*dx + dy*dy);
    float delX = other.x - this.x;
    float delY = other.y - this.y;
    float mag = sqrt(delX*delX + delY*delY);
    
    if(mag > 0 && mag <= minFollowDistance) 
    {
      if(delY < delX)
      {
        x -= (delY / mag) * speed * 0.5;
        y += (delX / mag) * speed * 0.5;
      }
      else
      {
        x += (delY / mag) * speed * 0.5;
        y -= (delX / mag) * speed * 0.5;
      }
      return;
    }
    
    if(delX != 0) x += (delX / mag) * speed;
    if(delY != 0) y += (delY / mag) * speed;
  }
  
  // make this Sprite move at the speed := |<dx, dy>|
  // directly toward your mouse pofloater!
  void followMouse()
  {
    float speed = sqrt(dx*dx + dy*dy);
    float delX = mouseX - this.x;
    float delY = mouseY - this.y;
    float mag = sqrt(delX*delX + delY*delY);
    
    if(delX != 0) x += (delX / mag) * speed;
    if(delY != 0) y += (delY / mag) * speed;
  }
  
  // move this sprite according to it's current velocity vector
  // bounces off the walls
  void move()
  {
    this.location = this.location.add (this.velocity);

    
    // make sure we don't go out of bounds
    if(this.location.x < 0)
    { 
      this.location.x  += width;
    }
    if(this.location.x  > width) 
    {
      this.location.x  -= width;
    }
    if(this.location.y  < 0) 
    {
      this.location.y  += height;
    }
    if(this.location.y  > height)
    {
      this.location.y  -= height;
    }
  }
  
  // get the distance between centers of this Sprite and another
  float distanceTo(Sprite other)
  {
    float delX = this.location.x  - this.location.x ;
    float delY = this.location.y  - this.location.y ;
    return sqrt(delX*delX + delY*delY);
  }
  
  // Control this sprite using the Arrow Keys
  void keyboardControl()
  {
    // If I hit the LEFT arrow, go Left
    if(keyCode == LEFT)
    {
      dx = -1;
      dy = 0;
    }
    // if I hit the RIGHT arrow, go Right
    else if(keyCode == RIGHT)
    {
      dx = 1;
      dy = 0;
    }
    // if I hit the UP arrow, go Up
    if(keyCode == UP)
    {
      dy = -1;
      dx = 0;
    }
    // if I hit the DOWN arrow, go Down
    else if(keyCode == DOWN)
    {
      dy = 1;
      dx = 0;
    }
    // if I hit the Space Bar, Stop
    if(keyCode == ' ')
    {
      velocity = 0;
      velocity = 0;
    }
    
    // move x and y in the appropriate way
    x = x + dx;
    y = y + dy;
    
    // make sure we don't go out of bounds
    if(x < 0) x += width;
    if(x > width) x -= width;
    if(y < 0) y += height;
    if(y > height) y -= height;
  }
  
  // a Sprite itself is abstract and does not actually know
  // what it looks like.  This method must be overriden in 
  // any classes which /are/ Sprites.
  abstract void drawSprite();
}
