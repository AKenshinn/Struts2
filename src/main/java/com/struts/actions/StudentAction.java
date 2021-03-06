package com.struts.actions;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import com.opensymphony.xwork2.ActionSupport;
import com.struts.entities.Student;


@SuppressWarnings({"serial", "unchecked"})
@Namespace("/")
@ResultPath("/")
@InterceptorRef(value = "loggingStack")
public class StudentAction extends ActionSupport {
	
	private SessionFactory sessionFactory;
	
	private Student student = new Student();
	
	private List<Student> students = new ArrayList<Student>();
	
	public SessionFactory getSessionFactory() {
    Configuration configuration = new Configuration().configure();
    ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
    sessionFactory = configuration.configure().buildSessionFactory(serviceRegistry);
    
    return sessionFactory;
    
  }

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}
	
	@Action(value = "save", results = {
	    @Result(name = "input", location = "/student.jsp"),
	    @Result(name = "success", type = "redirectAction", location = "student")
	})
  public String createOrUpdate() {
    Session session = getSessionFactory().openSession();
    session.getTransaction().begin();
  	session.saveOrUpdate(this.student);
    session.getTransaction().commit();
    session.close();

    return SUCCESS;
    
  }
	
	@Action(value = "delete", results = {
			@Result(name = "input", location = "/student.jsp"),
			@Result(name = "success", location = "student", type = "redirectAction")
  })
  public String delete() {
    Session session = getSessionFactory().openSession();
    session.getTransaction().begin();
    Student result = (Student) session.get(Student.class, this.getStudent().getId());
    session.delete(result);
    session.getTransaction().commit();
    session.close();

    return "success";
    
  }
	
	public void findAll() {
    Session session = getSessionFactory().openSession();
    this.students = session.createQuery("FROM Student").list();
    session.close();
    
  }
	
	@Action(value = "student", results = {
			@Result(name = "success", type="tiles", location = "/student.tiles")
  })
  public String execute() {
		this.findAll();
    return SUCCESS;
  }

}
