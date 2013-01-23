module PostalMethods
  
  module SendPostcard
    
    def send_postcard_and_address_advanced(opts)
      raise PostalMethods::NoPreparationException unless self.prepared 
      #Add in any default settings
      opts = get_settings().merge(opts)
      rv = @rpc_driver.sendPostcardAndAddress(opts)
      
      #Handle the return value
      status_code = rv.sendPostcardAndAddressResult.to_i
      if status_code > 0
        return status_code
      elsif API_STATUS_CODES.has_key?(status_code)
        instance_eval("raise APIStatusCode#{status_code.to_s.gsub(/( |\-)/,'')}Exception")
      end
    end

    def send_postcard_and_address(image_side_filename, address_side_filename, address, description="Sent at #{Time.now()}", work_mode = "Default")
      raise PostalMethods::NoPreparationException unless self.prepared 

      if( image_side_filename.index("MyFile:") )
        is_name = image_side_filename
      else
        is_name = upload_file(image_side_filename)
      end
      if(address_side_filename.index("MyFile:") )
        as_name = address_side_filename
      else
        as_name = upload_file(address_side_filename)
      end

      ## push a postcard over the api
      opts = {
        :MyDescription => description,
        :ImageSideFileType => is_name,
        :AddressSideFileType => as_name
      }

      opts.merge!(address)
      return send_postcard_and_address_advanced(opts)
    end

    def get_settings
      return {
        :APIKey=> self.api_key,
        :WorkMode => self.work_mode,
        :ImageSideScaling => self.imageSideScaling,
        :PrintColor=>self.printColor,
        :PostcardSize=>self.postcardSize,
        :MailingPriority=>self.mailingPriority
      }
    end
    
    def upload_file(doc, description="", overwrite=true, work_mode="") 
      if doc.class == String
        opts = upload_file_options_with_strings(doc, description, overwrite, work_mode)
      else
        opts = upload_file_options_with_hash(doc)
      end

      status_code = self.rpc_driver.uploadFile(opts).uploadFileResult

      if status_code == "-3000"
        return "MyFile:#{opts[:MyFileName]}"
      elsif API_STATUS_CODES.has_key?(status_code)
        instance_eval("raise APIStatusCode#{status_code.to_s.gsub(/( |\-)/,'')}Exception")
      end
    end

    def upload_file_options_with_strings(doc_name, description="", overwrite=true, work_mode="") 
      file_name=File.basename(doc_name)
      file_data = open(doc_name, "rb") {|io| io.read } 
      opts = {
         :APIKey => self.api_key,
	       :MyFileName => file_name,
	       :FileBinaryData => file_data,
	       :Permissions => self.permissions,
	       :MyDescription => description,
	       :Overwrite => overwrite
      }
      return opts
    end

    def upload_file_options_with_hash(user_opts)
      #Add in the api key
      user_opts.merge!({:APIKey=> self.api_key})
      return user_opts
    end


  end
  
end
