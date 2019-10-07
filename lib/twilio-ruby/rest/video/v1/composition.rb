##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Video < Domain
      class V1 < Version
        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CompositionList < ListResource
          ##
          # Initialize the CompositionList
          # @param [Version] version Version that contains the resource
          # @return [CompositionList] CompositionList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Compositions"
          end

          ##
          # Lists CompositionInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [composition.Status] status Read only Composition resources with this
          #   status. Can be: `enqueued`, `processing`, `completed`, `deleted`, or `failed`.
          # @param [Time] date_created_after Read only Composition resources created on or
          #   after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date-time with
          #   time zone.
          # @param [Time] date_created_before Read only Composition resources created before
          #   this ISO 8601 date-time with time zone.
          # @param [String] room_sid Read only Composition resources with this Room SID.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(status: :unset, date_created_after: :unset, date_created_before: :unset, room_sid: :unset, limit: nil, page_size: nil)
            self.stream(
                status: status,
                date_created_after: date_created_after,
                date_created_before: date_created_before,
                room_sid: room_sid,
                limit: limit,
                page_size: page_size
            ).entries
          end

          ##
          # Streams CompositionInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [composition.Status] status Read only Composition resources with this
          #   status. Can be: `enqueued`, `processing`, `completed`, `deleted`, or `failed`.
          # @param [Time] date_created_after Read only Composition resources created on or
          #   after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date-time with
          #   time zone.
          # @param [Time] date_created_before Read only Composition resources created before
          #   this ISO 8601 date-time with time zone.
          # @param [String] room_sid Read only Composition resources with this Room SID.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(status: :unset, date_created_after: :unset, date_created_before: :unset, room_sid: :unset, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(
                status: status,
                date_created_after: date_created_after,
                date_created_before: date_created_before,
                room_sid: room_sid,
                page_size: limits[:page_size],
            )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields CompositionInstance records from the API.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          def each
            limits = @version.read_limits

            page = self.page(page_size: limits[:page_size], )

            @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
          end

          ##
          # Retrieve a single page of CompositionInstance records from the API.
          # Request is executed immediately.
          # @param [composition.Status] status Read only Composition resources with this
          #   status. Can be: `enqueued`, `processing`, `completed`, `deleted`, or `failed`.
          # @param [Time] date_created_after Read only Composition resources created on or
          #   after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date-time with
          #   time zone.
          # @param [Time] date_created_before Read only Composition resources created before
          #   this ISO 8601 date-time with time zone.
          # @param [String] room_sid Read only Composition resources with this Room SID.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of CompositionInstance
          def page(status: :unset, date_created_after: :unset, date_created_before: :unset, room_sid: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'Status' => status,
                'DateCreatedAfter' => Twilio.serialize_iso8601_datetime(date_created_after),
                'DateCreatedBefore' => Twilio.serialize_iso8601_datetime(date_created_before),
                'RoomSid' => room_sid,
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            CompositionPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of CompositionInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of CompositionInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            CompositionPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of CompositionInstance records from the API.
          # Request is executed immediately.
          # @param [String] room_sid The SID of the Group Room with the media tracks to be
          #   used as composition sources.
          # @param [Hash] video_layout An object that describes the video layout of the
          #   composition in terms of regions. See [Specifying Video
          #   Layouts](https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts) for more info.
          # @param [String] audio_sources An array of track names from the same group room
          #   to merge into the new composition. Can include zero or more track names. The new
          #   composition includes all audio sources specified in `audio_sources` except for
          #   those specified in `audio_sources_excluded`. The track names in this parameter
          #   can include an asterisk as a wild card character, which will match zero or more
          #   characters in a track name. For example, `student*` includes `student` as well
          #   as `studentTeam`.
          # @param [String] audio_sources_excluded An array of track names to exclude. The
          #   new composition includes all audio sources specified in `audio_sources` except
          #   for those specified in `audio_sources_excluded`. The track names in this
          #   parameter can include an asterisk as a wild card character, which will match
          #   zero or more characters in a track name. For example, `student*` excludes
          #   `student` as well as `studentTeam`. This parameter can also be empty.
          # @param [String] resolution A string that describes the columns (width) and rows
          #   (height) of the generated composed video in pixels. Defaults to `640x480`.
          #   The string's format is `{width}x{height}` where:
          #
          #   * 16 <= `{width}` <= 1280
          #   * 16 <= `{height}` <= 1280
          #   * `{width}` * `{height}` <= 921,600
          #
          #   Typical values are:
          #
          #   * HD = `1280x720`
          #   * PAL = `1024x576`
          #   * VGA = `640x480`
          #   * CIF = `320x240`
          #
          #   Note that the `resolution` imposes an aspect ratio to the resulting composition.
          #   When the original video tracks are constrained by the aspect ratio, they are
          #   scaled to fit. See [Specifying Video
          #   Layouts](https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts) for more info.
          # @param [composition.Format] format The container format of the composition's
          #   media files. Can be: `mp4` or `webm` and the default is `webm`. If you specify
          #   `mp4` or `webm`, you must also specify one or more `audio_sources` and/or a
          #   `video_layout` element that contains a valid `video_sources` list, otherwise an
          #   error occurs.
          # @param [String] status_callback The URL we should call using the
          #   `status_callback_method` to send status information to your application on every
          #   composition event. If not provided, status callback events will not be
          #   dispatched.
          # @param [String] status_callback_method The HTTP method we should use to call
          #   `status_callback`. Can be: `POST` or `GET` and the default is `POST`.
          # @param [Boolean] trim Whether to clip the intervals where there is no active
          #   media in the composition. The default is `true`. Compositions with `trim`
          #   enabled are shorter when the Room is created and no Participant joins for a
          #   while as well as if all the Participants leave the room and join later, because
          #   those gaps will be removed. See [Specifying Video
          #   Layouts](https://www.twilio.com/docs/video/api/compositions-resource#specifying-video-layouts) for more info.
          # @return [CompositionInstance] Newly created CompositionInstance
          def create(room_sid: nil, video_layout: :unset, audio_sources: :unset, audio_sources_excluded: :unset, resolution: :unset, format: :unset, status_callback: :unset, status_callback_method: :unset, trim: :unset)
            data = Twilio::Values.of({
                'RoomSid' => room_sid,
                'VideoLayout' => Twilio.serialize_object(video_layout),
                'AudioSources' => Twilio.serialize_list(audio_sources) { |e| e },
                'AudioSourcesExcluded' => Twilio.serialize_list(audio_sources_excluded) { |e| e },
                'Resolution' => resolution,
                'Format' => format,
                'StatusCallback' => status_callback,
                'StatusCallbackMethod' => status_callback_method,
                'Trim' => trim,
            })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            CompositionInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Video.V1.CompositionList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CompositionPage < Page
          ##
          # Initialize the CompositionPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [CompositionPage] CompositionPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of CompositionInstance
          # @param [Hash] payload Payload response from the API
          # @return [CompositionInstance] CompositionInstance
          def get_instance(payload)
            CompositionInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Video.V1.CompositionPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CompositionContext < InstanceContext
          ##
          # Initialize the CompositionContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The SID of the Composition resource to fetch.
          # @return [CompositionContext] CompositionContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Compositions/#{@solution[:sid]}"
          end

          ##
          # Fetch a CompositionInstance
          # @return [CompositionInstance] Fetched CompositionInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            CompositionInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Deletes the CompositionInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
            @version.delete('delete', @uri)
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Video.V1.CompositionContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Video.V1.CompositionContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CompositionInstance < InstanceResource
          ##
          # Initialize the CompositionInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The SID of the Composition resource to fetch.
          # @return [CompositionInstance] CompositionInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'status' => payload['status'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_completed' => Twilio.deserialize_iso8601_datetime(payload['date_completed']),
                'date_deleted' => Twilio.deserialize_iso8601_datetime(payload['date_deleted']),
                'sid' => payload['sid'],
                'room_sid' => payload['room_sid'],
                'audio_sources' => payload['audio_sources'],
                'audio_sources_excluded' => payload['audio_sources_excluded'],
                'video_layout' => payload['video_layout'],
                'resolution' => payload['resolution'],
                'trim' => payload['trim'],
                'format' => payload['format'],
                'bitrate' => payload['bitrate'].to_i,
                'size' => payload['size'].to_i,
                'duration' => payload['duration'].to_i,
                'url' => payload['url'],
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [CompositionContext] CompositionContext for this CompositionInstance
          def context
            unless @instance_context
              @instance_context = CompositionContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] The SID of the Account that created the resource
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [composition.Status] The status of the composition
          def status
            @properties['status']
          end

          ##
          # @return [Time] The ISO 8601 date and time in GMT when the resource was created
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] Date when the media processing task finished
          def date_completed
            @properties['date_completed']
          end

          ##
          # @return [Time] The ISO 8601 date and time in GMT when the composition generated media was deleted
          def date_deleted
            @properties['date_deleted']
          end

          ##
          # @return [String] The unique string that identifies the resource
          def sid
            @properties['sid']
          end

          ##
          # @return [String] The SID of the Group Room that generated the audio and video tracks used in the composition
          def room_sid
            @properties['room_sid']
          end

          ##
          # @return [String] The array of track names to include in the composition
          def audio_sources
            @properties['audio_sources']
          end

          ##
          # @return [String] The array of track names to exclude from the composition
          def audio_sources_excluded
            @properties['audio_sources_excluded']
          end

          ##
          # @return [Hash] An object that describes the video layout of the composition
          def video_layout
            @properties['video_layout']
          end

          ##
          # @return [String] The dimensions of the video image in pixels expressed as columns (width) and rows (height)
          def resolution
            @properties['resolution']
          end

          ##
          # @return [Boolean] Whether to remove intervals with no media
          def trim
            @properties['trim']
          end

          ##
          # @return [composition.Format] The container format of the composition's media files as specified in the POST request that created the Composition resource
          def format
            @properties['format']
          end

          ##
          # @return [String] The average bit rate of the composition's media
          def bitrate
            @properties['bitrate']
          end

          ##
          # @return [String] The size of the composed media file in bytes
          def size
            @properties['size']
          end

          ##
          # @return [String] The duration of the composition's media file in seconds
          def duration
            @properties['duration']
          end

          ##
          # @return [String] The absolute URL of the resource
          def url
            @properties['url']
          end

          ##
          # @return [String] The URL of the media file associated with the composition
          def links
            @properties['links']
          end

          ##
          # Fetch a CompositionInstance
          # @return [CompositionInstance] Fetched CompositionInstance
          def fetch
            context.fetch
          end

          ##
          # Deletes the CompositionInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
            context.delete
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Video.V1.CompositionInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Video.V1.CompositionInstance #{values}>"
          end
        end
      end
    end
  end
end