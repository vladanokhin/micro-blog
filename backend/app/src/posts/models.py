from sqlalchemy import Boolean, Column, ForeignKey, Integer, String, Text
from sqlalchemy.orm import relationship

from src.db.base import Base


class Post(Base):
    id = Column(Integer, primary_key=True, index=True)
    title = Column(String(30))
    text = Column(Text)
    is_draft = Column(Boolean, default=False)
    user_id = Column(Integer, ForeignKey("users.id"))
    author = relationship("User", back_populates="posts")
