package env;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class EnvironmentManager {
    private static Properties apiProperties = loadProperties("src/test/java/env/API.env");
    private static Properties dbProperties = loadProperties("src/test/java/env/DB.env");

    private static Properties loadProperties(String envFilePath) {
        Properties properties = new Properties();
        try {
            properties.load(new FileInputStream(envFilePath));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return properties;
    }

    public static String getAPIValue(String key) {
        return apiProperties.getProperty(key);
    }

    public static String getDBValue(String key) {
        return dbProperties.getProperty(key);
    }
}

