Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC05B297DF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 May 2019 14:14:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hU95N-0001iY-EM; Fri, 24 May 2019 12:14:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hU95L-0001iQ-Mp
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 12:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=emIEVw2hvEWuzV8uAdPdY/bGC8rbHJNPB8RJkxo8hCY=; b=cTHOzYPQz5yHd7EYrtKkaB9opu
 2iJ/mpt+GNwzPBHBei5JJdKweCP7FYpfVtxBA6FZsoKd5+t9WYpd7ZU8fV57lBsWSvg0wPp11DyGJ
 3op5LPr/V3MhCAG641i1NYXsaC/KGwmH4y9g78nGL9Gtys0cez5JbJz2URNaLGMC6+Ag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=emIEVw2hvEWuzV8uAdPdY/bGC8rbHJNPB8RJkxo8hCY=; b=PV8ZtIQafN9yXMbYQthm4CHgTP
 Kbl+GJSxysTF5vc1ixsdjJhFnPTT2Z6ZVnBxomC/GVJ390PIzeeF9TduZNhz8leZ6Zyu+Qg+/dEGt
 C4DL2xKiHsI8FE94/aa7+gr0NW03keEicfzQrRVVSxIijgk/O5aJHwasIBuj90sOBNwo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hU95K-006Ry6-Aa
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 12:14:07 +0000
Received: from [192.168.0.101] (unknown [58.212.135.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D8082081C;
 Fri, 24 May 2019 12:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558700040;
 bh=lQa2ZD0AkGmwV+cXHfxks/LzhDAp6FE+dRNET0zMXcw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=JDcueTUfpVJ8P+nuqY9xSq9C4boM6sqhbXXlEP9rwRzS8Ni9pxQEBlzVYdDKjHHNq
 JMtKa//wOioC9KirtDr/BJlTIqnuC7OvEovx5fpcT796lQy/yWuA1DcSfraYIKBeT9
 sYmkNoEpoSkmCnMnfJyAy/3gmi8lNiJj8JJ59fPw=
To: Sahitya Tummala <stummala@codeaurora.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <1558694631-12481-1-git-send-email-stummala@codeaurora.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <6a4ce8cb-d9ec-1923-8304-6b8956283e85@kernel.org>
Date: Fri, 24 May 2019 20:13:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1558694631-12481-1-git-send-email-stummala@codeaurora.org>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hU95K-006Ry6-Aa
Subject: Re: [f2fs-dev] [PATCH] f2fs: add errors=panic mount option
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019-5-24 18:43, Sahitya Tummala wrote:
> Add errors=panic mount option for debugging purpose. It can be
> set dynamically when the config option CONFIG_F2FS_CHECK_FS
> is not enabled.

Sahitya,

I remember Yunlei has a similar patch for this, could you rebase your code on
that patch, if Yunlei agrees, we can add Signed-off of him.

FYI

https://sourceforge.net/p/linux-f2fs/mailman/linux-f2fs-devel/thread/f6a0b1c3-4057-8b64-a419-4b2914d48394%40kernel.org/#msg36376331

Thanks,

> 
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> ---
>  fs/f2fs/f2fs.h  |  9 +++++++--
>  fs/f2fs/super.c | 21 +++++++++++++++++++++
>  2 files changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9b3d997..95adedb 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -32,8 +32,12 @@
>  #define f2fs_bug_on(sbi, condition)					\
>  	do {								\
>  		if (unlikely(condition)) {				\
> -			WARN_ON(1);					\
> -			set_sbi_flag(sbi, SBI_NEED_FSCK);		\
> +			if (test_opt(sbi, ERRORS_PANIC)) {		\
> +				BUG_ON(condition);			\
> +			} else {					\
> +				WARN_ON(1);				\
> +				set_sbi_flag(sbi, SBI_NEED_FSCK);	\
> +			}						\
>  		}							\
>  	} while (0)
>  #endif
> @@ -99,6 +103,7 @@ struct f2fs_fault_info {
>  #define F2FS_MOUNT_INLINE_XATTR_SIZE	0x00800000
>  #define F2FS_MOUNT_RESERVE_ROOT		0x01000000
>  #define F2FS_MOUNT_DISABLE_CHECKPOINT	0x02000000
> +#define F2FS_MOUNT_ERRORS_PANIC		0x04000000
>  
>  #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
>  #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 912e261..7d6d96a 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -137,6 +137,7 @@ enum {
>  	Opt_fsync,
>  	Opt_test_dummy_encryption,
>  	Opt_checkpoint,
> +	Opt_errors,
>  	Opt_err,
>  };
>  
> @@ -196,6 +197,7 @@ enum {
>  	{Opt_fsync, "fsync_mode=%s"},
>  	{Opt_test_dummy_encryption, "test_dummy_encryption"},
>  	{Opt_checkpoint, "checkpoint=%s"},
> +	{Opt_errors, "errors=%s"},
>  	{Opt_err, NULL},
>  };
>  
> @@ -788,6 +790,23 @@ static int parse_options(struct super_block *sb, char *options)
>  			}
>  			kvfree(name);
>  			break;
> +		case Opt_errors:
> +#ifndef CONFIG_F2FS_CHECK_FS
> +			name = match_strdup(&args[0]);
> +			if (!name)
> +				return -ENOMEM;
> +
> +			if (strlen(name) == 5 && !strncmp(name, "panic", 5)) {
> +				set_opt(sbi, ERRORS_PANIC);
> +			} else {
> +				kvfree(name);
> +				return -EINVAL;
> +			}
> +			kvfree(name);
> +			f2fs_msg(sb, KERN_INFO,
> +				"debug mode errors=panic enabled\n");
> +#endif
> +			break;
>  		default:
>  			f2fs_msg(sb, KERN_ERR,
>  				"Unrecognized mount option \"%s\" or missing value",
> @@ -1417,6 +1436,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>  		seq_printf(seq, ",fsync_mode=%s", "strict");
>  	else if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_NOBARRIER)
>  		seq_printf(seq, ",fsync_mode=%s", "nobarrier");
> +	if (test_opt(sbi, ERRORS_PANIC))
> +		seq_printf(seq, ",errors=%s", "panic");
>  	return 0;
>  }
>  
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
