from flask import Blueprint, render_template

dashboard_admin = Blueprint('Bludashboardadmin',__name__)

@dashboard_admin.route('/dashboardadmin')
def dashboardadmin():
    return render_template('/dashboardAdmin.html')