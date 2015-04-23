var Total = 0;
var OrderNum = 1;
var OrderedItems = [];

function AddToCart(item,price,Name)
{
	$("#ItemsOrdered").append('<tr id="R'+OrderNum+'"><td>'+OrderNum+'</td><td>'+Name+'</td><td>R'+price+'.00</td><td><a href = "#Cart" class="btn btn-primary" onClick="RemoveFromCart(\'R'+OrderNum+'\',\''+price+'\')">Remove from Cart</a></td></tr>');
	OrderNum = Number(OrderNum) + 1;
	OrderedItems.push(""+item+"");
	Total = Number(Total) + Number(price);
	$("#Total").empty();
	$("#Total").append('<strong>Total: R'+Total+'.00</strong>');
}

function RemoveFromCart(item,price)
{
	$("#"+item).hide('fast');
	OrderedItems.splice(item,1);
	Total = Number(Total) - Number(price);
	$("#Total").empty();
	$("#Total").append('<strong>Total: R'+Total+'.00</strong>');
}

function GetMerch(Company)
{
	var url = 'obelix/GetMerch.php?CompID='+Company;
	$('#Merch').empty();
	$.getJSON(url,function(data) {
	$.each(data, function(index, data) 
	{
		$('#Merch').append('<div class="panel panel-default"><div class="panel-heading"><h4>'+data.Name+'</h4></div><div class="panel-body"><center><img src="BackEnd/'+data.URL+'" style="width:80%"/></center><br /><strong>Description:</strong><br />'+data.Description+'<br /><br /><strong style="float:Right">R'+data.Price+'.00</strong></div><div class="panel-footer"><a href = "#Cart" class="btn btn-default" onClick="AddToCart(\''+data.ID+'\',\''+data.Price+'\',\''+data.Name+'\')">Add to Cart</a></div></div>');
	});
	});	
}

function RegisterCompany()
{
	var Email = $('#exampleInputEmail1').val();
	var password = $('#exampleInputPass1').val();
	var CompanyName = $('#exampleInputName1').val();
	$.post('obelix/NewCompany.php?Email='+Email+'&Password='+password+'&CompanyName='+CompanyName,'json');
}

function Login()
{
	var email = $('#exampleInputEmail2').val();
	var password = $('#exampleInputPass2').val();
	var url = 'obelix/GetAuthorisation.php?em='+email+'&Pass='+password;
	$.getJSON(url,function(data) {
	$.each(data, function(index, data) 
	{
		Auth = String(data.Reply);
		if(Auth == 'Approve')
		{
			window.location.href = 'BackEnd/index.php?ID='+data.ID;	
		}
		else
		{
			$('#LoginBody').append('<div class="alert alert-dismissable alert-danger"><strong>Incorrect Email or Password</strong></div>');	
		}
	});
	});
}

function AddToDatabase()
{
	var index;
	var order
	var email = $('#CartEmail').val();
	if($("#ApproveOrder").is(':checked') || $("#CartEmail").val() != '')
	{
		for	(index = 0; index < OrderedItems.length; index++) 
		{
    		$.post('../obelix/AddToDatabase.php?ID='+OrderedItems[index]+'&Email='+email,'json');
			$.post('../obelix/NewOrder.php?Email='+email+'&Order='+OrderedItems[index],'json');
  		}
		//window.location.href = 'index.html';	
	}
	else
	{
		$('#CartNotify').empty();
		$('#CartNotify').append('<center>Please confirm order before submitting</center>');	
	}
			
}