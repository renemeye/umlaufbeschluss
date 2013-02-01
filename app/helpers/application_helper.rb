module ApplicationHelper
	#use in Code: return if you_shall_not_pass
	def you_shall_not_pass
		redirect_to root_path, :notice => "Du bist nicht angemeldet" if current_user.nil?
		logger.debug "You here the sound of an old man shouting and a stone bridge bursting." if current_user.nil?
		return current_user.nil?
	end

  def bootstrap_class_for_flash flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end

	def bootstrap_tr_class_for_voting voting
		case voting
			when "yes"
				"success "+voting
			when "no"
				"error "+voting
			when "abstention"
				"info "+voting
			when "noResult"
				"info "+voting
			when "notVoted"
				" "+voting
			else
				voting
		end
	end

	def german_word_for_voting_result voting
		case voting
			when "yes"
				"Angenommen"
			when "no"
				"Abgelehnt"
			when "abstention"
				"Kein Ergebniss"
			when "noResult"
				"Noch offen"
			when "notVoted"
				"Noch offen"
			else
				voting
		end
	end	
	
	def german_word_for_vote voting
		case voting
			when "yes"
				"Dafuer"
			when "no"
				"Dagegen"
			when "abstention"
				"Enthaltung"
			when "noResult"
				"Nicht abgestimmt"
			when "notVoted"
				"Nicht abgestimmt"
			else
				voting
		end
	end


end
