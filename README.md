> ## ⚠️ Deprecated — no longer maintained
>
> This repository has been superseded. All new development and support lives in:
>
> - **[systempromptio/systemprompt-template](https://github.com/systempromptio/systemprompt-template)** — start here. Self-hosted evaluation of the full systemprompt.io AI governance infrastructure.
> - **[systempromptio/systemprompt-core](https://github.com/systempromptio/systemprompt-core)** — the underlying Rust library (MCP, A2A, OAuth 2.1, audit, compile-time extensions).
>
> Learn more at [systemprompt.io](https://systemprompt.io).
>
> _The original README is preserved below for historical reference._

---

# systemprompt-mcp-server

[![npm version](https://img.shields.io/npm/v/@systemprompt/systemprompt-mcp-server.svg)](https://www.npmjs.com/package/@systemprompt/systemprompt-mcp-server)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Twitter Follow](https://img.shields.io/twitter/follow/tyingshoelaces_?style=social)](https://twitter.com/tyingshoelaces_)
[![Discord](https://img.shields.io/discord/1255160891062620252?color=7289da&label=discord)](https://discord.com/invite/wkAbSuPWpr)

[Website](https://systemprompt.io) | [Documentation](https://systemprompt.io/mcp-server)

## Sponsored by systemprompt.io

This MCP server implementation is **sponsored by [systemprompt.io](https://systemprompt.io)** — creators of the **world's first native mobile MCP client for iOS and Android** — and provided completely **free and open source** to the community. 

**If you find this project useful, we'd appreciate:**
- ⭐ **A star on this repository**
- 👍 **A like/follow on our social channels**
- 🔗 **Sharing with your network**

Your support helps us continue creating valuable open source tools for the AI community!

> 🚀 **Learn More**: For an interactive walkthrough of this implementation with live SDK testing, visit [systemprompt.io/mcp-server](https://systemprompt.io/mcp-server)

A production-ready Model Context Protocol (MCP) server that demonstrates the **complete MCP specification** including OAuth 2.1, sampling, elicitation, structured data validation, and real-time notifications. 

**This implementation uses Reddit as a real-world example to demonstrate OAuth 2.1 flow and advanced MCP features**, but the architecture is designed to be easily adapted for any API that requires OAuth authentication.

This server works with any MCP-compliant client that supports advanced features like sampling and notifications.

### 🔍 MCP Inspector Compatible

This server is **fully compatible** with the [MCP Inspector](https://modelcontextprotocol.io/docs/tools/inspector), providing perfect support for:
- ✅ **OAuth 2.1 Authentication** - Complete flow with PKCE
- ✅ **Tools** - All Reddit interaction capabilities  
- ✅ **Prompts** - Dynamic content generation prompts
- ✅ **Sampling** - AI-assisted content with human approval
- ✅ **Notifications** - Real-time progress updates

Test it yourself: `npm run inspector`

## 🌟 Why This Implementation Matters

### OAuth 2.1 Demonstration with Reddit

This implementation uses **Reddit's API as a real-world example** to demonstrate how to build a complete OAuth 2.1 flow in an MCP server. Reddit was chosen because:
- It requires OAuth authentication for most operations
- It provides a rich API for demonstrating various MCP features
- It's a well-documented, publicly accessible API
- It showcases real-world authentication challenges and solutions

**Note**: While this server uses Reddit, the OAuth implementation and architecture patterns are designed to be easily adapted for any OAuth-based API (GitHub, Google, Slack, etc.).

### Key Features Demonstrated

This repository serves as the **gold standard** for MCP server implementations, showcasing:

- **Complete MCP Spec Coverage**: Every feature from OAuth to sampling is implemented
- **Production Architecture**: Multi-user sessions, security, and scalability built-in
- **Developer Experience**: Clean code structure perfect for learning or forking
- **Real-World OAuth Integration**: Full OAuth 2.1 flow with PKCE, JWT tokens, and session management
- **AI-Native Design**: Deep integration with LLMs for content generation and analysis

## 📚 Table of Contents

- [Features](#-features)
- [Quick Start](#-quick-start)
- [Architecture](#-architecture)
- [OAuth Implementation](#-oauth-implementation)
- [Tool Reference](#-tool-reference)
- [Advanced Features](#-advanced-features)
- [Using as a Template](#-using-as-a-template)
- [Development](#-development)
- [Code Structure](#-code-structure)
- [Contributing](#-contributing)
- [Related Projects](#-related-projects)

## ✨ Features

### Core MCP Implementation

- **🔐 OAuth 2.1 Flow**: Complete 8-step implementation with PKCE and JWT
- **🛠️ Tool System**: Comprehensive tools for Reddit interaction
- **📚 Resources & Prompts**: Dynamic prompt generation and resource management
- **🤖 Sampling**: AI-assisted content generation with human oversight
- **💬 Elicitation**: Dynamic user input gathering during tool execution
- **✅ Structured Data**: JSON Schema validation for all inputs/outputs
- **📡 Notifications**: Real-time progress updates and status notifications
- **🔄 Session Management**: Multi-user support with automatic cleanup

### Reddit Integration Features

- **Content Discovery**: Search and analyze Reddit content
- **User Interactions**: View messages, notifications, and manage account
- **Subreddit Information**: Retrieve subreddit details and posts
- **Comment Threads**: Navigate and analyze Reddit discussions

### Developer Features

- **TypeScript**: Full type safety with comprehensive interfaces
- **Modular Architecture**: Clean separation of concerns
- **Error Handling**: Robust error management with custom error types
- **Docker Support**: Ready for containerized deployment
- **Testing**: Example test implementations included
- **Documentation**: Extensive inline documentation and examples

## 🚀 Quick Start

### 🐳 Simplest Installation (Docker with npx)

Run the server instantly with Docker - no installation required:

#### Step 1: Create Reddit App & Initial Config

1. Create a Reddit app at [reddit.com/prefs/apps](https://reddit.com/prefs/apps)
   - Choose "script" type
   - Set redirect URI: `http://localhost:3000/oauth/reddit/callback`

2. Create initial `.env` file:
```bash
cat > .env << EOF
REDDIT_CLIENT_ID=your_reddit_client_id
REDDIT_CLIENT_SECRET=your_reddit_client_secret
JWT_SECRET=any_random_string_here
EOF
```

#### Step 2: Run the Server

```bash
# Run with Docker (pulls image automatically)
docker run -it --rm \
  -p 3000:3000 \
  --env-file .env \
  --name mcp-reddit \
  node:20-slim \
  npx @systemprompt/systemprompt-mcp-server
```

#### Step 3: Complete OAuth Authentication

1. In your MCP client, connect to `http://localhost:3000`
2. The OAuth flow will start automatically
3. Authorize the app in your browser
4. Copy the returned OAuth token

#### Step 4: Update Environment with Token

```bash
# Stop the container (Ctrl+C)

# Add the OAuth token to your .env file
echo "OAUTH_ACCESS_TOKEN=your_oauth_token_here" >> .env

# Restart with the token
docker run -it --rm \
  -p 3000:3000 \
  --env-file .env \
  node:20-slim \
  npx @systemprompt/systemprompt-mcp-server
```

Now you can use all Reddit tools with your authenticated session!

### Installation

```bash
# Via npm
npm install -g @systemprompt/systemprompt-mcp-server

# Via npx (no installation)
npx @systemprompt/systemprompt-mcp-server

# Clone for development
git clone https://github.com/systempromptio/systemprompt-mcp-server.git
cd systemprompt-mcp-server
npm install
npm run build
```

### Configuration

1. **Create Reddit App**: [reddit.com/prefs/apps](https://reddit.com/prefs/apps)
   - Choose "script" type
   - Set redirect URI: `http://localhost:3000/oauth/reddit/callback`

2. **Set Environment Variables**:

Create a `.env` file in the project root:

```bash
# Required for Reddit API
REDDIT_CLIENT_ID=your_reddit_client_id
REDDIT_CLIENT_SECRET=your_reddit_client_secret
JWT_SECRET=your_jwt_secret       # Secret for JWT signing

# Optional
PORT=3000                        # Server port (default: 3000)
OAUTH_ISSUER=http://localhost:3000  # OAuth issuer URL
REDIRECT_URL=http://localhost:3000/oauth/reddit/callback  # OAuth redirect
REDDIT_USER_AGENT=linux:systemprompt-mcp-reddit:v2.0.0   # Reddit user agent
REDDIT_USERNAME=your_reddit_username  # Your Reddit username (optional)
LOG_LEVEL=debug                  # Logging level (debug, info, warn, error)
```

**Note**: Environment variables are required for both local development and Docker deployment.

### Running the Server

```bash
# Build the TypeScript code
npm run build

# Run the built server
node build/index.js

# Development with watch mode
npm run watch
# In another terminal:
node build/index.js

# With Docker
npm run docker
```

## 🏗️ Architecture

This implementation follows clean architecture principles with clear separation between layers:

```
┌─────────────────────────────────────────────────────────┐
│                    Client Application                    │
│                  (systemprompt.io)                      │
└────────────────────────┬────────────────────────────────┘
                         │ MCP Protocol
┌────────────────────────┴────────────────────────────────┐
│                    MCP Server Layer                      │
│  ┌─────────────┐  ┌─────────────┐  ┌────────────────┐  │
│  │   OAuth 2.1 │  │   Session   │  │  Notification  │  │
│  │   Handler   │  │   Manager   │  │    Manager     │  │
│  └─────────────┘  └─────────────┘  └────────────────┘  │
└────────────────────────┬────────────────────────────────┘
                         │
┌────────────────────────┴────────────────────────────────┐
│                   Handler Layer                          │
│  ┌─────────────┐  ┌─────────────┐  ┌────────────────┐  │
│  │    Tools    │  │  Resources  │  │    Sampling    │  │
│  │   Handler   │  │   Handler   │  │    Handler     │  │
│  └─────────────┘  └─────────────┘  └────────────────┘  │
└────────────────────────┬────────────────────────────────┘
                         │
┌────────────────────────┴────────────────────────────────┐
│                   Service Layer                          │
│  ┌─────────────┐  ┌─────────────┐  ┌────────────────┐  │
│  │   Reddit    │  │    Auth     │  │     Fetch      │  │
│  │   Service   │  │   Service   │  │    Service     │  │
│  └─────────────┘  └─────────────┘  └────────────────┘  │
└─────────────────────────────────────────────────────────┘
```

### Key Components

- **`src/server.ts`**: Main HTTP server setup and Express configuration
- **`src/server/`**: Core server infrastructure (MCP, OAuth, auth management)
- **`src/handlers/`**: Request handlers for tools, prompts, resources, and sampling
- **`src/services/`**: Business logic and Reddit API integration
- **`src/constants/`**: Tool definitions, server configuration, and schemas
- **`src/types/`**: TypeScript type definitions and interfaces

## 🔐 OAuth Implementation

This server implements the complete [MCP OAuth 2.1 specification](https://spec.modelcontextprotocol.io/specification/2024-11-05/authentication/):

### OAuth Flow Steps

1. **Initial 401 Response** ([src/server/oauth.ts](src/server/oauth.ts))
   ```typescript
   WWW-Authenticate: Bearer realm="MCP Reddit Server"
   ```

2. **Resource Metadata** ([src/server/oauth.ts](src/server/oauth.ts))
   ```json
   {
     "authorization_server": "http://localhost:3000/.well-known/oauth"
   }
   ```

3. **Authorization Server Metadata** ([src/server/oauth.ts](src/server/oauth.ts))
   - Token endpoint configuration
   - PKCE support declaration
   - Grant types supported

4. **Authorization Request** ([src/server/oauth.ts](src/server/oauth.ts))
   - PKCE code challenge
   - State parameter for CSRF protection
   - Reddit OAuth redirect handling

5. **Reddit OAuth Callback** ([src/server/oauth.ts](src/server/oauth.ts))
   - Reddit authorization handling
   - Secure state validation

6. **Token Exchange** ([src/server/oauth.ts](src/server/oauth.ts))
   - PKCE verification
   - JWT token generation
   - Reddit credentials embedding

7. **Authenticated Requests** ([src/server/middleware.ts](src/server/middleware.ts))
   - JWT validation
   - Session management
   - Request context injection

### Security Features

- **PKCE Implementation**: Prevents authorization code interception
- **JWT Tokens**: Secure credential storage and transmission
- **Session Isolation**: Each user has isolated Reddit credentials
- **Automatic Cleanup**: Sessions expire after inactivity

## 🛠️ Tool Reference

### Content Discovery Tools

#### `search_reddit`
Search across Reddit with filters ([src/handlers/tools/search-reddit.ts](src/handlers/tools/search-reddit.ts))
```typescript
{
  "query": "typescript MCP",
  "subreddit": "programming",      // Optional specific subreddit
  "sort": "relevance",
  "time": "week",
  "limit": 10
}
```

#### `get_post`
Fetch a specific post with comments ([src/handlers/tools/get-post.ts](src/handlers/tools/get-post.ts))
```typescript
{
  "id": "post_id_here"             // Reddit post ID
}
```

#### `get_channel`
Get subreddit posts ([src/handlers/tools/get-channel.ts](src/handlers/tools/get-channel.ts))
```typescript
{
  "subreddit": "programming",
  "sort": "hot"                    // "hot", "new", or "controversial"
}
```

### User Interaction Tools

#### `get_notifications`
Fetch user notifications and messages ([src/handlers/tools/get-notifications.ts](src/handlers/tools/get-notifications.ts))
```typescript
{
  "filter": "unread",              // "all", "unread", "messages", "comments", "mentions"
  "limit": 25,
  "markRead": false
}
```

#### `get_comment`
Retrieve a specific comment ([src/handlers/tools/get-comment.ts](src/handlers/tools/get-comment.ts))
```typescript
{
  "id": "comment_id_here",
  "includeThread": true            // Include full comment thread
}
```

### Example and Development Tools

#### `elicitation_example`
Demonstrates user input gathering ([src/handlers/tools/elicitation-example.ts](src/handlers/tools/elicitation-example.ts))
```typescript
{
  "type": "input",                 // "input", "confirm", "choice"
  "prompt": "Enter your choice",
  "options": ["option1", "option2"] // For choice type
}
```

#### `sampling_example`
Demonstrates AI-assisted content generation ([src/handlers/tools/sampling-example.ts](src/handlers/tools/sampling-example.ts))
```typescript
{
  "prompt": "Generate a code example",
  "maxTokens": 1000,
  "temperature": 0.7
}
```

#### `structured_data_example`
Demonstrates structured data handling ([src/handlers/tools/structured-data-example.ts](src/handlers/tools/structured-data-example.ts))
```typescript
{
  "format": "json",               // "json", "table", "markdown"
  "data": { "key": "value" }
}
```

#### `validation_example`
Demonstrates input validation ([src/handlers/tools/validation-example.ts](src/handlers/tools/validation-example.ts))
```typescript
{
  "test_string": "example",
  "test_number": 42,
  "test_enum": "option1"
}
```

#### `mcp_logging`
Request server to log messages ([src/handlers/tools/logging.ts](src/handlers/tools/logging.ts))
```typescript
{
  "level": "info",                // "debug", "info", "warning", "error"
  "message": "Debug message",
  "data": { "additional": "context" }
}
```


## 🎯 Advanced Features

### Sampling (AI-Assisted Content Generation)

The sampling implementation ([src/handlers/sampling.ts](src/handlers/sampling.ts)) follows the complete MCP specification:

```typescript
// 1. Client requests AI assistance
await client.callTool("sampling_example", { 
  prompt: "Analyze this subreddit and suggest actions",
  maxTokens: 1000,
  temperature: 0.7
});

// 2. Server initiates sampling for content generation
const samplingRequest = {
  method: "sampling/createMessage",
  params: {
    messages: [{
      role: "user",
      content: {
        type: "text",
        text: "Analyze this subreddit and suggest actions"
      }
    }],
    maxTokens: 1000,
    temperature: 0.7,
    _meta: {
      callback: "suggest_action"
    }
  }
};

// 3. AI generates content
// 4. Callback processes the response
// 5. Client receives the final result
```

### Elicitation (Dynamic Input Gathering)

Example implementation ([src/handlers/tools/elicitation-example.ts](src/handlers/tools/elicitation-example.ts)):

```typescript
// Call the elicitation example tool
await client.callTool("elicitation_example", {
  type: "input",
  prompt: "Enter post title",
  options: []
});

// The tool demonstrates different elicitation types:
// - "input": Text input from user
// - "confirm": Yes/no confirmation
// - "choice": Multiple choice selection
```

### Progress Notifications

Real-time updates during operations ([src/handlers/notifications.ts](src/handlers/notifications.ts)):

```typescript
// Send notifications during long-running operations
await sendProgressNotification("Processing request...", sessionId);
await sendSamplingCompleteNotification("Analysis complete", sessionId);

// Notifications are automatically sent to the MCP client
// providing real-time feedback during tool execution
```

### Structured Data Validation

All inputs use Zod schema validation ([src/handlers/tool-handlers.ts](src/handlers/tool-handlers.ts)):

```typescript
// Example Zod schema for Reddit search
const SearchRedditSchema = z.object({
  query: z.string().min(1).max(500).describe("Search query"),
  subreddit: z.string().optional().describe("Optional subreddit filter"),
  sort: z.enum(["relevance", "hot", "new", "top"]).default("relevance"),
  time: z.enum(["hour", "day", "week", "month", "year", "all"]).default("all"),
  limit: z.number().int().min(1).max(100).default(25)
});

// Validation is automatic and provides detailed error messages
const args = SearchRedditSchema.parse(request.params.arguments);
```

## 🎨 Using as a Template

This codebase is designed to be forked and adapted for other MCP implementations:

### Step 1: Fork and Clone
```bash
git clone https://github.com/your-username/your-mcp-server.git
cd your-mcp-server
```

### Step 2: Replace Service Layer
Replace Reddit-specific services in `src/services/` with your API:

```typescript
// src/services/your-api/your-service.ts
export class YourAPIService {
  async fetchData(params: YourParams): Promise<YourData> {
    // Your API integration
  }
}
```

### Step 3: Define New Tools
Create tools in `src/handlers/tools/`:

```typescript
// src/handlers/tools/your-tool.ts
export const yourTool: ToolDefinition = {
  schema: {
    name: "your_tool",
    description: "What your tool does",
    inputSchema: {
      type: "object",
      properties: {
        // Your parameters
      }
    }
  },
  handler: async (params, context) => {
    // Tool implementation
  }
};
```

### Step 4: Update Configuration
Modify `src/constants/server/server-config.ts`:

```typescript
export const serverConfig = {
  name: "your-mcp-server",
  version: "1.0.0",
  description: "Your MCP server description"
};

export const serverCapabilities = {
  tools: {},
  prompts: {},
  resources: {},
  sampling: {}
};
```

## 💻 Development

### Prerequisites
- Node.js 18+
- npm or yarn
- Reddit account and app credentials

### Development Commands

```bash
# Install dependencies
npm install

# Build TypeScript
npm run build

# Watch mode for development
npm run watch

# Run tests (requires OAuth tokens - see below)
npm run test

# Run end-to-end tests
npm run e2e

# Build and run with Docker
npm run docker
```

### Testing

#### Testing with MCP Inspector

The server is fully compatible with the [MCP Inspector](https://modelcontextprotocol.io/docs/tools/inspector), which provides a powerful interface for testing all MCP features:

```bash
# Build the server first
npm run build

# Launch the inspector with the built server
npx @modelcontextprotocol/inspector build/index.js
```

This command will:
1. Build the TypeScript project
2. Open the MCP Inspector documentation in your browser
3. Launch the inspector connected to your local server

#### Full Feature Compatibility

The Reddit MCP server works perfectly with the MCP Inspector for:

- **🔐 OAuth Authentication**: Complete OAuth 2.1 flow with PKCE support
- **🛠️ Tools**: All Reddit interaction tools (search, get posts, notifications, etc.)
- **📚 Prompts**: Dynamic prompt generation for content creation
- **🤖 Sampling**: AI-assisted content generation with human-in-the-loop approval
- **📡 Notifications**: Real-time progress updates during operations
- **✅ Structured Data**: Full JSON Schema validation for inputs/outputs

The inspector provides:
- Interactive tool testing with parameter validation
- OAuth flow visualization and debugging
- Sampling request/response inspection
- Real-time notification monitoring
- Session management visibility

#### Setting Up for Testing

**Important**: To run tests that interact with Reddit, you need to complete the OAuth flow first:

1. **Start the server and open MCP Inspector**:
   ```bash
   # Build and start the server
   npm run build
   node build/index.js
   
   # In another terminal, open the MCP Inspector
   npx @modelcontextprotocol/inspector build/index.js
   ```

2. **Complete OAuth Authentication**:
   - The Inspector will prompt you to authenticate
   - Follow the OAuth flow to authorize with Reddit
   - After successful authentication, the server stores tokens

3. **Save OAuth Tokens for Testing**:
   - Once authenticated via Inspector, copy the generated tokens
   - Add them to your `.env` file for persistent testing:
   ```bash
   # Add these to your .env after completing OAuth
   REDDIT_ACCESS_TOKEN=your_access_token
   REDDIT_REFRESH_TOKEN=your_refresh_token
   ```

#### Running Tests

```bash
# Run all tests (requires OAuth tokens in .env)
npm run test

# Run end-to-end tests
npm run e2e
```

#### Testing with Docker

```bash
# Build and run with Docker
npm run docker

# Run the server with npx in Docker
docker run --rm -it \
  -p 3000:3000 \
  -e REDDIT_CLIENT_ID=your_id \
  -e REDDIT_CLIENT_SECRET=your_secret \
  -e JWT_SECRET=your_jwt_secret \
  node:18-alpine \
  npx @systemprompt/mcp-server
```

#### Manual Testing

```bash
# Test OAuth flow manually
curl -X POST http://localhost:3000/mcp/v1/initialize \
  -H "Content-Type: application/json" \
  -d '{"protocolVersion": "2024-11-05", "capabilities": {}}'

# The response will include auth details if tokens are needed
```

### Docker Development

#### Quick Start with Docker

```bash
# Build and run with docker-compose (recommended)
npm run docker:build-and-run
```

#### Manual Docker Commands

```bash
# Build image
docker build -t systemprompt-mcp-reddit .

# Run with environment variables
docker run -p 3001:3001 \
  -e REDDIT_CLIENT_ID=your_id \
  -e REDDIT_CLIENT_SECRET=your_secret \
  -e JWT_SECRET=your_jwt_secret \
  systemprompt-mcp-reddit
```

#### Environment Variables for Docker

Create a `.env` file in the project root with the following variables:

```bash
# Required - Reddit OAuth Application Credentials
REDDIT_CLIENT_ID=your_reddit_client_id
REDDIT_CLIENT_SECRET=your_reddit_client_secret

# Optional - Server Configuration
MCP_PORT=3001                    # Port for the MCP server (default: 3001)
JWT_SECRET=your_jwt_secret       # Secret for JWT signing (default: auto-generated)
DEBUG=true                       # Enable debug logging (default: false)
```

**Important**: The `docker:build-and-run` command requires these environment variables to be set either in a `.env` file or exported in your shell. Without proper Reddit credentials, the OAuth flow will not work.

## 📁 Code Structure

```
systemprompt-mcp-reddit/
├── src/
│   ├── index.ts                 # Main entry point
│   ├── server.ts               # HTTP server setup
│   ├── server/                  # Server infrastructure
│   │   ├── mcp.ts              # MCP protocol handler with session management
│   │   ├── oauth.ts            # OAuth 2.1 implementation
│   │   ├── middleware.ts       # Express middleware (rate limiting, auth)
│   │   ├── auth-store.ts       # Authentication storage
│   │   └── config.ts           # Server configuration
│   ├── handlers/               # Request handlers
│   │   ├── tool-handlers.ts    # Tool execution and validation
│   │   ├── prompt-handlers.ts  # Prompt processing
│   │   ├── resource-handlers.ts # Resource management
│   │   ├── sampling.ts         # AI sampling implementation
│   │   ├── notifications.ts    # Real-time notifications
│   │   ├── callbacks/          # Sampling callback handlers
│   │   └── tools/              # Individual tool implementations
│   ├── services/               # Business logic
│   │   └── reddit/             # Reddit API integration
│   ├── constants/              # Configuration and definitions
│   │   ├── tools.ts            # Tool definitions
│   │   ├── resources.ts        # Resource definitions
│   │   ├── sampling/           # Sampling prompt templates
│   │   ├── server/             # Server configuration constants
│   │   └── tool/               # Individual tool constants
│   ├── types/                  # TypeScript definitions
│   │   ├── reddit.ts           # Reddit-specific types
│   │   ├── config.ts           # Configuration types
│   │   ├── sampling.ts         # Sampling types
│   │   └── request-context.ts  # Request context types
│   └── utils/                  # Helper functions
│       ├── logger.ts           # Logging utilities
│       ├── reddit-transformers.ts # Reddit data transformers
│       └── validation.ts       # Validation utilities
├── scripts/                    # Development and testing scripts
├── docker-compose.yml          # Docker configuration
├── tsconfig.json              # TypeScript configuration
└── package.json               # Project configuration
```

### Key Files

- **[src/index.ts](src/index.ts)**: Application entry point
- **[src/server.ts](src/server.ts)**: HTTP server setup and Express configuration
- **[src/server/mcp.ts](src/server/mcp.ts)**: MCP protocol implementation with session management
- **[src/server/oauth.ts](src/server/oauth.ts)**: Complete OAuth 2.1 flow
- **[src/handlers/tool-handlers.ts](src/handlers/tool-handlers.ts)**: Tool execution with Zod validation
- **[src/handlers/sampling.ts](src/handlers/sampling.ts)**: AI sampling implementation
- **[src/services/reddit/reddit-service.ts](src/services/reddit/reddit-service.ts)**: Reddit API integration

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

### Development Process

1. Fork the repository
2. Create a feature branch
3. Make your changes with tests
4. Submit a pull request

### Code Style

- Use TypeScript for all code
- Follow the existing patterns
- Add JSDoc comments for public APIs
- Include tests for new features

## 🔗 Related Projects

- **[Interactive Implementation Guide](https://systemprompt.io/mcp-server)**: Live testing and tutorial
- **[MCP Specification](https://spec.modelcontextprotocol.io)**: Official MCP documentation
- **[systemprompt.io Documentation](https://systemprompt.io/documentation)**: Platform documentation

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Anthropic](https://anthropic.com) for the MCP specification
- [Reddit](https://reddit.com) for their comprehensive API
- The MCP community for feedback and contributions

---

Built with ❤️ by the [systemprompt.io](https://systemprompt.io) team

For support, join our [Discord](https://discord.com/invite/wkAbSuPWpr) or reach out on [Twitter](https://twitter.com/tyingshoelaces_)
