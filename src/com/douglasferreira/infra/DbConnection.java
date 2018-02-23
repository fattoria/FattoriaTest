package com.douglasferreira.infra;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public final class DbConnection {
	
	public static SessionFactory factory; 
	private static DbConnection instance;
		
	private DbConnection() {
		
		try {
			factory = new Configuration().configure("/com/douglasferreira/infra/hibernate.cfg.xml").buildSessionFactory();
		}
		catch(Throwable ex){
			throw new ExceptionInInitializerError(ex);
		}
		
	}
	
	public static DbConnection GetInstance() {
		
		if(instance == null){
			instance = new DbConnection();
		}
		return instance;
	}
	
	public void CreateObject(Object obj) { 
		
		Session session = factory.openSession();
		Transaction tx = null;
		
		try {
			tx = session.beginTransaction();
			session.save(obj);
			tx.commit();
		}
		catch (HibernateException e) {
			if(tx != null) tx.rollback();
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		
	}
	
	public void GetAllObjects() {
		
	}
	
	public void GetObject() {
		
	}
	
	public void UpdateObject() {
		
	}
	
	public void DeleteObject() {
		
	}
	
}
