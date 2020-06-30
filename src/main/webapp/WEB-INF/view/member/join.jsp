<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			 <main>
                     
        <div class="join">
        <form id="form1" method="post" action="join">
            <fieldset>
                <legend class="d-none">회원정보</legend>
                <table class="table margin-top first">
                    <tbody class="signup-body">                                
                        <tr>
                            <th class="body-th"><label>아이디</label></th>
                            <td colspan="3" class="text-align-left indent">
                                <input id="id-text" type="text" name="uid" class="width-half"  required="required" value="" placeholder="영문과 숫자 6~20자 이내" pattern="^\w{6,20}$" />
                                <input class="btn-text btn-default" type="button" id="id-check-button" value="중복확인" />								
                            </td>
                        </tr>
                        <tr>
                            <th class="body-th"><label>비밀번호</label></th>
                            <td colspan="3" class="text-align-left indent">
                                <input type="password" name="pwd" class="" required placeholder="비밀번호 입력" />
                            </td>
                        </tr>
                        <tr>
                            <th class="body-th"><label>비밀번호 확인</label></th>
                            <td colspan="3" class="text-align-left indent"><input class="" name="pwd2" type="password" required /></td>
                        </tr>
                        <tr>
                            <th class="body-th"><label>이름</label></th>
                            <td colspan="3" class="text-align-left indent"><input class="width-half" name="name" type="text"  value="" required="required"/></td>
                        </tr>
                      
                        <tr>
                            <th class="body-th"><label>생년월일</label></th>
                            <td colspan="3" class="text-align-left indent">
                                
                                
                                
                                
                                <input name="birthday" type="date" class="width-half" required placeholder="예) 2000-02-17"  value=""/>

                            </td>
                        </tr>
                        <tr>
                            <th class="body-th"><label>핸드폰번호</label></th>
                            <td colspan="3" class="text-align-left indent"><input name="phone" type="text" class="width-half" pattern="^01[016789]-\d{3,4}-\d{4}$" placeholder="예) 010-1111-2222" required  value=""/></td>
                        </tr>
                                                   
                                                        
                        <tr>
                            <td colspan="4">
                                <input type="hidden" name="" value="" />
                                <input id="submit-Button" type="submit" name="btn" value="확인" style="height: 30px; margin:20px;" class="btn-text btn-default" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </fieldset>
        </form>
        </div>
    </main>
