class Vector2
{
 float x; // implementation of the properties in this calss
 float y; //coordinates of this Vector2. You can also do x and y on the same line.
 
 Vector2 (float x, float y) //implementation of the instructor
 {
   this.x=x;
   this.y=y; //means this is the key word for self reference (this object refering to itself)
 }//done with this context do you go back to Vecor2 in the last line. Return means take me back to the context I came from 
 
 Vector2 add(Vector2 other) //name and perimeter. This is called the mthod header. It has 3 parts
 //return type. Add is a name. (Vector2 other) is pararmeters 
 //implementation of the add
{
 
   return new Vector2(this.x + other.x,this.y + other.y); //adding a new Vector
   // Vector 2 is the type that comes from the return statement
  
 }
 
 Double magnitude()
 {
   Double mag = Math.sqrt((this.x * this.x)+(this.y * this.y)) //this is the pythag. th'm
   return mag;  
 }
 Vector2 subtract (Vector2 other) 
 
 {
 
}
 
 Float doProduct(Vector2 other) 
 {
   float prod = this.x -other.x -this.y -other.y;
  return prod;
 }
 
}
