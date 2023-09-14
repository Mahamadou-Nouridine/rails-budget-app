class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create
    user = current_user
    @transaction = Transaction.new(params.require(:transaction).permit(:name, :amount))
    @transaction.author = user
    @category_transaction = CategoryTransaction.new(expense: @transaction, category_id: params[:category_id])

    if @transaction.save && @category_transaction.save
      if params[:categorys]
        params[:categorys].each do |category_id|
          CategoryTransaction.create(expense: @transaction, category_id: category_id)
        end
      end
      redirect_to category_path(params[:category_id]), notice: 'Transaction created successfully'
    else
      redirect_to category_path(params[:category_id]), alert: 'An error occured when creating the transaction'
    end
  end
end
