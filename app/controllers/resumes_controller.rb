class ResumesController < ApplicationController
   def index
      @resumes = Resume.all
      @resumenew = Resume.new
   end

   def new
      @resume = Resume.new
   end

   def create
      @resume = Resume.new(resume_params)
      @resume.name="noname"
      if @resume.save
         redirect_to resumes_path, notice: "#{@resume.attachment.file.filename} 가 업로드 되었습니다."
      else
         redirect_to :root, notice: "파일을 올려주세요."
      end

   end

   def destroy
      @resume = Resume.find(params[:id])
      @resume.destroy
      redirect_to resumes_path, notice:  "#{@resume.attachment.file.filename} 가 삭제 되었습니다."
   end

   private
      def resume_params
          params.require(:resume).permit(:name, :attachment)

      end

end
