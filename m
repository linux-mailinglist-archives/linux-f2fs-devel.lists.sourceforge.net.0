Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4176F43A93D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Oct 2021 02:30:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mfALn-0005y2-Ie; Tue, 26 Oct 2021 00:29:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mfALl-0005xu-5y
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Oct 2021 00:29:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TSXpIWxvN8Mly4TKzLRg78YblyzeOv4PzpKd8ASS2sU=; b=i/+rGQzQc57/G7RLMMBy0W0tCM
 v7oMHojNmjaKrVMCfZIO9OCVvaNjmj+eO49Q8rlTdWY/hMPhiKatrh64n5cGGZWeYhxP3IvJu/iD7
 kbD/pmYUASuMQpcpynPHZTjyHR8l2U/lPpiwPZxcMxztNxZdvc7rz7grneNwqtQEAHy8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TSXpIWxvN8Mly4TKzLRg78YblyzeOv4PzpKd8ASS2sU=; b=GYxBtOR+RY31TuwLn+bwYPTNBH
 gjMCJZoZO7qm2y1OuFCXT0Ymwj3WCcMl/yP8pUvyI2QAbFmVfSqdU3cHWDlY5pbfQkpKJcO2sBSAh
 Mg7HgqHgZ1/qzH3ChuXYLVGLMJ6Ej6yiA+4xb6DRtn/GKDmbIuCk04aFgp2hIs29xzj8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mfALd-00GDyb-5q
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Oct 2021 00:29:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0ADB860F70;
 Tue, 26 Oct 2021 00:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635208183;
 bh=0VuQAw+HzRJDE4rYOLmbnEb/8SHoVt05musi8JpRMys=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AtixvkMlPYhYsZp2Bh18BV7qq5crjEYpwnryYnqqLY9TJ2I9vLJLjiXWeFVPZTphs
 LbWnq35jTqj9YBd1jTckCu5FgINIgv2ig/hA2f8nTAD3ab9t8IpA8Yce++BzOUt1ut
 6Xah/LAWU9sbcClyu+RJ9WzQXyb8X354agBMliTUHhZc6U9Yvq/JLDrEKhJNwpY+3Y
 LX7WhiYaAdE6p5wIfUNcdav0AmquQQoeN+WCD3g2s3NrlZpAT5SFSorSuUsoihbSMb
 /zj57D9Z89buL7OVeJ7AoDgW2aGA7y/O6tP6ahON1OG46V6xSsW2wfP8yTJGRtBWOu
 VGGKdBDQ/K+9Q==
Message-ID: <1a8748f4-c15d-361a-f57a-bdacc037314f@kernel.org>
Date: Tue, 26 Oct 2021 08:29:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Content-Language: en-US
To: Wang Xiaojun <wangxiaojun11@huawei.com>, jaegeuk@kernel.org
References: <20211025120931.1409835-1-wangxiaojun11@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211025120931.1409835-1-wangxiaojun11@huawei.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/10/25 20:09, Wang Xiaojun wrote: > If sbi->cur_cp
 is 2 and the duplicate_checkpoint function returns > in advance because
 sbi->cp_backuped
 is set to true, we cannot set > sbi->cur_cp to 1. Hmmm,
 in previous implementation, 
 what problem we will encounter, and what's the root cause? 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mfALd-00GDyb-5q
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: fix the wrong sbi->cur_cp setting
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/10/25 20:09, Wang Xiaojun wrote:
> If sbi->cur_cp is 2 and the duplicate_checkpoint function returns
> in advance because sbi->cp_backuped is set to true, we cannot set
> sbi->cur_cp to 1.

Hmmm, in previous implementation, what problem we will encounter, and
what's the root cause?

Thanks,

> 
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
> ---
>   fsck/fsck.c  | 3 ---
>   fsck/mount.c | 5 ++---
>   2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index 110c1ec..aa77a34 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -2383,9 +2383,6 @@ static void fix_checkpoints(struct f2fs_sb_info *sbi)
>   {
>   	/* copy valid checkpoint to its mirror position */
>   	duplicate_checkpoint(sbi);
> -
> -	/* repair checkpoint at CP #0 position */
> -	sbi->cur_cp = 1;
>   	fix_checkpoint(sbi);
>   }
>   
> diff --git a/fsck/mount.c b/fsck/mount.c
> index c928a15..295170e 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -2998,6 +2998,8 @@ void duplicate_checkpoint(struct f2fs_sb_info *sbi)
>   	ASSERT(ret >= 0);
>   
>   	sbi->cp_backuped = 1;
> +	/* repair checkpoint at CP #0 position */
> +	sbi->cur_cp = 1;
>   
>   	MSG(0, "Info: Duplicate valid checkpoint to mirror position "
>   		"%llu -> %llu\n", src, dst);
> @@ -3098,9 +3100,6 @@ void write_checkpoints(struct f2fs_sb_info *sbi)
>   {
>   	/* copy valid checkpoint to its mirror position */
>   	duplicate_checkpoint(sbi);
> -
> -	/* repair checkpoint at CP #0 position */
> -	sbi->cur_cp = 1;
>   	write_checkpoint(sbi);
>   }
>   
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
