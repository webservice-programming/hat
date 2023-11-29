function onclick_link_innerval(url_name, action, req_key, req_val_id) {
  /**
   * req_val_id을 가진 html 요소의 내부 값(input 한정으로 작동)이 필요할 때 호출해 링크를 이동
   * */
  let element1 = document.getElementById(req_val_id); // 여기가 바뀌어서 내부 요소 찾음
  // let element1 =  document.querySelector(`#value`); // 여기가 바뀌어서 내부 요소 찾음
  // let req_val = document.querySelector(`#value`).innerHTML;
  let req_val = element1.value;
  // alert(`Debug>>> req_val: ${req_val}`);
  if (notEmpty(url_name) && notEmpty(action)) {
    // 사이트 링크, action value가 전달될 경우
    if (notEmpty(req_key) && notEmpty(req_val_id)) {
      // 추가적인 인수 키와 값이 전달될 겨우
      window.location.href = `${url_name}?action=${action}&${req_key}=${req_val}`; // change here: req_key와 req_val이 바뀌어 요소 전달됨
    } else {
      window.location.href = `${url_name}?action=${action}`; // change here: action이 바뀌어 요소 전달됨
    }
  } else {
    // 잘못된 함수 호출시
    alert("Oops!! 링크가 없어요!"); // 실사용시 활성화
  }
}

function onclick_link(url_name, action, req_key, req_val) {
  /**
   * req_val 값 자체 값만 필요할 때 호출해 링크를 이동
   * */
  if (notEmpty(url_name) && notEmpty(action)) {
    // 사이트 링크, action value가 전달될 경우
    if (notEmpty(req_key) && notEmpty(req_val)) {
      // 추가적인 인수 키와 값이 전달될 겨우
      window.location.href = `${url_name}?action=${action}&${req_key}=${req_val}`; // change here: req_key와 req_val이 바뀌어 요소 전달됨
    } else {
      window.location.href = `${url_name}?action=${action}`; // change here: action이 바뀌어 요소 전달됨
    }
  } else {
    // 잘못된 함수 호출시
    alert("Oops!! 링크가 없어요!"); // 실사용시 활성화
  }
}

/**
 * 버튼 등에서 별도의 get param 필요 없이 jsp/절대경로 호출만 필요할 때 사용
 * @param {string} url_name 이동할 jsp 파일 경로
 */
const onclick_static = (url_name) => {
  if (notEmpty(url_name)) {
    window.location.href = `${url_name}`;
  } else {
    alert("Oops!! 링크가 없어요!"); // 실사용시 활성화
  }
};

function notEmpty(str) {
  /**
   * 문자열 비었는지 판단
   * */
  return !(typeof str == "undefined" || str == null || str === "");
}
