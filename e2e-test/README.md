# MCP Server E2E Test Suite

A comprehensive, world-class test suite for the Reddit MCP Server using the official MCP SDK and bash scripts.

## Structure

```
e2e-test/
├── typescript/         # TypeScript tests using MCP SDK
│   ├── test-tools.ts      # Tests MCP tools functionality
│   ├── test-prompts.ts    # Tests MCP prompts functionality
│   ├── test-resources.ts  # Tests MCP resources functionality
│   ├── test-sampling.ts   # Tests MCP sampling flow
│   ├── test-concurrent.ts # Tests concurrent operations
│   └── test-utils.ts      # Shared test utilities
├── bash-scripts/       # Bash integration tests
│   ├── run-all.sh            # Runs all bash tests
│   ├── test-tools.sh         # Basic tool testing
│   ├── test-concurrent-sessions.sh  # Concurrent session testing
│   ├── test-concurrent-tools.sh     # Concurrent tool calls
│   └── test-full-flow.sh           # Full integration flow
├── index.ts           # Main test runner
├── package.json       # Test dependencies
└── tsconfig.json      # TypeScript configuration
```

## Prerequisites

1. Node.js 18+ installed
2. MCP server running (locally or via Docker)
3. Valid `.env` file with:
   ```env
   MCP_ACCESS_TOKEN=your-token
   MCP_BASE_URL=http://127.0.0.1:3000
   ```

## Running Tests

### From Root Directory

```bash
# Run all E2E tests
npm run test:e2e

# Run specific test suites
npm run test:e2e:tools      # Tools tests only
npm run test:e2e:prompts    # Prompts tests only
npm run test:e2e:resources  # Resources tests only
npm run test:e2e:sampling   # Sampling tests only
npm run test:e2e:concurrent # Concurrent tests only
npm run test:e2e:bash       # Bash scripts only

# Run with Docker
npm run test:e2e:docker
```

### From Test Directory

```bash
cd e2e-test
npm install
npm test               # Run all tests
npm test tools         # Run specific suite
npm run test:bash      # Run bash scripts
```

## Test Coverage

### TypeScript Tests (SDK-based)
- **Tools**: Tests all MCP tools including discovery, execution, and error handling
- **Prompts**: Tests prompt listing, retrieval, and argument validation
- **Resources**: Tests resource discovery, reading, and URI validation
- **Sampling**: Tests AI sampling flow with tool integration
- **Concurrent**: Tests concurrent operations and high-volume requests

### Bash Scripts (HTTP/SSE-based)
- **Tools**: Direct HTTP testing of tool endpoints
- **Concurrent Sessions**: Multiple simultaneous MCP sessions
- **Concurrent Tools**: Parallel tool execution
- **Full Flow**: End-to-end integration scenarios

## Features

- ✅ No duplication between tests
- ✅ Clean, modular structure
- ✅ Comprehensive error handling
- ✅ Colored console output
- ✅ Detailed test summaries
- ✅ Both SDK and HTTP testing approaches
- ✅ Docker support
- ✅ CI/CD ready

## Writing New Tests

### TypeScript Test Template

```typescript
import { createMCPClient, log, TestTracker, runTest } from './test-utils.js';
import type { Client } from '@modelcontextprotocol/sdk/client/index.js';

async function testFeature(client: Client): Promise<void> {
  // Test implementation
}

export async function testSuite(): Promise<void> {
  log.section('🚀 Testing Feature');
  const tracker = new TestTracker();
  let client: Client | null = null;
  
  try {
    client = await createMCPClient();
    await runTest('Feature Test', () => testFeature(client!), tracker);
    tracker.printSummary();
  } finally {
    if (client) await client.close();
  }
}
```

### Bash Test Template

```bash
#!/bin/bash
set -e

# Load environment
source ../.env

# Test implementation
echo "Testing feature..."
# Add curl commands here

echo "✅ Test passed!"
```

## Troubleshooting

1. **Connection errors**: Ensure MCP server is running and accessible
2. **Authentication errors**: Check `MCP_ACCESS_TOKEN` in `.env`
3. **TypeScript errors**: Run `npm run build` to check compilation
4. **Bash permission errors**: Run `chmod +x bash-scripts/*.sh`

## Contributing

When adding new tests:
1. Follow the existing patterns
2. Add to appropriate category (tools, prompts, etc.)
3. Update this README
4. Ensure no duplication with existing tests
5. Add proper error handling and logging
- `MCP_REFRESH_TOKEN` - OAuth refresh token (required)
- `MCP_BASE_URL` - MCP server URL (default: http://localhost:3000)

## Example Output

```
Reddit MCP Server Test Client
==================================================

🚀 Initializing MCP Connection
✅ Connected to systemprompt-mcp-reddit v2.0.0
ℹ Protocol version: 2024-11-05
ℹ Server capabilities: tools, sampling, prompts, resources

🔧 Available Tools
✅ Found 13 tools:
  analyse_subreddit: Analyse subreddit content and trends using AI assistance
  get_channel: Get subreddit information and rules
  get_comment: Get a specific Reddit comment by ID
  ... (more tools)

📝 Available Prompts
✅ Found 6 prompts:
  analyse_subreddit: Analyse a subreddit's content and provide insights
  create_reddit_comment: Generate a Reddit comment
  ... (more prompts)

🧪 Testing Tools
📬 Testing get_notifications...
✅ Retrieved 3 notifications
🔍 Testing search_reddit...
✅ Found 3 posts
  Top result: JavaScript is now a system language
    Score: 1234, Comments: 567
```

## Troubleshooting

- **Connection refused**: Make sure the MCP server is running (`docker-compose up`)
- **401 Unauthorized**: Your access token may have expired. Generate new tokens through the OAuth flow
- **Tool errors**: Some tools require specific Reddit permissions. Check the error messages for details