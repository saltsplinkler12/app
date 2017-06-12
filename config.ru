require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require_relative './controller/expense_controller.rb'
require_relative './model/expenses.rb'
require 'pry'

use Rack::MethodOverride

run ExpenseController