from sqlalchemy import Boolean, Column, String, Integer
from sqlalchemy.orm import relationship

from src.db.base import Base


class User(Base):
    id = Column(Integer, primary_key=True, index=True)
    email = Column(String, unique=True, index=True)
    password = Column(String)
    is_active = Column(Boolean, default=True)
    posts = relationship("Post", back_populates="author")
