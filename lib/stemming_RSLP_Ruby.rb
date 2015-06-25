require 'ffi'

class Stemming_RSLP_Ruby

# Config static variables
CONFIG= "DO_STEMMING=YES
REPLACE_ISO_CHARS=YES
USE_STEM_DICTIONARY=YES
USE_NAMED_ENTITIES=YES
NAMED_ENTITIES_FILE=entidades_nomeadas.txt
STEM_DICT_MAX_SIZE=300
NAMED_ENTITIES_DICT_MAX_SIZE=50"

    # Filter class encapsulates filter logic to be applied on selector content
    extend FFI::Library

    ffi_lib (File.join(__dir__, '/wraprslp.so.1.0'))
    attach_function :wrap_rslpLoadStemmer, [:string], :void
    attach_function :wrap_rslpWord, [:string], :string
    attach_function :wrap_rslpUnloadStemmer, [], :void

    def self.applyStemmerPT(text)

        # See if config file is created
        configFile = File.open((File.join(__dir__, '/rslpconfig.txt')), "r")

        if configFile.read.empty?

            # Create config file for first time
            File.open((File.join(__dir__, '/rslpconfig.txt')), 'w') { |file| file.write("STEPS_FILE=" << (File.join(__dir__, '/steprules.txt')) << "\n") }
            File.open((File.join(__dir__, '/rslpconfig.txt')), 'a') { |file| file.write(CONFIG) }

        end
        # Load config
        Stemming_RSLP_Ruby.wrap_rslpLoadStemmer((File.join(__dir__, '/rslpconfig.txt')))

        # return stem word
        return wrap_rslpWord(text.encode(Encoding::ISO_8859_1))
    end

end
