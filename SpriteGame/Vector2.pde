class Vector2
{
 float x;
 float y; //coordinates of this Vector2. You can also do x and y on the same line.
 
 Vector2 (float x, float y)
 {
   this.x=x;
   this.y=y; //means this is the key word for self reference (this object refering to itself)
 }
 
 Vector2 add(Vector2 other) //name and perimeter
 
{
 
   return new Vector2(this.x + other.x,this.y + other.y); //adding a new Vector
 }
}
