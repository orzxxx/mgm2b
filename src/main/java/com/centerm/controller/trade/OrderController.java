package com.centerm.controller.trade;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centerm.base.Page;
import com.centerm.model.trade.OrderJourInf;
import com.centerm.service.trade.IOrderServiceImpl;
import com.centerm.utils.StringUtils;

@Controller
@RequestMapping("trade/order")
public class OrderController {

	private IOrderServiceImpl orderServiceImpl;

	public IOrderServiceImpl getOrderServiceImpl() {
		return orderServiceImpl;
	}
	@Autowired
	public void setOrderServiceImpl(IOrderServiceImpl orderServiceImpl) {
		this.orderServiceImpl = orderServiceImpl;
	}

	@RequestMapping("/list")
	@ResponseBody()
	public Object list(@ModelAttribute("orderInf") OrderJourInf order, 
			@RequestParam int currentPage, 
			@RequestParam int pageSize) throws Exception {
		if (!StringUtils.isNull(order.getMinTransdate())) {
			order.setMinTransdate(order.getMinTransdate().replace("-", ""));
		}
		if (!StringUtils.isNull(order.getMaxTransdate())) {
			order.setMaxTransdate(order.getMaxTransdate().replace("-", ""));
		}
		Page page = new Page(currentPage, pageSize);
		List<OrderJourInf> orders = orderServiceImpl.list(order, page);
		page.setRows(orders);
		return page;
	}
	
	@RequestMapping("/details")
	@ResponseBody()
	public Object list(String orderNo) throws Exception {
		return orderServiceImpl.getDetails(orderNo);
	}
}
