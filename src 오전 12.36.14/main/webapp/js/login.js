function onclick_link_multi_val(url_name, action, key, val_id) {
  /**
   * val_id을 가진 html 요소의 내부 값(input 한정으로 작동)이 필요할 때 호출해 링크를 이동
   * */
  let str_loc_href = "";
  // let element1 =  document.getElementById(req_val_id); // 여기가 바뀌어서 내부 요소 찾음
  // let req_val = element1.value;
  if (notEmpty(url_name) && notEmpty(action)) {
    // 사이트 링크, action value가 전달될 경우
    str_loc_href = `${url_name}?action=${action}`;

    key.forEach((value, index) => {
      let id_elem = document.getElementById(val_id[index]);
      let val_elem = id_elem.value;
      str_loc_href += `&${value}=${val_elem}`;
    });

    window.location.href = str_loc_href;
  } else {
    // 잘못된 함수 호출시
    alert("Oops!! 링크가 없어요!"); // 실사용시 활성화
  }
}
