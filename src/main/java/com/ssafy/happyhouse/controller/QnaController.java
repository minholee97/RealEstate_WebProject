package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.dto.PageBean;
import com.ssafy.happyhouse.dto.Qna;
import com.ssafy.happyhouse.dto.User;
import com.ssafy.happyhouse.dto.UserException;
import com.ssafy.happyhouse.service.QnaService;

import io.swagger.annotations.ApiOperation;

@RestController
@CrossOrigin(origins = {"*"}, maxAge = 6000)
public class QnaController {
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Autowired
	private QnaService service;
	private static final String SUCCESS = "success";
	
	@ExceptionHandler
	public ResponseEntity<String> handler(Exception e) {
		logger.debug("ErrorHandler.....");
		logger.debug("ErrorHandler.....{}", e.getMessage());
		e.printStackTrace();
		
		HttpHeaders resHeaders = new HttpHeaders();
		resHeaders.add("Content-Type", "application/json;charset=UTF-8");
		if(e instanceof UserException) {
			return new ResponseEntity<String>(e.getMessage(), resHeaders, HttpStatus.FAILED_DEPENDENCY);
		} else {
			return new ResponseEntity<String>("처리 중 오류 발생", resHeaders, HttpStatus.FAILED_DEPENDENCY);
		}
	}
	@ApiOperation(value="qna 리스트", notes = "qna 리스트 반환")
	@GetMapping("/qna")
	public ResponseEntity<?> searchAll(PageBean bean, HttpServletRequest request){
		logger.info("searchAll.......................................{}");
		HttpSession session = request.getSession();
		String author = ((User) session.getAttribute("user")).getId();
		List<Qna> qnas = null;
		if (author.equals("admin")) {
			qnas = service.searchAllQna(bean);
		} else  {
			qnas = service.searchUserQna(author);
		}
		logger.debug("users:{}",qnas);
		if(qnas!=null && !qnas.isEmpty()) {
			return new ResponseEntity<List<Qna>>(qnas, HttpStatus.OK);
		}else {
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
	}
	
	@ApiOperation(value="qna 선택", notes = "qna 반환")
	@GetMapping("/qna/{no}")
	public ResponseEntity<?> search(@PathVariable String no){
		logger.info("search.......................................{}");
		Qna qna = service.searchQna(Integer.parseInt(no));
		logger.debug("users:{}",qna);
		if(qna!=null) {
			return new ResponseEntity<Qna>(qna, HttpStatus.OK);
		}else {
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
	}
	
	@ApiOperation(value="qna 등록", notes = "qna를 등록 시킨다.")
	@PostMapping("/qna")
	public ResponseEntity<String> regist(@RequestBody Qna qna, HttpServletRequest request){
		HttpSession session = request.getSession();
		String author = ((User) session.getAttribute("user")).getId();
		qna.setAuthorId(author);
		logger.info("regist.........................."+qna);
		service.registQna(qna);
		return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
	}
	
	@ApiOperation(value="qna 수정", notes = "qna를 수정 한다")
	@PutMapping("/qna")
	public ResponseEntity<String> update(@RequestBody Qna qna){
		logger.info("update................................" + qna);
		service.updateQna(qna);
		return new ResponseEntity<String>(SUCCESS,  HttpStatus.OK);
	}
	
	@ApiOperation(value="qna answer 등록", notes = "qna에  answer를 등록")
	@PutMapping("/answer")
	public ResponseEntity<String> answer(@RequestBody Qna qna, HttpServletRequest request){
		HttpSession session = request.getSession();
		String writer = ((User) session.getAttribute("user")).getId();
		qna.setWriterId(writer);
		logger.info("update................................" + qna);
		service.answerQna(qna);
		return new ResponseEntity<String>(SUCCESS,  HttpStatus.OK);
	}
	
	@ApiOperation(value="qna 조회 수 업데이트", notes = "조회 수 증가")
	@PutMapping("/hit")
	public ResponseEntity<String> hit(@RequestBody int no){
		logger.info("update................................");
		service.updateHit(no);
		return new ResponseEntity<String>(SUCCESS,  HttpStatus.OK);
	}
	
	@ApiOperation(value="qna 삭제", notes = "qna 삭제")
	@DeleteMapping("/qna/{no}")
	public ResponseEntity<String> delete(@PathVariable String no){
		logger.info("delete................................");
		service.deleteQna(Integer.parseInt(no));
		return new ResponseEntity<String>(SUCCESS,  HttpStatus.OK);
	}
}
