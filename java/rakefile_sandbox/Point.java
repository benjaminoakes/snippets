/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */

import java.lang.Math;

public class Point {
  private double x, y;

  public double get_x() { return this.x; }
  public void set_x(double x) { this.x = x; }

  public double get_y() { return this.y; }
  public void set_y(double y) { this.y = y; }

  public Point(double x, double y) {
    this.x = x;
    this.y = y;
  }

  public String inspect() {
    return "(" + this.x + ", " + this.y + ")";
  }

  public double distance_to(Point another_point) {
    double x_difference = Math.pow(another_point.get_x() - this.x, 2.0);
    double y_difference = Math.pow(another_point.get_y() - this.y, 2.0);
    double distance = Math.sqrt(x_difference + y_difference);

    return distance;
  }
}

