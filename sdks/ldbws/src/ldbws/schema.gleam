import gleam/dynamic/decode
import gleam/json
import gleam/option.{type Option, None}

pub type XmlSerializerNamespaces {
  XmlSerializerNamespaces(count: Option(Int))
}

pub type ToiletAvailabilityType {
  ToiletAvailabilityType(value: Option(String), status: Option(String))
}

pub type Nrccmessage {
  Nrccmessage(value: Option(String))
}

pub type CoachData {
  CoachData(
    number: Option(String),
    toilet: Option(ToiletAvailabilityType),
    loading_specified: Option(Bool),
    loading: Option(Int),
    coach_class: Option(String),
  )
}

pub type ServiceItemDiversionBetweenStart {
  ServiceItemDiversionBetweenStart(crs: Option(String), value: Option(String))
}

pub type DeparturesBoard {
  DeparturesBoard(
    location_name: Option(String),
    generated_at: Option(String),
    crs: Option(String),
    filtercrs: Option(String),
    nrcc_messages: Option(List(Nrccmessage)),
    filter_type: Option(String),
    platform_available: Option(Bool),
    are_services_available: Option(Bool),
    filter_location_name: Option(String),
    xmlns: Option(XmlSerializerNamespaces),
    departures: Option(List(DepartureItem)),
  )
}

pub type DepartureItem {
  DepartureItem(crs: Option(String), service: Option(ServiceItem))
}

pub type UncertaintyType {
  UncertaintyType(reason: Option(String), status: Option(String))
}

pub type ServiceItem {
  ServiceItem(
    future_delay: Option(Bool),
    is_circular_route: Option(Bool),
    sta: Option(String),
    std: Option(String),
    filter_location_cancelled: Option(Bool),
    operator: Option(String),
    future_cancellation: Option(Bool),
    length: Option(Int),
    origin: Option(List(ServiceLocation)),
    delay_reason: Option(String),
    is_cancelled: Option(Bool),
    affected_by: Option(String),
    destination: Option(List(ServiceLocation)),
    uncertainty: Option(UncertaintyType),
    service_type: Option(String),
    adhoc_alerts: Option(List(String)),
    service_id: Option(String),
    formation: Option(FormationData),
    operator_code: Option(String),
    eta: Option(String),
    platform: Option(String),
    diversion: Option(ServiceItemDiversion),
    current_origins: Option(List(ServiceLocation)),
    etd: Option(String),
    detach_front: Option(Bool),
    is_reverse_formation: Option(Bool),
    rsid: Option(String),
    cancel_reason: Option(String),
    current_destinations: Option(List(ServiceLocation)),
  )
}

pub type StationBoardWithDetails {
  StationBoardWithDetails(
    location_name: Option(String),
    generated_at: Option(String),
    crs: Option(String),
    train_services: Option(List(ServiceItemWithCallingPoints)),
    filtercrs: Option(String),
    nrcc_messages: Option(List(Nrccmessage)),
    filter_type: Option(String),
    platform_available: Option(Bool),
    are_services_available: Option(Bool),
    filter_location_name: Option(String),
    ferry_services: Option(List(ServiceItemWithCallingPoints)),
    xmlns: Option(XmlSerializerNamespaces),
    bus_services: Option(List(ServiceItemWithCallingPoints)),
  )
}

pub type ServiceLocation {
  ServiceLocation(
    location_name: Option(String),
    crs: Option(String),
    via: Option(String),
    future_change_to: Option(String),
    assoc_is_cancelled: Option(Bool),
  )
}

pub type ServiceItemDiversion {
  ServiceItemDiversion(
    reason: Option(String),
    between: Option(ServiceItemDiversionBetween),
    reroute_delay: Option(Int),
    diverted_via: Option(String),
  )
}

pub type CallingPoint {
  CallingPoint(
    location_name: Option(String),
    st: Option(String),
    crs: Option(String),
    length: Option(Int),
    delay_reason: Option(String),
    is_cancelled: Option(Bool),
    affected_by_diversion: Option(Bool),
    affected_by: Option(String),
    reroute_delay: Option(Int),
    uncertainty: Option(UncertaintyType),
    et: Option(String),
    adhoc_alerts: Option(List(String)),
    formation: Option(FormationData),
    at: Option(String),
    detach_front: Option(Bool),
    cancel_reason: Option(String),
  )
}

pub type ServiceDetails {
  ServiceDetails(
    sta: Option(String),
    location_name: Option(String),
    generated_at: Option(String),
    std: Option(String),
    operator: Option(String),
    crs: Option(String),
    length: Option(Int),
    delay_reason: Option(String),
    is_cancelled: Option(Bool),
    overdue_message: Option(String),
    ata: Option(String),
    service_type: Option(String),
    previous_calling_points: Option(List(ArrayOfCallingPoints)),
    adhoc_alerts: Option(List(String)),
    formation: Option(FormationData),
    operator_code: Option(String),
    atd: Option(String),
    eta: Option(String),
    subsequent_calling_points: Option(List(ArrayOfCallingPoints)),
    platform: Option(String),
    etd: Option(String),
    detach_front: Option(Bool),
    diversion_reason: Option(String),
    is_reverse_formation: Option(Bool),
    diverted_via: Option(String),
    rsid: Option(String),
    xmlns: Option(XmlSerializerNamespaces),
    cancel_reason: Option(String),
  )
}

pub type StationBoard {
  StationBoard(
    location_name: Option(String),
    generated_at: Option(String),
    crs: Option(String),
    train_services: Option(List(ServiceItem)),
    filtercrs: Option(String),
    nrcc_messages: Option(List(Nrccmessage)),
    filter_type: Option(String),
    platform_available: Option(Bool),
    are_services_available: Option(Bool),
    filter_location_name: Option(String),
    ferry_services: Option(List(ServiceItem)),
    xmlns: Option(XmlSerializerNamespaces),
    bus_services: Option(List(ServiceItem)),
  )
}

pub type DeparturesBoardWithDetails {
  DeparturesBoardWithDetails(
    location_name: Option(String),
    generated_at: Option(String),
    crs: Option(String),
    filtercrs: Option(String),
    nrcc_messages: Option(List(Nrccmessage)),
    filter_type: Option(String),
    platform_available: Option(Bool),
    are_services_available: Option(Bool),
    filter_location_name: Option(String),
    xmlns: Option(XmlSerializerNamespaces),
    departures: Option(List(DepartureItemWithCallingPoints)),
  )
}

pub type ArrayOfCallingPoints {
  ArrayOfCallingPoints(
    service_change_required: Option(Bool),
    calling_point: Option(List(CallingPoint)),
    service_type: Option(String),
    assoc_is_cancelled: Option(Bool),
  )
}

pub type ServiceItemWithCallingPoints {
  ServiceItemWithCallingPoints(
    future_delay: Option(Bool),
    is_circular_route: Option(Bool),
    sta: Option(String),
    std: Option(String),
    filter_location_cancelled: Option(Bool),
    operator: Option(String),
    future_cancellation: Option(Bool),
    length: Option(Int),
    origin: Option(List(ServiceLocation)),
    delay_reason: Option(String),
    is_cancelled: Option(Bool),
    affected_by: Option(String),
    destination: Option(List(ServiceLocation)),
    uncertainty: Option(UncertaintyType),
    service_type: Option(String),
    previous_calling_points: Option(List(ArrayOfCallingPoints)),
    adhoc_alerts: Option(List(String)),
    service_id: Option(String),
    formation: Option(FormationData),
    operator_code: Option(String),
    eta: Option(String),
    subsequent_calling_points: Option(List(ArrayOfCallingPoints)),
    platform: Option(String),
    diversion: Option(ServiceItemDiversion),
    current_origins: Option(List(ServiceLocation)),
    etd: Option(String),
    detach_front: Option(Bool),
    is_reverse_formation: Option(Bool),
    rsid: Option(String),
    cancel_reason: Option(String),
    current_destinations: Option(List(ServiceLocation)),
  )
}

pub type DepartureItemWithCallingPoints {
  DepartureItemWithCallingPoints(
    crs: Option(String),
    service: Option(ServiceItemWithCallingPoints),
  )
}

pub type LoadingCategory {
  LoadingCategory(
    colour: Option(String),
    code: Option(String),
    value: Option(String),
    image: Option(String),
  )
}

pub type FormationData {
  FormationData(
    coaches: Option(List(CoachData)),
    loading_category: Option(LoadingCategory),
  )
}

pub type ServiceItemDiversionBetween {
  ServiceItemDiversionBetween(
    start: Option(ServiceItemDiversionBetweenStart),
    end: Option(ServiceItemDiversionBetweenEnd),
  )
}

pub type ServiceItemDiversionBetweenEnd {
  ServiceItemDiversionBetweenEnd(crs: Option(String), value: Option(String))
}

pub fn service_item_diversion_between_end_decoder() {
  use crs <- decode.optional_field("crs", None, decode.optional(decode.string))
  use value <- decode.optional_field(
    "Value",
    None,
    decode.optional(decode.string),
  )
  decode.success(ServiceItemDiversionBetweenEnd(crs: crs, value: value))
}

pub fn service_item_diversion_between_end_encode(
  data: ServiceItemDiversionBetweenEnd,
) {
  json.object([
    #("crs", json.nullable(data.crs, json.string)),
    #("Value", json.nullable(data.value, json.string)),
  ])
}

pub fn service_item_diversion_between_decoder() {
  use start <- decode.optional_field(
    "start",
    None,
    decode.optional(service_item_diversion_between_start_decoder()),
  )
  use end <- decode.optional_field(
    "end",
    None,
    decode.optional(service_item_diversion_between_end_decoder()),
  )
  decode.success(ServiceItemDiversionBetween(start: start, end: end))
}

pub fn service_item_diversion_between_encode(data: ServiceItemDiversionBetween) {
  json.object([
    #(
      "start",
      json.nullable(data.start, service_item_diversion_between_start_encode),
    ),
    #("end", json.nullable(data.end, service_item_diversion_between_end_encode)),
  ])
}

pub fn formation_data_decoder() {
  use coaches <- decode.optional_field(
    "coaches",
    None,
    decode.optional(decode.list(coach_data_decoder())),
  )
  use loading_category <- decode.optional_field(
    "loadingCategory",
    None,
    decode.optional(loading_category_decoder()),
  )
  decode.success(FormationData(
    coaches: coaches,
    loading_category: loading_category,
  ))
}

pub fn formation_data_encode(data: FormationData) {
  json.object([
    #("coaches", json.nullable(data.coaches, json.array(_, coach_data_encode))),
    #(
      "loadingCategory",
      json.nullable(data.loading_category, loading_category_encode),
    ),
  ])
}

pub fn loading_category_decoder() {
  use colour <- decode.optional_field(
    "colour",
    None,
    decode.optional(decode.string),
  )
  use code <- decode.optional_field(
    "code",
    None,
    decode.optional(decode.string),
  )
  use value <- decode.optional_field(
    "Value",
    None,
    decode.optional(decode.string),
  )
  use image <- decode.optional_field(
    "image",
    None,
    decode.optional(decode.string),
  )
  decode.success(LoadingCategory(
    colour: colour,
    code: code,
    value: value,
    image: image,
  ))
}

pub fn loading_category_encode(data: LoadingCategory) {
  json.object([
    #("colour", json.nullable(data.colour, json.string)),
    #("code", json.nullable(data.code, json.string)),
    #("Value", json.nullable(data.value, json.string)),
    #("image", json.nullable(data.image, json.string)),
  ])
}

pub fn departure_item_with_calling_points_decoder() {
  use crs <- decode.optional_field("crs", None, decode.optional(decode.string))
  use service <- decode.optional_field(
    "service",
    None,
    decode.optional(service_item_with_calling_points_decoder()),
  )
  decode.success(DepartureItemWithCallingPoints(crs: crs, service: service))
}

pub fn departure_item_with_calling_points_encode(
  data: DepartureItemWithCallingPoints,
) {
  json.object([
    #("crs", json.nullable(data.crs, json.string)),
    #(
      "service",
      json.nullable(data.service, service_item_with_calling_points_encode),
    ),
  ])
}

pub fn service_item_with_calling_points_decoder() {
  use future_delay <- decode.optional_field(
    "futureDelay",
    None,
    decode.optional(decode.bool),
  )
  use is_circular_route <- decode.optional_field(
    "isCircularRoute",
    None,
    decode.optional(decode.bool),
  )
  use sta <- decode.optional_field("sta", None, decode.optional(decode.string))
  use std <- decode.optional_field("std", None, decode.optional(decode.string))
  use filter_location_cancelled <- decode.optional_field(
    "filterLocationCancelled",
    None,
    decode.optional(decode.bool),
  )
  use operator <- decode.optional_field(
    "operator",
    None,
    decode.optional(decode.string),
  )
  use future_cancellation <- decode.optional_field(
    "futureCancellation",
    None,
    decode.optional(decode.bool),
  )
  use length <- decode.optional_field(
    "length",
    None,
    decode.optional(decode.int),
  )
  use origin <- decode.optional_field(
    "origin",
    None,
    decode.optional(decode.list(service_location_decoder())),
  )
  use delay_reason <- decode.optional_field(
    "delayReason",
    None,
    decode.optional(decode.string),
  )
  use is_cancelled <- decode.optional_field(
    "isCancelled",
    None,
    decode.optional(decode.bool),
  )
  use affected_by <- decode.optional_field(
    "affectedBy",
    None,
    decode.optional(decode.string),
  )
  use destination <- decode.optional_field(
    "destination",
    None,
    decode.optional(decode.list(service_location_decoder())),
  )
  use uncertainty <- decode.optional_field(
    "uncertainty",
    None,
    decode.optional(uncertainty_type_decoder()),
  )
  use service_type <- decode.optional_field(
    "serviceType",
    None,
    decode.optional(decode.string),
  )
  use previous_calling_points <- decode.optional_field(
    "previousCallingPoints",
    None,
    decode.optional(decode.list(array_of_calling_points_decoder())),
  )
  use adhoc_alerts <- decode.optional_field(
    "adhocAlerts",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use service_id <- decode.optional_field(
    "serviceID",
    None,
    decode.optional(decode.string),
  )
  use formation <- decode.optional_field(
    "formation",
    None,
    decode.optional(formation_data_decoder()),
  )
  use operator_code <- decode.optional_field(
    "operatorCode",
    None,
    decode.optional(decode.string),
  )
  use eta <- decode.optional_field("eta", None, decode.optional(decode.string))
  use subsequent_calling_points <- decode.optional_field(
    "subsequentCallingPoints",
    None,
    decode.optional(decode.list(array_of_calling_points_decoder())),
  )
  use platform <- decode.optional_field(
    "platform",
    None,
    decode.optional(decode.string),
  )
  use diversion <- decode.optional_field(
    "diversion",
    None,
    decode.optional(service_item_diversion_decoder()),
  )
  use current_origins <- decode.optional_field(
    "currentOrigins",
    None,
    decode.optional(decode.list(service_location_decoder())),
  )
  use etd <- decode.optional_field("etd", None, decode.optional(decode.string))
  use detach_front <- decode.optional_field(
    "detachFront",
    None,
    decode.optional(decode.bool),
  )
  use is_reverse_formation <- decode.optional_field(
    "isReverseFormation",
    None,
    decode.optional(decode.bool),
  )
  use rsid <- decode.optional_field(
    "rsid",
    None,
    decode.optional(decode.string),
  )
  use cancel_reason <- decode.optional_field(
    "cancelReason",
    None,
    decode.optional(decode.string),
  )
  use current_destinations <- decode.optional_field(
    "currentDestinations",
    None,
    decode.optional(decode.list(service_location_decoder())),
  )
  decode.success(ServiceItemWithCallingPoints(
    future_delay: future_delay,
    is_circular_route: is_circular_route,
    sta: sta,
    std: std,
    filter_location_cancelled: filter_location_cancelled,
    operator: operator,
    future_cancellation: future_cancellation,
    length: length,
    origin: origin,
    delay_reason: delay_reason,
    is_cancelled: is_cancelled,
    affected_by: affected_by,
    destination: destination,
    uncertainty: uncertainty,
    service_type: service_type,
    previous_calling_points: previous_calling_points,
    adhoc_alerts: adhoc_alerts,
    service_id: service_id,
    formation: formation,
    operator_code: operator_code,
    eta: eta,
    subsequent_calling_points: subsequent_calling_points,
    platform: platform,
    diversion: diversion,
    current_origins: current_origins,
    etd: etd,
    detach_front: detach_front,
    is_reverse_formation: is_reverse_formation,
    rsid: rsid,
    cancel_reason: cancel_reason,
    current_destinations: current_destinations,
  ))
}

pub fn service_item_with_calling_points_encode(
  data: ServiceItemWithCallingPoints,
) {
  json.object([
    #("futureDelay", json.nullable(data.future_delay, json.bool)),
    #("isCircularRoute", json.nullable(data.is_circular_route, json.bool)),
    #("sta", json.nullable(data.sta, json.string)),
    #("std", json.nullable(data.std, json.string)),
    #(
      "filterLocationCancelled",
      json.nullable(data.filter_location_cancelled, json.bool),
    ),
    #("operator", json.nullable(data.operator, json.string)),
    #("futureCancellation", json.nullable(data.future_cancellation, json.bool)),
    #("length", json.nullable(data.length, json.int)),
    #(
      "origin",
      json.nullable(data.origin, json.array(_, service_location_encode)),
    ),
    #("delayReason", json.nullable(data.delay_reason, json.string)),
    #("isCancelled", json.nullable(data.is_cancelled, json.bool)),
    #("affectedBy", json.nullable(data.affected_by, json.string)),
    #(
      "destination",
      json.nullable(data.destination, json.array(_, service_location_encode)),
    ),
    #("uncertainty", json.nullable(data.uncertainty, uncertainty_type_encode)),
    #("serviceType", json.nullable(data.service_type, json.string)),
    #(
      "previousCallingPoints",
      json.nullable(data.previous_calling_points, json.array(
        _,
        array_of_calling_points_encode,
      )),
    ),
    #(
      "adhocAlerts",
      json.nullable(data.adhoc_alerts, json.array(_, json.string)),
    ),
    #("serviceID", json.nullable(data.service_id, json.string)),
    #("formation", json.nullable(data.formation, formation_data_encode)),
    #("operatorCode", json.nullable(data.operator_code, json.string)),
    #("eta", json.nullable(data.eta, json.string)),
    #(
      "subsequentCallingPoints",
      json.nullable(data.subsequent_calling_points, json.array(
        _,
        array_of_calling_points_encode,
      )),
    ),
    #("platform", json.nullable(data.platform, json.string)),
    #("diversion", json.nullable(data.diversion, service_item_diversion_encode)),
    #(
      "currentOrigins",
      json.nullable(data.current_origins, json.array(_, service_location_encode)),
    ),
    #("etd", json.nullable(data.etd, json.string)),
    #("detachFront", json.nullable(data.detach_front, json.bool)),
    #("isReverseFormation", json.nullable(data.is_reverse_formation, json.bool)),
    #("rsid", json.nullable(data.rsid, json.string)),
    #("cancelReason", json.nullable(data.cancel_reason, json.string)),
    #(
      "currentDestinations",
      json.nullable(data.current_destinations, json.array(
        _,
        service_location_encode,
      )),
    ),
  ])
}

pub fn array_of_calling_points_decoder() {
  use service_change_required <- decode.optional_field(
    "serviceChangeRequired",
    None,
    decode.optional(decode.bool),
  )
  use calling_point <- decode.optional_field(
    "callingPoint",
    None,
    decode.optional(decode.list(calling_point_decoder())),
  )
  use service_type <- decode.optional_field(
    "serviceType",
    None,
    decode.optional(decode.string),
  )
  use assoc_is_cancelled <- decode.optional_field(
    "assocIsCancelled",
    None,
    decode.optional(decode.bool),
  )
  decode.success(ArrayOfCallingPoints(
    service_change_required: service_change_required,
    calling_point: calling_point,
    service_type: service_type,
    assoc_is_cancelled: assoc_is_cancelled,
  ))
}

pub fn array_of_calling_points_encode(data: ArrayOfCallingPoints) {
  json.object([
    #(
      "serviceChangeRequired",
      json.nullable(data.service_change_required, json.bool),
    ),
    #(
      "callingPoint",
      json.nullable(data.calling_point, json.array(_, calling_point_encode)),
    ),
    #("serviceType", json.nullable(data.service_type, json.string)),
    #("assocIsCancelled", json.nullable(data.assoc_is_cancelled, json.bool)),
  ])
}

pub fn departures_board_with_details_decoder() {
  use location_name <- decode.optional_field(
    "locationName",
    None,
    decode.optional(decode.string),
  )
  use generated_at <- decode.optional_field(
    "generatedAt",
    None,
    decode.optional(decode.string),
  )
  use crs <- decode.optional_field("crs", None, decode.optional(decode.string))
  use filtercrs <- decode.optional_field(
    "filtercrs",
    None,
    decode.optional(decode.string),
  )
  use nrcc_messages <- decode.optional_field(
    "nrccMessages",
    None,
    decode.optional(decode.list(nrccmessage_decoder())),
  )
  use filter_type <- decode.optional_field(
    "filterType",
    None,
    decode.optional(decode.string),
  )
  use platform_available <- decode.optional_field(
    "platformAvailable",
    None,
    decode.optional(decode.bool),
  )
  use are_services_available <- decode.optional_field(
    "areServicesAvailable",
    None,
    decode.optional(decode.bool),
  )
  use filter_location_name <- decode.optional_field(
    "filterLocationName",
    None,
    decode.optional(decode.string),
  )
  use xmlns <- decode.optional_field(
    "Xmlns",
    None,
    decode.optional(xml_serializer_namespaces_decoder()),
  )
  use departures <- decode.optional_field(
    "departures",
    None,
    decode.optional(decode.list(departure_item_with_calling_points_decoder())),
  )
  decode.success(DeparturesBoardWithDetails(
    location_name: location_name,
    generated_at: generated_at,
    crs: crs,
    filtercrs: filtercrs,
    nrcc_messages: nrcc_messages,
    filter_type: filter_type,
    platform_available: platform_available,
    are_services_available: are_services_available,
    filter_location_name: filter_location_name,
    xmlns: xmlns,
    departures: departures,
  ))
}

pub fn departures_board_with_details_encode(data: DeparturesBoardWithDetails) {
  json.object([
    #("locationName", json.nullable(data.location_name, json.string)),
    #("generatedAt", json.nullable(data.generated_at, json.string)),
    #("crs", json.nullable(data.crs, json.string)),
    #("filtercrs", json.nullable(data.filtercrs, json.string)),
    #(
      "nrccMessages",
      json.nullable(data.nrcc_messages, json.array(_, nrccmessage_encode)),
    ),
    #("filterType", json.nullable(data.filter_type, json.string)),
    #("platformAvailable", json.nullable(data.platform_available, json.bool)),
    #(
      "areServicesAvailable",
      json.nullable(data.are_services_available, json.bool),
    ),
    #(
      "filterLocationName",
      json.nullable(data.filter_location_name, json.string),
    ),
    #("Xmlns", json.nullable(data.xmlns, xml_serializer_namespaces_encode)),
    #(
      "departures",
      json.nullable(data.departures, json.array(
        _,
        departure_item_with_calling_points_encode,
      )),
    ),
  ])
}

pub fn station_board_decoder() {
  use location_name <- decode.optional_field(
    "locationName",
    None,
    decode.optional(decode.string),
  )
  use generated_at <- decode.optional_field(
    "generatedAt",
    None,
    decode.optional(decode.string),
  )
  use crs <- decode.optional_field("crs", None, decode.optional(decode.string))
  use train_services <- decode.optional_field(
    "trainServices",
    None,
    decode.optional(decode.list(service_item_decoder())),
  )
  use filtercrs <- decode.optional_field(
    "filtercrs",
    None,
    decode.optional(decode.string),
  )
  use nrcc_messages <- decode.optional_field(
    "nrccMessages",
    None,
    decode.optional(decode.list(nrccmessage_decoder())),
  )
  use filter_type <- decode.optional_field(
    "filterType",
    None,
    decode.optional(decode.string),
  )
  use platform_available <- decode.optional_field(
    "platformAvailable",
    None,
    decode.optional(decode.bool),
  )
  use are_services_available <- decode.optional_field(
    "areServicesAvailable",
    None,
    decode.optional(decode.bool),
  )
  use filter_location_name <- decode.optional_field(
    "filterLocationName",
    None,
    decode.optional(decode.string),
  )
  use ferry_services <- decode.optional_field(
    "ferryServices",
    None,
    decode.optional(decode.list(service_item_decoder())),
  )
  use xmlns <- decode.optional_field(
    "Xmlns",
    None,
    decode.optional(xml_serializer_namespaces_decoder()),
  )
  use bus_services <- decode.optional_field(
    "busServices",
    None,
    decode.optional(decode.list(service_item_decoder())),
  )
  decode.success(StationBoard(
    location_name: location_name,
    generated_at: generated_at,
    crs: crs,
    train_services: train_services,
    filtercrs: filtercrs,
    nrcc_messages: nrcc_messages,
    filter_type: filter_type,
    platform_available: platform_available,
    are_services_available: are_services_available,
    filter_location_name: filter_location_name,
    ferry_services: ferry_services,
    xmlns: xmlns,
    bus_services: bus_services,
  ))
}

pub fn station_board_encode(data: StationBoard) {
  json.object([
    #("locationName", json.nullable(data.location_name, json.string)),
    #("generatedAt", json.nullable(data.generated_at, json.string)),
    #("crs", json.nullable(data.crs, json.string)),
    #(
      "trainServices",
      json.nullable(data.train_services, json.array(_, service_item_encode)),
    ),
    #("filtercrs", json.nullable(data.filtercrs, json.string)),
    #(
      "nrccMessages",
      json.nullable(data.nrcc_messages, json.array(_, nrccmessage_encode)),
    ),
    #("filterType", json.nullable(data.filter_type, json.string)),
    #("platformAvailable", json.nullable(data.platform_available, json.bool)),
    #(
      "areServicesAvailable",
      json.nullable(data.are_services_available, json.bool),
    ),
    #(
      "filterLocationName",
      json.nullable(data.filter_location_name, json.string),
    ),
    #(
      "ferryServices",
      json.nullable(data.ferry_services, json.array(_, service_item_encode)),
    ),
    #("Xmlns", json.nullable(data.xmlns, xml_serializer_namespaces_encode)),
    #(
      "busServices",
      json.nullable(data.bus_services, json.array(_, service_item_encode)),
    ),
  ])
}

pub fn service_details_decoder() {
  use sta <- decode.optional_field("sta", None, decode.optional(decode.string))
  use location_name <- decode.optional_field(
    "locationName",
    None,
    decode.optional(decode.string),
  )
  use generated_at <- decode.optional_field(
    "generatedAt",
    None,
    decode.optional(decode.string),
  )
  use std <- decode.optional_field("std", None, decode.optional(decode.string))
  use operator <- decode.optional_field(
    "operator",
    None,
    decode.optional(decode.string),
  )
  use crs <- decode.optional_field("crs", None, decode.optional(decode.string))
  use length <- decode.optional_field(
    "length",
    None,
    decode.optional(decode.int),
  )
  use delay_reason <- decode.optional_field(
    "delayReason",
    None,
    decode.optional(decode.string),
  )
  use is_cancelled <- decode.optional_field(
    "isCancelled",
    None,
    decode.optional(decode.bool),
  )
  use overdue_message <- decode.optional_field(
    "overdueMessage",
    None,
    decode.optional(decode.string),
  )
  use ata <- decode.optional_field("ata", None, decode.optional(decode.string))
  use service_type <- decode.optional_field(
    "serviceType",
    None,
    decode.optional(decode.string),
  )
  use previous_calling_points <- decode.optional_field(
    "previousCallingPoints",
    None,
    decode.optional(decode.list(array_of_calling_points_decoder())),
  )
  use adhoc_alerts <- decode.optional_field(
    "adhocAlerts",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use formation <- decode.optional_field(
    "formation",
    None,
    decode.optional(formation_data_decoder()),
  )
  use operator_code <- decode.optional_field(
    "operatorCode",
    None,
    decode.optional(decode.string),
  )
  use atd <- decode.optional_field("atd", None, decode.optional(decode.string))
  use eta <- decode.optional_field("eta", None, decode.optional(decode.string))
  use subsequent_calling_points <- decode.optional_field(
    "subsequentCallingPoints",
    None,
    decode.optional(decode.list(array_of_calling_points_decoder())),
  )
  use platform <- decode.optional_field(
    "platform",
    None,
    decode.optional(decode.string),
  )
  use etd <- decode.optional_field("etd", None, decode.optional(decode.string))
  use detach_front <- decode.optional_field(
    "detachFront",
    None,
    decode.optional(decode.bool),
  )
  use diversion_reason <- decode.optional_field(
    "diversionReason",
    None,
    decode.optional(decode.string),
  )
  use is_reverse_formation <- decode.optional_field(
    "isReverseFormation",
    None,
    decode.optional(decode.bool),
  )
  use diverted_via <- decode.optional_field(
    "divertedVia",
    None,
    decode.optional(decode.string),
  )
  use rsid <- decode.optional_field(
    "rsid",
    None,
    decode.optional(decode.string),
  )
  use xmlns <- decode.optional_field(
    "Xmlns",
    None,
    decode.optional(xml_serializer_namespaces_decoder()),
  )
  use cancel_reason <- decode.optional_field(
    "cancelReason",
    None,
    decode.optional(decode.string),
  )
  decode.success(ServiceDetails(
    sta: sta,
    location_name: location_name,
    generated_at: generated_at,
    std: std,
    operator: operator,
    crs: crs,
    length: length,
    delay_reason: delay_reason,
    is_cancelled: is_cancelled,
    overdue_message: overdue_message,
    ata: ata,
    service_type: service_type,
    previous_calling_points: previous_calling_points,
    adhoc_alerts: adhoc_alerts,
    formation: formation,
    operator_code: operator_code,
    atd: atd,
    eta: eta,
    subsequent_calling_points: subsequent_calling_points,
    platform: platform,
    etd: etd,
    detach_front: detach_front,
    diversion_reason: diversion_reason,
    is_reverse_formation: is_reverse_formation,
    diverted_via: diverted_via,
    rsid: rsid,
    xmlns: xmlns,
    cancel_reason: cancel_reason,
  ))
}

pub fn service_details_encode(data: ServiceDetails) {
  json.object([
    #("sta", json.nullable(data.sta, json.string)),
    #("locationName", json.nullable(data.location_name, json.string)),
    #("generatedAt", json.nullable(data.generated_at, json.string)),
    #("std", json.nullable(data.std, json.string)),
    #("operator", json.nullable(data.operator, json.string)),
    #("crs", json.nullable(data.crs, json.string)),
    #("length", json.nullable(data.length, json.int)),
    #("delayReason", json.nullable(data.delay_reason, json.string)),
    #("isCancelled", json.nullable(data.is_cancelled, json.bool)),
    #("overdueMessage", json.nullable(data.overdue_message, json.string)),
    #("ata", json.nullable(data.ata, json.string)),
    #("serviceType", json.nullable(data.service_type, json.string)),
    #(
      "previousCallingPoints",
      json.nullable(data.previous_calling_points, json.array(
        _,
        array_of_calling_points_encode,
      )),
    ),
    #(
      "adhocAlerts",
      json.nullable(data.adhoc_alerts, json.array(_, json.string)),
    ),
    #("formation", json.nullable(data.formation, formation_data_encode)),
    #("operatorCode", json.nullable(data.operator_code, json.string)),
    #("atd", json.nullable(data.atd, json.string)),
    #("eta", json.nullable(data.eta, json.string)),
    #(
      "subsequentCallingPoints",
      json.nullable(data.subsequent_calling_points, json.array(
        _,
        array_of_calling_points_encode,
      )),
    ),
    #("platform", json.nullable(data.platform, json.string)),
    #("etd", json.nullable(data.etd, json.string)),
    #("detachFront", json.nullable(data.detach_front, json.bool)),
    #("diversionReason", json.nullable(data.diversion_reason, json.string)),
    #("isReverseFormation", json.nullable(data.is_reverse_formation, json.bool)),
    #("divertedVia", json.nullable(data.diverted_via, json.string)),
    #("rsid", json.nullable(data.rsid, json.string)),
    #("Xmlns", json.nullable(data.xmlns, xml_serializer_namespaces_encode)),
    #("cancelReason", json.nullable(data.cancel_reason, json.string)),
  ])
}

pub fn calling_point_decoder() {
  use location_name <- decode.optional_field(
    "locationName",
    None,
    decode.optional(decode.string),
  )
  use st <- decode.optional_field("st", None, decode.optional(decode.string))
  use crs <- decode.optional_field("crs", None, decode.optional(decode.string))
  use length <- decode.optional_field(
    "length",
    None,
    decode.optional(decode.int),
  )
  use delay_reason <- decode.optional_field(
    "delayReason",
    None,
    decode.optional(decode.string),
  )
  use is_cancelled <- decode.optional_field(
    "isCancelled",
    None,
    decode.optional(decode.bool),
  )
  use affected_by_diversion <- decode.optional_field(
    "affectedByDiversion",
    None,
    decode.optional(decode.bool),
  )
  use affected_by <- decode.optional_field(
    "affectedBy",
    None,
    decode.optional(decode.string),
  )
  use reroute_delay <- decode.optional_field(
    "rerouteDelay",
    None,
    decode.optional(decode.int),
  )
  use uncertainty <- decode.optional_field(
    "uncertainty",
    None,
    decode.optional(uncertainty_type_decoder()),
  )
  use et <- decode.optional_field("et", None, decode.optional(decode.string))
  use adhoc_alerts <- decode.optional_field(
    "adhocAlerts",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use formation <- decode.optional_field(
    "formation",
    None,
    decode.optional(formation_data_decoder()),
  )
  use at <- decode.optional_field("at", None, decode.optional(decode.string))
  use detach_front <- decode.optional_field(
    "detachFront",
    None,
    decode.optional(decode.bool),
  )
  use cancel_reason <- decode.optional_field(
    "cancelReason",
    None,
    decode.optional(decode.string),
  )
  decode.success(CallingPoint(
    location_name: location_name,
    st: st,
    crs: crs,
    length: length,
    delay_reason: delay_reason,
    is_cancelled: is_cancelled,
    affected_by_diversion: affected_by_diversion,
    affected_by: affected_by,
    reroute_delay: reroute_delay,
    uncertainty: uncertainty,
    et: et,
    adhoc_alerts: adhoc_alerts,
    formation: formation,
    at: at,
    detach_front: detach_front,
    cancel_reason: cancel_reason,
  ))
}

pub fn calling_point_encode(data: CallingPoint) {
  json.object([
    #("locationName", json.nullable(data.location_name, json.string)),
    #("st", json.nullable(data.st, json.string)),
    #("crs", json.nullable(data.crs, json.string)),
    #("length", json.nullable(data.length, json.int)),
    #("delayReason", json.nullable(data.delay_reason, json.string)),
    #("isCancelled", json.nullable(data.is_cancelled, json.bool)),
    #(
      "affectedByDiversion",
      json.nullable(data.affected_by_diversion, json.bool),
    ),
    #("affectedBy", json.nullable(data.affected_by, json.string)),
    #("rerouteDelay", json.nullable(data.reroute_delay, json.int)),
    #("uncertainty", json.nullable(data.uncertainty, uncertainty_type_encode)),
    #("et", json.nullable(data.et, json.string)),
    #(
      "adhocAlerts",
      json.nullable(data.adhoc_alerts, json.array(_, json.string)),
    ),
    #("formation", json.nullable(data.formation, formation_data_encode)),
    #("at", json.nullable(data.at, json.string)),
    #("detachFront", json.nullable(data.detach_front, json.bool)),
    #("cancelReason", json.nullable(data.cancel_reason, json.string)),
  ])
}

pub fn service_item_diversion_decoder() {
  use reason <- decode.optional_field(
    "reason",
    None,
    decode.optional(decode.string),
  )
  use between <- decode.optional_field(
    "between",
    None,
    decode.optional(service_item_diversion_between_decoder()),
  )
  use reroute_delay <- decode.optional_field(
    "rerouteDelay",
    None,
    decode.optional(decode.int),
  )
  use diverted_via <- decode.optional_field(
    "divertedVia",
    None,
    decode.optional(decode.string),
  )
  decode.success(ServiceItemDiversion(
    reason: reason,
    between: between,
    reroute_delay: reroute_delay,
    diverted_via: diverted_via,
  ))
}

pub fn service_item_diversion_encode(data: ServiceItemDiversion) {
  json.object([
    #("reason", json.nullable(data.reason, json.string)),
    #(
      "between",
      json.nullable(data.between, service_item_diversion_between_encode),
    ),
    #("rerouteDelay", json.nullable(data.reroute_delay, json.int)),
    #("divertedVia", json.nullable(data.diverted_via, json.string)),
  ])
}

pub fn service_location_decoder() {
  use location_name <- decode.optional_field(
    "locationName",
    None,
    decode.optional(decode.string),
  )
  use crs <- decode.optional_field("crs", None, decode.optional(decode.string))
  use via <- decode.optional_field("via", None, decode.optional(decode.string))
  use future_change_to <- decode.optional_field(
    "futureChangeTo",
    None,
    decode.optional(decode.string),
  )
  use assoc_is_cancelled <- decode.optional_field(
    "assocIsCancelled",
    None,
    decode.optional(decode.bool),
  )
  decode.success(ServiceLocation(
    location_name: location_name,
    crs: crs,
    via: via,
    future_change_to: future_change_to,
    assoc_is_cancelled: assoc_is_cancelled,
  ))
}

pub fn service_location_encode(data: ServiceLocation) {
  json.object([
    #("locationName", json.nullable(data.location_name, json.string)),
    #("crs", json.nullable(data.crs, json.string)),
    #("via", json.nullable(data.via, json.string)),
    #("futureChangeTo", json.nullable(data.future_change_to, json.string)),
    #("assocIsCancelled", json.nullable(data.assoc_is_cancelled, json.bool)),
  ])
}

pub fn station_board_with_details_decoder() {
  use location_name <- decode.optional_field(
    "locationName",
    None,
    decode.optional(decode.string),
  )
  use generated_at <- decode.optional_field(
    "generatedAt",
    None,
    decode.optional(decode.string),
  )
  use crs <- decode.optional_field("crs", None, decode.optional(decode.string))
  use train_services <- decode.optional_field(
    "trainServices",
    None,
    decode.optional(decode.list(service_item_with_calling_points_decoder())),
  )
  use filtercrs <- decode.optional_field(
    "filtercrs",
    None,
    decode.optional(decode.string),
  )
  use nrcc_messages <- decode.optional_field(
    "nrccMessages",
    None,
    decode.optional(decode.list(nrccmessage_decoder())),
  )
  use filter_type <- decode.optional_field(
    "filterType",
    None,
    decode.optional(decode.string),
  )
  use platform_available <- decode.optional_field(
    "platformAvailable",
    None,
    decode.optional(decode.bool),
  )
  use are_services_available <- decode.optional_field(
    "areServicesAvailable",
    None,
    decode.optional(decode.bool),
  )
  use filter_location_name <- decode.optional_field(
    "filterLocationName",
    None,
    decode.optional(decode.string),
  )
  use ferry_services <- decode.optional_field(
    "ferryServices",
    None,
    decode.optional(decode.list(service_item_with_calling_points_decoder())),
  )
  use xmlns <- decode.optional_field(
    "Xmlns",
    None,
    decode.optional(xml_serializer_namespaces_decoder()),
  )
  use bus_services <- decode.optional_field(
    "busServices",
    None,
    decode.optional(decode.list(service_item_with_calling_points_decoder())),
  )
  decode.success(StationBoardWithDetails(
    location_name: location_name,
    generated_at: generated_at,
    crs: crs,
    train_services: train_services,
    filtercrs: filtercrs,
    nrcc_messages: nrcc_messages,
    filter_type: filter_type,
    platform_available: platform_available,
    are_services_available: are_services_available,
    filter_location_name: filter_location_name,
    ferry_services: ferry_services,
    xmlns: xmlns,
    bus_services: bus_services,
  ))
}

pub fn station_board_with_details_encode(data: StationBoardWithDetails) {
  json.object([
    #("locationName", json.nullable(data.location_name, json.string)),
    #("generatedAt", json.nullable(data.generated_at, json.string)),
    #("crs", json.nullable(data.crs, json.string)),
    #(
      "trainServices",
      json.nullable(data.train_services, json.array(
        _,
        service_item_with_calling_points_encode,
      )),
    ),
    #("filtercrs", json.nullable(data.filtercrs, json.string)),
    #(
      "nrccMessages",
      json.nullable(data.nrcc_messages, json.array(_, nrccmessage_encode)),
    ),
    #("filterType", json.nullable(data.filter_type, json.string)),
    #("platformAvailable", json.nullable(data.platform_available, json.bool)),
    #(
      "areServicesAvailable",
      json.nullable(data.are_services_available, json.bool),
    ),
    #(
      "filterLocationName",
      json.nullable(data.filter_location_name, json.string),
    ),
    #(
      "ferryServices",
      json.nullable(data.ferry_services, json.array(
        _,
        service_item_with_calling_points_encode,
      )),
    ),
    #("Xmlns", json.nullable(data.xmlns, xml_serializer_namespaces_encode)),
    #(
      "busServices",
      json.nullable(data.bus_services, json.array(
        _,
        service_item_with_calling_points_encode,
      )),
    ),
  ])
}

pub fn service_item_decoder() {
  use future_delay <- decode.optional_field(
    "futureDelay",
    None,
    decode.optional(decode.bool),
  )
  use is_circular_route <- decode.optional_field(
    "isCircularRoute",
    None,
    decode.optional(decode.bool),
  )
  use sta <- decode.optional_field("sta", None, decode.optional(decode.string))
  use std <- decode.optional_field("std", None, decode.optional(decode.string))
  use filter_location_cancelled <- decode.optional_field(
    "filterLocationCancelled",
    None,
    decode.optional(decode.bool),
  )
  use operator <- decode.optional_field(
    "operator",
    None,
    decode.optional(decode.string),
  )
  use future_cancellation <- decode.optional_field(
    "futureCancellation",
    None,
    decode.optional(decode.bool),
  )
  use length <- decode.optional_field(
    "length",
    None,
    decode.optional(decode.int),
  )
  use origin <- decode.optional_field(
    "origin",
    None,
    decode.optional(decode.list(service_location_decoder())),
  )
  use delay_reason <- decode.optional_field(
    "delayReason",
    None,
    decode.optional(decode.string),
  )
  use is_cancelled <- decode.optional_field(
    "isCancelled",
    None,
    decode.optional(decode.bool),
  )
  use affected_by <- decode.optional_field(
    "affectedBy",
    None,
    decode.optional(decode.string),
  )
  use destination <- decode.optional_field(
    "destination",
    None,
    decode.optional(decode.list(service_location_decoder())),
  )
  use uncertainty <- decode.optional_field(
    "uncertainty",
    None,
    decode.optional(uncertainty_type_decoder()),
  )
  use service_type <- decode.optional_field(
    "serviceType",
    None,
    decode.optional(decode.string),
  )
  use adhoc_alerts <- decode.optional_field(
    "adhocAlerts",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use service_id <- decode.optional_field(
    "serviceID",
    None,
    decode.optional(decode.string),
  )
  use formation <- decode.optional_field(
    "formation",
    None,
    decode.optional(formation_data_decoder()),
  )
  use operator_code <- decode.optional_field(
    "operatorCode",
    None,
    decode.optional(decode.string),
  )
  use eta <- decode.optional_field("eta", None, decode.optional(decode.string))
  use platform <- decode.optional_field(
    "platform",
    None,
    decode.optional(decode.string),
  )
  use diversion <- decode.optional_field(
    "diversion",
    None,
    decode.optional(service_item_diversion_decoder()),
  )
  use current_origins <- decode.optional_field(
    "currentOrigins",
    None,
    decode.optional(decode.list(service_location_decoder())),
  )
  use etd <- decode.optional_field("etd", None, decode.optional(decode.string))
  use detach_front <- decode.optional_field(
    "detachFront",
    None,
    decode.optional(decode.bool),
  )
  use is_reverse_formation <- decode.optional_field(
    "isReverseFormation",
    None,
    decode.optional(decode.bool),
  )
  use rsid <- decode.optional_field(
    "rsid",
    None,
    decode.optional(decode.string),
  )
  use cancel_reason <- decode.optional_field(
    "cancelReason",
    None,
    decode.optional(decode.string),
  )
  use current_destinations <- decode.optional_field(
    "currentDestinations",
    None,
    decode.optional(decode.list(service_location_decoder())),
  )
  decode.success(ServiceItem(
    future_delay: future_delay,
    is_circular_route: is_circular_route,
    sta: sta,
    std: std,
    filter_location_cancelled: filter_location_cancelled,
    operator: operator,
    future_cancellation: future_cancellation,
    length: length,
    origin: origin,
    delay_reason: delay_reason,
    is_cancelled: is_cancelled,
    affected_by: affected_by,
    destination: destination,
    uncertainty: uncertainty,
    service_type: service_type,
    adhoc_alerts: adhoc_alerts,
    service_id: service_id,
    formation: formation,
    operator_code: operator_code,
    eta: eta,
    platform: platform,
    diversion: diversion,
    current_origins: current_origins,
    etd: etd,
    detach_front: detach_front,
    is_reverse_formation: is_reverse_formation,
    rsid: rsid,
    cancel_reason: cancel_reason,
    current_destinations: current_destinations,
  ))
}

pub fn service_item_encode(data: ServiceItem) {
  json.object([
    #("futureDelay", json.nullable(data.future_delay, json.bool)),
    #("isCircularRoute", json.nullable(data.is_circular_route, json.bool)),
    #("sta", json.nullable(data.sta, json.string)),
    #("std", json.nullable(data.std, json.string)),
    #(
      "filterLocationCancelled",
      json.nullable(data.filter_location_cancelled, json.bool),
    ),
    #("operator", json.nullable(data.operator, json.string)),
    #("futureCancellation", json.nullable(data.future_cancellation, json.bool)),
    #("length", json.nullable(data.length, json.int)),
    #(
      "origin",
      json.nullable(data.origin, json.array(_, service_location_encode)),
    ),
    #("delayReason", json.nullable(data.delay_reason, json.string)),
    #("isCancelled", json.nullable(data.is_cancelled, json.bool)),
    #("affectedBy", json.nullable(data.affected_by, json.string)),
    #(
      "destination",
      json.nullable(data.destination, json.array(_, service_location_encode)),
    ),
    #("uncertainty", json.nullable(data.uncertainty, uncertainty_type_encode)),
    #("serviceType", json.nullable(data.service_type, json.string)),
    #(
      "adhocAlerts",
      json.nullable(data.adhoc_alerts, json.array(_, json.string)),
    ),
    #("serviceID", json.nullable(data.service_id, json.string)),
    #("formation", json.nullable(data.formation, formation_data_encode)),
    #("operatorCode", json.nullable(data.operator_code, json.string)),
    #("eta", json.nullable(data.eta, json.string)),
    #("platform", json.nullable(data.platform, json.string)),
    #("diversion", json.nullable(data.diversion, service_item_diversion_encode)),
    #(
      "currentOrigins",
      json.nullable(data.current_origins, json.array(_, service_location_encode)),
    ),
    #("etd", json.nullable(data.etd, json.string)),
    #("detachFront", json.nullable(data.detach_front, json.bool)),
    #("isReverseFormation", json.nullable(data.is_reverse_formation, json.bool)),
    #("rsid", json.nullable(data.rsid, json.string)),
    #("cancelReason", json.nullable(data.cancel_reason, json.string)),
    #(
      "currentDestinations",
      json.nullable(data.current_destinations, json.array(
        _,
        service_location_encode,
      )),
    ),
  ])
}

pub fn uncertainty_type_decoder() {
  use reason <- decode.optional_field(
    "reason",
    None,
    decode.optional(decode.string),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(decode.string),
  )
  decode.success(UncertaintyType(reason: reason, status: status))
}

pub fn uncertainty_type_encode(data: UncertaintyType) {
  json.object([
    #("reason", json.nullable(data.reason, json.string)),
    #("status", json.nullable(data.status, json.string)),
  ])
}

pub fn departure_item_decoder() {
  use crs <- decode.optional_field("crs", None, decode.optional(decode.string))
  use service <- decode.optional_field(
    "service",
    None,
    decode.optional(service_item_decoder()),
  )
  decode.success(DepartureItem(crs: crs, service: service))
}

pub fn departure_item_encode(data: DepartureItem) {
  json.object([
    #("crs", json.nullable(data.crs, json.string)),
    #("service", json.nullable(data.service, service_item_encode)),
  ])
}

pub fn departures_board_decoder() {
  use location_name <- decode.optional_field(
    "locationName",
    None,
    decode.optional(decode.string),
  )
  use generated_at <- decode.optional_field(
    "generatedAt",
    None,
    decode.optional(decode.string),
  )
  use crs <- decode.optional_field("crs", None, decode.optional(decode.string))
  use filtercrs <- decode.optional_field(
    "filtercrs",
    None,
    decode.optional(decode.string),
  )
  use nrcc_messages <- decode.optional_field(
    "nrccMessages",
    None,
    decode.optional(decode.list(nrccmessage_decoder())),
  )
  use filter_type <- decode.optional_field(
    "filterType",
    None,
    decode.optional(decode.string),
  )
  use platform_available <- decode.optional_field(
    "platformAvailable",
    None,
    decode.optional(decode.bool),
  )
  use are_services_available <- decode.optional_field(
    "areServicesAvailable",
    None,
    decode.optional(decode.bool),
  )
  use filter_location_name <- decode.optional_field(
    "filterLocationName",
    None,
    decode.optional(decode.string),
  )
  use xmlns <- decode.optional_field(
    "Xmlns",
    None,
    decode.optional(xml_serializer_namespaces_decoder()),
  )
  use departures <- decode.optional_field(
    "departures",
    None,
    decode.optional(decode.list(departure_item_decoder())),
  )
  decode.success(DeparturesBoard(
    location_name: location_name,
    generated_at: generated_at,
    crs: crs,
    filtercrs: filtercrs,
    nrcc_messages: nrcc_messages,
    filter_type: filter_type,
    platform_available: platform_available,
    are_services_available: are_services_available,
    filter_location_name: filter_location_name,
    xmlns: xmlns,
    departures: departures,
  ))
}

pub fn departures_board_encode(data: DeparturesBoard) {
  json.object([
    #("locationName", json.nullable(data.location_name, json.string)),
    #("generatedAt", json.nullable(data.generated_at, json.string)),
    #("crs", json.nullable(data.crs, json.string)),
    #("filtercrs", json.nullable(data.filtercrs, json.string)),
    #(
      "nrccMessages",
      json.nullable(data.nrcc_messages, json.array(_, nrccmessage_encode)),
    ),
    #("filterType", json.nullable(data.filter_type, json.string)),
    #("platformAvailable", json.nullable(data.platform_available, json.bool)),
    #(
      "areServicesAvailable",
      json.nullable(data.are_services_available, json.bool),
    ),
    #(
      "filterLocationName",
      json.nullable(data.filter_location_name, json.string),
    ),
    #("Xmlns", json.nullable(data.xmlns, xml_serializer_namespaces_encode)),
    #(
      "departures",
      json.nullable(data.departures, json.array(_, departure_item_encode)),
    ),
  ])
}

pub fn service_item_diversion_between_start_decoder() {
  use crs <- decode.optional_field("crs", None, decode.optional(decode.string))
  use value <- decode.optional_field(
    "Value",
    None,
    decode.optional(decode.string),
  )
  decode.success(ServiceItemDiversionBetweenStart(crs: crs, value: value))
}

pub fn service_item_diversion_between_start_encode(
  data: ServiceItemDiversionBetweenStart,
) {
  json.object([
    #("crs", json.nullable(data.crs, json.string)),
    #("Value", json.nullable(data.value, json.string)),
  ])
}

pub fn coach_data_decoder() {
  use number <- decode.optional_field(
    "number",
    None,
    decode.optional(decode.string),
  )
  use toilet <- decode.optional_field(
    "toilet",
    None,
    decode.optional(toilet_availability_type_decoder()),
  )
  use loading_specified <- decode.optional_field(
    "loadingSpecified",
    None,
    decode.optional(decode.bool),
  )
  use loading <- decode.optional_field(
    "loading",
    None,
    decode.optional(decode.int),
  )
  use coach_class <- decode.optional_field(
    "coachClass",
    None,
    decode.optional(decode.string),
  )
  decode.success(CoachData(
    number: number,
    toilet: toilet,
    loading_specified: loading_specified,
    loading: loading,
    coach_class: coach_class,
  ))
}

pub fn coach_data_encode(data: CoachData) {
  json.object([
    #("number", json.nullable(data.number, json.string)),
    #("toilet", json.nullable(data.toilet, toilet_availability_type_encode)),
    #("loadingSpecified", json.nullable(data.loading_specified, json.bool)),
    #("loading", json.nullable(data.loading, json.int)),
    #("coachClass", json.nullable(data.coach_class, json.string)),
  ])
}

pub fn nrccmessage_decoder() {
  use value <- decode.optional_field(
    "Value",
    None,
    decode.optional(decode.string),
  )
  decode.success(Nrccmessage(value: value))
}

pub fn nrccmessage_encode(data: Nrccmessage) {
  json.object([#("Value", json.nullable(data.value, json.string))])
}

pub fn toilet_availability_type_decoder() {
  use value <- decode.optional_field(
    "Value",
    None,
    decode.optional(decode.string),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(decode.string),
  )
  decode.success(ToiletAvailabilityType(value: value, status: status))
}

pub fn toilet_availability_type_encode(data: ToiletAvailabilityType) {
  json.object([
    #("Value", json.nullable(data.value, json.string)),
    #("status", json.nullable(data.status, json.string)),
  ])
}

pub fn xml_serializer_namespaces_decoder() {
  use count <- decode.optional_field("Count", None, decode.optional(decode.int))
  decode.success(XmlSerializerNamespaces(count: count))
}

pub fn xml_serializer_namespaces_encode(data: XmlSerializerNamespaces) {
  json.object([#("Count", json.nullable(data.count, json.int))])
}
