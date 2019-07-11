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
        class RoomContext < InstanceContext
          class ParticipantContext < InstanceContext
            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class SubscribeRulesList < ListResource
              ##
              # Initialize the SubscribeRulesList
              # @param [Version] version Version that contains the resource
              # @param [String] room_sid The unique Room identifier for the Subscribe Rules
              # @param [String] participant_sid The unique Participant identifier for the
              #   Subscribe Rules.
              # @return [SubscribeRulesList] SubscribeRulesList
              def initialize(version, room_sid: nil, participant_sid: nil)
                super(version)

                # Path Solution
                @solution = {room_sid: room_sid, participant_sid: participant_sid}
                @uri = "/Rooms/#{@solution[:room_sid]}/Participants/#{@solution[:participant_sid]}/SubscribeRules"
              end

              ##
              # Fetch a SubscribeRulesInstance
              # @return [SubscribeRulesInstance] Fetched SubscribeRulesInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                SubscribeRulesInstance.new(
                    @version,
                    payload,
                    room_sid: @solution[:room_sid],
                    participant_sid: @solution[:participant_sid],
                )
              end

              ##
              # Update the SubscribeRulesInstance
              # @param [Hash] rules A JSON-encoded array of Subscribe Rules. See the [Specifying
              #   Subscribe
              #   Rules](https://www.twilio.com/docs/video/api/track-subscriptions#specifying-sr)
              #   section for further information.
              # @return [SubscribeRulesInstance] Updated SubscribeRulesInstance
              def update(rules: :unset)
                data = Twilio::Values.of({'Rules' => Twilio.serialize_object(rules), })

                payload = @version.update(
                    'POST',
                    @uri,
                    data: data,
                )

                SubscribeRulesInstance.new(
                    @version,
                    payload,
                    room_sid: @solution[:room_sid],
                    participant_sid: @solution[:participant_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Video.V1.SubscribeRulesList>'
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class SubscribeRulesPage < Page
              ##
              # Initialize the SubscribeRulesPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [SubscribeRulesPage] SubscribeRulesPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of SubscribeRulesInstance
              # @param [Hash] payload Payload response from the API
              # @return [SubscribeRulesInstance] SubscribeRulesInstance
              def get_instance(payload)
                SubscribeRulesInstance.new(
                    @version,
                    payload,
                    room_sid: @solution[:room_sid],
                    participant_sid: @solution[:participant_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Video.V1.SubscribeRulesPage>'
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class SubscribeRulesInstance < InstanceResource
              ##
              # Initialize the SubscribeRulesInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] room_sid The unique Room identifier for the Subscribe Rules
              # @param [String] participant_sid The unique Participant identifier for the
              #   Subscribe Rules.
              # @return [SubscribeRulesInstance] SubscribeRulesInstance
              def initialize(version, payload, room_sid: nil, participant_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'participant_sid' => payload['participant_sid'],
                    'room_sid' => payload['room_sid'],
                    'rules' => payload['rules'],
                    'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                    'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                }
              end

              ##
              # @return [String] The unique Participant identifier for the Subscribe Rules.
              def participant_sid
                @properties['participant_sid']
              end

              ##
              # @return [String] The unique Room identifier for the Subscribe Rules
              def room_sid
                @properties['room_sid']
              end

              ##
              # @return [String] A collection of Subscribe Rules to include or exclude matching Tracks.
              def rules
                @properties['rules']
              end

              ##
              # @return [Time] The date that this resource was created.
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The date that this resource was last updated.
              def date_updated
                @properties['date_updated']
              end

              ##
              # Provide a user friendly representation
              def to_s
                "<Twilio.Video.V1.SubscribeRulesInstance>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                "<Twilio.Video.V1.SubscribeRulesInstance>"
              end
            end
          end
        end
      end
    end
  end
end