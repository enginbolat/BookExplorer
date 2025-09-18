import SwiftUI
import Kingfisher

struct BookCard: View {
    var title: String
    var description: String
    var imageUrl: URL?
    var onPress: (() -> Void)?
    
    var body: some View {
        VStack(spacing: AppSpacing.Component.cardSpacing) {
            if let url = imageUrl {
                KFImage(url)
                    .placeholder {
                        placeholder
                    }
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 160)
                    .clipped()
                    .cornerRadius(AppSpacing.Padding.md)
            } else {
                placeholder
            }
            
            Text(title)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 140)
                .lineLimit(2)
                .font(.headline)
            
            if !description.isEmpty {
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 140)
                    .lineLimit(2)
            }
        }
        .onTapGesture {
            onPress?()
        }
    }
    
    private var placeholder: some View {
        RoundedRectangle(cornerRadius: AppSpacing.Padding.md)
            .fill(Color.gray.opacity(0.3))
            .frame(width: 120, height: 160)
            .overlay {
                Image(systemName: "book.closed")
                    .foregroundColor(.gray)
            }
    }
}

#Preview {
    BookCard(
        title: "Proud to Be a Software Developer Citizen",
        description: "description",
        imageUrl: URL(string: "https://covers.openlibrary.org/b/id/123456-M.jpg")
    )
}
