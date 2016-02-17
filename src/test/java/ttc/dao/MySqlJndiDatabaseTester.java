package ttc.dao;

import org.dbunit.database.IDatabaseConnection;
import org.dbunit.database.DatabaseConfig;
import org.dbunit.ext.mysql.MySqlMetadataHandler;
import org.dbunit.ext.mysql.MySqlDataTypeFactory;


public class MySqlJndiDatabaseTester extends org.dbunit.JndiDatabaseTester {
  public MySqlJndiDatabaseTester(String driverClass) throws ClassNotFoundException {
    super(driverClass);
  }

  @Override
  public IDatabaseConnection getConnection() throws Exception {
    IDatabaseConnection connection = super.getConnection();
    DatabaseConfig dbConfig = connection.getConfig();
    dbConfig.setProperty(DatabaseConfig.PROPERTY_DATATYPE_FACTORY, new MySqlDataTypeFactory());
    dbConfig.setProperty(DatabaseConfig.PROPERTY_METADATA_HANDLER, new MySqlMetadataHandler());
    return connection;
  }
}
