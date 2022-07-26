package tiger.api.test.runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
	
	@Karate.Test
	public Karate runTest() {
		// classpath is the location to your feature files.
		// if this path is wrong, you won't be able to run anything.
		// tag is to specify what tag to execute with this runner.
		return Karate.run("classpath:features")
				.tags("Smoke");
		
	}

}
