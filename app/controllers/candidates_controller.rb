class CandidatesController < ApplicationController
	before_action	:find_candidate, only: [:show, :edit, :update, :destroy, :vote]
	# before_action	:find_candidate, except: [:index, :new, :create] #除了

	def index
		@number = "number = #{[*1..100].sample}"
		@candidates = Candidate.all
	end

	def new
		@candidate = Candidate.new
	end

	def edit
		# find_candidate
	end

	def show
		# find_candidate
	end

	def destroy
		# find_candidate
		@candidate.destroy
		redirect_to candidates_path, notice: "#{params[:id]}號刪除成功"
	end

	def create
		# 中斷點 debugger

		# 預設只存入指定欄位
		clean_params = candidate_params

		# params[:candidate][:name]
		@candidate = Candidate.new(clean_params)
		if @candidate.save
			flash[:notice] = "新增成功"
			redirect_to candidates_path
			# redirect_to candidates_path, notice: "新增成功"
		else
			render :new
		end
	end

	def update
		find_candidate

		# clean_params = params.require(:candidate).permit(:name, :age, :gender, :party)

		if @candidate.update(candidate_params)
			flash[:notice] = "編輯成功"
			redirect_to candidates_path
		else
			render :edit
		end
	end

	def vote
		@candidate.vote = @candidate.vote.to_i + 1
		@candidate.save
		flash[:notice] = "投票成功"
		redirect_to candidates_path
	end

	private 
	def find_candidate
		@candidate = Candidate.find_by(id: params[:id])
	end

	def candidate_params
		# 預設只存入指定欄位
		clean_params = params.require(:candidate).permit(:name, :age, :gender, :party, :msg)
	end
end
