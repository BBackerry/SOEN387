package domain;

public class DomainObject {
	
	private long id;
	
	
	public DomainObject() {
		super();
	}
	
	public DomainObject(long id) {
		super();
		this.id = id;
	}


	public long getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


}
