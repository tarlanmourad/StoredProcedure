USE Login
GO
/****** Object:  StoredProcedure [dbo].[Rgstr]    Script Date: 17.12.2022 15:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- creating procedure named Rgstr
CREATE procedure Rgstr
-- declaring variables
@exists int out, @username nvarchar(30), @password nvarchar(30)
as
-- checking whether the record already exists in table Users or not
-- if exists we set 1 to variable named exists
if exists (select username from Users where username = @username)
	begin
		set @exists = 1
		return @exists
	end
-- if not exists we set 0 to variable named exists and insert given username and password to Users table
else
	begin
		insert into Users(username, password) values(@username, @password)
		set @exists = 0
		return @exists
	end
