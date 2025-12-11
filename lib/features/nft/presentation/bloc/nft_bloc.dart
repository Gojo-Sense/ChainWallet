// ============================================================================
// FILE: nft_bloc.dart
// PURPOSE: BLoC for NFT gallery state management
// ============================================================================

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/repositories/nft_repository_impl.dart';
import '../../domain/entities/nft_entity.dart';

part 'nft_bloc.freezed.dart';

// Events
@freezed
sealed class NFTEvent with _$NFTEvent {
  const NFTEvent._();
  const factory NFTEvent.load() = LoadNFTsEvent;
  const factory NFTEvent.selectNFT(NFT nft) = SelectNFTEvent;
  const factory NFTEvent.clearSelection() = ClearSelectionEvent;
}

// State
@freezed
sealed class NFTState with _$NFTState {
  const NFTState._();
  
  const factory NFTState({
    @Default([]) List<NFT> nfts,
    @Default([]) List<NFTCollection> collections,
    @Default(false) bool isLoading,
    NFT? selectedNFT,
    String? error,
  }) = _NFTState;

  factory NFTState.initial() => const NFTState();

  double get totalFloorValue {
    return nfts.fold(0.0, (sum, nft) => sum + (nft.floorPrice ?? 0));
  }
}

@injectable
class NFTBloc extends Bloc<NFTEvent, NFTState> {
  final INFTRepository _repository;

  NFTBloc(this._repository) : super(NFTState.initial()) {
    on<LoadNFTsEvent>(_onLoad);
    on<SelectNFTEvent>(_onSelect);
    on<ClearSelectionEvent>(_onClearSelection);
  }

  Future<void> _onLoad(
    LoadNFTsEvent event,
    Emitter<NFTState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    final nftsResult = await _repository.getNFTs();
    final collectionsResult = await _repository.getCollections();

    nftsResult.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        error: failure.message,
      )),
      (nfts) {
        collectionsResult.fold(
          (failure) => emit(state.copyWith(
            isLoading: false,
            nfts: nfts,
          )),
          (collections) => emit(state.copyWith(
            isLoading: false,
            nfts: nfts,
            collections: collections,
          )),
        );
      },
    );
  }

  void _onSelect(
    SelectNFTEvent event,
    Emitter<NFTState> emit,
  ) {
    emit(state.copyWith(selectedNFT: event.nft));
  }

  void _onClearSelection(
    ClearSelectionEvent event,
    Emitter<NFTState> emit,
  ) {
    emit(state.copyWith(selectedNFT: null));
  }
}


