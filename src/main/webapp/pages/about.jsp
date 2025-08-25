<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta property="og:title" content="Phương Anh Store" />
    <meta property="og:description" content="Phụ kiện sạc, livestream, máy tính, ô tô, xe máy..." />
    <meta property="og:image" content="https://www.phuonganhstore.vn/assets/images/logo/main-logo-2.png" />
    <meta property="og:url" content="https://www.phuonganhstore.vn/" />
    <meta property="og:type" content="website" />

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Phương Anh Store</title>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/images/logo/main-logo-2.png" type="image/x-icon">

    <meta name="keywords" content="HTML5 Template">
    <meta name="description" content="Molla - Bootstrap eCommerce Template">
    <meta name="author" content="p-themes">

    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <!-- Main CSS File -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <!--Vienamese-->
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Agbalumo&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }
        header {
            background-color: #fff;
            padding: 20px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        nav {
            background-color: #eee;
            padding: 10px;
            text-align: center;
        }
        nav a {
            margin: 0 15px;
            text-decoration: none;
            color: #39f;
            font-weight: bold;
        }
        nav a:hover {
            text-decoration: underline;
        }
        section {
            padding: 20px;
            max-width: 800px;
            margin: 0 auto;
        }
        h1, h2 {
            color: #39f;
        }
        .highlight {
            color: #39f;
            font-weight: bold;
        }
        ul {
            list-style-type: disc;
            padding-left: 20px;
        }
        footer {
            text-align: center;
            padding: 10px;
            background-color: #fff;
            border-top: 1px solid #ddd;
            margin-top: 20px;
        }
    </style>
</head>
<%@ include file="/assets/components/header.jsp" %>
<body>
    <header>
        <h1>Phương Anh Store</h1>
        <p>Chuyên cung cấp phụ kiện điện thoại và máy tính uy tín</p>
    </header>
    
    <nav>
        <a href="#gioi-thieu">Giới thiệu</a>
        <a href="#kiem-hang">Chính sách kiểm hàng</a>
        <a href="#bao-mat">Chính sách bảo mật</a>
        <a href="#van-chuyen">Chính sách vận chuyển</a>
        <a href="#thanh-toan">Chính sách thanh toán</a>
        <a href="#bao-hanh">Chính sách bảo hành & đổi trả</a>
        <a href="#lien-he">Thông tin liên hệ</a>
    </nav>
    
    <section id="gioi-thieu">
        <h2>Giới thiệu về Phương Anh Store</h2>
        <p>Phương Anh Store là địa chỉ uy tín chuyên cung cấp củ sạc, cáp sạc, sạc dự phòng, cường lực, và các sản phẩm liên quan đến điện thoại – máy tính, với chất lượng và sản phẩm phù hợp với người tiêu dùng.</p>
        
        <h3>Tầm nhìn & Sứ mệnh</h3>
        <ul>
            <li><span class="highlight">Tầm nhìn:</span> Trở thành lựa chọn hàng đầu của sinh viên, dân văn phòng và freelancer khi tìm kiếm phụ kiện công nghệ bền – đẹp – tiện ích.</li>
            <li><span class="highlight">Sứ mệnh:</span> Mang đến sản phẩm chất lượng, dịch vụ tận tâm và trải nghiệm mua sắm dễ dàng, nhanh chóng.</li>
        </ul>
        
        <h3>Sản phẩm & Dịch vụ</h3>
        <ul>
            <li>Phụ kiện điện thoại: Ốp lưng, cáp sạc, tai nghe, pin dự phòng, kính cường lực...</li>
            <li>Phụ kiện máy tính: Chuột, bàn phím, USB, loa, đèn LED, giá đỡ laptop...</li>
            <li>Thiết bị công nghệ khác: Loa Bluetooth, camera mini, thiết bị định vị, mic thu âm...</li>
            <li>Dịch vụ: Giao hàng toàn quốc, bảo hành chính hãng, đổi trả theo quy định.</li>
        </ul>
        
        <h3>Lý do chọn Phương Anh Store</h3>
        <ul>
            <li><span class="highlight">Sản phẩm chính hãng,</span> đầy đủ hóa đơn/chứng từ.</li>
            <li><span class="highlight">Giá cạnh tranh</span> kèm nhiều ưu đãi hấp dẫn.</li>
            <li><span class="highlight">Tư vấn tận tâm,</span> chọn sản phẩm phù hợp nhu cầu và ngân sách.</li>
            <li><span class="highlight">Hỗ trợ sau bán hàng</span> nhanh chóng và chu đáo.</li>
        </ul>
        
        
    </section>
    
    <section id="kiem-hang">
        <h2>Chính sách kiểm hàng</h2>
        <ol>
            <li><span class="highlight">Mua trực tiếp tại cửa hàng</span>
                <ul>
                    <li>Khách hàng được kiểm tra trực tiếp sản phẩm trước khi thanh toán.</li>
                    <li>Bao gồm: ngoại hình sản phẩm, phụ kiện kèm theo, thử chức năng cơ bản (nếu có).</li>
                </ul>
            </li>
            <li><span class="highlight">Mua online qua mạng xã hội (Facebook, Zalo, TikTok...)</span>
                <ul>
                    <li>Thanh toán khi nhận hàng (COD): Khách được mở hàng và kiểm tra ngoại quan (hình thức, số lượng, mẫu mã). Không dung thử sản phẩm, vận hành sản phẩm (trừ khi có thỏa thuận trước).</li>
                    <li>Chuyển khoản trước: Shop sẽ gửi video hoặc hình ảnh sản phẩm trước khi đóng gói để khách xác nhận.</li>
                </ul>
            </li>
            <li><span class="highlight">Mua trên sàn thương mại điện tử (Shopee, Lazada, Tiki...)</span>
                <ul>
                    <li>Thực hiện kiểm hàng theo quy định của từng sàn.</li>
                    <li>Khách nên quay video quá trình mở hàng để làm bằng chứng khi khiếu nại nếu sản phẩm bị lỗi hoặc giao sai.</li>
                </ul>
            </li>
            <li><span class="highlight">Mua qua website của shop</span>
                <ul>
                    <li>Thanh toán khi nhận hàng (COD): Khách được kiểm tra ngoại quan sản phẩm trước khi thanh toán.</li>
                    <li>Thanh toán trước (chuyển khoản, ví điện tử): Shop sẽ gửi video/hình ảnh sản phẩm trước khi gửi hàng. Khách nên quay video mở hộp khi nhận hàng để bảo vệ quyền lợi khi có sự cố.</li>
                </ul>
            </li>
            <li><span class="highlight">Lưu ý chung</span>
                <ul>
                    <li>Nếu sản phẩm không đúng mẫu, màu, số lượng hoặc bị lỗi do vận chuyển, khách không nhận hàng và liên hệ ngay cho shop.</li>
                    <li>Hàng đã qua sử dụng hoặc mất tem bảo hành không áp dụng đổi trả, trừ trường hợp lỗi kỹ thuật được bảo hành.</li>
                    <li>Mọi thắc mắc, vui lòng liên hệ: 0901050697</li>
                </ul>
            </li>
        </ol>
    </section>
    
    <section id="bao-mat">
        <h2>Chính sách bảo mật thông tin</h2>
        <ol>
            <li><span class="highlight">Mục đích thu thập thông tin</span>
                <p>Chúng tôi thu thập thông tin cá nhân của khách hàng nhằm:</p>
                <ul>
                    <li>Xác nhận và xử lý đơn hàng.</li>
                    <li>Giao hàng đúng địa chỉ và người nhận.</li>
                    <li>Liên hệ khi có vấn đề phát sinh về sản phẩm/dịch vụ.</li>
                    <li>Gửi thông tin khuyến mãi, ưu đãi (nếu khách đồng ý).</li>
                </ul>
            </li>
            <li><span class="highlight">Thông tin thu thập</span>
                <ul>
                    <li>Họ và tên.</li>
                    <li>Số điện thoại.</li>
                    <li>Địa chỉ giao hàng.</li>
                    <li>Email (nếu có).</li>
                    <li>Thông tin thanh toán (nếu khách hàng thanh toán trước).</li>
                </ul>
            </li>
            <li><span class="highlight">Phạm vi sử dụng thông tin</span>
                <p>Thông tin của khách chỉ được sử dụng để:</p>
                <ul>
                    <li>Xử lý đơn hàng và giao hàng.</li>
                    <li>Cung cấp dịch vụ chăm sóc khách hàng.</li>
                    <li>Gửi thông tin ưu đãi, khuyến mãi (khi khách đồng ý).</li>
                </ul>
            </li>
            <li><span class="highlight">Lưu trữ và bảo mật thông tin</span>
                <ul>
                    <li>Thông tin khách hàng được lưu trữ an toàn tại hệ thống quản lý của shop.</li>
                    <li>Chúng tôi không bán, trao đổi hay chia sẻ thông tin khách hàng cho bên thứ ba, trừ khi được sự đồng ý của khách hàng hoặc theo yêu cầu pháp luật.</li>
                </ul>
            </li>
            <li><span class="highlight">Quyền của khách hàng</span>
                <p>Khách hàng có quyền:</p>
                <ul>
                    <li>Yêu cầu xem lại, chỉnh sửa hoặc xóa thông tin cá nhân.</li>
                    <li>Từ chối nhận thông tin khuyến mãi bất kỳ lúc nào.</li>
                </ul>
            </li>
           
        </ol>
    </section>
    
    <section id="van-chuyen">
        <h2>Chính sách vận chuyển</h2>
        <ol>
            <li><span class="highlight">Phạm vi giao hàng</span>
                <ul>
                    <li>Giao hàng toàn quốc qua các đơn vị vận chuyển uy tín (GHN, GHTK, Viettel Post, J&T…).</li>
                    <li>Miễn phí giao hàng nội thành Cần Thơ với đơn từ 300.000 VNĐ, bán kính 3Km</li>
                </ul>
            </li>
            <li><span class="highlight">Thời gian giao hàng</span>
                <ul>
                    <li>Nội thành Cần Thơ: 1 – 2 ngày làm việc, hoặc sớm hơn tùy theo vị trí.</li>
                    <li>Tỉnh/thành khác: 2 – 5 ngày làm việc (tùy khu vực).</li>
                    <li>Một số khu vực xa, hải đảo có thể mất thêm thời gian. Tùy theo thời điểm, tình hình thời tiết…</li>
                </ul>
            </li>
            <li><span class="highlight">Phí vận chuyển</span>
                <ul>
                    <li>Tính theo bảng giá của đơn vị vận chuyển và sẽ được thông báo trước khi chốt đơn.</li>
                    <li>Chương trình miễn/giảm phí ship sẽ được áp dụng theo từng thời điểm khuyến mãi.</li>
                </ul>
            </li>
            <li><span class="highlight">Lưu ý khi nhận hàng</span>
                <ul>
                    <li>Kiểm tra kỹ tình trạng bao bì, sản phẩm, số lượng, mẫu mã trước khi thanh toán (đối với COD).</li>
                    <li>Quay video mở hộp để làm bằng chứng nếu hàng bị hư hỏng hoặc sai mẫu.</li>
                </ul>
            </li>
        </ol>
    </section>
    
    <section id="thanh-toan">
        <h2>Chính sách & hướng dẫn thanh toán</h2>
        <ol>
            <li><span class="highlight">Mua trực tiếp tại cửa hàng</span>
                <ul>
                    <li>Địa chỉ: 163N Nguyễn Văn Cừ Nối Dài, P. Tân An, TP. Cần Thơ.</li>
                    <li>Thanh toán tiền mặt hoặc chuyển khoản ngân hàng sau khi nhận và kiểm tra sản phẩm.</li>
                </ul>
            </li>
            <li><span class="highlight">Mua qua mạng xã hội (Facebook, Zalo, TikTok...)</span>
                <ul>
                    <li>Thanh toán khi nhận hàng (COD): Khách thanh toán cho đơn vị vận chuyển sau khi nhận và kiểm tra sản phẩm.</li>
                    <li>Chuyển khoản trước: Ngân hàng: Ngân hàng thương mại cổ phần quân đội MB Bank, Chủ tài khoản: Nguyễn Văn Tới, Số tài khoản: 098513955555, Nội dung CK: Mã hóa đơn cho từng đơn hàng.</li>
                    <li>Lưu ý: Với đơn hàng giá trị cao, shop có thể yêu cầu đặt cọc trước để giữ hàng.</li>
                </ul>
            </li>
            <li><span class="highlight">Mua qua sàn thương mại điện tử (Shopee, Lazada, Tiki...)</span>
                <ul>
                    <li>Thanh toán theo các hình thức sẵn có trên sàn: COD, ví điện tử, thẻ ngân hàng...</li>
                    <li>Tất cả giao dịch, thanh toán, hoàn tiền sẽ tuân thủ chính sách của từng sàn.</li>
                    <li>Khách hàng nên kiểm tra kỹ thông tin người bán trước khi thanh toán để tránh nhầm shop giả mạo.</li>
                </ul>
            </li>
            <li><span class="highlight">Mua qua Website của shop</span>
                <ul>
                    <li>Thanh toán khi nhận hàng (COD): Khách thanh toán cho đơn vị vận chuyển sau khi nhận và kiểm tra sản phẩm.</li>
                    <li>Chuyển khoản trước: Mã QR Code sẽ được tạo tự động theo đơn hàng của quý khách hàng. Nội dung chuyển khoản và số tiền đã được gán sẵn vào QR Code. Quý khách hàng mở App ngân hàn hoặc ví điện tử sau đó quét mã và thanh toán. Nhân viên sẽ liên hệ xác nhận đơn ngay sau khi có giao dịch phát sinh (trong thời gian làm việc).</li>
                    <li>Lưu ý: Với đơn hàng giá trị cao, shop có thể yêu cầu đặt cọc trước để giữ hàng.</li>
                </ul>
            </li>
            <li><span class="highlight">Lưu ý chung</span>
                <ul>
                    <li>Luôn giữ hóa đơn hoặc mã đơn hàng để bảo hành/đổi trả.</li>
                    <li>Shop chỉ xác nhận đơn sau khi đã xác thực thanh toán hoặc xác nhận COD.</li>
                </ul>
            </li>
        </ol>
    </section>
    
    <section id="bao-hanh">
        <h2>Chính sách bảo hành & đổi trả</h2>
        <ol>
            <li><span class="highlight">Chính sách bảo hành</span>
                <ul>
                    <li>Tùy trường hợp sản phẩm sẽ được bảo hành theo chính sách của Shop hoặc nhà sản xuất.</li>
                    <li>Sản phẩm được bảo hành sẽ lưu thông tin bằng mã hóa đơn, số điện thoại, họ tên khách hàng.</li>
                    <li>Thời gian bảo hành được ghi rõ trên hóa đơn hoặc tem bảo hành đi kèm sản phẩm.</li>
                    <li>Bảo hành bao gồm: lỗi kỹ thuật từ sản phẩm (không bao gồm hao mòn tự nhiên, lỗi do người sử dụng).</li>
                    <li>Không áp dụng bảo hành với các trường hợp: Do tác động từ bên ngoài trong quá trình sử dụng gây vở, dứt, dãy….dẫn đến hư hỏng; Can thiệp sửa chữa bên ngoài hoặc tự ý tháo lắp.</li>
                </ul>
            </li>
            <li><span class="highlight">Chính sách đổi - trả</span>
                <ul>
                    <li>Đổi trả tùy theo sản phẩm nếu sản phẩm tùy theo thỏa thuận.</li>
                    <li>Sản phẩm đổi trả phải còn nguyên vẹn, đầy đủ phụ kiện, bao bì, hóa đơn mua hàng. Phải có clip làm bằng chứng.</li>
                    <li>Không hỗ trợ đổi trả với sản phẩm đã qua sử dụng, bị hư hỏng do người dùng, hoặc không còn nguyên tình trạng ban đầu.</li>
                </ul>
            </li>
            <li><span class="highlight">Hình thức bảo hành / đổi trả</span>
                <ul>
                    <li>Đem sản phẩm trực tiếp đến cửa hàng hoặc gửi qua bưu điện (khách chịu phí vận chuyển khi đổi trả không thuộc phạm vi bảo hành).</li>
                    <li>Cửa hàng sẽ kiểm tra và phản hồi trong vòng 3–5 ngày làm việc kể từ ngày nhận được sản phẩm hoàn trả.</li>
                </ul>
            </li>
            
        </ol>
    </section>

    <section id="lien-he">
        <h2>Thông tin liên hệ</h2>
        <ol>
             <li><span class="highlight">Liên hệ chúng tôi qua:</span>
                <ul>
                    <li>Địa chỉ: 163N, Nguyễn Văn Cừ, Phường Tân An, Thành Phố Cần Thơ</li>
                    <li>SĐT / Zalo: 0901050697</li>
                    <li>Fanpage / Website: phuonganhstore.vn</li>
                    <li>Email CSKH (nếu có): pkphuonganhstore@gmail.com</li>
                </ul>
            </li>
        </ol>
    </section>
    
    <footer>
        <%@ include file="/assets/components/footer.jsp" %>    
    </footer>
</body>
</html>
```