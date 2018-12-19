-- This is a generic starting class for void safe EV applications.
-- The following variables need to be adjusted for each application
-- minimum_height  -- Height of the application window
-- minimum_width   -- Width of the application window
-- window_title    -- The title for the window
-- the_application -- Change the type for the main controller
                   -- for the application.
                   -- The start feature is "make_and_launch"
note
  description: "Generic starting class for EV applications"
  author: "Eiffel example"
  date: "2009 November 17"
  adapted: "2013 January 7"
  revision: "V1.0"

class APPLICATION
  inherit EV_APPLICATION
    redefine create_interface_objects end

create make_and_launch

--------------------------------------------------------------------------------
-- Replace the constants as needed.
feature {NONE} -- Constants

minimum_height: INTEGER = 500   -- minimum height of the window
minimum_width: INTEGER = 350    -- minimum width of the window.
window_title: STRING = "Calculator"

--------------------------------------------------------------------------------
-- Replace the `the_application' type as needed.
feature {NONE} -- Implementation

main_window: EV_TITLED_WINDOW   -- Main (first) window for the application.
the_application: CALCULATOR_VIEW_CONTROLLER

--------------------------------------------------------------------------------
feature {NONE} -- Initialization

make_and_launch
    -- Create `Current', build and display `main_window',
    -- then launch the application.
  do
    default_create
    main_window.set_title (window_title)
    main_window.set_minimum_height (minimum_height)
    main_window.set_minimum_width (minimum_width)

      -- Connect the `destroy' routine to `close_request_actions' of
      -- the`main_window' so that when a user attempts to close the window,
      -- `Current' will be destroyed.

    main_window.close_request_actions.extend (agent destroy)
    main_window.extend (the_application.widget)
    main_window.show
    the_application.initialize

      -- Start running the event loop.
    launch
  end

create_interface_objects
  do
    create main_window
    create the_application
  end

end
