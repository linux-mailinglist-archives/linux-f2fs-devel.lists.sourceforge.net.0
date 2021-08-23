Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5F43F4CE4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Aug 2021 17:03:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mIBTg-0002cB-0B; Mon, 23 Aug 2021 15:03:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <krisman@collabora.com>) id 1mIBTd-0002bz-OL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Aug 2021 15:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1GWma5VAPHuk9b/amAInatNRRXNXFUAW7YC/TbSo9cw=; b=HkqKTcVBP0aZyfhdWQC7DdP+H3
 uAvakBTZs++7XlztJdPf1FqqyoWvkdgihd+dJxjtRRumZv8IsEnKPnDK/RNqwlvSUOAKiAXUqhEj4
 rW0Gu4neX/unhMRLU5iRdsA9OuJfK/nVAi9YIWe++X0W9Y57KjBiXB9J2ZmuUUGhInyk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1GWma5VAPHuk9b/amAInatNRRXNXFUAW7YC/TbSo9cw=; b=BpaVUXymO5CVQc9UDbC+4pQlb1
 9Qw0Kb/dBqZukQvizl6ZZT4Uew01s7iTYdGDMly/rNWnFS4dpztL+SsAtAjCgUAAnf2fd3IHfHHhx
 XklOho4q5FS1K8uB+JZq4g5xYrc9WO9ieq8UuZRBwmL0EAfyheObNQkcjzqWyZGO6l04=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mIBTb-00024W-Qa
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Aug 2021 15:03:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 4DC591F42D87
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Christoph Hellwig <hch@lst.de>
Organization: Collabora
References: <20210818140651.17181-1-hch@lst.de>
 <20210818140651.17181-6-hch@lst.de>
Date: Mon, 23 Aug 2021 11:02:52 -0400
In-Reply-To: <20210818140651.17181-6-hch@lst.de> (Christoph Hellwig's message
 of "Wed, 18 Aug 2021 16:06:45 +0200")
Message-ID: <87tujg19wj.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1mIBTb-00024W-Qa
Subject: Re: [f2fs-dev] [PATCH 05/11] unicode: pass a UNICODE_AGE() tripple
 to utf8_load
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Shreeya Patel <shreeya.patel@collabora.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Christoph Hellwig <hch@lst.de> writes:

> Don't bother with pointless string parsing when the caller can just pass
> the version in the format that the core expects.  Also remove the
> fallback to the latest version that none of the callers actually uses.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/ext4/super.c            | 10 ++++----
>  fs/f2fs/super.c            | 10 ++++----
>  fs/unicode/utf8-core.c     | 50 ++++----------------------------------
>  fs/unicode/utf8-norm.c     | 11 ++-------
>  fs/unicode/utf8-selftest.c | 15 ++++++------
>  fs/unicode/utf8n.h         | 14 ++---------
>  include/linux/unicode.h    | 11 ++++++++-
>  7 files changed, 37 insertions(+), 84 deletions(-)
>
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index a68be582bba5..be418a30b52e 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -2016,9 +2016,9 @@ static const struct mount_opts {
>  static const struct ext4_sb_encodings {
>  	__u16 magic;
>  	char *name;
> -	char *version;
> +	unsigned int version;
>  } ext4_sb_encoding_map[] = {
> -	{EXT4_ENC_UTF8_12_1, "utf8", "12.1.0"},
> +	{EXT4_ENC_UTF8_12_1, "utf8", UNICODE_AGE(12, 1, 0)},
>  };
>  
>  static const struct ext4_sb_encodings *
> @@ -4308,15 +4308,15 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
>  		encoding = utf8_load(encoding_info->version);
>  		if (IS_ERR(encoding)) {
>  			ext4_msg(sb, KERN_ERR,
> -				 "can't mount with superblock charset: %s-%s "
> +				 "can't mount with superblock charset: %s-0x%x "
>  				 "not supported by the kernel. flags: 0x%x.",
>  				 encoding_info->name, encoding_info->version,
>  				 encoding_flags);
>  			goto failed_mount;
>  		}
>  		ext4_msg(sb, KERN_INFO,"Using encoding defined by superblock: "
> -			 "%s-%s with flags 0x%hx", encoding_info->name,
> -			 encoding_info->version?:"\b", encoding_flags);
> +			 "%s-0x%x with flags 0x%hx", encoding_info->name,
> +			 encoding_info->version, encoding_flags);
>  
>  		sb->s_encoding = encoding;
>  		sb->s_encoding_flags = encoding_flags;
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index af63ae009582..d107480f88a3 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -255,9 +255,9 @@ void f2fs_printk(struct f2fs_sb_info *sbi, const char *fmt, ...)
>  static const struct f2fs_sb_encodings {
>  	__u16 magic;
>  	char *name;
> -	char *version;
> +	unsigned int version;
>  } f2fs_sb_encoding_map[] = {
> -	{F2FS_ENC_UTF8_12_1, "utf8", "12.1.0"},
> +	{F2FS_ENC_UTF8_12_1, "utf8", UNICODE_AGE(12, 1, 0)},
>  };
>  
>  static const struct f2fs_sb_encodings *
> @@ -3734,15 +3734,15 @@ static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
>  		encoding = utf8_load(encoding_info->version);
>  		if (IS_ERR(encoding)) {
>  			f2fs_err(sbi,
> -				 "can't mount with superblock charset: %s-%s "
> +				 "can't mount with superblock charset: %s-0x%x "
>  				 "not supported by the kernel. flags: 0x%x.",
>  				 encoding_info->name, encoding_info->version,
>  				 encoding_flags);
>  			return PTR_ERR(encoding);
>  		}
>  		f2fs_info(sbi, "Using encoding defined by superblock: "
> -			 "%s-%s with flags 0x%hx", encoding_info->name,
> -			 encoding_info->version?:"\b", encoding_flags);
> +			 "%s-0x%x with flags 0x%hx", encoding_info->name,
> +			 encoding_info->version, encoding_flags);
>  
>  		sbi->sb->s_encoding = encoding;
>  		sbi->sb->s_encoding_flags = encoding_flags;
> diff --git a/fs/unicode/utf8-core.c b/fs/unicode/utf8-core.c
> index 86f42a078d99..dca2865c3bee 100644
> --- a/fs/unicode/utf8-core.c
> +++ b/fs/unicode/utf8-core.c
> @@ -167,59 +167,19 @@ int utf8_normalize(const struct unicode_map *um, const struct qstr *str,
>  	}
>  	return -EINVAL;
>  }
> -
>  EXPORT_SYMBOL(utf8_normalize);
>  
> -static int utf8_parse_version(const char *version, unsigned int *maj,
> -			      unsigned int *min, unsigned int *rev)
> +struct unicode_map *utf8_load(unsigned int version)
>  {
> -	substring_t args[3];
> -	char version_string[12];
> -	static const struct match_token token[] = {
> -		{1, "%d.%d.%d"},
> -		{0, NULL}
> -	};
> -
> -	strncpy(version_string, version, sizeof(version_string));
> -
> -	if (match_token(version_string, token, args) != 1)
> -		return -EINVAL;
> -
> -	if (match_int(&args[0], maj) || match_int(&args[1], min) ||
> -	    match_int(&args[2], rev))
> -		return -EINVAL;
> +	struct unicode_map *um;
>  
> -	return 0;
> -}
> -
> -struct unicode_map *utf8_load(const char *version)
> -{
> -	struct unicode_map *um = NULL;
> -	int unicode_version;
> -
> -	if (version) {
> -		unsigned int maj, min, rev;
> -
> -		if (utf8_parse_version(version, &maj, &min, &rev) < 0)
> -			return ERR_PTR(-EINVAL);
> -
> -		if (!utf8version_is_supported(maj, min, rev))
> -			return ERR_PTR(-EINVAL);
> -
> -		unicode_version = UNICODE_AGE(maj, min, rev);
> -	} else {
> -		unicode_version = utf8version_latest();
> -		printk(KERN_WARNING"UTF-8 version not specified. "
> -		       "Assuming latest supported version (%d.%d.%d).",
> -		       (unicode_version >> 16) & 0xff,
> -		       (unicode_version >> 8) & 0xff,
> -		       (unicode_version & 0xff));

I remember this fallback was specifically requested during a review or
in a discussion, but I honestly cannot remember the reason.

One advantage I can think is if we have a filesystem that requires a
newer unicode version than the current kernel has, and strict mode flag
is set, we can fallback to the latest version and still mount the fs
read/write.

That is not implemented though, so I'm fine with this removal.

Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
