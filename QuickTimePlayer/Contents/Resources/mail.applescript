-- dynamicCall publish("[[QTExpNameOut]]")

on publish(attachedFilePath)
	tell application "Mail"
		set new_message to make new outgoing message
		tell new_message
			set visible to true
			make new to recipient at end of to recipients
			tell content
				make new attachment with properties {file name:attachedFilePath} at after the last paragraph
			end tell
		end tell
		activate
	end tell
end publish
