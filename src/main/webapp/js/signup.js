const signup_logic = (url_name, action, req_val_id) => {
  const bean_id = ["name", "email", "uid", "password", "interest", "admin"];
  let val_save = [];

  if (notEmpty(url_name) && notEmpty(action)) {
    // 값 가져오기
    req_val_id.forEach((value, index) => {
      get_val(value, val_save, index);
    });

    // 값 정상적으로 입력되었는지 확인
    for (let i = 0; i < val_save.length; i++) {
        if (!notEmpty(val_save[i])) {
          // 가져온 값이 비었을 경우
          alert(
              "회원가입에 필요한 정보가 모두 입력되지 않았습니다.\n다시 한 번 확인해주세요."
          );
          return;
        }
    }

    // 비밀번호 재입력값 같은지 확인
    if (val_save[3] === val_save[4]) {
      regist_req(url_name, action, bean_id, val_save);
    } else {
      alert("비밀번호 확인 값이 일치하지 않습니다.");
      return;
    }
  } else {
    // url_name, action 전달 잘못될 시
    alert("Oops!! 링크가 잘못됐어요!");
  }
};

/**
 * 문자열 비었는지 판단하는 함수
 *
 * @param {string} str 비었는지 판단할 문자열
 * @returns {boolean} 문자열 비었는지 여부
 */
const notEmpty = (str) => {
  return !(typeof str == "undefined" || str == null || str === "");
};

/**
 * dom 접근해 값 가져오는 함수
 *
 * @param {string} val_id dom 객체 id
 * @param {any[]} save_arr 객체 값 저장용 배열
 * @param {number} index 배열 인덱스
 * @returns nothing
 */
const get_val = (val_id, save_arr, index) => {
  let id_elem = document.getElementById(val_id);
  save_arr[index] = id_elem.value;
  return;
};

/**
 * 파라미터를 받아 컨트롤러에 회원가입 요청 전달
 * @param {string} url_name url값
 * @param {string} action action값
 * @param {string[]} bean_id User 자바 빈 전달용 필드 변수명
 * @param {string[]} val_save User 자바 빈 전달용 필드 변수 값
 * @returns nothing: 컨트롤러 요청 후 로직 종료
 */
const regist_req = (url_name, action, bean_id, val_save) => {
  let str_loc_href = `${url_name}?action=${action}`;

  // 자바 빈 파라미터 세팅
  for (let index = 0; index < val_save.length; index++) {
    if (index === 4) {
      // DB에 들어가는 값은 비밀번호 확인값(인덱스 4) 제외됨
      // deprecated 항목들 삽입 (관심사, 관리자여부)
      str_loc_href += `&${bean_id[index]}=none&${bean_id[index + 1]}=false`;
      break;
    }

    // val_save에 맞는 항목 세팅
    const element = val_save[index];
    str_loc_href += `&${bean_id[index]}=${element}`;
  }

  window.location.href = str_loc_href;
};
