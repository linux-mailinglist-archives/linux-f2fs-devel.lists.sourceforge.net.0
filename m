Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E8F4008B2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  4 Sep 2021 02:17:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mMJNX-0007qC-F0; Sat, 04 Sep 2021 00:17:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1mMJNW-0007q6-Ut
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Sep 2021 00:17:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qm6LnOLB2wsiAM8E/PH4fLhPcFkVKfV7uvIiWOYfubE=; b=HgKD35fUorlccn2+wJTfpdUdkO
 cJQKXjtVmE/SI5p9o5K3iZtDflK/P9G/1E1tze2hGV2ll39JR886glezMZ+CS+uFPU8KDY+FxDbUG
 t2lBOZfLA+ikpDywAlWslYVC/6u8eHShDKteZPEXN4aqz721P3vILuNbfYMD8JUCU7fo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qm6LnOLB2wsiAM8E/PH4fLhPcFkVKfV7uvIiWOYfubE=; b=BAHiJ9ByaznDqTcb+2dMwEKwDN
 9hG3RAiC0T4LKC0D1w/lPjIhf59E84/etyXSEGufXAkv4L+QTE0gGAgaW1vZcKB3wHEE4Wjmt7lqp
 szPo/uIReQcMZkVehM0c/VH+ya9LR2S85PwIsWPesyUMtNqYdrtBhKm1ta9LxDjkngnU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mMJNT-0006Xj-2W
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Sep 2021 00:17:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76DFF6054F;
 Sat,  4 Sep 2021 00:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630714661;
 bh=quET8Z/GKIi9mENwz85QW773NwEuFV2QGtF8vHsporw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bc606Ci0WqDvKzpxPYRwUyvuw34Cra3rmseMnpuj/9i8ZC2uYvkSDeUdZeuSQWICB
 Gljtz44ekOKQ/yhM0jqt9E6tdMKT3Eh6dyCYpiRTUOVf79nngaCxqTBOGlImhTSGLE
 ZjPQFJ3PPWaQBU/2moS4EBZIvtKUmXhU89O23VEilmoSPYqcmA5IYsrgcJ/xsztwMU
 RFk5Zv598hQIuNVgaT0xJbyuRQGFd2Pn/xbaJDMw63xYvwWRSF4DN7m0UFPpuMjpUU
 /52dtFA/7jtUr4Dt4SGKqlC9Lfc4seE1ffjhrvVG8Q4Kdla6EWVranZwXyDScsIF0N
 MXz/jmJXqSc4Q==
Date: Fri, 3 Sep 2021 17:17:40 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YTK7JDnpc6+LNqsl@google.com>
References: <20210901080621.110319-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210901080621.110319-1-chao@kernel.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mMJNT-0006Xj-2W
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: avoid attaching SB_ACTIVE flag
 during mount
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
Cc: Zhang Yi <yi.zhang@huawei.com>, Chao Yu <chao.yu@linux.dev>,
 Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I remember this gave a regression before?

On 09/01, Chao Yu wrote:
> Quoted from [1]
> 
> "I do remember that I've added this code back then because otherwise
> orphan cleanup was losing updates to quota files. But you're right
> that now I don't see how that could be happening and it would be nice
> if we could get rid of this hack"
> 
> [1] https://lore.kernel.org/linux-ext4/99cce8ca-e4a0-7301-840f-2ace67c551f3@huawei.com/T/#m04990cfbc4f44592421736b504afcc346b2a7c00
> 
> Related fix in ext4 by
> commit 72ffb49a7b62 ("ext4: do not set SB_ACTIVE in ext4_orphan_cleanup()").
> 
> f2fs has the same hack implementation in
> - f2fs_recover_orphan_inodes()
> - f2fs_recover_fsync_data()
> 
> Let's get rid of this hack as well in f2fs.
> 
> Cc: Zhang Yi <yi.zhang@huawei.com>
> Cc: Jan Kara <jack@suse.cz>
> Acked-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - don't bother checkpoint disabling path
>  fs/f2fs/checkpoint.c | 3 ---
>  fs/f2fs/recovery.c   | 8 ++------
>  2 files changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 83e9bc0f91ff..7d8803a4cbc2 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -705,9 +705,6 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
>  	}
>  
>  #ifdef CONFIG_QUOTA
> -	/* Needed for iput() to work correctly and not trash data */
> -	sbi->sb->s_flags |= SB_ACTIVE;
> -
>  	/*
>  	 * Turn on quotas which were not enabled for read-only mounts if
>  	 * filesystem has quota feature, so that they are updated correctly.
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index 04655511d7f5..706ddb3c95c0 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -787,8 +787,6 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
>  	}
>  
>  #ifdef CONFIG_QUOTA
> -	/* Needed for iput() to work correctly and not trash data */
> -	sbi->sb->s_flags |= SB_ACTIVE;
>  	/* Turn on quotas so that they are updated correctly */
>  	quota_enabled = f2fs_enable_quota_files(sbi, s_flags & SB_RDONLY);
>  #endif
> @@ -816,10 +814,8 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
>  	err = recover_data(sbi, &inode_list, &tmp_inode_list, &dir_list);
>  	if (!err)
>  		f2fs_bug_on(sbi, !list_empty(&inode_list));
> -	else {
> -		/* restore s_flags to let iput() trash data */
> -		sbi->sb->s_flags = s_flags;
> -	}
> +	else
> +		f2fs_bug_on(sbi, sbi->sb->s_flags & SB_ACTIVE);
>  skip:
>  	fix_curseg_write_pointer = !check_only || list_empty(&inode_list);
>  
> -- 
> 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
