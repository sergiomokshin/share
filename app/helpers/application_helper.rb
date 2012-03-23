#encoding: utf-8

module ApplicationHelper

	def format_boolean(valor)
		if valor 
			retorno = "Sim" 
		else
			retorno =  "Não"			
		end				
	end 

	def format_url(url)
    	/^http/.match(url) ? url : "http://#{url}"
  	end


	def comments(post)
		comments = "<div id='comments'>"
		comments << "<h3>" + t(:comments) + "</h3>"
		comments << render(:partial => "comments/comment",
		:collection => post.comments) unless post.comments.empty?
		comments << "</div>"
		raw comments
	end

	def new_comment(post)
		comments = render(:partial => "comments/new_comment",
		:locals => { :post => post })
		raw comments
	end

	def links(post)
		links = "<div id='links'>"
		links << "<h3>" + t(:links) + "</h3>"
		links << render(:partial => "links/link",
		:collection => post.links) unless post.links.empty?
		links << "</div>"
		raw links
	end

	def new_link(post)
		links = render(:partial => "links/new_link",
		:locals => { :post => post })
		raw links
	end

	def attachments(post)
		attachments = "<div id='attachments'>"
		attachments << "<h3>" + t(:attachments) + "</h3>"
		attachments << render(:partial => "attachments/attachment",
		:collection => post.attachments) unless post.attachments.empty?
		attachments << "</div>"
		raw attachments
	end

	def new_attachment(post)
		attachments = render(:partial => "attachments/new_attachment",
		:locals => { :post => post })
		raw attachments
	end

end