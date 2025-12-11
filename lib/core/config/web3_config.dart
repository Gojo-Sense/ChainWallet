// ============================================================================
// FILE: web3_config.dart
// PURPOSE: Web3 and blockchain configuration
// ============================================================================

/// Ethereum network configurations
class EthereumNetworks {
  static const String mainnet = 'https://eth.llamarpc.com';
  static const String sepolia = 'https://rpc.sepolia.org';
  static const String goerli = 'https://rpc.ankr.com/eth_goerli';
  
  // Infura endpoints (require API key)
  static String infuraMainnet(String apiKey) => 
      'https://mainnet.infura.io/v3/$apiKey';
  static String infuraSepolia(String apiKey) => 
      'https://sepolia.infura.io/v3/$apiKey';
  
  // Alchemy endpoints (require API key)
  static String alchemyMainnet(String apiKey) => 
      'https://eth-mainnet.g.alchemy.com/v2/$apiKey';
}

/// Default RPC URL (can be overridden via environment or config)
String getDefaultRpcUrl() {
  // In production, get from environment variables or config file
  return EthereumNetworks.mainnet;
}



