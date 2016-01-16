package com.struts.actions;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

@SuppressWarnings("serial")
@Namespace("/")
@ResultPath(value = "/")
@InterceptorRef(value = "loggingStack")
public class HomeAction extends ActionSupport {
	
  @Action(value = "home", results = {
  		@Result(name = SUCCESS, type="tiles", location = "/home.tiles")
  })
  public String execute() {
    return SUCCESS;
  }

}
