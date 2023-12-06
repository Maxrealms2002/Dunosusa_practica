<?php
require_once "Assets/pdf/fpdf.php";

$total = 0.00;
$pdf = new FPDF('P', 'mm', array(105 , 148));
$pdf->AddPage();
$pdf->setFont('Arial', 'B', 14);
$pdf->setTitle("Reporte de Venta");
$pdf->image(base_url().'Assets/img/6.jpg', 55, 1, 55, 20, 'JPG');
$pdf->setFont('Arial', 'B', 10);
$pdf->Cell(50, 5, utf8_decode($config['nombre']), 0, 1, 'L');
$pdf->Cell(20, 5, utf8_decode("Ruc"), 0, 0, 'L');
$pdf->setFont('Arial', '', 10);
$pdf->Cell(50, 5, utf8_decode($config['ruc']), 0, 1, 'L');
$pdf->setFont('Arial', 'B', 10);
$pdf->Cell(20, 5, utf8_decode("Teléfono"), 0, 0, 'L');
$pdf->setFont('Arial', '', 10);
$pdf->Cell(50, 5, utf8_decode($config['telefono']), 0, 1, 'L');
$pdf->setFont('Arial', 'B', 10);
$pdf->Cell(20, 5, utf8_decode("Dirección"), 0, 0, 'L');
$pdf->setFont('Arial', '', 10);
$pdf->Cell(50, 5, utf8_decode($config['direccion']), 0, 1, 'L');
$pdf->Ln();


$pdf->Ln(10);
$pdf->setFont('Arial', '', 9);
$pdf->SetTextColor(255, 255, 255);
$pdf->Cell(45, 5, utf8_decode('Descripción'), 1, 0, 'L', 1);
$pdf->Cell(10, 5, 'Cant.', 1, 0, 'L', 1);
$pdf->Cell(15, 5, 'Precio', 1, 0, 'L', 1);
$pdf->Cell(20, 5, 'Sub Total', 1, 1, 'L', 1);

// Check if $data is an array before the foreach loop
if (is_array($data)) {
    foreach ($data as $compras) {
        $subtotal = $compras['cantidad'] * $compras['precio'];
        $total = $total + $subtotal;
        $pdf->SetTextColor(0, 0, 0);
        $pdf->Cell(45, 5, utf8_decode($compras['producto']), 0, 0, 'L');
        $pdf->Cell(10, 5, $compras['cantidad'], 0, 0, 'L');
        $pdf->Cell(15, 5, $compras['precio'], 0, 0, 'L');
        $pdf->Cell(20, 5, number_format($subtotal, 2, '.', ','), 0, 1, 'L');
    }
} else {
    // Handle the case where $data is not an array
    $pdf->Cell(0, 5, 'Error: Data is not available.', 0, 1, 'L');
}

$pdf->Ln();
$pdf->Cell(90, 5, 'Total S/.'. number_format( $total, 2, '.', ','), 0, 1, 'R');

$pdf->Output();
?>
