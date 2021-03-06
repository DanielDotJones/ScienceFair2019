USE [master]
GO
/****** Object:  Database [Science_Fair]    Script Date: 1/10/2019 11:32:36 PM ******/
CREATE DATABASE [Science_Fair]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Science_Fair', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Science_Fair.mdf' , SIZE = 729088KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Science_Fair_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Science_Fair_log.ldf' , SIZE = 3687936KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Science_Fair] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Science_Fair].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Science_Fair] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Science_Fair] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Science_Fair] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Science_Fair] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Science_Fair] SET ARITHABORT OFF 
GO
ALTER DATABASE [Science_Fair] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Science_Fair] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Science_Fair] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Science_Fair] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Science_Fair] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Science_Fair] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Science_Fair] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Science_Fair] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Science_Fair] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Science_Fair] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Science_Fair] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Science_Fair] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Science_Fair] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Science_Fair] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Science_Fair] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Science_Fair] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Science_Fair] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Science_Fair] SET RECOVERY FULL 
GO
ALTER DATABASE [Science_Fair] SET  MULTI_USER 
GO
ALTER DATABASE [Science_Fair] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Science_Fair] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Science_Fair] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Science_Fair] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Science_Fair] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Science_Fair', N'ON'
GO
ALTER DATABASE [Science_Fair] SET QUERY_STORE = OFF
GO
USE [Science_Fair]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 1/10/2019 11:32:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[Article_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Article_name] [varchar](255) NULL,
	[Author_id] [numeric](18, 0) NULL,
	[Article_raw_id] [numeric](18, 0) NULL,
	[Author_name] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Article_raw]    Script Date: 1/10/2019 11:32:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article_raw](
	[Article_raw_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Article_text] [varchar](max) NULL,
	[Author_firstname] [varchar](100) NULL,
	[Author_lastname] [varchar](100) NULL,
	[Article_name] [varchar](255) NULL,
	[ProcessedFlag] [tinyint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Article_sentence]    Script Date: 1/10/2019 11:32:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article_sentence](
	[Article_sentence_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Article_id] [numeric](18, 0) NULL,
	[sentence_number] [int] NULL,
	[sentence] [varchar](max) NULL,
	[Article_name_raw] [varchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Article_word]    Script Date: 1/10/2019 11:32:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article_word](
	[Article_word_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Article_sentence_id] [numeric](18, 0) NULL,
	[Article_id] [numeric](18, 0) NULL,
	[word] [varchar](45) NULL,
	[part_of_speech] [varchar](50) NULL,
	[origin] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleAtributes]    Script Date: 1/10/2019 11:32:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleAtributes](
	[article_id] [numeric](18, 0) NULL,
	[Avg_WordPerSentance] [numeric](18, 2) NULL,
	[Avg_CharPerSentance] [numeric](18, 2) NULL,
	[Avg_CharPerWord] [numeric](18, 2) NULL,
	[Avg_ContractPerSentance] [numeric](18, 2) NULL,
	[Avg_WordFreq] [numeric](18, 2) NULL,
	[Avg_POSpeechFreq] [numeric](18, 2) NULL,
	[Avg_OriginFreq] [numeric](18, 2) NULL,
	[Max_WordFreq] [numeric](18, 2) NULL,
	[Max_POSpeechFreq] [numeric](18, 2) NULL,
	[Max_OriginFreq] [numeric](18, 2) NULL,
	[Avg_NounsPerSentence] [numeric](18, 6) NULL,
	[Avg_CharInNoun] [numeric](18, 6) NULL,
	[Avg_VerbsPerSentence] [numeric](18, 6) NULL,
	[Avg_CharInVerb] [numeric](18, 6) NULL,
	[Avg_AdjectivesPerSentence] [numeric](18, 6) NULL,
	[Avg_CharInAdjective] [numeric](18, 6) NULL,
	[Avg_AdverbsPerSentence] [numeric](18, 6) NULL,
	[Avg_CharInAdverb] [numeric](18, 6) NULL,
	[MostOrigin] [varchar](100) NULL,
	[LeastOrigin] [varchar](100) NULL,
	[Min_POSpeechFreq] [numeric](18, 2) NULL,
	[Min_OriginFreq] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 1/10/2019 11:32:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[Author_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Author_firstname] [varchar](100) NULL,
	[Author_lastname] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dict_article_raw]    Script Date: 1/10/2019 11:32:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dict_article_raw](
	[Dict_article_raw_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Dict_article_text] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dict_article_word]    Script Date: 1/10/2019 11:32:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dict_article_word](
	[Dict_article_word_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[word] [varchar](45) NULL,
	[count_of_Word] [numeric](18, 0) NULL,
	[part_of_speech] [varchar](50) NULL,
	[origin] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartOfSpeech]    Script Date: 1/10/2019 11:32:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartOfSpeech](
	[Word] [varchar](80) NOT NULL,
	[Part_Of_Speech] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartOfSpeech2]    Script Date: 1/10/2019 11:32:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartOfSpeech2](
	[word] [varchar](50) NOT NULL,
	[Part_Of_Speech] [varchar](45) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pos]    Script Date: 1/10/2019 11:32:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pos](
	[lemma] [varchar](80) NULL,
	[pos] [varchar](1) NULL,
	[posname] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WordOrigin]    Script Date: 1/10/2019 11:32:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WordOrigin](
	[Base] [varchar](100) NULL,
	[Word] [varchar](100) NULL,
	[Origin] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-20190108-194542]    Script Date: 1/10/2019 11:32:37 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20190108-194542] ON [dbo].[PartOfSpeech]
(
	[Word] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-20190108-194606]    Script Date: 1/10/2019 11:32:37 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20190108-194606] ON [dbo].[pos]
(
	[lemma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-20181227-115439]    Script Date: 1/10/2019 11:32:37 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20181227-115439] ON [dbo].[WordOrigin]
(
	[Word] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Article_raw] ADD  CONSTRAINT [DF_Article_raw_ProcessedFlag]  DEFAULT ((0)) FOR [ProcessedFlag]
GO
/****** Object:  StoredProcedure [dbo].[compare_two_articles]    Script Date: 1/10/2019 11:32:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[compare_two_articles] 
@article_id numeric(18,0),
@article_id2 numeric(18,0),
@articleNum int
as

--Create Temp Tables
create table #tempSentenceSummary
(
sentence_count int,
word_count int,
char_count int,  
contractions_count int,
avg_words_per_sentence numeric(18,2), 
avg_char_per_sentence numeric(18,2),
avg_char_per_word numeric(18,2),
avg_contractions_per_sentence numeric(18,6),
article_id numeric(18,0)
)

create table #tempWordFreq
(
word varchar(100), 
word_freq int, 
total_words int, 
word_freq_percent numeric(18,4),
avg_word_freq numeric(18,2), 
article_id numeric(18,0)
)

create table #tempPOSpeech
(
po_speech varchar(100), 
po_speech_freq int, 
total_words_with_POS int, 
po_speech_freq_percent numeric(18,4) ,
avg_po_speech_freq numeric(18,2),
article_id numeric(18,0)
)

create table #tempOrigin
(
origin varchar(100), 
origin_freq int, 
total_words_with_origin int, 
origin_freq_percent numeric(18,4),
avg_origin_freq numeric(18,2),
article_id numeric(18,0)
)

--initialize my summary table
insert into #tempSentenceSummary 
(
sentence_count, avg_words_per_sentence, avg_char_per_sentence, avg_char_per_word, avg_contractions_per_sentence, article_id
)
values 
(
0,0,0,0,0,@article_id
) 

insert into #tempSentenceSummary 
(
sentence_count, avg_words_per_sentence, avg_char_per_sentence, avg_char_per_word, avg_contractions_per_sentence, article_id
)
values 
(
0,0,0,0,0,@article_id2
) 

--determine the summary of the sentences 

update #tempSentenceSummary 
set sentence_count = (select count(*) from Article_sentence where article_id = @article_id) 
where article_id = @article_id

update #tempSentenceSummary 
set sentence_count = (select count(*) from Article_sentence where article_id = @article_id2) 
where article_id = @article_id2

update #tempSentenceSummary 
set word_count = (select count(*) from Article_word where article_id = @article_id)
where article_id = @article_id

update #tempSentenceSummary 
set word_count = (select count(*) from Article_word where article_id = @article_id2)
where article_id = @article_id2

update #tempSentenceSummary 
set char_count = (select sum(len(word)) from Article_word where article_id = @article_id)
where article_id = @article_id

update #tempSentenceSummary 
set char_count = (select sum(len(word)) from Article_word where article_id = @article_id2)
where article_id = @article_id2

update #tempSentenceSummary 
set contractions_count = (select count(*) from Article_word where article_id = @article_id and word like '%’%' or word like '%''%')
where article_id = @article_id

update #tempSentenceSummary 
set contractions_count = (select count(*) from Article_word where article_id = @article_id2 and word like '%’%' or word like '%''%')
where article_id = @article_id2

update #tempSentenceSummary 
set avg_words_per_sentence = Convert(numeric(18,2),word_count) / Convert(numeric(18,2),sentence_count)
where sentence_count <> 0 


update #tempSentenceSummary 
set avg_words_per_sentence = 0
where sentence_count = 0 


update #tempSentenceSummary 
set avg_char_per_sentence = Convert(numeric(18,2),char_count) / Convert(numeric(18,2),sentence_count)
where sentence_count <> 0 


update #tempSentenceSummary 
set avg_char_per_sentence = 0
where sentence_count = 0 

update #tempSentenceSummary 
set avg_char_per_word = Convert(numeric(18,2),char_count) / Convert(numeric(18,2),word_count)
where word_count <> 0 

update #tempSentenceSummary 
set avg_char_per_word = 0
where word_count = 0 

update #tempSentenceSummary 
set avg_contractions_per_sentence = Convert(numeric(18,6),contractions_count) / Convert(numeric(18,6),sentence_count)
where sentence_count <> 0 

update #tempSentenceSummary 
set avg_contractions_per_sentence = 0
where sentence_count = 0 

--determine the word frequency for this article 
insert into #tempWordFreq
(
word, word_freq, article_id
)
select word, count(word), @article_id
from Article_word 
where Article_id = @article_id 
group by word, article_id 

insert into #tempWordFreq
(
word, word_freq, article_id
)
select word, count(word), @article_id2
from Article_word 
where Article_id = @article_id2 
group by word, article_id

delete from #tempWordFreq where word = ''
delete from #tempWordFreq where word is null

update #tempWordFreq 
set total_words = (select count(*) from article_word where Article_id = @article_id) 
where article_id = @article_id

update #tempWordFreq 
set total_words = (select count(*) from article_word where Article_id = @article_id2) 
where article_id = @article_id2

update #tempWordFreq 
set word_freq_percent =  (100/Convert(numeric(18,4), total_words))*Convert(numeric(18,4), word_freq)
where total_words <> 0  

update #tempWordFreq
set avg_word_freq = (select Convert(numeric(18,2), sum(word_freq))/count(word) from #tempWordFreq where article_id = @article_id)
where article_id = @article_id

update #tempWordFreq
set avg_word_freq = (select Convert(numeric(18,2), sum(word_freq))/count(word) from #tempWordFreq where article_id = @article_id2)
where article_id = @article_id2

--determine part of speech %
insert into #tempPOSpeech
(
 po_speech, po_speech_freq, article_id
)
select part_of_speech, count(part_of_speech), @article_id
from Article_word 
where Article_id = @article_id
group by part_of_speech, article_id

insert into #tempPOSpeech
(
 po_speech, po_speech_freq, article_id
)
select part_of_speech, count(part_of_speech), @article_id2
from Article_word 
where Article_id = @article_id2
group by part_of_speech, article_id

delete from #tempPOSpeech where po_speech = ''
delete from #tempPOSpeech where po_speech is null

update #tempPOSpeech 
set total_words_with_POS = (select sum(po_speech_freq) from #tempPOSpeech where article_id = @article_id)
where article_id = @article_id

update #tempPOSpeech 
set total_words_with_POS = (select sum(po_speech_freq) from #tempPOSpeech where article_id = @article_id2)
where article_id = @article_id2

update #tempPOSpeech 
set po_speech_freq_percent = (100/Convert(numeric(18,4), total_words_with_POS))*Convert(numeric(18,4), po_speech_freq)
where po_speech_freq <> 0

update #tempPOSpeech
set avg_po_speech_freq = (select Convert(numeric(18,2), sum(po_speech_freq))/count(po_speech) from #tempPOSpeech where article_id = @article_id)
where article_id = @article_id

update #tempPOSpeech
set avg_po_speech_freq = (select Convert(numeric(18,2), sum(po_speech_freq))/count(po_speech) from #tempPOSpeech where article_id = @article_id2)
where article_id = @article_id2

--determine origin
insert into #tempOrigin
(
 origin, origin_freq, article_id
)
select origin, count(origin), @article_id
from Article_word 
where Article_id = @article_id
group by origin, article_id

insert into #tempOrigin
(
 origin, origin_freq, article_id
)
select origin, count(origin), @article_id2
from Article_word 
where Article_id = @article_id2
group by origin, article_id

delete from #tempOrigin where origin = ''
delete from #tempOrigin where origin is null

update #tempOrigin 
set total_words_with_origin = (select sum(origin_freq) from #tempOrigin where article_id = @article_id)
where article_id = @article_id

update #tempOrigin 
set total_words_with_origin = (select sum(origin_freq) from #tempOrigin where article_id = @article_id2)
where article_id = @article_id2

--(select count(*) from article_word where Article_id = @article_id) 

update #tempOrigin 
set origin_freq_percent = (100/Convert(numeric(18,4), total_words_with_origin))*Convert(numeric(18,4), origin_freq)
where origin_freq <> 0

update #tempOrigin
set avg_origin_freq = (select Convert(numeric(18,2), sum(origin_freq))/count(origin) from #tempOrigin where article_id = @article_id)
where article_id = @article_id

update #tempOrigin
set avg_origin_freq = (select Convert(numeric(18,2), sum(origin_freq))/count(origin) from #tempOrigin where article_id = @article_id2)
where article_id = @article_id2

--frequency of words
--parts of speech %
--count of parts of speech (each type)


--origin of word %

-------------------------------------------------------------Indivisual Part Of Speech-------------------------------------------------------------------------

--------------Nouns----------------
create table #tempNounSummary
(
noun_count int,
sentence_count int,
char_count int,  
avg_nouns_per_sentence numeric(18,6), 
avg_char_in_noun numeric(18,6),
article_id numeric(18,0)
)



insert into #tempNounSummary
(
sentence_count,  
article_id,
noun_count
)
select sentence_count, @article_id,
noun_count = (
				select top 1 po_speech_freq 
				from #tempPOSpeech 
				where po_speech = 'noun' and a.article_id = @article_id
			)
from #tempSentenceSummary a
where a.article_id = @article_id

insert into #tempNounSummary
(
sentence_count,
article_id,
noun_count
)
select sentence_count, @article_id2,
noun_count = (
				select top 1 po_speech_freq 
				from #tempPOSpeech 
				where po_speech = 'noun' and a.article_id = @article_id2
			)
from #tempSentenceSummary a
where a.article_id = @article_id2

update #tempNounSummary 
set avg_nouns_per_sentence = Convert(numeric(18,6),noun_count) / Convert(numeric(18,6),sentence_count)
where sentence_count <> 0

update #tempNounSummary 
set char_count = (select sum(len(word)) from Article_word where article_id = @article_id and part_of_speech = 'noun')
where article_id = @article_id

update #tempNounSummary 
set char_count = (select sum(len(word)) from Article_word where article_id = @article_id2 and part_of_speech = 'noun')
where article_id = @article_id2

update #tempNounSummary 
set avg_char_in_noun = Convert(numeric(18,6),char_count) / Convert(numeric(18,6),noun_count)
where noun_count <> 0 

--------------Verbs----------------
create table #tempVerbSummary
(
verb_count int,
sentence_count int,
char_count int,  
avg_verbs_per_sentence numeric(18,6), 
avg_char_in_verb numeric(18,6),
article_id numeric(18,0)
)

insert into #tempVerbSummary
(
sentence_count,
article_id,
verb_count
)
select sentence_count, @article_id,
verb_count = (
				select top 1 po_speech_freq 
				from #tempPOSpeech 
				where po_speech = 'verb' and a.article_id = @article_id
			)
from #tempSentenceSummary a
where a.article_id = @article_id

insert into #tempVerbSummary
(
sentence_count, 
article_id,
verb_count
)
select sentence_count, @article_id2,
verb_count = (
				select top 1 po_speech_freq 
				from #tempPOSpeech 
				where po_speech = 'verb' and a.article_id = @article_id2
			)
from #tempSentenceSummary a
where a.article_id = @article_id2

update #tempVerbSummary 
set char_count = (select sum(len(word)) from Article_word where article_id = @article_id and part_of_speech = 'verb')
where article_id = @article_id

update #tempVerbSummary 
set char_count = (select sum(len(word)) from Article_word where article_id = @article_id2 and part_of_speech = 'verb')
where article_id = @article_id2

update #tempVerbSummary 
set avg_verbs_per_sentence = Convert(numeric(18,6),verb_count) / Convert(numeric(18,6),sentence_count)
where sentence_count <> 0 

update #tempVerbSummary 
set avg_char_in_verb = Convert(numeric(18,6),char_count) / Convert(numeric(18,6),verb_count)
where verb_count <> 0 

-------------Adjectives------------
create table #tempAdjectiveSummary
(
adjectives_count int,
sentence_count int,
char_count int,  
avg_adjectives_per_sentence numeric(18,6), 
avg_char_in_adjective numeric(18,6),
article_id numeric(18,0)
)

insert into #tempAdjectiveSummary
(
sentence_count,
char_count,  
article_id,
adjectives_count
)
select sentence_count, char_count, @article_id,
adjectives_count = (
				select top 1 po_speech_freq 
				from #tempPOSpeech 
				where po_speech = 'adjective' and a.article_id = @article_id
			)
from #tempSentenceSummary a
where a.article_id = @article_id

insert into #tempAdjectiveSummary
(
sentence_count,
char_count,  
article_id,
adjectives_count
)
select sentence_count, char_count, @article_id2,
adjectives_count = (
				select top 1 po_speech_freq 
				from #tempPOSpeech 
				where po_speech = 'adjective' and a.article_id = @article_id2
			)
from #tempSentenceSummary a
where a.article_id = @article_id2

update #tempAdjectiveSummary 
set char_count = (select sum(len(word)) from Article_word where article_id = @article_id and part_of_speech = 'adjective')
where article_id = @article_id

update #tempAdjectiveSummary 
set char_count = (select sum(len(word)) from Article_word where article_id = @article_id2 and part_of_speech = 'adjective')
where article_id = @article_id2

update #tempAdjectiveSummary 
set avg_adjectives_per_sentence = Convert(numeric(18,6),adjectives_count) / Convert(numeric(18,6),sentence_count)
where sentence_count <> 0 

update #tempAdjectiveSummary 
set avg_char_in_adjective = Convert(numeric(18,6),char_count) / Convert(numeric(18,6),adjectives_count)
where adjectives_count <> 0 

------------Adverbs---------------
create table #tempAdverbSummary
(
adverb_count int,
sentence_count int,
char_count int,  
avg_adverbs_per_sentence numeric(18,6), 
avg_char_in_adverb numeric(18,6),
article_id numeric(18,0)
)

insert into #tempAdverbSummary
(
sentence_count,
char_count,  
article_id,
adverb_count
)
select sentence_count, char_count, @article_id,
adverb_count = (
				select top 1 po_speech_freq 
				from #tempPOSpeech 
				where po_speech = 'adverb' and a.article_id = @article_id
			)
from #tempSentenceSummary a
where a.article_id = @article_id

insert into #tempAdverbSummary
(
sentence_count,
char_count,  
article_id,
adverb_count
)
select sentence_count, char_count, @article_id2,
adverb_count = (
				select top 1 po_speech_freq 
				from #tempPOSpeech 
				where po_speech = 'adverb' and a.article_id = @article_id2
			)
from #tempSentenceSummary a
where a.article_id = @article_id2

update #tempAdverbSummary 
set char_count = (select sum(len(word)) from Article_word where article_id = @article_id and part_of_speech = 'adverb')
where article_id = @article_id

update #tempAdverbSummary 
set char_count = (select sum(len(word)) from Article_word where article_id = @article_id2 and part_of_speech = 'adverb')
where article_id = @article_id2

update #tempAdverbSummary 
set avg_adverbs_per_sentence = Convert(numeric(18,6),adverb_count) / Convert(numeric(18,6),sentence_count)
where sentence_count <> 0 

update #tempAdverbSummary 
set avg_char_in_adverb = Convert(numeric(18,6),char_count) / Convert(numeric(18,6),adverb_count)
where adverb_count <> 0 


----------------------------------------------------------------------Scoring----------------------------------------------------------------------------------

create table #tempPercentChangeResults
(
Avg_WordPerSentance numeric(18,2), 
Avg_CharPerSentance numeric(18,2), 
Avg_CharPerWord numeric(18,2),
Avg_ContractPerSentance numeric(18,2),
Avg_WordFreq numeric(18,2),
Avg_POSpeechFreq numeric(18,2),
Avg_OriginFreq numeric(18,2),
Max_WordFreq numeric(18,2),
Max_POSpeechFreq numeric(18,2),
Max_OriginFreq numeric(18,2),
)


insert into #tempPercentChangeResults (
Avg_WordPerSentance, 
Avg_CharPerSentance, 
Avg_CharPerWord,
Avg_ContractPerSentance,
Avg_WordFreq,
Avg_POSpeechFreq,
Avg_OriginFreq,
Max_WordFreq,
Max_POSpeechFreq,
Max_OriginFreq
)
select
Avg_WordPerSentance = 
					(
						select	
						((	
							(	
							select top 1 avg_words_per_sentence 
								from #tempSentenceSummary 
								where article_id = @article_id2	
							)	
							-	
							(	
							select top 1 avg_words_per_sentence 
								from #tempSentenceSummary 
								where article_id = @article_id
							)
						)
							/
							(
							select top 1 avg_words_per_sentence 
								from #tempSentenceSummary 
								where article_id = @article_id
							)
						)
							*
							convert(numeric(18,2),100)
					),	

Avg_CharPerSentance = 
					(
						select 
						((
							(
							select top 1 avg_char_per_sentence 
								from #tempSentenceSummary 
								where article_id = @article_id2
							) 
							- 
							(
							select top 1 avg_char_per_sentence 
								from #tempSentenceSummary 
								where article_id = @article_id
							)
						)
							/
							(
							select top 1 avg_char_per_sentence 
								from #tempSentenceSummary 
								where article_id = @article_id
							)
						)
							*
							convert(numeric(18,2),100)
					),
Avg_CharPerWord = 
					(
						select 
						((
							(
							select top 1 avg_char_per_word 
								from #tempSentenceSummary 
								where article_id = @article_id2
							) 
							- 
							(
							select top 1 avg_char_per_word 
								from #tempSentenceSummary 
								where article_id = @article_id
							)
						)
							/
							(
							select top 1 avg_char_per_word 
								from #tempSentenceSummary 
								where article_id = @article_id
							)
						)
							*
							convert(numeric(18,2),100)
					),
Avg_ContractPerSentance = 
					(
						select 
						((
							(
							select top 1 avg_contractions_per_sentence 
								from #tempSentenceSummary 
								where article_id = @article_id2
							) 
							- 
							(
							select top 1 avg_contractions_per_sentence 
								from #tempSentenceSummary 
								where article_id = @article_id
							)
						)
							/
							(
							select top 1 avg_contractions_per_sentence 
								from #tempSentenceSummary 
								where article_id = @article_id
							)
						)
							*
							convert(numeric(18,2),100)
					),
Avg_WordFreq = 
					(
						select 
						((
							(
							select top 1 avg_word_freq
								from #tempWordFreq
								where article_id = @article_id2
							) 
							- 
							(
							select top 1 avg_word_freq 
								from #tempWordFreq
								where article_id = @article_id
							)
						)
							/
							(
							select top 1 avg_word_freq 
								from #tempWordFreq 
								where article_id = @article_id
							)
						)
							*
							convert(numeric(18,2),100)
					),
Avg_POSpeechFreq = 
					(
						select 
						((
							(
							select top 1 avg_po_speech_freq
								from #tempPOSpeech
								where article_id = @article_id2
							) 
							- 
							(
							select top 1 avg_po_speech_freq 
								from #tempPOSpeech
								where article_id = @article_id
							)
						)
							/
							(
							select top 1 avg_po_speech_freq 
								from #tempPOSpeech 
								where article_id = @article_id
							)
						)
							*
							convert(numeric(18,2),100)
					),
Avg_OriginFreq = 
					(
						select 
						((
							(
							select top 1 avg_origin_freq
								from #tempOrigin
								where article_id = @article_id2
							) 
							- 
							(
							select top 1 avg_origin_freq 
								from #tempOrigin
								where article_id = @article_id
							)
						)
							/
							(
							select top 1 avg_origin_freq 
								from #tempOrigin 
								where article_id = @article_id
							)
						)
							*
							convert(numeric(18,2),100)
					),
Max_WordFreq = 
					(
						select 
						((
							(
							select convert(numeric(18,2),max( word_freq ))
								from #tempWordFreq
								where article_id = @article_id2
							) 
							- 
							(
							select convert(numeric(18,2),max( word_freq ))
								from #tempWordFreq
								where article_id = @article_id
							)
						)
							/
							(
							select convert(numeric(18,2),max( word_freq ))
								from #tempWordFreq 
								where article_id = @article_id
							)
						)
							*
							convert(numeric(18,2),100)
					),
Max_POSpeechFreq = 
					(
						select 
						((
							(
							select convert(numeric(18,2),max( po_speech_freq ))
								from #tempPOSpeech
								where article_id = @article_id2
							) 
							- 
							(
							select convert(numeric(18,2),max( po_speech_freq ))
								from #tempPOSpeech
								where article_id = @article_id
							)
						)
							/
							(
							select convert(numeric(18,2),max( po_speech_freq ))
								from #tempPOSpeech 
								where article_id = @article_id
							)
						)
							*
							convert(numeric(18,2),100)
					),
Max_OriginFreq = 
					(
						select 
						((
							(
							select convert(numeric(18,2),max( origin_freq ))
								from #tempOrigin
								where article_id = @article_id2
							) 
							- 
							(
							select convert(numeric(18,2),max( origin_freq ))
								from #tempOrigin
								where article_id = @article_id
							)
						)
							/
							(
							select convert(numeric(18,2),max( origin_freq ))
								from #tempOrigin 
								where article_id = @article_id
							)
						)
							*
							convert(numeric(18,2),100)
					)







----------------------------------------------------------------------Results--------------------------------------------------------------------------------------

----table (0) in the return set 
--select * from #tempSentenceSummary where article_id = iif((@articleNum) = 1, @article_id, iif((@articleNum) = 2, @article_id2, 0));

----table (1) in the return set 
--select * from #tempWordFreq where article_id = iif((@articleNum) = 1, @article_id, iif((@articleNum) = 2, @article_id2, 0));

----table (2) in the return set 
--select * from #tempPOSpeech where article_id = iif((@articleNum) = 1, @article_id, iif((@articleNum) = 2, @article_id2, 0));

----table (3) in the return set 
--select * from #tempOrigin where article_id = iif((@articleNum) = 1, @article_id, iif((@articleNum) = 2, @article_id2, 0));

delete from #tempSentenceSummary where article_id = 0

select * from #tempSentenceSummary

--table (1) in the return set 
select * from #tempWordFreq

--table (2) in the return set 
select * from #tempPOSpeech

--table (3) in the return set 
select * from #tempOrigin


select * from #tempPercentChangeResults
GO
/****** Object:  StoredProcedure [dbo].[mass_comparison]    Script Date: 1/10/2019 11:32:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mass_comparison]
@baseArticleId as numeric(18,2)
as

create table #tempPercentChange
(
base_article_id numeric(18,0),
secondary_article_id numeric(18,0),
Avg_WordPerSentance numeric(18,2), 
Avg_CharPerSentance numeric(18,2), 
Avg_CharPerWord numeric(18,2),
Avg_ContractPerSentance numeric(18,2),
Avg_WordFreq numeric(18,2),
Avg_POSpeechFreq numeric(18,2),
Avg_OriginFreq numeric(18,2),
Max_WordFreq numeric(18,2),
Max_POSpeechFreq numeric(18,2),
Max_OriginFreq numeric(18,2)
)

insert into #tempPercentChange
(
base_article_id,
secondary_article_id,
Avg_WordPerSentance, 
Avg_CharPerSentance, 
Avg_CharPerWord,
Avg_ContractPerSentance,
Avg_WordFreq,
Avg_POSpeechFreq,
Avg_OriginFreq,
Max_WordFreq,
Max_POSpeechFreq,
Max_OriginFreq
)
select 
@baseArticleId,
article_id,
Avg_WordPerSentance = 
					(
						select	
						((	
							(	
							select top 1 Avg_WordPerSentance 
								from ArticleAtributes 
								where article_id = da.article_id	
							)	
							-	
							(	
							select top 1 Avg_WordPerSentance 
								from ArticleAtributes 
								where article_id = @baseArticleId
							)
						)
							/
							(
							select top 1 Avg_WordPerSentance 
								from ArticleAtributes 
								where article_id = @baseArticleId
							)
						)
							*
							convert(numeric(18,2),100)
					),	
Avg_CharPerSentance = 
					(
						select	
						((	
							(	
							select top 1 Avg_CharPerSentance 
								from ArticleAtributes 
								where article_id = da.article_id	
							)	
							-	
							(	
							select top 1 Avg_CharPerSentance 
								from ArticleAtributes 
								where article_id = @baseArticleId
							)
						)
							/
							(
							select top 1 Avg_CharPerSentance 
								from ArticleAtributes 
								where article_id = @baseArticleId
							)
						)
							*
							convert(numeric(18,2),100)
					),	
Avg_CharPerWord = 
					(
						select	
						((	
							(	
							select top 1 Avg_CharPerWord 
								from ArticleAtributes 
								where article_id = da.article_id	
							)	
							-	
							(	
							select top 1 Avg_CharPerWord 
								from ArticleAtributes 
								where article_id = @baseArticleId
							)
						)
							/
							(
							select top 1 Avg_CharPerWord 
								from ArticleAtributes 
								where article_id = @baseArticleId
							)
						)
							*
							convert(numeric(18,2),100)
					),	
Avg_ContractPerSentance = 
					(
						select	
						((	
							(	
							select top 1 Avg_ContractPerSentance 
								from ArticleAtributes 
								where article_id = da.article_id	
							)	
							-	
							(	
							select top 1 Avg_ContractPerSentance 
								from ArticleAtributes 
								where article_id = @baseArticleId
							)
						)
							/
							(
							select top 1 Avg_ContractPerSentance 
								from ArticleAtributes 
								where article_id = @baseArticleId
							)
						)
							*
							convert(numeric(18,2),100)
					),	
Avg_WordFreq = 
					(
						select	
						((	
							(	
							select top 1 Avg_WordFreq 
								from ArticleAtributes 
								where article_id = da.article_id	
							)	
							-	
							(	
							select top 1 Avg_WordFreq 
								from ArticleAtributes 
								where article_id = @baseArticleId
							)
						)
							/
							(
							select top 1 Avg_WordFreq 
								from ArticleAtributes 
								where article_id = @baseArticleId
							)
						)
							*
							convert(numeric(18,2),100)
					),	
Avg_POSpeechFreq = 
					(
						select	
						((	
							(	
							select top 1 Avg_POSpeechFreq 
								from ArticleAtributes 
								where article_id = da.article_id	
							)	
							-	
							(	
							select top 1 Avg_POSpeechFreq 
								from ArticleAtributes 
								where article_id = @baseArticleId
							)
						)
							/
							(
							select top 1 Avg_POSpeechFreq 
								from ArticleAtributes 
								where article_id = @baseArticleId
							)
						)
							*
							convert(numeric(18,2),100)
					),	
Avg_OriginFreq = 
					(
						select	
						((	
							(	
							select top 1 Avg_OriginFreq 
								from ArticleAtributes 
								where article_id = da.article_id	
							)	
							-	
							(	
							select top 1 Avg_OriginFreq 
								from ArticleAtributes 
								where article_id = @baseArticleId
							)
						)
							/
							(
							select top 1 Avg_OriginFreq 
								from ArticleAtributes 
								where article_id = @baseArticleId
							)
						)
							*
							convert(numeric(18,2),100)
					),	
Max_WordFreq = 
					(
						select	
						((	
							(	
							select top 1 Max_WordFreq 
								from ArticleAtributes 
								where article_id = da.article_id	
							)	
							-	
							(	
							select top 1 Max_WordFreq 
								from ArticleAtributes 
								where article_id = @baseArticleId
							)
						)
							/
							(
							select top 1 Max_WordFreq 
								from ArticleAtributes 
								where article_id = @baseArticleId
							)
						)
							*
							convert(numeric(18,2),100)
					),	
Max_POSpeechFreq = 
					(
						select	
						((	
							(	
							select top 1 Max_POSpeechFreq 
								from ArticleAtributes 
								where article_id = da.article_id	
							)	
							-	
							(	
							select top 1 Max_POSpeechFreq 
								from ArticleAtributes 
								where article_id = @baseArticleId
							)
						)
							/
							(
							select top 1 Max_POSpeechFreq 
								from ArticleAtributes 
								where article_id = @baseArticleId
							)
						)
							*
							convert(numeric(18,2),100)
					),	
Max_OriginFreq = 
					(
						select	
						((	
							(	
							select top 1 Max_OriginFreq 
								from ArticleAtributes 
								where article_id = da.article_id	
							)	
							-	
							(	
							select top 1 Max_OriginFreq 
								from ArticleAtributes 
								where article_id = @baseArticleId
							)
						)
							/
							(
							select top 1 Max_OriginFreq 
								from ArticleAtributes 
								where article_id = @baseArticleId
							)
						)
							*
							convert(numeric(18,2),100)
					)
from ArticleAtributes as da

create table #tempResults
(
base_article_id numeric(18,0),
secondary_article_id numeric(18,0),
Avg_WordPerSentance numeric(18,2), 
Avg_CharPerSentance numeric(18,2), 
Avg_CharPerWord numeric(18,2),
Avg_ContractPerSentance numeric(18,2),
Avg_WordFreq numeric(18,2),
Avg_POSpeechFreq numeric(18,2),
Avg_OriginFreq numeric(18,2),
Max_WordFreq numeric(18,2),
Max_POSpeechFreq numeric(18,2),
Max_OriginFreq numeric(18,2),
MasterPercent numeric(18,2)
)

declare @CountOfAtributes as int
select @CountOfAtributes = 10

insert into #tempResults
(
base_article_id,
secondary_article_id,
Avg_WordPerSentance, 
Avg_CharPerSentance, 
Avg_CharPerWord,
Avg_ContractPerSentance,
Avg_WordFreq,
Avg_POSpeechFreq,
Avg_OriginFreq,
Max_WordFreq,
Max_POSpeechFreq,
Max_OriginFreq
)
select 
base_article_id,
secondary_article_id,
Avg_WordPerSentance =	(
							(convert(numeric(18,2),@CountOfAtributes)/convert(numeric(18,2),100))
							*
							(select top 1 Avg_WordPerSentance 
							from #tempPercentChange
							where secondary_article_id = a.secondary_article_id)
						),
Avg_CharPerSentance =	(
							(convert(numeric(18,2),@CountOfAtributes)/convert(numeric(18,2),100))
							*
							(select top 1 Avg_CharPerSentance 
							from #tempPercentChange
							where secondary_article_id = a.secondary_article_id)
						),
Avg_CharPerWord =		(
							(convert(numeric(18,2),@CountOfAtributes)/convert(numeric(18,2),100))
							*
							(select top 1 Avg_CharPerWord 
							from #tempPercentChange
							where secondary_article_id = a.secondary_article_id)
						),
Avg_ContractPerSentance = (
							(convert(numeric(18,2),@CountOfAtributes)/convert(numeric(18,2),100))
							*
							(select top 1 Avg_ContractPerSentance 
							from #tempPercentChange
							where secondary_article_id = a.secondary_article_id)
						),
Avg_WordFreq =			(
							(convert(numeric(18,2),@CountOfAtributes)/convert(numeric(18,2),100))
							*
							(select top 1 Avg_WordFreq 
							from #tempPercentChange
							where secondary_article_id = a.secondary_article_id)
						),
Avg_POSpeechFreq =		(
							(convert(numeric(18,2),@CountOfAtributes)/convert(numeric(18,2),100))
							*
							(select top 1 Avg_POSpeechFreq 
							from #tempPercentChange
							where secondary_article_id = a.secondary_article_id)
						),
Avg_OriginFreq =		(
							(convert(numeric(18,2),@CountOfAtributes)/convert(numeric(18,2),100))
							*
							(select top 1 Avg_OriginFreq 
							from #tempPercentChange
							where secondary_article_id = a.secondary_article_id)
						),
Max_WordFreq =			(
							(convert(numeric(18,2),@CountOfAtributes)/convert(numeric(18,2),100))
							*
							(select top 1 Max_WordFreq 
							from #tempPercentChange
							where secondary_article_id = a.secondary_article_id)
						),
Max_POSpeechFreq =		(
							(convert(numeric(18,2),@CountOfAtributes)/convert(numeric(18,2),100))
							*
							(select top 1 Max_POSpeechFreq 
							from #tempPercentChange
							where secondary_article_id = a.secondary_article_id)
						),
Max_OriginFreq =		(
							(convert(numeric(18,2),@CountOfAtributes)/convert(numeric(18,2),100))
							*
							(select top 1 Max_OriginFreq 
							from #tempPercentChange
							where secondary_article_id = a.secondary_article_id)
						)
from #tempPercentChange a

update #tempResults
set MasterPercent =			(							
							abs((
							(
							select abs(Avg_WordPerSentance) 
							from #tempResults ab
							where secondary_article_id = a.secondary_article_id and a.base_article_id = @baseArticleId
							)
							+
							(
							select abs(Avg_CharPerSentance) 
							from #tempResults ab
							where secondary_article_id = a.secondary_article_id and a.base_article_id = @baseArticleId
							)
							+
							(
							select abs(Avg_CharPerWord )
							from #tempResults ab
							where secondary_article_id = a.secondary_article_id and a.base_article_id = @baseArticleId
							)
							+
							(
							select abs(Avg_ContractPerSentance )
							from #tempResults ab
							where secondary_article_id = a.secondary_article_id and a.base_article_id = @baseArticleId
							)
							+
							(
							select abs(Avg_WordFreq )
							from #tempResults ab
							where secondary_article_id = a.secondary_article_id and a.base_article_id = @baseArticleId
							)
							+
							(
							select abs(Avg_POSpeechFreq )
							from #tempResults ab
							where secondary_article_id = a.secondary_article_id and a.base_article_id = @baseArticleId
							)
							+
							(
							select abs(Avg_OriginFreq )
							from #tempResults ab
							where secondary_article_id = a.secondary_article_id and a.base_article_id = @baseArticleId
							)
							+
							(
							select abs(Max_WordFreq )
							from #tempResults ab
							where secondary_article_id = a.secondary_article_id and a.base_article_id = @baseArticleId
							)
							+
							(
							select abs(Max_POSpeechFreq) 
							from #tempResults ab
							where secondary_article_id = a.secondary_article_id and a.base_article_id = @baseArticleId
							)
							+
							(
							select abs(Max_OriginFreq )
							from #tempResults ab
							where secondary_article_id = a.secondary_article_id and a.base_article_id = @baseArticleId
							)							
							)
							-
							100
							)						
						)
from #tempPercentChange a
where a.secondary_article_id = #tempResults.secondary_article_id





select * from #tempPercentChange

select * from #tempResults
order by MasterPercent desc
GO
/****** Object:  StoredProcedure [dbo].[processArticleRaw]    Script Date: 1/10/2019 11:32:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[processArticleRaw] as 

--create temp table to handle the insert of words
create table #tempWord
(
	word varchar(60),
	Article_sentence_id numeric(18, 0),
	Article_id numeric(18, 0),
	Article_name_raw varchar(255)
)

--raw inserts into author
insert into Author (Author_firstname, Author_lastname) 
Select Author_firstname, Author_lastname 
from Article_raw
where Author_firstname + Author_lastname not in (
													select Author_firstname + Author_lastname
													from Author 
												)

--raw inserts into article
insert into Article (Article_name, Author_id, Article_raw_id) 
Select Article_name,
Author_id = (
			 select top 1 Author_id 
			 from Author 
			 where Author_firstname + Author_lastname = a.Author_firstname + a.Author_lastname
			 ),
Article_raw_id 
from Article_raw a
where Article_name not in (
							select Article_name
							from Article 
						   ) 

update Article
set Author_name = (select concat((select top 1 Author_firstname from Author where Author_id = a.Author_id), ' ', (select top 1 Author_lastname from Author where Author_id = a.Author_id)))
from Article a

--removes other end of sentance punctuation to split by period
update Article_raw 
set Article_text = Replace(Replace(Article_text, '?', '.'), '!', '.')  

update Article_raw 
set Article_text = Replace(Replace(Replace(Replace(Replace(Replace(Replace(Replace(Article_text, '-', ''), '"', ''), '”', ''), '/n', '') , '_', '') , ')', '') , '(', '') , '“', '') 

update Article_word  
set word = Replace(Replace(Replace(Replace(Replace(Replace(Replace(Replace(word, '-', ''), '"', ''), '”', ''), '/n', '') , '_', '') , ')', '') , '(', '') , '“', '') 

update Article_sentence 
set sentence = Replace(Replace(Replace(Replace(Replace(Replace(Replace(Replace(sentence, '-', ''), '"', ''), '”', ''), '/n', '') , '_', '') , ')', '') , '(', '') , '“', '') 

--raw split by '.'
insert into Article_sentence (Article_id, sentence, Article_name_raw)
Select 
Article_id = (
				select top 1 Article_id
				from Article
				where Article_name = a.Article_name
			 ),
ltrim(rtrim(replace(replace(replace(value, char(10), ''), char(13), '') , '.', ''))),
Article_name_raw = (a.Article_name)
from Article_raw a
CROSS APPLY STRING_SPLIT(Article_text, '.');

delete from Article_sentence where sentence = ''

--insert words without punct
insert into #tempWord (Article_sentence_id, Article_id, Article_name_raw, word)
Select 
Article_sentence_id, Article_id, Article_name_raw, replace(replace(value, char(10), ''), char(13), '') 
from Article_sentence a
CROSS APPLY STRING_SPLIT(sentence, ' ')
where value not like '%.%' 
and value not like '%,%' 
and value not like '%?%' 
and value not like '%!%' 
and value not like '%;%' 
and value not like '%:%' 
and value not like '%"%'
and value not like '%.' 
and value not like '%,' 
and value not like '%?' 
and value not like '%!' 
and value not like '%;' 
and value not like '%:' 
and value not like '%"'
and value not like ';%' 
and value not like ':%' 
and value not like '"%'

--insert words with punct and replace
insert into #tempWord (Article_sentence_id, Article_id, Article_name_raw, word)
Select Article_sentence_id, Article_id, Article_name_raw, 
ltrim(rtrim(replace(replace(replace(value, char(10), ''), char(13), '') , '.', '')))
from Article_sentence a 
CROSS APPLY STRING_SPLIT(sentence, ' ') 
where value like '%.%'

insert into #tempWord (Article_sentence_id, Article_id, Article_name_raw, word)
Select Article_sentence_id, Article_id, Article_name_raw, 
ltrim(rtrim(replace(replace(replace(value, char(10), ''), char(13), '') , ',', '')))
from Article_sentence a 
CROSS APPLY STRING_SPLIT(sentence, ' ') 
where value like '%,%'

insert into #tempWord (Article_sentence_id, Article_id, Article_name_raw, word)
Select Article_sentence_id, Article_id, Article_name_raw, 
ltrim(rtrim(replace(replace(replace(value, char(10), ''), char(13), '') , '!', '')))
from Article_sentence a 
CROSS APPLY STRING_SPLIT(sentence, ' ') 
where value like '%!%'

insert into #tempWord (Article_sentence_id, Article_id, Article_name_raw, word)
Select Article_sentence_id, Article_id, Article_name_raw, 
ltrim(rtrim(replace(replace(replace(value, char(10), ''), char(13), '') , '?', '')))
from Article_sentence a 
CROSS APPLY STRING_SPLIT(sentence, ' ') 
where value like '%?%'

insert into #tempWord (Article_sentence_id, Article_id, Article_name_raw, word)
Select Article_sentence_id, Article_id, Article_name_raw, 
ltrim(rtrim(replace(replace(replace(value, char(10), ''), char(13), '') , ':', '')))
from Article_sentence a 
CROSS APPLY STRING_SPLIT(sentence, ' ') 
where value like '%:%'

insert into #tempWord (Article_sentence_id, Article_id, Article_name_raw, word)
Select Article_sentence_id, Article_id, Article_name_raw, 
ltrim(rtrim(replace(replace(replace(value, char(10), ''), char(13), '') , ';', '')))
from Article_sentence a 
CROSS APPLY STRING_SPLIT(sentence, ' ') 
where value like '%;%'


--sentance split by ' '
insert into Article_word (word, Article_sentence_id, Article_id)
Select 
word,
Article_sentence_id,
Article_id = (
				select top 1 Article_id
				from Article
				where Article_name = a.Article_name_raw
			 )
from #tempWord a

--update the count of words
update Dict_article_word 
set count_of_Word = (
						select count(*) from article_word aw where aw.word = a.word
					)
from Dict_article_word a

--update origin
update Dict_article_word
set origin = (
				select top 1 Origin
				from WordOrigin ay
				where ay.Word = a.Word
			 )
from Dict_article_word a

--update part of speech
update Dict_article_word
set part_of_speech = (
						select top 1 part_of_speech
						from PartOfSpeech ay
						where ay.Word = a.Word
					 )
from Dict_article_word a




--adds origin from dicionary
update Article_word
set origin = (
				select top 1 Origin
				from Dict_article_word ay
				where ay.Word = a.Word
			 )
from Article_word a

--adds part of speech from dicionary
update Article_word
set part_of_speech = (
				select top 1 part_of_speech
				from Dict_article_word ay
				where ay.Word = a.Word
			 )
from Article_word a

delete from Article_word where word = ''

GO
/****** Object:  StoredProcedure [dbo].[processDictArticleRaw]    Script Date: 1/10/2019 11:32:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[processDictArticleRaw] as

--create temp table to handle the insert of words
create table #tempWord
(
word varchar(45)
)

update Dict_article_raw 
set Dict_article_text = Replace(Replace(Replace(Replace(Replace(Replace(Replace(Replace(Dict_article_text, '-', ''), '"', ''), '”', ''), '/n', '') , '_', '') , ')', '') , '(', '') , '“', '') 

--insert words without punct
insert into #tempWord (word)
Select 
replace(replace(value, char(10), ''), char(13), '') 
from Dict_article_raw a
CROSS APPLY STRING_SPLIT(Dict_article_text, ' ')
where value not like '%.%' 
and value not like '%,%' 
and value not like '%?%' 
and value not like '%!%' 
and value not like '%;%' 
and value not like '%:%' 
and value not like '%"%'
and value not like '%.' 
and value not like '%,' 
and value not like '%?' 
and value not like '%!' 
and value not like '%;' 
and value not like '%:' 
and value not like '%"'
and value not like ';%' 
and value not like ':%' 
and value not like '"%'

--insert words with punct and replace
insert into #tempWord (word)
Select 
ltrim(rtrim(replace(replace(replace(value, char(10), ''), char(13), '') , '.', '')))
from Dict_article_raw a 
CROSS APPLY STRING_SPLIT(Dict_article_text, ' ') 
where value like '%.%'

insert into #tempWord (word)
Select 
ltrim(rtrim(replace(replace(replace(value, char(10), ''), char(13), '') , ',', '')))
from Dict_article_raw a 
CROSS APPLY STRING_SPLIT(Dict_article_text, ' ') 
where value like '%,%'

insert into #tempWord (word)
Select 
ltrim(rtrim(replace(replace(replace(value, char(10), ''), char(13), '') , '!', '')))
from Dict_article_raw a 
CROSS APPLY STRING_SPLIT(Dict_article_text, ' ') 
where value like '%!%'

insert into #tempWord (word)
Select 
ltrim(rtrim(replace(replace(replace(value, char(10), ''), char(13), '') , '?', '')))
from Dict_article_raw a 
CROSS APPLY STRING_SPLIT(Dict_article_text, ' ') 
where value like '%?%'

insert into #tempWord (word)
Select 
ltrim(rtrim(replace(replace(replace(value, char(10), ''), char(13), '') , ':', '')))
from Dict_article_raw a 
CROSS APPLY STRING_SPLIT(Dict_article_text, ' ') 
where value like '%:%'

insert into #tempWord (word)
Select 
ltrim(rtrim(replace(replace(replace(value, char(10), ''), char(13), '') , ';', '')))
from Dict_article_raw a 
CROSS APPLY STRING_SPLIT(Dict_article_text, ' ') 
where value like '%;%'

--insert into word from temp table
insert into Dict_article_word 
(
word
)
select distinct ltrim(rtrim(word)) 
from #tempWord 
where word not in 
(
select ltrim(rtrim(replace(replace(word, char(10), ''), char(13), '')))  
from Dict_article_word
) and word is not null
and ltrim(rtrim(word))  <> ''


		 
--TODO : Find bigger part of speech library
GO
/****** Object:  StoredProcedure [dbo].[returnArticleID]    Script Date: 1/10/2019 11:32:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[returnArticleID]
@article_name varchar(255)
as
begin
      select Article_id 
	  from Article 
	  where Article_name = @article_name 
      return
end
GO
/****** Object:  StoredProcedure [dbo].[returnArticles]    Script Date: 1/10/2019 11:32:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[returnArticles]
as
begin
	select * from Article
	order by Author_name desc
    return
end
GO
/****** Object:  StoredProcedure [dbo].[returnTitles]    Script Date: 1/10/2019 11:32:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[returnTitles] as
begin
      select Article_name 
	  from Article 
	  where Article_name is not null
      return
end
GO
/****** Object:  StoredProcedure [dbo].[setArticleAtrtibutes]    Script Date: 1/10/2019 11:32:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--exec setArticleAtrtibutes 70

CREATE proc [dbo].[setArticleAtrtibutes]
@article_id numeric(18,0)
as

--Create Temp Tables
create table #tempSentenceSummary
(
sentence_count int,
word_count int,
char_count int,  
contractions_count int,
avg_words_per_sentence numeric(18,2), 
avg_char_per_sentence numeric(18,2),
avg_char_per_word numeric(18,2),
avg_contractions_per_sentence numeric(18,6),
article_id numeric(18,0)
)

create table #tempWordFreq
(
word varchar(100), 
word_freq int, 
total_words int, 
word_freq_percent numeric(18,4),
avg_word_freq numeric(18,2), 
article_id numeric(18,0)
)

create table #tempPOSpeech
(
po_speech varchar(100), 
po_speech_freq int, 
total_words_with_POS int, 
po_speech_freq_percent numeric(18,4) ,
avg_po_speech_freq numeric(18,2),
article_id numeric(18,0)
)

create table #tempOrigin
(
origin varchar(100), 
origin_freq int, 
total_words_with_origin int, 
origin_freq_percent numeric(18,4),
avg_origin_freq numeric(18,2),
article_id numeric(18,0)
)

--initialize my summary table
insert into #tempSentenceSummary 
(
sentence_count, avg_words_per_sentence, avg_char_per_sentence, avg_char_per_word, avg_contractions_per_sentence, article_id
)
values 
(
0,0,0,0,0,@article_id
) 


--determine the summary of the sentences 

update #tempSentenceSummary 
set sentence_count = (select count(*) from Article_sentence where article_id = @article_id) 
where article_id = @article_id

update #tempSentenceSummary 
set word_count = (select count(*) from Article_word where article_id = @article_id)
where article_id = @article_id

update #tempSentenceSummary 
set char_count = (select sum(len(word)) from Article_word where article_id = @article_id)
where article_id = @article_id

update #tempSentenceSummary 
set contractions_count = (select count(*) from Article_word where article_id = @article_id and word like '%’%' or word like '%''%')
where article_id = @article_id

update #tempSentenceSummary 
set avg_words_per_sentence = Convert(numeric(18,2),word_count) / Convert(numeric(18,2),sentence_count)
where sentence_count <> 0 


update #tempSentenceSummary 
set avg_words_per_sentence = 0
where sentence_count = 0 


update #tempSentenceSummary 
set avg_char_per_sentence = Convert(numeric(18,2),char_count) / Convert(numeric(18,2),sentence_count)
where sentence_count <> 0 


update #tempSentenceSummary 
set avg_char_per_sentence = 0
where sentence_count = 0 

update #tempSentenceSummary 
set avg_char_per_word = Convert(numeric(18,2),char_count) / Convert(numeric(18,2),word_count)
where word_count <> 0 

update #tempSentenceSummary 
set avg_char_per_word = 0
where word_count = 0 

update #tempSentenceSummary 
set avg_contractions_per_sentence = Convert(numeric(18,6),contractions_count) / Convert(numeric(18,6),sentence_count)
where sentence_count <> 0 

update #tempSentenceSummary 
set avg_contractions_per_sentence = 0
where sentence_count = 0 

--determine the word frequency for this article 
insert into #tempWordFreq
(
word, word_freq, article_id
)
select word, count(word), @article_id
from Article_word 
where Article_id = @article_id 
group by word, article_id 

delete from #tempWordFreq where word = ''
delete from #tempWordFreq where word is null

update #tempWordFreq 
set total_words = (select count(*) from article_word where Article_id = @article_id) 
where article_id = @article_id

update #tempWordFreq 
set word_freq_percent =  (100/Convert(numeric(18,4), total_words))*Convert(numeric(18,4), word_freq)
where total_words <> 0  

update #tempWordFreq
set avg_word_freq = (select Convert(numeric(18,2), sum(word_freq))/count(word) from #tempWordFreq where article_id = @article_id)
where article_id = @article_id

--determine part of speech %
insert into #tempPOSpeech
(
 po_speech, po_speech_freq, article_id
)
select part_of_speech, count(part_of_speech), @article_id
from Article_word 
where Article_id = @article_id
group by part_of_speech, article_id

delete from #tempPOSpeech where po_speech = ''
delete from #tempPOSpeech where po_speech is null

update #tempPOSpeech 
set total_words_with_POS = (select sum(po_speech_freq) from #tempPOSpeech where article_id = @article_id)
where article_id = @article_id

update #tempPOSpeech 
set po_speech_freq_percent = (100/Convert(numeric(18,4), total_words_with_POS))*Convert(numeric(18,4), po_speech_freq)
where po_speech_freq <> 0

update #tempPOSpeech
set avg_po_speech_freq = (select Convert(numeric(18,2), sum(po_speech_freq))/count(po_speech) from #tempPOSpeech where article_id = @article_id)
where article_id = @article_id

--determine origin
insert into #tempOrigin
(
 origin, origin_freq, article_id
)
select origin, count(origin), @article_id
from Article_word 
where Article_id = @article_id
group by origin, article_id

delete from #tempOrigin where origin = ''
delete from #tempOrigin where origin is null

update #tempOrigin 
set total_words_with_origin = (select sum(origin_freq) from #tempOrigin where article_id = @article_id)
where article_id = @article_id

--(select count(*) from article_word where Article_id = @article_id) 

update #tempOrigin 
set origin_freq_percent = (100/Convert(numeric(18,4), total_words_with_origin))*Convert(numeric(18,4), origin_freq)
where origin_freq <> 0

update #tempOrigin
set avg_origin_freq = (select Convert(numeric(18,2), sum(origin_freq))/count(origin) from #tempOrigin where article_id = @article_id)
where article_id = @article_id

--frequency of words
--parts of speech %
--count of parts of speech (each type)


--origin of word %

-------------------------------------------------------------Indivisual Part Of Speech-------------------------------------------------------------------------

--------------Nouns----------------
create table #tempNounSummary
(
noun_count int,
sentence_count int,
char_count int,  
avg_nouns_per_sentence numeric(18,6), 
avg_char_in_noun numeric(18,6),
article_id numeric(18,0)
)



insert into #tempNounSummary
(
sentence_count,  
article_id,
noun_count
)
select sentence_count, @article_id,
noun_count = (
				select top 1 po_speech_freq 
				from #tempPOSpeech 
				where po_speech = 'noun' and a.article_id = @article_id
			)
from #tempSentenceSummary a
where a.article_id = @article_id

update #tempNounSummary 
set avg_nouns_per_sentence = Convert(numeric(18,6),noun_count) / Convert(numeric(18,6),sentence_count)
where sentence_count <> 0

update #tempNounSummary 
set char_count = (select sum(len(word)) from Article_word where article_id = @article_id and part_of_speech = 'noun')
where article_id = @article_id

update #tempNounSummary 
set avg_char_in_noun = Convert(numeric(18,6),char_count) / Convert(numeric(18,6),noun_count)
where noun_count <> 0 

--------------Verbs----------------
create table #tempVerbSummary
(
verb_count int,
sentence_count int,
char_count int,  
avg_verbs_per_sentence numeric(18,6), 
avg_char_in_verb numeric(18,6),
article_id numeric(18,0)
)

insert into #tempVerbSummary
(
sentence_count,
article_id,
verb_count
)
select sentence_count, @article_id,
verb_count = (
				select top 1 po_speech_freq 
				from #tempPOSpeech 
				where po_speech = 'verb' and a.article_id = @article_id
			)
from #tempSentenceSummary a
where a.article_id = @article_id

update #tempVerbSummary 
set char_count = (select sum(len(word)) from Article_word where article_id = @article_id and part_of_speech = 'verb')
where article_id = @article_id

update #tempVerbSummary 
set avg_verbs_per_sentence = Convert(numeric(18,6),verb_count) / Convert(numeric(18,6),sentence_count)
where sentence_count <> 0 

update #tempVerbSummary 
set avg_char_in_verb = Convert(numeric(18,6),char_count) / Convert(numeric(18,6),verb_count)
where verb_count <> 0 

-------------Adjectives------------
create table #tempAdjectiveSummary
(
adjectives_count int,
sentence_count int,
char_count int,  
avg_adjectives_per_sentence numeric(18,6), 
avg_char_in_adjective numeric(18,6),
article_id numeric(18,0)
)

insert into #tempAdjectiveSummary
(
sentence_count,
char_count,  
article_id,
adjectives_count
)
select sentence_count, char_count, @article_id,
adjectives_count = (
				select top 1 po_speech_freq 
				from #tempPOSpeech 
				where po_speech = 'adjective' and a.article_id = @article_id
			)
from #tempSentenceSummary a
where a.article_id = @article_id

update #tempAdjectiveSummary 
set char_count = (select sum(len(word)) from Article_word where article_id = @article_id and part_of_speech = 'adjective')
where article_id = @article_id

update #tempAdjectiveSummary 
set avg_adjectives_per_sentence = Convert(numeric(18,6),adjectives_count) / Convert(numeric(18,6),sentence_count)
where sentence_count <> 0 

update #tempAdjectiveSummary 
set avg_char_in_adjective = Convert(numeric(18,6),char_count) / Convert(numeric(18,6),adjectives_count)
where adjectives_count <> 0 

------------Adverbs---------------
create table #tempAdverbSummary
(
adverb_count int,
sentence_count int,
char_count int,  
avg_adverbs_per_sentence numeric(18,6), 
avg_char_in_adverb numeric(18,6),
article_id numeric(18,0)
)

insert into #tempAdverbSummary
(
sentence_count,
char_count,  
article_id,
adverb_count
)
select sentence_count, char_count, @article_id,
adverb_count = (
				select top 1 po_speech_freq 
				from #tempPOSpeech 
				where po_speech = 'adverb' and a.article_id = @article_id
			)
from #tempSentenceSummary a
where a.article_id = @article_id

update #tempAdverbSummary 
set char_count = (select sum(len(word)) from Article_word where article_id = @article_id and part_of_speech = 'adverb')
where article_id = @article_id

update #tempAdverbSummary 
set avg_adverbs_per_sentence = Convert(numeric(18,6),adverb_count) / Convert(numeric(18,6),sentence_count)
where sentence_count <> 0 

update #tempAdverbSummary 
set avg_char_in_adverb = Convert(numeric(18,6),char_count) / Convert(numeric(18,6),adverb_count)
where adverb_count <> 0 


----------------------------------------------------------------------Setting Tab----------------------------------------------------------------------------------


insert into ArticleAtributes(
article_id,
Avg_WordPerSentance, 
Avg_CharPerSentance, 
Avg_CharPerWord,
Avg_ContractPerSentance,
Avg_WordFreq,
Avg_POSpeechFreq,
Avg_OriginFreq,
Max_WordFreq,
Max_POSpeechFreq,
Min_POSpeechFreq,
Max_OriginFreq,
Min_OriginFreq,

Avg_NounsPerSentence,
Avg_CharInNoun,
Avg_VerbsPerSentence,
Avg_CharInVerb,
Avg_AdjectivesPerSentence,
Avg_CharInAdjective,
Avg_AdverbsPerSentence,
Avg_CharInAdverb

)
select
@article_id, 
Avg_WordPerSentance = (select top 1 avg_words_per_sentence from #tempSentenceSummary),
Avg_CharPerSentance = (select top 1 avg_char_per_sentence from #tempSentenceSummary),
Avg_CharPerWord = (select top 1 avg_char_per_word from #tempSentenceSummary),
Avg_ContractPerSentance = (select top 1 avg_contractions_per_sentence from #tempSentenceSummary),
Avg_WordFreq = (select top 1 avg_word_freq from #tempWordFreq),
Avg_POSpeechFreq = (select top 1 avg_po_speech_freq from #tempPOSpeech),
Avg_OriginFreq = (select top 1 avg_origin_freq from #tempOrigin),
Max_WordFreq = (select convert(numeric(18,2),max( word_freq ))
								from #tempWordFreq
								where article_id = @article_id),
Max_POSpeechFreq = (select convert(numeric(18,2),max( po_speech_freq ))
								from #tempPOSpeech
								where article_id = @article_id),
Min_POSpeechFreq = (select convert(numeric(18,2),min( po_speech_freq ))
								from #tempPOSpeech
								where article_id = @article_id),

Max_OriginFreq = (select convert(numeric(18,2),max( origin_freq ))
								from #tempOrigin
								where article_id = @article_id),
Min_OriginFreq = (select convert(numeric(18,2),min( origin_freq ))
								from #tempOrigin
								where article_id = @article_id),


Avg_NounsPerSentence = (select top 1 avg_nouns_per_sentence from #tempNounSummary),
Avg_CharInNoun = (select top 1 avg_char_in_noun from #tempNounSummary),
Avg_VerbsPerSentence = (select top 1 avg_verbs_per_sentence from #tempVerbSummary),
Avg_CharInVerb = (select top 1 avg_char_in_verb from #tempVerbSummary),
Avg_AdjectivesPerSentence = (select top 1 avg_adjectives_per_sentence from #tempAdjectiveSummary),
Avg_CharInAdjective = (select top 1 avg_char_in_adjective from #tempAdjectiveSummary),
Avg_AdverbsPerSentence = (select top 1 avg_adverbs_per_sentence from #tempAdverbSummary),
Avg_CharInAdverb = (select top 1 avg_char_in_adverb from #tempAdverbSummary) 

--MostOrigin = (select top 1 Origin from #tempOrigin where origin_freq = max( origin_freq )),
--LeastOrigin = (select top 1 Origin from #tempOrigin where origin_freq = min( origin_freq ))



GO
/****** Object:  StoredProcedure [dbo].[tempDeleteData]    Script Date: 1/10/2019 11:32:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[tempDeleteData]
as

delete from Dict_article_raw
delete from Dict_article_word
delete from Article_word
delete from Article_raw
delete from Article_sentence
delete from Article
delete from Author
delete from ArticleAtributes
GO
USE [master]
GO
ALTER DATABASE [Science_Fair] SET  READ_WRITE 
GO
