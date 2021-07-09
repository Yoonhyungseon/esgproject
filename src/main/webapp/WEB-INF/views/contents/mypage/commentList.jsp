<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>



<body>
commentList
	<br>
	<br>
	<br>
	<section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center mb-4">
                    <h2 class="heading-section">댓글관리</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h3 class="h5 mb-4 text-center">Comment Table</h3>
                    <div class="table-wrap">
                        <table class="table myaccordion table-hover" id="accordion">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <th scope="row">1</th>
                                    <td>Laptop Technology AS2020</td>
                                    <td>$200.00</td>
                                    <td>2</td>
                                    <td>$400.00</td>
                                    <td>
                                        <i class="fa" aria-hidden="true"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" id="collapseOne" class="collapse show acc" data-parent="#accordion">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro iste, facere sunt sequi nostrum ipsa, amet doloremque magnam reiciendis tempore sapiente. Necessitatibus recusandae harum nam sit perferendis quia inventore natus.</p>
                                    </td>
                                </tr>
                                <tr data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" class="collapsed">
                                    <th scope="row">2</th>
                                    <td>Laptop Technology AS2020</td>
                                    <td>$200.00</td>
                                    <td>2</td>
                                    <td>$400.00</td>
                                    <td>
                                        <i class="fa" aria-hidden="false"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" id="collapseTwo" class="collapse acc" data-parent="#accordion">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro iste, facere sunt sequi nostrum ipsa, amet doloremque magnam reiciendis tempore sapiente. Necessitatibus recusandae harum nam sit perferendis quia inventore natus.</p>
                                    </td>
                                </tr>
                                <tr data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree" class="collapsed">
                                    <th scope="row">3</th>
                                    <td>Laptop Technology AS2020</td>
                                    <td>$200.00</td>
                                    <td>2</td>
                                    <td>$400.00</td>
                                    <td>
                                        <i class="fa" aria-hidden="false"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" id="collapseThree" class="collapse acc" data-parent="#accordion">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro iste, facere sunt sequi nostrum ipsa, amet doloremque magnam reiciendis tempore sapiente. Necessitatibus recusandae harum nam sit perferendis quia inventore natus.</p>
                                    </td>
                                </tr>
                                <tr data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour" class="collapsed">
                                    <th scope="row">4</th>
                                    <td>Laptop Technology AS2020</td>
                                    <td>$200.00</td>
                                    <td>2</td>
                                    <td>$400.00</td>
                                    <td>
                                        <i class="fa" aria-hidden="false"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" id="collapseFour" class="collapse acc" data-parent="#accordion">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro iste, facere sunt sequi nostrum ipsa, amet doloremque magnam reiciendis tempore sapiente. Necessitatibus recusandae harum nam sit perferendis quia inventore natus.</p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>

</body>

</html>