class VotesController < ApplicationController
  # Intended as a JSON endpoint
  def create_or_update
    Vote.create_or_update(
      post_id: params[:vote][:post_id],
      vector: params[:vote][:vector]
    )
  end
end
