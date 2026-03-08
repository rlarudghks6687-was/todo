//라우팅 = 사용자의 요청(URI+METHOD)
//        + Service
//        + 응답(view or Data)
const express = require("express");
const router = express.Router();
//제공할 서비스 객체
const userService = require("../services/user_service.js");

//전체조회 | URI(/users) + METHOD(GET)
// async: 특정 함수를 비동기 처리 하는 코드
// await: 비동기화된 함수가 해결될 때까지 함수의 실행을 멈춘 뒤 결과를 받은 뒤 다음 줄 실행(동기화) 
router.get(`/users`, async (req, res) => {
  let result = await userService.findAll();
  res.send(result);
});
//단건조회 | URI(/users/:no) + METHOD(GET)
router.get(`/users/:no`, async (req, res) => {
  let target = req.params.no;
  let result = await userService.findInfoByNo(target);
  res.send(result);
});
//등록 | URI(/users) + METHOD(POST)
router.post(`/users`, async (req, res) => {
  let target = req.body;
  let result = await userService.createInfo(target);
  res.send(result);
});
//수정 | URI(/users/:no) + METHOD(PUT)
router.put(`/users/:no`, async (req, res) => {
  let userNo = req.params.no;
  let target = req.body;
  let result = await userService.modifyInfo(userNo, target);
  res.send(result);
});
//삭제 | URI(/users/:no) + METHOD(DELETE)

module.exports = router; //end of code
