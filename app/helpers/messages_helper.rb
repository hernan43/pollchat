module MessagesHelper
  def get_existing_or_random_color(nick)
    # copied a bunch of the tango color scheme colors
    colors = [
      '#fec94f',
      '#edd400',
      '#c4a000',
      '#fcaf3e',
      '#f57900',
      '#ce5c00',
      '#e9b96e',
      '#c17d11',
      '#8f5902',
      '#8ae234',
      '#73d216',
      '#4e9a06',
      '#729fcf',
      '#3465a4',
      '#204a87',
      '#ad7fa8',
      '#75507b',
      '#5c3566',
      '#cf2929',
      '#cc0000',
      '#a40000',
      '#eeeeec',
      '#d3d7cf',
      '#babdb6'
      ]

      # use existing color or set it to a random one
      session[nick] = session[nick] || colors[rand(colors.length)]
  end
end
