from flask import Blueprint, render_template

dashboard_cli = Blueprint('Bluedashboardcliente',__name__)

@dashboard_cli.route('/dashboardcliente')
def dashboardcliente():
    return render_template('/dashboardCliente.html')