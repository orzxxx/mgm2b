package com.controller;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.centerm.base.ResponseBean;
import com.centerm.controller.menu.MenuController;
import com.centerm.model.menu.ComboDetailInf;
@RunWith(SpringJUnit4ClassRunner.class)  
//@WebAppConfiguration(value = "src/main/webapp")  
@ContextConfiguration(locations = {"classpath*:spring.xml","classpath:spring-mvc.xml"})  
@Transactional
@Rollback(true)
/**
 * 继承AbstractTransactionalJUnit4SpringContextTests
 * 自动事务回滚,避免数据污染
 */
public class MenuControllerTest extends AbstractTransactionalJUnit4SpringContextTests{
	private MockMvc mockMvc;  
	@Autowired
	private MenuController userController;
    @Before  
    public void setUp() {  
        mockMvc = MockMvcBuilders.standaloneSetup(userController).build();  
    }  
    @Transactional
    @Rollback(true)
	@Test
	public void list() throws Exception{
		 MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/menu/menu/list").param("mchntCd", "60055550006")
				 .param("currentPage", "1").param("pageSize", "10"))  
		            //.andExpect(MockMvcResultMatchers.view().name("user/view"))  
		            //.andExpect(MockMvcResultMatchers.model().attributeExists("user"))  
		            .andDo(MockMvcResultHandlers.print())  
		            .andReturn();  
		      
		 ResponseBean response = JSON.parseObject(result.getResponse().getContentAsString(), ResponseBean.class);
		 Assert.assertNotNull(response.getData());  
	}
}
