Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 849CCA9841D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Apr 2025 10:51:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u7VpB-0008Nj-SD;
	Wed, 23 Apr 2025 08:51:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u7VoP-0008MI-Ti
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Apr 2025 08:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DbGUNx2FmJNEmUalzOdB2aLS06lepVKxZWzvzeDklPs=; b=MMtCb/o2A+Az5l0/jxoHR1tD+6
 wcmng2bi6GDOErOiMmb3xwjL+YHJYGLv9vMQZi0M45ZJZMXogUUzp9RMr5yTF/qgsn+HmyCIsOJbC
 /Pe/YypMRxLQa7aSQYTGXHOZeQAQREWJMbeTnBJC5pr0AVEX7cATlx5iJ23PYEODpeIc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DbGUNx2FmJNEmUalzOdB2aLS06lepVKxZWzvzeDklPs=; b=Kstwvxj+nW3i3P+rR538USn0a9
 J/CdkPhvVTJPWqLL6v9U2mYie1KOgvEpCCXVdg48RG54KRIYsB7bkFXr+guGjiAtaeBNPQXBXLbbk
 SFCvb+toQrUtja4FyRqVBAgw88Al5g15znJJWAeSeI5pM0ClemLxDZ5RR+dnpcP5VMoM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u7Vnx-0002yN-5f for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Apr 2025 08:50:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A928B5C5F41;
 Wed, 23 Apr 2025 08:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99106C4CEE2;
 Wed, 23 Apr 2025 08:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745398199;
 bh=4zszpaiYY27dFluclG+Yse6bg/94yxXQ+mZgQjv8N7A=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=l+DoXT8SqoV1o9WeGu2MbRY0S8I6z3IutO46zrA2W4qS4LXOIwK4yEqUZCXJoBC+1
 oF74AVEbvd7OP4l/5EDXGKBmXAkfr9DRrXsLQ0qYphY2uo09gPtwDYTmKjQVyL7wog
 PleM+jDiqfT6hckTpbid0LGpNBC9JaOotDv8TaUjHGdboxWPBsgjIBCXpI2psV69JP
 KQ3W91wTrNNCviFeR6JiZ7ciPcWMXJZpANt63y96EY8LXAf/K4p14BnZHw1Z5k23jN
 FzjKv3aZ9jAXGhjWDd6M0io+nn34mJxQ5wvqz4hppF2TwHLf6bqh34OyxkYvFA8LsH
 zMkRsgt0qL87g==
Message-ID: <b68762b0-b003-4a0b-9f7e-09c1b7bd14eb@kernel.org>
Date: Wed, 23 Apr 2025 16:49:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250422191128.1346260-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20250422191128.1346260-1-daeho43@gmail.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/23/25 03:11,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > In cases of removing memory donation, we need to handle some error cases
 > like ENOENT and EACCES (indicating the r [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u7Vnx-0002yN-5f
Subject: Re: [f2fs-dev] [PATCH] f2fs: handle error cases of memory donation
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/23/25 03:11, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> In cases of removing memory donation, we need to handle some error cases
> like ENOENT and EACCES (indicating the range already has been donated).
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fs/f2fs/f2fs.h     |  1 +
>  fs/f2fs/file.c     | 21 ++++++++++++++-------
>  fs/f2fs/shrinker.c |  5 +++++
>  3 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index f1576dc6ec67..e4b39550f380 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -821,6 +821,7 @@ enum {
>  	FI_ATOMIC_DIRTIED,	/* indicate atomic file is dirtied */
>  	FI_ATOMIC_REPLACE,	/* indicate atomic replace */
>  	FI_OPENED_FILE,		/* indicate file has been opened */
> +	FI_PAGE_DONATED,	/* indicate pages of file has been donated */
>  	FI_MAX,			/* max flag, never be used */
>  };
>  
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index abbcbb5865a3..0807f8e97492 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2464,19 +2464,20 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
>  	return ret;
>  }
>  
> -static void f2fs_keep_noreuse_range(struct inode *inode,
> +static int f2fs_keep_noreuse_range(struct inode *inode,
>  				loff_t offset, loff_t len)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  	u64 max_bytes = F2FS_BLK_TO_BYTES(max_file_blocks(inode));
>  	u64 start, end;
> +	int ret = 0;
>  
>  	if (!S_ISREG(inode->i_mode))
> -		return;
> +		return 0;
>  
>  	if (offset >= max_bytes || len > max_bytes ||
>  	    (offset + len) > max_bytes)
> -		return;
> +		return 0;
>  
>  	start = offset >> PAGE_SHIFT;
>  	end = DIV_ROUND_UP(offset + len, PAGE_SIZE);
> @@ -2484,7 +2485,7 @@ static void f2fs_keep_noreuse_range(struct inode *inode,
>  	inode_lock(inode);
>  	if (f2fs_is_atomic_file(inode)) {
>  		inode_unlock(inode);
> -		return;
> +		return 0;
>  	}
>  
>  	spin_lock(&sbi->inode_lock[DONATE_INODE]);
> @@ -2493,7 +2494,10 @@ static void f2fs_keep_noreuse_range(struct inode *inode,
>  		if (!list_empty(&F2FS_I(inode)->gdonate_list)) {
>  			list_del_init(&F2FS_I(inode)->gdonate_list);
>  			sbi->donate_files--;
> -		}
> +			if (is_inode_flag_set(inode, FI_PAGE_DONATED))
> +				ret = -EACCES;

If caller has no enough permission, it will return EACCES as well, to avoid
conflict, what do you think of returning EALREADY? or use a wrapper of this
macro like EFSCORRUPTED?

Thanks,

> +		} else
> +			ret = -ENOENT;
>  	} else {
>  		if (list_empty(&F2FS_I(inode)->gdonate_list)) {
>  			list_add_tail(&F2FS_I(inode)->gdonate_list,
> @@ -2505,9 +2509,12 @@ static void f2fs_keep_noreuse_range(struct inode *inode,
>  		}
>  		F2FS_I(inode)->donate_start = start;
>  		F2FS_I(inode)->donate_end = end - 1;
> +		clear_inode_flag(inode, FI_PAGE_DONATED);
>  	}
>  	spin_unlock(&sbi->inode_lock[DONATE_INODE]);
>  	inode_unlock(inode);
> +
> +	return ret;
>  }
>  
>  static int f2fs_ioc_fitrim(struct file *filp, unsigned long arg)
> @@ -5236,8 +5243,8 @@ static int f2fs_file_fadvise(struct file *filp, loff_t offset, loff_t len,
>  	     f2fs_compressed_file(inode)))
>  		f2fs_invalidate_compress_pages(F2FS_I_SB(inode), inode->i_ino);
>  	else if (advice == POSIX_FADV_NOREUSE)
> -		f2fs_keep_noreuse_range(inode, offset, len);
> -	return 0;
> +		err = f2fs_keep_noreuse_range(inode, offset, len);
> +	return err;
>  }
>  
>  #ifdef CONFIG_COMPAT
> diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> index 9c8d3aee89af..1fa6619db40f 100644
> --- a/fs/f2fs/shrinker.c
> +++ b/fs/f2fs/shrinker.c
> @@ -186,8 +186,13 @@ static unsigned int do_reclaim_caches(struct f2fs_sb_info *sbi,
>  
>  		len = fi->donate_end - fi->donate_start + 1;
>  		npages = npages < len ? 0 : npages - len;
> +
> +		inode_lock(inode);
>  		invalidate_inode_pages2_range(inode->i_mapping,
>  					fi->donate_start, fi->donate_end);
> +		set_inode_flag(inode, FI_PAGE_DONATED);
> +		inode_unlock(inode);
> +
>  		iput(inode);
>  		cond_resched();
>  	}



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
