function iniciarEventos(){

}

function listarPedidos(){
    try {
        const telefono = localStorage.getItem("telefono");
        fetch("../server/.....", {
            method: "POST",
            body: JSON.stringify({ 
                telefono: telefono.value,
            }),
            headers: {
                "Content-Type": "application/json"
            }
        })
            .then(response => response.json())
            .then(data => {
                const respuestaPeticion = document.getElementById("respuestaPeticion");
                const avisoPeticon = document.createElement("p");
                respuestaPeticion.innerHTML = "";

                if(data[0].msg === "Creada"){
                    avisoPeticon.setAttribute("class", "w-full text-center rounded text-green-600 bg-green-200 py-2");
                    avisoPeticon.textContent = "Se ha creado correctamente la petición. Revisa el correo para recibir respuesta";
                    respuestaPeticion.appendChild(avisoPeticon);
                }else{
                    avisoPeticon.setAttribute("class", "w-full text-center rounded text-red-600 bg-red-200 py-2");
                    avisoPeticon.textContent = "No se ha podido crear la petición correctamente. Inténtalo de nuevo.";
                    respuestaPeticion.appendChild(avisoPeticon);
                }
            })
            .catch(error => {
                console.error("Error: No se ha podido crear la petición ->", error);
            });
    } catch (e) {
        
    }
}

