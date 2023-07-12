function deleteSuscripcion(id) {   
    Swal.fire({
        title: 'Confirmar',
        text: '¿Estás seguro que deseas eliminar la suscripción?',
        icon: 'info',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Eliminar'
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire('Eliminado', 'Suscripción eliminada correctamente', 'success').then(() => {
                window.location.href = '/deleteSuscripcion/' + id + '/';
            });
        }
    });
}
