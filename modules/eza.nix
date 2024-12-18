{ pkgs, ... }:
{
	programs.eza = {
		enable = true;
		git = true;
		icons = "auto";
		extraOptions = [
			  "--group-directories-first"
			  "--header"
		];
		enableZshIntegration = true;
	};
}
