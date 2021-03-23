Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 505F2346897
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Mar 2021 20:11:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lOmQr-0003vK-Hz; Tue, 23 Mar 2021 19:11:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <krisman@collabora.com>) id 1lOmQW-0003uZ-29
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Mar 2021 19:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fO2dXOpQdCHpXW+mrJ71xamuddmFtID3PQJfTRycM/I=; b=HVo1F9iBTqFb6AF5qJsUWoLPt0
 qar26CP6oBynRB76nAnOotRQ83mo4Kns/B3aEmd9Bfk6oYAHkuezIb7nqeHtKqMZDPQkmPi9Bc3k7
 gIWz8qmm2tC6RcHR5jMVLF8iC7RRjCY+ofKF50zFVcMI1nEbQewlGrQ1wXQ6FVxIzO/4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fO2dXOpQdCHpXW+mrJ71xamuddmFtID3PQJfTRycM/I=; b=UEj9PonmebMAXNYdfmVxtOVkRZ
 k1mfKlve77P5zSAoNxtMyp5oFym2GMhfpFbnF9xSWchfn/38eSxUkWbFTRY5BvJOXXAH4EMxbtHKZ
 CXqiPiMpOhEawTsJKIkq3z6aRSrcSMKDqmJFltJGBotiukxQe+pZpSotbLUb3MeexVFk=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lOmQU-002BzV-9n
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Mar 2021 19:10:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id EA0A21F455E1
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Shreeya Patel <shreeya.patel@collabora.com>
Organization: Collabora
References: <20210323183201.812944-1-shreeya.patel@collabora.com>
 <20210323183201.812944-3-shreeya.patel@collabora.com>
Date: Tue, 23 Mar 2021 15:10:40 -0400
In-Reply-To: <20210323183201.812944-3-shreeya.patel@collabora.com> (Shreeya
 Patel's message of "Wed, 24 Mar 2021 00:01:58 +0530")
Message-ID: <87sg4ld6tr.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1lOmQU-002BzV-9n
Subject: Re: [f2fs-dev] [PATCH v3 2/5] fs: Check if utf8 encoding is loaded
 before calling utf8_unload()
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
Cc: tytso@mit.edu, drosen@google.com, ebiggers@google.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, kernel@collabora.com, adilger.kernel@dilger.ca,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, andre.almeida@collabora.com,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Shreeya Patel <shreeya.patel@collabora.com> writes:

> utf8_unload is being called if CONFIG_UNICODE is enabled.
> The ifdef block doesn't check if utf8 encoding has been loaded
> or not before calling the utf8_unload() function.
> This is not the expected behavior since it would sometimes lead
> to unloading utf8 even before loading it.
> Hence, add a condition which will check if sb->encoding is NOT NULL
> before calling the utf8_unload().

Just to mention this used to be safe, since it was just doing a
kfree(NULL), but won't be anymore after the rest of this series.

Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>

>
> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> ---
>
> Changes in v3
>   - Add this patch to the series which checks if utf8 encoding
>     was loaded before calling uft8_unload().
>  
>  fs/ext4/super.c | 6 ++++--
>  fs/f2fs/super.c | 9 ++++++---
>  2 files changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index ad34a3727..e438d14f9 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -1259,7 +1259,8 @@ static void ext4_put_super(struct super_block *sb)
>  	fs_put_dax(sbi->s_daxdev);
>  	fscrypt_free_dummy_policy(&sbi->s_dummy_enc_policy);
>  #ifdef CONFIG_UNICODE
> -	utf8_unload(sb->s_encoding);
> +	if (sb->s_encoding)
> +		utf8_unload(sb->s_encoding);
>  #endif
>  	kfree(sbi);
>  }
> @@ -5165,7 +5166,8 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
>  		crypto_free_shash(sbi->s_chksum_driver);
>  
>  #ifdef CONFIG_UNICODE
> -	utf8_unload(sb->s_encoding);
> +	if (sb->s_encoding)
> +		utf8_unload(sb->s_encoding);
>  #endif
>  
>  #ifdef CONFIG_QUOTA
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 706979375..0a04983c2 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1430,7 +1430,8 @@ static void f2fs_put_super(struct super_block *sb)
>  	for (i = 0; i < NR_PAGE_TYPE; i++)
>  		kvfree(sbi->write_io[i]);
>  #ifdef CONFIG_UNICODE
> -	utf8_unload(sb->s_encoding);
> +	if (sb->s_encoding)
> +		utf8_unload(sb->s_encoding);
>  #endif
>  	kfree(sbi);
>  }
> @@ -4073,8 +4074,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  		kvfree(sbi->write_io[i]);
>  
>  #ifdef CONFIG_UNICODE
> -	utf8_unload(sb->s_encoding);
> -	sb->s_encoding = NULL;
> +	if (sb->s_encoding) {
> +		utf8_unload(sb->s_encoding);
> +		sb->s_encoding = NULL;
> +	}
>  #endif
>  free_options:
>  #ifdef CONFIG_QUOTA

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
