USE [Sweet-As-SaltDB]
ALTER TABLE Questions
ADD InCorrectScale float not null default 0.5;