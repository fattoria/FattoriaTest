package com.douglasferreira.infra;

import com.douglasferreira.domain.*;

import java.util.List;
import java.util.Iterator;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

//Singeton clas
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
	
	public static DbConnection getInstance() {
		
		if(instance == null){
			instance = new DbConnection();
		}
		return instance;
	}
	
	public void createObject(Object obj) { 
		
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
	
	public List getAllProducts() {
		
		Session session = factory.openSession();
		Transaction tx = null;
		List products = null;
		
		try {
			tx = session.beginTransaction();
			products = session.createQuery("FROM Product").list();
			tx.commit();				
		}
		catch(HibernateException e)
		{
			if(tx != null) tx.rollback();
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		
		return products;
		
	}
	
	public List getAllObjects(String tableName) {
		
		Session session = factory.openSession();
		Transaction tx = null;
		List products = null;
		
		try {
			tx = session.beginTransaction();
			products = session.createQuery("FROM " + tableName).list();
			tx.commit();				
		}
		catch(HibernateException e)
		{
			if(tx != null) tx.rollback();
			e.printStackTrace();
		}
		finally {
			session.close();
			
		}
		
		return products;
	}
	
	public void updateObject(int id) {
		
		Session session = factory.openSession();
		Transaction tx = null;
			
		try {
			tx = session.beginTransaction();
			Product p = (Product)session.get(Product.class, id);
			session.update(p);
			tx.commit();				
		}
		catch(HibernateException e)
		{
			if(tx != null) tx.rollback();
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		
	}
	
	public void deleteObject(int id) {
		Session session = factory.openSession();
		Transaction tx = null;
			
		try {
			tx = session.beginTransaction();
			Product p = (Product)session.get(Product.class, id);
			session.delete(p);
			tx.commit();				
		}
		catch(HibernateException e)
		{
			if(tx != null) tx.rollback();
			e.printStackTrace();
		}
		finally {
			session.close();
		}
	}
}
