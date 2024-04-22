import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://fzztpbnzwzxoeqraffar.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ6enRwYm56d3p4b2VxcmFmZmFyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTAzMDg4MjMsImV4cCI6MjAyNTg4NDgyM30.h1o9lxb_19CrEwoAHfvltG3vmisdb_ZXbY4DKFHiu_4';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
