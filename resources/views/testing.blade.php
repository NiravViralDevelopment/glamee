<!DOCTYPE html>
<html>
<head>
    <title>Add/remove multiple input fields dynamically with Jquery Laravel 5.8</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />  
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body> 
<div class="container">
    <h2 align="center">Add/remove multiple input fields dynamically </h2> 
    <form action="{{ route('store_profile') }}" method="POST"  enctype="multipart/form-data">
        @csrf
        @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
        @if (Session::has('success'))
            <div class="alert alert-success text-center">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                <p>{{ Session::get('success') }}</p>
            </div>
        @endif
        <table class="table table-bordered" id="dynamicTable">  
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Image</th>
                <th>Action</th>
            </tr>
            <tr>  
                <td><input type="text" name="addmore[0][name]" placeholder="Enter your name" class="form-control" /></td>  
                <td><input type="text" name="addmore[0][email]" placeholder="Enter your email" class="form-control" /></td>  
                <td><input type="file" name="addmore[0][image]" placeholder="Enter your image" class="form-control" /></td>  
                <td><button type="button" name="add" id="add" class="btn btn-success">Add More</button></td>  

            </tr>  
        </table> 
        <table class="table table-bordered" >
        @foreach($testing_data as  $testing_key => $testing )
        <tr >  
            <td><input type="text" name="addmore[{{ $testing['id'] }}][name]" value="{{$testing->name}}" placeholder="Enter your Name" class="form-control" /></td>  
            <td><input type="text" name="addmore[{{ $testing['id'] }}][email]" value="{{$testing->email}}" placeholder="Enter your Qty" class="form-control" /></td>  
            <td><input type="file" name="addmore[{{ $testing['id'] }}][image]" value="{{$testing->image}}" placeholder="Enter your Price" class="form-control" /></td>  
            <input type="hidden" value="{{ $testing['id'] }}" name="addmore[{{ $testing['id'] }}][id]" placeholder="Enter your Name" class="form-control" />
            <td><a href="{{route('testing_Delete',$testing->id)}}" name="adxd" id="edit" class="btn btn-danger" onclick="return confirm('Are you sure?')">Delete</button></a>  

        </tr> 
        @endforeach
        </table>

    

          <button type="submit" class="btn btn-success">Save</button><hr>
          

    </form>

    <table class="table table-bordered">
       
    </table>

</div>

   

<script type="text/javascript">

   

    var i = 0;

       

    $("#add").click(function(){

   

        ++i;

   

        $("#dynamicTable").append('<tr><td><input type="text" name="addmore['+i+'][name]" placeholder="Enter your Name" class="form-control" /></td><td><input type="text" name="addmore['+i+'][email]" placeholder="Enter your email" class="form-control" /></td><td><input type="file" name="addmore['+i+'][image]" placeholder="Enter your Price" class="form-control" /></td><td><button type="button" class="btn btn-danger remove-tr">Remove</button></td></tr>');

    });

   

    $(document).on('click', '.remove-tr', function(){  

         $(this).parents('tr').remove();

    });  

   

</script>

  

</body>

</html>