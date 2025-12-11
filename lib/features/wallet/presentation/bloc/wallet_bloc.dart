// ============================================================================
// FILE: wallet_bloc.dart
// PURPOSE: BLoC for wallet feature handling all wallet operations
// ============================================================================

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/wallet_entity.dart';
import '../../domain/failures/wallet_failure.dart';
import '../../domain/repositories/i_wallet_repository.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';
part 'wallet_bloc.freezed.dart';

@injectable
class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc(this._repository) : super(const WalletState.initial()) {
    on<CheckWalletExists>(_onCheckWalletExists);
    on<GenerateMnemonic>(_onGenerateMnemonic);
    on<CreateWallet>(_onCreateWallet);
    on<ImportWallet>(_onImportWallet);
    on<LoadWallet>(_onLoadWallet);
    on<DeleteWallet>(_onDeleteWallet);
    on<CopyToClipboard>(_onCopyToClipboard);
  }

  final IWalletRepository _repository;

  Future<void> _onCheckWalletExists(
    CheckWalletExists event,
    Emitter<WalletState> emit,
  ) async {
    emit(const WalletState.loading());

    final result = await _repository.hasWallet();

    result.fold(
      (failure) => emit(WalletState.failure(failure)),
      (exists) {
        if (exists) {
          add(const WalletEvent.loadWallet());
        } else {
          emit(const WalletState.noWallet());
        }
      },
    );
  }

  Future<void> _onGenerateMnemonic(
    GenerateMnemonic event,
    Emitter<WalletState> emit,
  ) async {
    emit(const WalletState.loading());

    final result = await _repository.generateMnemonic();

    result.fold(
      (failure) => emit(WalletState.failure(failure)),
      (mnemonic) => emit(WalletState.mnemonicGenerated(mnemonic)),
    );
  }

  Future<void> _onCreateWallet(
    CreateWallet event,
    Emitter<WalletState> emit,
  ) async {
    emit(const WalletState.loading());

    final result = await _repository.createWallet(event.mnemonic);

    result.fold(
      (failure) => emit(WalletState.failure(failure)),
      (wallet) => emit(WalletState.walletCreated(wallet)),
    );
  }

  Future<void> _onImportWallet(
    ImportWallet event,
    Emitter<WalletState> emit,
  ) async {
    emit(const WalletState.loading());

    final result = await _repository.importWallet(event.privateKey);

    result.fold(
      (failure) => emit(WalletState.failure(failure)),
      (wallet) => emit(WalletState.walletCreated(wallet)),
    );
  }

  Future<void> _onLoadWallet(
    LoadWallet event,
    Emitter<WalletState> emit,
  ) async {
    emit(const WalletState.loading());

    final result = await _repository.getWallet();

    result.fold(
      (failure) => emit(WalletState.failure(failure)),
      (wallet) => emit(WalletState.walletLoaded(wallet)),
    );
  }

  Future<void> _onDeleteWallet(
    DeleteWallet event,
    Emitter<WalletState> emit,
  ) async {
    emit(const WalletState.loading());

    final result = await _repository.deleteWallet();

    result.fold(
      (failure) => emit(WalletState.failure(failure)),
      (_) => emit(const WalletState.walletDeleted()),
    );
  }

  Future<void> _onCopyToClipboard(
    CopyToClipboard event,
    Emitter<WalletState> emit,
  ) async {
    await Clipboard.setData(ClipboardData(text: event.text));
    HapticFeedback.lightImpact();
    emit(const WalletState.copiedToClipboard());
  }
}

