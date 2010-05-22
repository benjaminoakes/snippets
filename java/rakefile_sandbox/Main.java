/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */

public class Main {
  public static void main(String[] arguments) {
    System.out.println("Hello, world!");

    System.out.println("");

    Point point_1 = new Point(0.0, 12.0);
    System.out.println("point_1: " + point_1.inspect());
    Point point_2 = new Point(0.0, 4.0);
    System.out.println("point_2: " + point_2.inspect());

    System.out.println("point_1.distance_to(point_1): " + point_1.distance_to(point_1));
    System.out.println("point_1.distance_to(point_2): " + point_1.distance_to(point_2));

    System.out.println("");

    Person jane = new Person("Jane", "Doe");
    System.out.println("jane: " + jane.inspect());
    System.out.println("jane.name(): " + jane.name());

    System.out.println("");

    Person ben = new Person("Benjamin", "Oakes");
    System.out.println("ben: " + ben.inspect());
    System.out.println("ben.name(): " + ben.name());
  }
}

