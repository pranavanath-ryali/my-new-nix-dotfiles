{ ... }:
{
    flake.homeModules.defaultWebapps = { self, config, ... }: {
        imports = [
            self.homeModules.webappsModules
        ];

        programs.firefox.webapps.whatsapp = {
            url = "https://web.whatsapp.com/";
            id = 1;

            extraSettings = config.programs.firefox.profiles."tlater".settings;
            backgroundColor = "#202225";

            comment = "WhatsApp is a free, widely used mobile messaging app (owned by Meta) that uses an internet connection to send encrypted text messages, documents, images, and videos, as well as make voice/video calls globally.";
            genericName = "Internet Messenger";
            categories = [ "Network" "InstantMessaging" ];
        };
    };
}
