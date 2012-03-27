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

	def break_line(field)
  		field.gsub(/\n/, '<br>')
	end

	def comments(post)
		comments = "<div id='comments'>"
		comments << "<h1>" + t(:comments) + "</h1>"
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
		links << "<h1>" + t(:links) + "</h1>"
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
		attachments << "<h1>" + t(:attachments) + "</h1>"
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

	def post_users(post)
		post_users = "<div id='post_users'>"
		post_users << "<h1>" + t(:users) +"</h1>"
		
		post.users.each do |user|			
			post_users << render(:partial => "post_users/post_user",
			:locals => { :user => user, :post => post})
		end

		#post_users << render(:partial => "post_users/post_user",
		#:collection => post.users) unless post.users.empty?

		post_users << "</div>"
		raw post_users
	end

	def new_post_user(post)
		post_users = render(:partial => "post_users/new_post_user",
		:locals => { :post => post })
		raw post_users
	end	

end
