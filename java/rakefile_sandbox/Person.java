/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */

public class Person {
  public String first_name, last_name;

  public Person(String first_name, String last_name) {
    this.first_name = first_name;
    this.last_name = last_name;
  }

	public String inspect() {
	  return this.name();
	}

  public String name() {
		return this.first_name + ' ' + this.last_name;
  }
}

