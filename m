Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3013F7F39
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Aug 2021 02:16:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mJ34M-0007jt-Ns; Thu, 26 Aug 2021 00:16:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mJ34E-0007jm-CM
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Aug 2021 00:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g07kk3xhnLUynCkv3h4HALjGXnyjiOEbpKz99JpYfoA=; b=DYwY4s8d5zS+8PJnbN3cHzL7n9
 oU1s9owR3GXFvsWnJYl2hcBPcyehGyAHJFuUb0oOraBVZDfdcG7cGFOlHXuoMrSv586j7rt1j41QY
 yEJ2N1ethShyvOcd9Box0Tlbg8Pn8gYhDwjwj2mftXygo1aTzC1087HG91jeqlnIv99Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g07kk3xhnLUynCkv3h4HALjGXnyjiOEbpKz99JpYfoA=; b=c0oFWLvSchM9OW9pzsA8GmWNNY
 thMJXz/avzmp5/hZt7/D7bwRMnyceR2B/RCA8E0cnEQmE2ncpM0J/fEabxhgCS9gKqIaguw3eStEq
 Y5IXxLZoaJ95w6fwOp+PiWN1VuFgQKdQC3qlnt/lxmYa300ZqJROnewCOltckI+e29mE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mJ34D-0005bD-14
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Aug 2021 00:16:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 35B3160F39;
 Thu, 26 Aug 2021 00:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629936973;
 bh=0ngJr9PpMHfpAYd6Uit3Fbbi1EtpGFDiQCW/shNirk4=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=GEDWdVTn1JAJ8v2Z18tJPMDEjntyAxEDV3AVH91IBl7pGNBI/QOBanw1L9MuRFtK1
 3D6uFqQPhI1DMTHsshtvydeo06QPKw8Nv+fdS329n29L9pq/aITwfwzDDyheyUL0S1
 mTQVtSMwD+Eey4MfcoG4t8JVJkzfV1gIXAqDPBTrBEIJKj4H3T/XqBM/WFpq68XnNU
 bhC8seMC1LcESlfooRJALK0br01Gnv7Q74DeQU0yvOkBTo9KQgf2S04Qapj7J9Jcsl
 olDzgeAlfpcPaNiFiHFI2FYXpa0yW5qLdsMTkQtAB1Kf0/C+exE/Zzy4vTDrwOu6ph
 4Yvxr3WZoziCw==
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210823170151.1434772-1-jaegeuk@kernel.org>
 <YSa3DPBIFZ5P17vt@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <bc9840f7-6fee-1ba4-ed82-b149f18934c9@kernel.org>
Date: Thu, 26 Aug 2021 08:16:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSa3DPBIFZ5P17vt@google.com>
Content-Language: en-US
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -2.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mJ34D-0005bD-14
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: don't ignore writing pages on fsync
 during checkpoint=disable
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/26 5:33, Jaegeuk Kim wrote:
> We must flush all the dirty data when enabling checkpoint back. Let's guarantee
> that first. In order to mitigate any failure, let's flush data in fsync as well
> during checkpoint=disable.

It needs to update comments a bit with respect to update part of v2?

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
> v2 from v1:
>   - handle sync_inodes_sb() failure
> 
>   fs/f2fs/file.c  |  5 ++---
>   fs/f2fs/super.c | 11 ++++++++++-
>   2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index cc2080866c54..3330efb41f22 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -263,8 +263,7 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
>   	};
>   	unsigned int seq_id = 0;
>   
> -	if (unlikely(f2fs_readonly(inode->i_sb) ||
> -				is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> +	if (unlikely(f2fs_readonly(inode->i_sb)))
>   		return 0;
>   
>   	trace_f2fs_sync_file_enter(inode);
> @@ -278,7 +277,7 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
>   	ret = file_write_and_wait_range(file, start, end);
>   	clear_inode_flag(inode, FI_NEED_IPU);
>   
> -	if (ret) {
> +	if (ret || is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
>   		trace_f2fs_sync_file_exit(inode, cp_reason, datasync, ret);
>   		return ret;
>   	}
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 49e153fd8183..d2f97dfb17af 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2088,8 +2088,17 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>   
>   static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
>   {
> +	int retry = DEFAULT_RETRY_IO_COUNT;
> +
>   	/* we should flush all the data to keep data consistency */
> -	sync_inodes_sb(sbi->sb);
> +	do {
> +		sync_inodes_sb(sbi->sb);
> +		cond_resched();
> +		congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
> +	} while (get_pages(sbi, F2FS_DIRTY_DATA) && retry--);
> +
> +	if (unlikely(!retry))

Well, if we break the loop due to retry-- == 0, value of retry will be -1 here.

So should be:

if (unlikely(retry < 0))

Thanks,

> +		f2fs_warn(sbi, "checkpoint=enable has some unwritten data.");
>   
>   	down_write(&sbi->gc_lock);
>   	f2fs_dirty_to_prefree(sbi);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
