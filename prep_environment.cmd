@ECHO OFF

echo Making hard junction links to siege core within mission folders...

for /d %%i in (*) do (
	IF /I "%%i" == "Siege_Core" (
		echo Skipping Siege_Core...
	) else (
		IF /I "%%i" == "tools" (
			echo Skipping Tools...
		) else (
			echo Adding Siege_Core to %%i
			mklink /j ".\%%i\Siege_Core" ".\Siege_Core\"
		)
	)
)

PAUSE