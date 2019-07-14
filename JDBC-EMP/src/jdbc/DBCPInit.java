package jdbc;

import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

public class DBCPInit extends HttpServlet {

	@Override
	public void init() throws ServletException {
		loadJDBCDriver();
		initConnectionPool();
	}

	private void loadJDBCDriver() {
		try {
			// Ŀ�ؼ� Ǯ�� ���ο��� ����� jdbc ����̹��� �ε���.
			Class.forName("com.mysql.jdbc.Driver");
			//Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Oracle �����ͺ��̽� ����̹� �ε� ����....!!!!!!");
		} catch (ClassNotFoundException ex) {
			throw new RuntimeException("fail to load JDBC Driver", ex);
		}
	}
	
	private void initConnectionPool() {
		
		try {
			
			String jdbcDriver = "jdbc:oracle:thin:localhost:1521:orcl";
			String username = "scott";
			String pw = "tiger";
			
			//Ŀ�ؼ�Ǯ�� ���ο� Ŀ�ؼ��� ������ �� ����� Ŀ�ؼ����丮�� ����.
			ConnectionFactory connFactory = new DriverManagerConnectionFactory(jdbcDriver, username, pw);
			
			// PoolableConnection�� �����ϴ� ���丮 ����.
			// DBCP�� Ŀ�ؼ��� ������ �� PoolableConnection �� ���
			// ���� Ŀ�ؼ��� ��� ��������, Ŀ�ؼ� Ǯ�� �����ϴµ� �ʿ��� ����� �����Ѵ�.
			// Ŀ�ؼ��� close�ϸ� �������� �ʰ� Ŀ�ؼ� Ǯ�� ��ȯ
			PoolableConnectionFactory poolableConnFactory = new PoolableConnectionFactory(connFactory, null);
			
			//Ŀ�ؼ��� ��ȿ���� ���θ� �˻��� �� ����ϴ� ������ �����Ѵ�.
			poolableConnFactory.setValidationQuery("select 1");
			
			//Ŀ�ؼ� Ǯ�� ���� ������ �����Ѵ�.
			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			
			//���� Ŀ�ؼ� �˻� �ֱ�
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
			
			//Ǯ�� �������� Ŀ�ؼ��� ��ȿ���� �˻����� ���� ����
			poolConfig.setTestWhileIdle(true);
			
			//Ŀ�ؼ� �ּ� ����
			poolConfig.setMinIdle(4);
			
			//Ŀ�ؼ� �ִ� ����
			poolConfig.setMaxTotal(50);
			
			//Ŀ�ؼ� Ǯ�� ����. �����ڴ� PoolabeConnectionFactory�� GenericObjectPoolConfig�� ���
			GenericObjectPool<PoolableConnection> connectionPool =
			new GenericObjectPool<>(poolableConnFactory, poolConfig);
			
			//PoolabeConnectionFactory���� Ŀ�ؼ� Ǯ�� ����
			poolableConnFactory.setPool(connectionPool);
			
			//Ŀ�ؼ� Ǯ�� �����ϴ� jdbc ����̹��� ���.
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			
		
			//������ Ŀ�ؼ� Ǯ ����̹��� ������ Ŀ�ؼ� Ǯ�� ����Ѵ�. �̸��� chap14 �̴�.
			driver.registerPool("pool", connectionPool);
			System.out.println("Ŀ�ؼ� Ǯ ���!!!!!");
			
		} catch (Exception e) {
			  throw new RuntimeException(e);
		}
	}
}
