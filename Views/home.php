<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="<?php echo base_url(); ?>Assets/css/bootstrap.min.css">
</head>

<style>
    body {
        background: url("<?php echo base_url(); ?>/Assets/img/4.jpg") no-repeat center center fixed;
        background-size: cover;
    }
</style>

<body>
    <div class="container">
        <div class="row mt-3">
            <div class="col-lg-4 m-auto">
                <div class="card mt-5">
                    <div class="card-header bg-primary text-center">
                        <strong class="text-white">Iniciar Sesión</strong><br>
                    </div>
                    <div class="card-body">
                        <?php if (isset($_GET['msg'])) { ?>
                            <div class="alert alert-danger" role="alert">
                                <strong>Usuario o contraseña Incorrecta</strong>
                            </div>
                        <?php } ?>
                        <form action="<?php echo base_url(); ?>Usuarios/login" method="post" autocomplete="off">
                            <div class="form-group">
                                <strong class="text-primary">Usuario</strong>
                                <input id="usuario" class="form-control" type="text" name="usuario" placeholder="Usuario">
                            </div>
                            <div class="form-group">
                                <strong class="text-primary">Contraseña</strong>
                                <input id="clave" class="form-control" type="password" name="clave" placeholder="Contraseña">
                            </div>
                            <button class="btn btn-primary btn-block" type="submit">Iniciar</button>
                        </form>
                        <br>
                        <?php
                            // Incluye el contenido del archivo recovery.html
                            include('recovery.html');
                        ?>

                        <!-- Botón para abrir la ventana modal -->
                        <span class="btn btn-transparent btn-block text-info" data-toggle="modal" data-target="#successModal">
                        <mark> Olvidaste tu contraseña</mark>  click aqui
                        </span>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts de Bootstrap y jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.4.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
