package com.struts.actions;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

/**
 * Created by Kenshinn on 1/15/2016 AD.
 */
@Namespace("/")
@ResultPath(value = "/")
public class HomeAction extends ActionSupport {

  @Action(
    value = "home",
    results = {
      @Result(name = SUCCESS, location = "views/home.jsp")
    }
  )
  public String execute() {
    System.out.println("Action: /home");
    return SUCCESS;
  }

}
