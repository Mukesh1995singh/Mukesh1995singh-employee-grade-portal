{{/*
Expand the name of the chart.
*/}}
{{- define "helm-chart.name" -}}
{{- default .Chart.Name .Values.microservice.name | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Create a fully qualified app name.
*/}}
{{- define "helm-chart.fullname" -}}
{{- .Values.microservice.name | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Create the chart name and version.
*/}}
{{- define "helm-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Common labels.
*/}}
{{- define "helm-chart.labels" -}}
helm.sh/chart: {{ include "helm-chart.chart" . }}
app.kubernetes.io/name: {{ include "helm-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{/*
Selector labels.
*/}}
{{- define "helm-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "helm-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/*
Create the service account name.
*/}}
{{- define "helm-chart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "helm-chart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}