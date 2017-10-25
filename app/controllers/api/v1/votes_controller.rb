class Api::V1::VotesController < ApplicationController

	def create
    # Swaps the points
    @check_vote = Vote.find_by(user_id: vote_params[:user_id], answer_id: vote_params[:answer_id])

    if @check_vote && @check_vote.vote_count == vote_params[:vote_count]
      render json: @check_vote.destroy, status: 202
    elsif @check_vote
      @check_vote.vote_count = vote_params[:vote_count]
      @check_vote.save
      render json: @check_vote, status: 200
    else
      # Tries to create a new vote
      @vote = Vote.create(vote_params)
			# byebug
      if @vote.valid?
				@answer = Answer.find_by(id: params[:answer_id])
				@total_votes = @answer.votes.size
        render json: {total_votes: @total_votes, answer_id: @answer.id}, status: 201
      else
        render json: {status: "Vote is there"}, status: 403
      end
    end
  end

  def destroy
    Vote.find(params[:id]).destroy
  end

	private
  def vote_params
    params.require(:vote).permit(:user_id, :vote_count, :answer_id)
  end

end
