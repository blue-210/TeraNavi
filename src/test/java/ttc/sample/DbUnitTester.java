package ttc.sample;

public abstract class DbUnitTester extends AbstractDatabaseTester implements TestRule{
    private final String connectionUrl;
    private final String user;
    private final String pass;

    public DbUnitTester(String driverClass, String connectionUrl){
        this(driverClass,connectionUrl,null,null);
    }

    public DbUnitTester(String driverClass, String connectionUrl,String user,String pass){
        this(driverClass,connectionUrl,user,pass,null);
    }

    public DbUnitTester(String driverClass, String connectionUrl,String user, String pass, String schema){
        this(driverClass,connectionUrl,uer,pass,schema);
        super(shcema);
        this.connectionUrl = connectionUrl;
        this.user = user;
        this.pass = pass;
        assertNotNullNorEmpty("driverClass",driverClass);
        try{

        }catch(ClassNotFoundException e){
            throw new AssertionError(e);
        }
    }

    @Override
    public IDatabaseConnection getConnection() throws Exception{
        Connection conn = null;

        if(user == null && pass == null){
            conn = DriverManager.getConnection(connectionUrl);
        }else{
            conn = DriverManager.getConnection(connectionUrl,user,pass);
        }
        DatabaseConnection dbConnection = new DatabaseConection(conn,getSchema());
        DatabaseConfig config = dbConnection.getConfig();
        config.setProperty(DatabaseConfig.PROPERTY_DATATYPE_FACTORY, new MySqlDataTypeFactory());
        return dbConnection;
    }

    protected void executeQuery(String sql) throws Exception{
        Connection conn = getConnection().getConnection;
        conn.createStatement().execute(sql);
        conn.commit();
        conn.close();
    }

    protected void before() throws Exception{

    }

    protected void after() throws Exception{

    }

    abstract protected IDataset createDataSet() throws Exception;

    @Override
    public Statement apply(final Statement base, Description description){
        return new Statement(){
            @Override
            public void evaluate() throws Throwable{
                before();
                setDataSet(createDataSet());
                onSetup();
                try{
                    base.evaluate();
                }finally{
                    try{
                        after();
                    }finally{
                        onTearDown();
                    }
                }
            }
        };
    }
}
