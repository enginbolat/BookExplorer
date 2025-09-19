<h1>📚 Book Explorer (SwiftUI + Combine + Moya)</h1>
<p>
  <strong>Book Explorer</strong> is a modern iOS app built with <strong>SwiftUI</strong>, 
  leveraging <strong>Combine</strong> for reactive data flow and <strong>Moya</strong> for a clean, testable networking layer. 
  It uses the <a href="https://openlibrary.org/dev/docs/api" target="_blank" rel="noopener noreferrer">OpenLibrary API</a> to fetch random books, browse by subject, and display detailed metadata.
</p>

<h2>✨ Features</h2>
<ul>
  <li>🚀 <strong>Onboarding Flow</strong>: First-time experience, persisted via a lightweight storage service</li>
  <li>🔎 <strong>Random &amp; Search</strong>: Pull randomized book lists and search results from OpenLibrary</li>
  <li>📂 <strong>Subjects</strong>: Browse books by category (e.g., Horror, Fantasy, Mystery)</li>
  <li>📖 <strong>Book Detail</strong>: Cover image, title, authors, description, publish date, subjects</li>
  <li>❤️ <strong>Favorites (placeholder)</strong>: Extendable pattern for saved items</li>
  <li>⚙️ <strong>Settings</strong>: User preferences (via <code>UserDefaults</code> in a <em>StorageService</em>)</li>
</ul>

<h2>🛠️ Tech Stack &amp; Architecture</h2>
<ul>
  <li><strong>UI</strong>: SwiftUI</li>
  <li><strong>Reactive</strong>: Combine (Publishers, <code>sink</code> / <code>AnyCancellable</code>)</li>
  <li><strong>Networking</strong>: Moya (with TargetType-based endpoints)</li>
  <li><strong>Data Layer</strong>: Repository Pattern (service → repository → view model)</li>
  <li><strong>Dependency Injection</strong>: Lightweight DI container (<code>DependencyContainer</code> + <code>@Injected</code>)</li>
  <li><strong>State Handling</strong>: <code>Loadable&lt;T&gt;</code> (idle / loading / loaded / failed)</li>
  <li><strong>Images</strong>: <code>AsyncImage</code> (easy swap to Kingfisher if desired)</li>
</ul>

<h3>📁 Project Structure</h3>
<pre><code>Coordinator
 ┣ Features
 ┃ ┣ Home
 ┃ ┣ Search
 ┃ ┣ Subject
 ┃ ┣ Detail
 ┃ ┣ Settings
 ┃ ┗ Onboarding
 ┣ Core
 ┃ ┣ Coordinator
 ┃ ┣ Navigation
 ┃ ┗ Storage
 ┣ Services
 ┃ ┣ Network
 ┃ ┗ BookServices
 ┣ UI (Reusable Components)
 ┣ Constants
 ┗ Assets
</code></pre>

<h2>🔌 API</h2>
<ul>
  <li><code>GET /search.json?q=book&amp;sort=random&amp;limit=15</code> – Random book feed</li>
  <li><code>GET /subjects/&lt;subject&gt;.json</code> – Books by subject</li>
  <li><code>GET /works/&lt;workId&gt;.json</code> – Book detail (work endpoint)</li>
  <li>Cover images via <code>https://covers.openlibrary.org/b/id/&lt;coverId&gt;-M.jpg</code></li>
</ul>

<h2>▶️ Getting Started</h2>
<ol>
  <li>Open the project in Xcode (iOS 17+ recommended; iOS 18 tested).</li>
  <li>Resolve Swift Package dependencies (Moya, etc.).</li>
  <li>Run the <strong>Coordinator</strong> scheme on a simulator or device.</li>
</ol>

<h2>🧩 Key Patterns</h2>
<ul>
  <li><strong>Repository</strong>: Exposes Combine publishers for UI consumption.</li>
  <li><strong>ViewModels</strong>: Hold <code>@Published</code> state and expose intents (e.g., <code>fetchSubject()</code>).</li>
  <li><strong>Loadable</strong>: Single source of truth for loading/error/success UI states.</li>
</ul>

<h2>🛣️ Roadmap</h2>
<ul>
  <li>[ ] Favorites persistence (CoreData or Cloud syncing)</li>
  <li>[ ] Auth / user profile</li>
  <li>[ ] Expanded search filters &amp; pagination</li>
  <li>[ ] Unit / Snapshot / UI Tests</li>
</ul>

<h2>📜 License</h2>
<p>MIT — feel free to use this as a starter for your own SwiftUI + Combine projects.</p>
