

/*
 * funciones de javascript
 * */
			function verTabla() {
 
    			var tabla=document.getElementById("tablaCargo").firstChild.innerHTML
				alert(tabla.cells[0].childNodes[0].nodeValue);
			}
    		
    		
    		
    		function llenarTablaCargo(id) {
    		/*	
    			var nombreCargo=document.unidad.txtNombreCargo.value
    			var sueldoCargo=document.unidad.txtSueldo.value	
    				
    			var tbody = document.getElementById(id).getElementsByTagName("tbody")[0];
    			            var row = document.createElement("tr")
    			            
    			            var td1 = document.createElement("td")
    			            td1.appendChild(document.createTextNode(nombreCargo))
    			            
    			            var td2 = document.createElement("td")
    			            td2.appendChild(document.createTextNode(sueldoCargo))
    			            
    			       
    			 			row.appendChild(td1);
    			            row.appendChild(td2);
    			            tbody.appendChild(row);*/
    			
    			var tbody = document.getElementById
    			(id).getElementsByTagName("TBODY")[0];
    			
    			var row = document.createElement("TR")
    			
    			var td1 = document.createElement("TD")
    			td1.appendChild(document.createTextNode("columna 1"))
    			
    			var td2 = document.createElement("TD")
    			td2.appendChild (document.createTextNode("columna 2"))
    			
    			var td3 = document.createElement("TD")
    			td3.appendChild (document.createTextNode("columna 3"))
    			
    			row.appendChild(td1).innerHTML="<input type=text>";
    			row.appendChild(td2).innerHTML="<input type=text>";
    			row.appendChild(td3).innerHTML="<input type=checkbox>";
    			tbody.appendChild(row);
    			
    			
    			}
    		
    		 function addRow(tableID) {

 				
    			var nombreCargo=document.equipo.txtNombreCargo.value
     			var sueldoCargo=document.equipo.txtSueldo.value	

                var table = document.getElementById(tableID);

                var rowCount = table.rows.length;

                var row = table.insertRow(rowCount);

                var cell1 = row.insertCell(0);
                var element1 = document.createElement("input");
                element1.type = "checkbox";
                cell1.appendChild(element1);

                var cell2 = row.insertCell(1);
                var element2 = document.createElement("td");
                cell2.appendChild(document.createTextNode(nombreCargo));
                
                
                
                var cell3 = row.insertCell(2);
                var element3 = document.createElement("td");
 				cell3.appendChild(document.createTextNode(sueldoCargo));
                
           }

  

           function deleteRow(tableID) {

                try {

                var table = document.getElementById(tableID);

                var rowCount = table.rows.length;

  

                for(var i=0; i<rowCount; i++) {

                     var row = table.rows[i];

                     var chkbox = row.cells[0].childNodes[0];

                     if(null != chkbox && true == chkbox.checked) {

                          table.deleteRow(i);

                          rowCount--;

                          i--;

                     }

                }

                }catch(e) {

                     alert(e);

                }
           }

           
           function datosTextos() {
        	    // textos = "CONTENIDO_TABLA";
        	   		textos="";
        	     for (var i=1;i < document.getElementById('tablaCargo').rows.length ; i++){
        	             for (var j=1; j<3; j++){
        	                   // textos = textos + document.getElementById('tablaCargo').rows[i].cells[j].innerHTML + " -> ";
        	            	 textos = textos + document.getElementById('tablaCargo').rows[i].cells[j].innerHTML + "\n";
        	             }
        	     } 
        	     alert(textos);
        	}
    		
           
           
           function verCheck(check) {
				
   			var nombreCargo=document.check.chkGestionarLES.value 
   			
   			alert(nombreCargo)
           }
    		
    	
    		