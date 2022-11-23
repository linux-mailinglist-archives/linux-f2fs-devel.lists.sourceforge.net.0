Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8076362F8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Nov 2022 16:12:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxrPz-0003Ce-R4;
	Wed, 23 Nov 2022 15:12:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oxrPy-0003CY-RD
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Nov 2022 15:12:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WKaWu0QlVZpwnezIERyZUUaBSqkMjhxDtcHczdKBQdo=; b=d13Z7slEMGGw4re9GXxkOCX3VV
 MJwSp6YKgOBFQgGK5nQ/LFJhCqvOlIU2QxZ+3EtTcXNgVosmCAiQvMVSTjgHhkGPoaGcGIMgtcCsJ
 XCP3noiiCUx0m1QaDuuQRM2w7KJ8B7CcRGlzLGQC2Lh/413wbyhqmYpvb15QaX200UYY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WKaWu0QlVZpwnezIERyZUUaBSqkMjhxDtcHczdKBQdo=; b=aSBlP+b2nKVLUtePIfqsreRmYK
 4ZvpYMH8SF3sJjVa0BJyPqgJjvA4YojmD/Z58r9bYRn516FrVvznU23HosWq+10tFaKkQkSBAT0nj
 GNjdcVRFV1Q7MwZ1K+zwk2+rSNIvfNxSeNl6X8noruP1lU/gJW16SBExpXiz4PwKTARI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oxrPw-0007YO-UG for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Nov 2022 15:12:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A61F61D70;
 Wed, 23 Nov 2022 15:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 950E7C433C1;
 Wed, 23 Nov 2022 15:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669216319;
 bh=E32LuTeewdv4LvRn43Fa4lz46cUSqIZ9KO69kapAzDQ=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=e1tBjLgkLI3ItIdUiZjmw+zk9GRtMBASep1CcRYCeSFQmcWN/gCX96cmqsfYSMXmk
 qvAtafUkufZK0T3ao79tZwW5k8C6EUMQ6RjciVOsKJohL7w6GblAzpB9kCG2IhgNO2
 /iyaRuT8ERmzp0qpsEmx9iAeZOV4wBkYgVrZBsw3NLPrWpuX2Nfn2RbEPeOde3gl0H
 V1uxNN8/EYTvsh9TtsNkfoFnP+SvkeYQIwpvnjbo2YZRj0AkRLKp+RCj822TKGHrer
 4YkC/8jc4LIGfa1d7/WSg4Oq56XDUrUG9qUF1A9pcCnaqQvg23h3LTgqRDrCQYvHIK
 aIO7mHe47R+TQ==
Message-ID: <c8145b2b-f8fa-9065-73dd-497c48a10a46@kernel.org>
Date: Wed, 23 Nov 2022 23:11:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221115184023.78070-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221115184023.78070-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/16 2:40,
 Yangtao Li wrote: > Some minor modifications
 to discard opt and related parameters: > > 1.introduce f2fs_is_readonly()
 and use it to simplify code > 2.The FLUSH_MERGE opt is set by [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oxrPw-0007YO-UG
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to set DISCARD opt
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/11/16 2:40, Yangtao Li wrote:
> Some minor modifications to discard opt and related parameters:
> 
>    1.introduce f2fs_is_readonly() and use it to simplify code
>    2.The FLUSH_MERGE opt is set by default only in non-ro mode.
>    3.When ro and DISCARD are set at the same time, an error is reported.
>    4.Display discard_unit mount opt when has discard opt.
>    5.clear DISCARD when remount as ro.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/f2fs.h  |  5 +++++
>   fs/f2fs/super.c | 53 +++++++++++++++++++++++++++----------------------
>   2 files changed, 34 insertions(+), 24 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index b89b5d755ce0..be23059344b4 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4579,4 +4579,9 @@ static inline void f2fs_handle_page_eio(struct f2fs_sb_info *sbi, pgoff_t ofs,
>   #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
>   #define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
>   
> +static inline bool f2fs_is_readonly(struct f2fs_sb_info *sbi)
> +{
> +	return !!f2fs_sb_has_readonly(sbi) || f2fs_readonly(sbi->sb);
> +}
> +
>   #endif /* _LINUX_F2FS_H */
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 75027ff85cd9..baa8f0860192 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1353,12 +1353,16 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   		return -EINVAL;
>   	}
>   
> -	if ((f2fs_sb_has_readonly(sbi) || f2fs_readonly(sbi->sb)) &&
> -		test_opt(sbi, FLUSH_MERGE)) {
> +	if (f2fs_is_readonly(sbi) && test_opt(sbi, FLUSH_MERGE)) {
>   		f2fs_err(sbi, "FLUSH_MERGE not compatible with readonly mode");
>   		return -EINVAL;
>   	}
>   
> +	if (f2fs_is_readonly(sbi) && test_opt(sbi, DISCARD)) {
> +		f2fs_err(sbi, "DISCARD not compatible with readonly mode");
> +		return -EINVAL;
> +	}

Well, it looks ext4 support mounting image w/ both discard and ro option.

And I guess for the case device is rw, and filesystem is ro, it may allow
filesystem itself issue command to trim device, and that won't break semantic
of readonly filesystem?

> +
>   	if (f2fs_sb_has_readonly(sbi) && !f2fs_readonly(sbi->sb)) {
>   		f2fs_err(sbi, "Allow to mount readonly mode only");
>   		return -EROFS;
> @@ -2035,12 +2039,14 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>   	if (test_opt(sbi, ATGC))
>   		seq_puts(seq, ",atgc");
>   
> -	if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_BLOCK)
> -		seq_printf(seq, ",discard_unit=%s", "block");
> -	else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
> -		seq_printf(seq, ",discard_unit=%s", "segment");
> -	else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SECTION)
> -		seq_printf(seq, ",discard_unit=%s", "section");
> +	if (test_opt(sbi, DISCARD)) {
> +		if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_BLOCK)
> +			seq_printf(seq, ",discard_unit=%s", "block");
> +		else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
> +			seq_printf(seq, ",discard_unit=%s", "segment");
> +		else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SECTION)
> +			seq_printf(seq, ",discard_unit=%s", "section");
> +	}
>   
>   	if (F2FS_OPTION(sbi).memory_mode == MEMORY_MODE_NORMAL)
>   		seq_printf(seq, ",memory=%s", "normal");
> @@ -2081,9 +2087,10 @@ static void default_options(struct f2fs_sb_info *sbi)
>   	set_opt(sbi, MERGE_CHECKPOINT);
>   	F2FS_OPTION(sbi).unusable_cap = 0;
>   	sbi->sb->s_flags |= SB_LAZYTIME;
> -	if (!f2fs_sb_has_readonly(sbi) && !f2fs_readonly(sbi->sb))
> +	if (!f2fs_is_readonly(sbi))
>   		set_opt(sbi, FLUSH_MERGE);
> -	if (f2fs_hw_support_discard(sbi) || f2fs_hw_should_discard(sbi))
> +	if ((f2fs_hw_support_discard(sbi) || f2fs_hw_should_discard(sbi)) &&
> +		!f2fs_is_readonly(sbi))
>   		set_opt(sbi, DISCARD);
>   	if (f2fs_sb_has_blkzoned(sbi)) {
>   		F2FS_OPTION(sbi).fs_mode = FS_MODE_LFS;
> @@ -2221,7 +2228,6 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   	bool enable_checkpoint = !test_opt(sbi, DISABLE_CHECKPOINT);
>   	bool no_io_align = !F2FS_IO_ALIGNED(sbi);
>   	bool no_atgc = !test_opt(sbi, ATGC);
> -	bool no_discard = !test_opt(sbi, DISCARD);
>   	bool no_compress_cache = !test_opt(sbi, COMPRESS_CACHE);
>   	bool block_unit_discard = f2fs_block_unit_discard(sbi);
>   	struct discard_cmd_control *dcc;
> @@ -2398,19 +2404,18 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   		need_stop_flush = true;
>   	}
>   
> -	if (no_discard == !!test_opt(sbi, DISCARD)) {
> -		if (test_opt(sbi, DISCARD)) {
> -			err = f2fs_start_discard_thread(sbi);
> -			if (err)
> -				goto restore_flush;
> -			need_stop_discard = true;
> -		} else {
> -			dcc = SM_I(sbi)->dcc_info;
> -			f2fs_stop_discard_thread(sbi);
> -			if (atomic_read(&dcc->discard_cmd_cnt))
> -				f2fs_issue_discard_timeout(sbi);
> -			need_restart_discard = true;
> -		}
> +	if ((*flags & SB_RDONLY) || !test_opt(sbi, DISCARD)) {
> +		clear_opt(sbi, DISCARD);
> +		dcc = SM_I(sbi)->dcc_info;
> +		f2fs_stop_discard_thread(sbi);
> +		if (atomic_read(&dcc->discard_cmd_cnt))
> +			f2fs_issue_discard_timeout(sbi);
> +		need_restart_discard = true;
> +	} else {
> +		err = f2fs_start_discard_thread(sbi);
> +		if (err)
> +			goto restore_flush;
> +		need_stop_discard = true;
>   	}
>   
>   	if (enable_checkpoint == !!test_opt(sbi, DISABLE_CHECKPOINT)) {


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
