<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Ehshe Project</title>
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<script src="https://kit.fontawesome.com/5a7a3b1a34.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
        <script crossorigin src="https://unpkg.com/react@16/umd/react.development.js"></script>
        <script crossorigin src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"></script>
        <script crossorigin src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
</head>

<body>
    
        <div id ="root">
        
        </div>
        <script type="text/babel">
        
            class GuGuDan extends React.Component{
                constructor(props){
                    super(props);
                    this.state = {
                            first: Math.ceil(Math.random() * 9 ),
                            second: Math.ceil(Math.random() * 9 ),
                            value: "",
                            result: "",
                            
                    };
                }
                
                onSubmit = (e) => {
                        e.preventDefault();
                        if(parseInt(this.state.value) === this.state.first * this.state.second ){
                            // setResult("정답");
                            // setFirst(Math.ceil(Math.random() * 9));
                            // setSecond(Math.ceil(Math.random() * 9));
                            // setValue(" ");
                            // inputEl.current.focus();
                            this.setState({
                                result : '정답',
                                first: Math.ceil(Math.random() * 9 ),
                                second: Math.ceil(Math.random() * 9 ),
                                value: "",
                            }); 
                        }else{
                            this.setState({
                                result : '오답입니다',
                            
                                value: "",
                            });
                            // setResult("오답입니다");
                            // setFirst(Math.ceil(Math.random() * 9));
                            // setSecond(Math.ceil(Math.random() * 9));
                            // setValue(" ");
                            // inputEl.current.focus();    
                        }
                        };

                onChange =(e) => {
                    this.setState({value : e.target.value});
                    };
                render(){
                    return (
                    <div>
                        <div> {this.state.first} 곱하기 {this.state.second}  는 ?  </div>
                    <form onSubmit = {this.onSubmit}>
                        <input type ="number " value = {this.state.value} onChange = {this.onChange} />
                        <button>입력 : </button>
                    </form>
                    <div>{this.state.result}</div>
                    </div>
                    );
                }
            }
            </script>
            <script type="text/babel">
            ReactDOM.render(<GuGuDan />,document.querySelector('#root' )); 
            </script>



    </body>
</html>