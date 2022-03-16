module Interact

using Reexport

@reexport using InteractBase
import InteractBase: notifications
import Widgets: Widget, @layout, @nodeps
import Observables: @on, @map!, @map

@reexport using OrderedCollections
@reexport using Observables
@reexport using Knockout
@reexport using CSSUtil
@reexport using WebIO
@reexport using Widgets
using RelocatableFolders, Memoize

struct Bulma<:InteractBase.WidgetTheme; end

folder_dir = @path joinpath(@__DIR__, "..")
notebookdir = joinpath(folder_dir, "doc", "notebooks")

@memoize bulma_css() = joinpath(folder_dir, "assets", "bulma.min.css")
@memoize bulma_confined_css() = joinpath(folder_dir, "assets", "bulma_confined.min.css")

function InteractBase.libraries(::Bulma)
    bulmalib = InteractBase.isijulia() ? bulma_confined_css() : bulma_css()
    vcat(InteractBase.font_awesome(), InteractBase.style_css(), bulmalib)
end

function __init__()
    InteractBase.registertheme!(:bulma, Bulma())
    settheme!(Bulma())
    nothing
end

end
