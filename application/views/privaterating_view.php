
	<div class="container">
	<h2>Рейтинг учеников</h2><br>
	<div class="row">
	
		<div class="btn-group">
		  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		    Выберите ученика <span class="caret"></span>
		  </button>
		  <ul class="dropdown-menu">
		    <?php
		    	for ($i=1; $i <= count($data['list']); $i++) { 
		    		if (isset($data['list'][$i]))  {
		    ?>
		    <li>
		    	<a href=" <?php echo '/shop/user/getPrivateRatingAndShow?user='.$data['list'][$i]['user_id'];?> ">
		    		<?php 
		    			echo $data['list'][$i]['family_name']; 
		    		?>
		    	</a>
		    </li>
		    <?php 
		    	} } 
		    ?>
		  </ul>
		</div>
<br/><br/>
<?php if (count($data['rating']) != 0) { ?> <!-- проверяем на наличие элементов -->	
	<div class="col-lg-3 centered">
	</div>
	<div class="col-lg-6 centered">

	<div class="panel panel-default">

	  <table class="table text-center">
	  	<tr>
	  		<td><b>Название событий</b></td>
	  		<td><b>Имя проподавателя</b></td>
	  		<td><b>Оценка</b></td>
	  		<td><b>Посещаемость</b></td>
	  	</tr>
	 	<?php 
	 	foreach ($data['rating'] as $row) {
	 		print '<tr><td>'.$row['name'].'</td>'.'<td>'.$row['family_name'].'</td>'.'<td>'.$row['mark'].'</td>'.'<td>'.$row['visited'].'</td></tr>';
	 	}
	 	?>


	  </table>
	</div>

	</div>


	</div>
	</div>
<?php } else echo '<h4 class="media-heading container text-center">Запрос не содержит элементов</h4>'?>