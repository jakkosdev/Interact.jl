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
using RelocatableFolders

struct Bulma<:InteractBase.WidgetTheme; end

const notebookdir = @path joinpath(@__DIR__, "..", "doc", "notebooks")

const bulma_css = @path joinpath(@__DIR__, "..", "assets", "bulma.min.css")
const bulma_confined_css = @path joinpath(@__DIR__, "..", "assets", "bulma_confined.min.css")

function InteractBase.libraries(::Bulma)
    bulmalib = InteractBase.isijulia() ? bulma_confined_css : bulma_css
    vcat(InteractBase.font_awesome, InteractBase.style_css, bulmalib)
end

function __init__()
    InteractBase.registertheme!(:bulma, Bulma())
    settheme!(Bulma())
    nothing
end

end
