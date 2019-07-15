from toggl import api, utils
import pendulum

# Custom config from existing file
config = utils.Config.factory('/Users/josejavier/.togglrc')

# Get Current entry
current_time_entry = api.TimeEntry.objects.current()

if current_time_entry is not None:
    duration = pendulum.now() - current_time_entry.start
    duration_s = f"{duration.hours}:{duration.minutes:02d}"
    description = current_time_entry.description

    try:
        project = current_time_entry.project.name
    except:
        project = None

    print(f"\u23F1{duration_s}")
    print("---")
    print(f"{description}")
    if project is not None:
        print(f"Project: {project}")
