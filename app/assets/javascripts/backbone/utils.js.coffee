window.utils =

    displayValidationErrors: (messages) ->
      for key of messages
        if messages.hasOwnProperty(key)
          this.addValidationError(key, messages[key])
      this.showAlert('Warning!', 'Fix validation errors and try again', 'alert-warning')

    addValidationError: (field, message) ->
      controlGroup = $('#' + field).parent().parent()
      controlGroup.addClass('error')
      $('.help-inline', controlGroup).html(message[0])

    removeValidationError: (field) ->
      controlGroup = $('#' + field).parent().parent()
      controlGroup.removeClass('error')
      $('.help-inline', controlGroup).html('')

    showAlert: (title, text, klass) ->
        $('.alert').removeClass("alert-error alert-warning alert-success alert-info")
        $('.alert').addClass(klass)
        $('.alert').html('<strong>' + title + '</strong> ' + text)
        $('.alert').show

    hideAlert: ->
        $('.alert').hide
