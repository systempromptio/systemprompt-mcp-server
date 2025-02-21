# [Project] Complete Reddit MCP Server - Production-Ready Implementation with OAuth 2.1, Sampling, and Full MCP Spec Support

Hey r/programming! I wanted to share an open-source project that demonstrates how to build a **production-ready Model Context Protocol (MCP) server** with complete specification support. This implementation integrates with Reddit's API and showcases advanced features like OAuth 2.1, AI sampling, and real-time notifications.

## 🎯 What is this?

**systemprompt-mcp-reddit** is a fully-featured MCP server that enables AI assistants to interact with Reddit through a secure, scalable architecture. It's designed as both a working Reddit integration AND a comprehensive template for building your own MCP servers.

**GitHub**: [https://github.com/Ejb503/systemprompt-mcp-reddit](https://github.com/Ejb503/systemprompt-mcp-reddit)  
**NPM**: `npm install -g systemprompt-mcp-reddit`

## 🚀 Key Features

### Complete MCP Specification Implementation
- **OAuth 2.1 Flow**: Full 8-step implementation with PKCE and JWT tokens
- **Tools System**: 10 tools for Reddit interaction (search, get posts, notifications, etc.)
- **Sampling**: AI-assisted content generation with human-in-the-loop approval
- **Resources & Prompts**: Dynamic content generation and management
- **Real-time Notifications**: Progress updates during operations
- **Structured Data Validation**: Zod schemas for all inputs/outputs

### Production Architecture
- **Per-Session Isolation**: Each user gets their own MCP server instance
- **Multi-User Support**: Concurrent sessions with proper auth context
- **Security**: Rate limiting, CORS, JWT auth, secure state management
- **Error Handling**: Comprehensive error messages and graceful degradation
- **Docker Ready**: Full containerization support

### Developer Experience
- **100% TypeScript**: Full type safety throughout
- **Modular Design**: Clean separation of concerns
- **MCP Inspector Compatible**: Test all features interactively
- **Comprehensive E2E Tests**: Both SDK and HTTP testing approaches
- **Extensive Documentation**: Inline docs and examples

## 🔧 Technical Highlights

### OAuth 2.1 Implementation
The server implements the complete MCP OAuth spec with enterprise-grade security:
```typescript
// PKCE flow with dynamic client registration
// JWT tokens containing encrypted Reddit credentials
// Automatic token refresh (30-day refresh tokens)
// Session isolation for multi-user support
```

### Sampling (AI-Assisted Operations)
Human-in-the-loop AI content generation:
```typescript
// 1. Server requests AI assistance
// 2. Client presents to user for approval
// 3. User reviews/modifies request
// 4. AI generates content
// 5. User approves final output
// 6. Server receives approved content
```

### Architecture
```
┌─────────────────────────────────────────────────────────┐
│                    MCP Client                            │
└────────────────────────┬────────────────────────────────┘
                         │ MCP Protocol
┌────────────────────────┴────────────────────────────────┐
│                 MCP Server Layer                         │
│  ┌─────────────┐  ┌─────────────┐  ┌────────────────┐  │
│  │   OAuth 2.1 │  │   Session   │  │  Notification  │  │
│  │   Handler   │  │   Manager   │  │    Manager     │  │
│  └─────────────┘  └─────────────┘  └────────────────┘  │
└────────────────────────┬────────────────────────────────┘
                         │
┌────────────────────────┴────────────────────────────────┐
│                   Service Layer                          │
│  ┌─────────────┐  ┌─────────────┐  ┌────────────────┐  │
│  │   Reddit    │  │    Auth     │  │     Tools      │  │
│  │   Service   │  │   Service   │  │    Handler     │  │
│  └─────────────┘  └─────────────┘  └────────────────┘  │
└─────────────────────────────────────────────────────────┘
```

## 📊 Real-World Testing

The project includes a comprehensive E2E test suite:
- **TypeScript Tests**: Using the official MCP SDK
- **Bash Scripts**: Direct HTTP/SSE testing
- **Concurrent Testing**: High-volume stress tests
- **Docker Integration**: CI/CD ready

## 🎓 Use as a Template

This codebase is designed to be forked for your own MCP implementations:

1. **Replace the service layer** with your API
2. **Define new tools** following the patterns
3. **Keep the OAuth/MCP infrastructure** 
4. **Customize prompts and resources**

The modular architecture makes it easy to swap out Reddit for any other API while keeping all the MCP plumbing.

## 🛠️ Quick Start

```bash
# Install globally
npm install -g systemprompt-mcp-reddit

# Or clone for development
git clone https://github.com/Ejb503/systemprompt-mcp-reddit.git
cd systemprompt-mcp-reddit
npm install
npm run build

# Set up Reddit app credentials in .env
REDDIT_CLIENT_ID=your_client_id
REDDIT_CLIENT_SECRET=your_secret
JWT_SECRET=your_jwt_secret

# Run the server
npm start
```

## 🔍 MCP Inspector Support

Test all features interactively:
```bash
npm run inspector
```

The inspector provides:
- OAuth flow visualization
- Interactive tool testing
- Sampling request/response inspection
- Real-time notification monitoring

## 💡 Why This Matters

- **Learn MCP**: See how every MCP feature works in production
- **Build Faster**: Fork and adapt for your own integrations  
- **Best Practices**: TypeScript, clean architecture, proper error handling
- **Real Integration**: Not just a demo - actually works with Reddit's API

## 🤝 Contributing

We welcome contributions! The codebase follows clean architecture principles with comprehensive documentation. Check out our [contributing guide](https://github.com/Ejb503/systemprompt-mcp-reddit/blob/main/CONTRIBUTING.md).

## 📺 Demo Videos

- [Reddit MCP OAuth Flow](https://www.youtube.com/watch?v=JA71OM3Se8Y) - Complete OAuth implementation walkthrough
- [Reddit Integration Demo](https://www.youtube.com/watch?v=SOX407rP1p4) - Voice-controlled Reddit browsing

## 🙏 Acknowledgments

This project is sponsored by [systemprompt.io](https://systemprompt.io) - creators of the world's first native mobile MCP client for iOS and Android.

Special thanks to Anthropic for the MCP specification and the amazing community feedback!

---

**Questions?** Happy to discuss implementation details, architecture decisions, or help with your own MCP server builds!

**Links:**
- GitHub: [https://github.com/Ejb503/systemprompt-mcp-reddit](https://github.com/Ejb503/systemprompt-mcp-reddit)
- Documentation: [https://systemprompt.io/documentation](https://systemprompt.io/documentation)
- Discord: [https://discord.com/invite/wkAbSuPWpr](https://discord.com/invite/wkAbSuPWpr)