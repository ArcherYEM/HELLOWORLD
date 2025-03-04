// 여러파일 업로드
		function multiFiles(input) {
			  var previewContainer = document.getElementById('preview-container');

			  if (input && input.length) {
			    for (var i = 0; i < input.length; i++) {
			      (function(file) {
			        var reader = new FileReader();
			        reader.onload = function(e) {
			       	  var newDiv = document.createElement("div");
					      newDiv.className = "image-container";
					      newDiv.style.position = "relative";
			          var newDiv2 = document.createElement("div");
			          newDiv2.className = "name-container";
								
			          // 파일이미지
			          var newImg = document.createElement("img");
			          newImg.src = e.target.result;
			          newImg.style.width = "50%"; // 이미지 크기 설정
			          newImg.style.height = "auto";
			          newImg.style.marginBottom = "20px";

			          // 파일 이름을 표시하는 텍스트 노드 생성
			          var imageName = document.createTextNode(file.name);
			          
			          // 취소버튼
			          var newBtn = document.createElement("button");
			          newBtn.className="removeBtn";
			          newBtn.style.position = "absolute";
			          newBtn.style.top = "0";
			          newBtn.style.right = "0";
			         newBtn.onclick = function() {
					    if (confirm("선택된 사진을 삭제하시겠습니까?") == true) {
					        previewContainer.removeChild(newDiv);
					
					        // 파일 인풋에서 해당 파일을 제외하고 다시 설정
					        var fileInput = document.querySelector('.fileUpload');
					        var updatedFiles = Array.from(fileInput.files).filter(function (f) {
					            return f !== file;
					        });
					        
					        // 새로운 FileList 생성
					        var newFileList = new DataTransfer();
					        updatedFiles.forEach(function (file) {
					            newFileList.items.add(file);
					        });
								
					         fileInput.files = newFileList.files;
					    } else {
					        return false;
					    }
					};
		          	  
		          // div 안에 img와 텍스트 노드 추가
		          newDiv.appendChild(newDiv2);
		          newDiv.appendChild(newBtn);
		          newDiv2.appendChild(imageName); 
		          newDiv.appendChild(newImg);

		          // 생성한 div를 preview-container에 추가
		          previewContainer.appendChild(newDiv);
		        };

		        reader.readAsDataURL(file); // 파일 읽기 시작
		      })(input[i]);
		    }
		  }
		}
		
function writeAlbum(){
		let userNickname = $("#hiddenUserNickname").val();
		let link = '/mnHome/albumWrite/' + userNickname;
		
		let formData = new FormData();
		let inputFile = $("input[name='albumFile']");
		let files = inputFile[0].files;
		
		if(files.length <=0){
			alert("사진을 첨부해주세요.");
			return;
		}
		
		for(let i = 0; i < files.length; i++){
			formData.append("uploadFile", files[i]);
		}
		
		if($.trim($("#albumTitle").val())==""){
			alert("제목을 입력해주세요.");
			return;
		}		
		
		let visibilityValue = $("#visibilitySelect").val();
	    
	    if (visibilityValue === "0") {
	        visibilityValue = "0"; // 비공개
	    } else if (visibilityValue === "1") {
	        visibilityValue = "1"; // 전체공개
	    } else if (visibilityValue === "base" || visibilityValue === null){
	    	visibilityValue = "1"; // 전체공개(기본값)
		}else {
	    	visibilityValue = "-99"; //에러
	    }

	    let albumData = {
	        title: $("#albumTitle").val(),
	        content: $("#albumContent").val(),
	        visibility: visibilityValue,
	        files: files
	    };
	    console.log(inputFile);
		
		formData.append("contents", new Blob([JSON.stringify(albumData)],{type : "application/json"} ));
		
		$.ajax({
			url : link
			,processData : false
			,contentType :false
			,data : formData
			,type : "POST"
			, success :function(json){
				if(json.resultCode === '1' ){
		        	 alert("저장되었습니다.");
		        	 document.getElementById("albumView").click();
		        } else if(json.resultCode === "0"){
		            alert("잠시 후 다시 시도해주세요.");
		        }
			}
		 });
	}
	
	function deleteAlbum(seq){
		if(confirm("정말 삭제하시겠습니까?")){
			let userNickname = $("#hiddenUserNickname").val();
			
			let jsonData = { 
							"seq" : seq 
							};
		
			$.ajax({
				url: "/mnHome/albumDelete"
				,type: "POST"
				, dataType : "json"
				, data: JSON.stringify(jsonData)
				, contentType: "application/json"
				, success : function(data){
					alert("삭제했습니다.");
					document.getElementById("albumView").click();
				}, error : function(error){
					console.log("Error : " + error);
					alert('잠시 후 다시 시도해주세요.');
				}
			});
		}
	}	