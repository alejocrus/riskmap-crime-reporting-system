from flask import Blueprint, render_template

dashboard_rm = Blueprint('dashboard',__name__)

@dashboard_rm.route('/dashboard')
def dashboard():
    return render_template('/dashboard.html')