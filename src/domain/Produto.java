package domain;

import java.util.Date;
import java.util.UUID;

public class Produto {

	private UUID id;
	private String name;
	private int price;
	private Date date;
	
	public Produto() {
		generateNewId();
	}
	
	public Produto(String name, int price) {
		generateNewId();
		setName(name);
		setPrice(price);
		setDate(new Date());
	}
		
	public UUID getId() {
		return id;
	}

	private void generateNewId() {
		id = UUID.randomUUID();
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}


	
}
