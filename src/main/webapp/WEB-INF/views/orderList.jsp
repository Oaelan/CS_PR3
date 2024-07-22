<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 내역</title>
    <!-- 부트스트랩 CDN 링크 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .table td,
        th {
            padding-left: 0;
            padding-right: 0;
            cursor: pointer;
            /* 마우스 커서를 포인터로 변경하여 클릭 가능함을 표시 */
            text-align: center;
        }

        .modal-footer .btn-confirm {
            background-color: #28a745;
            color: white;
        }

        .modal-footer .btn-reject {
            background-color: #dc3545;
            color: white;
        }

        .table {
            border-left: lightgray;
            border-right: lightgray;
        }

        #totalSum {
            display: flex;
            justify-content: flex-start;
        }

    </style>
</head>

<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body p-0">
                        <header class="bg-light py-2 mb-0">
                            <div class="container text-center">
                                <h5 class="m-0">주문 내역</h5>
                            </div>
                        </header>
                        <div class="table-responsive">
                            <table class="table table-striped text-center mb-0">
                                <thead>
                                    <tr>
                                        <th scope="col">수주번호</th>
                                        <th scope="col">주문자 ID</th>
                                        <th scope="col">배달 주소지</th>
                                        <th scope="col">주문 개수</th>
                                        <th scope="col">총 단가</th>
                                        <th scope="col">주문 일자</th>
                                        <th scope="col">상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr data-toggle="modal" data-target="#orderDetailModal" data-orderid="1">
                                        <td>1</td>
                                        <td>user123</td>
                                        <td>서울시 강남구</td>
                                        <td>3</td>
                                        <td>30,000원</td>
                                        <td>2024-07-18</td>
                                        <td></td>
                                    </tr>
                                    <tr data-toggle="modal" data-target="#orderDetailModal" data-orderid="2">
                                        <td>2</td>
                                        <td>user456</td>
                                        <td>서울시 종로구</td>
                                        <td>2</td>
                                        <td>20,000원</td>
                                        <td>2024-07-17</td>
                                        <td></td>
                                    </tr>
                                    <tr data-toggle="modal" data-target="#orderDetailModal" data-orderid="3">
                                        <td>3</td>
                                        <td>user789</td>
                                        <td>부산시 해운대구</td>
                                        <td>1</td>
                                        <td>10,000원</td>
                                        <td>2024-07-16</td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 주문 상세 모달 -->
    <div class="modal fade" id="orderDetailModal" tabindex="-1" role="dialog" aria-labelledby="orderDetailModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="orderDetailModalLabel">주문 상세 정보</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body pb-0">
                    <table class="table m-0">
                        <tbody>
                            <tr>
                                <th scope="row">제품번호</th>
                                <th scope="row">제품명</th>
                                <th scope="row">개수</th>
                                <th scope="row">가격</th>
                            </tr>
                            <tr>
                                <td id="orderId"></td>
                                <td id="userId"></td>
                                <td id="deliveryAddress"></td>
                                <td id="quantity"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="totalSum" class="mt-3 d-flex align-items-center pl-4 pb-3">
                    <strong class="mr-2">총 합계:</strong> <span id="totalAmount"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary mr-auto" data-dismiss="modal">거래 명세서</button>
                    <button type="button" class="btn btn-confirm" data-dismiss="modal">수주 확인</button>
                    <button type="button" class="btn btn-reject" data-dismiss="modal">수주 거절</button>
                </div>
            </div>
        </div>
    </div>


    <!-- 부트스트랩 자바스크립트 및 jQuery CDN 링크 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script src="orderList.js">
    </script>
</body>

</html>