React = require 'react'
Nav = React.createFactory require 'antwar-default-theme/Nav'
Paths = require('antwar-core/PathsMixin')
require 'antwar-default-theme/scss/main.scss'

Footer = React.createFactory require '../components/Footer'

# XXX: this can get compiled before latter... figure out how to forcei order
#require 'react-ghfork/gh-fork-ribbon.ie.css' # ie support
require 'react-ghfork/gh-fork-ribbon.css'
Fork = React.createFactory(require 'react-ghfork')
Config = require 'config'

{ div, main, script, link, footer } = require 'react-coffee-elements'

config = require 'config'
if config.theme.customStyles?
  require 'customStyles/' + config.theme.customStyles

module.exports = React.createClass

    displayName: 'Body'

    mixins: [
        Paths
    ]

    render: ->
        sectionName = @getSectionName()

        itemTitle = @getItem().title;

        div { },
            if sectionName and sectionName != '/'
                Nav({items: Config.theme.navigation(sectionName)})

            if sectionName and sectionName != '/'
                Fork { className: 'right ribbon', project: "survivejs/webpack_react/issues/new?title=#{itemTitle} - ", text: 'Submit feedback', style: {backgroundColor: 'black'}, target: '_blank'}

            main { role: 'main' }, @props.children

            # show footer only for index
            if not sectionName
                footer { },
                    Footer()
