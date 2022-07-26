package tiger.api.test.data;


import java.text.SimpleDateFormat;
import java.util.Date;

import com.github.javafaker.Faker;

public class DataGenerator {
	// this is to get fake email
	public static String getEmail() {
		Faker faker = new Faker();
		return faker.name().firstName() + faker.name().lastName() + "@gmail.com";

	}
	// this is to get fake phone number
	public static String getPhoneNumber() {
		Faker faker = new Faker();
		return faker.phoneNumber().cellPhone();

	}

	public static String getFirstName() {
		Faker faker = new Faker();
		return faker.name().firstName();

	}

	public static String getLastName() {
		Faker faker = new Faker();
		return faker.name().lastName();}

	public static String getDob() {
		Faker faker = new Faker();
		Date date = faker.date().birthday();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		return format.format(date);
	}
}
