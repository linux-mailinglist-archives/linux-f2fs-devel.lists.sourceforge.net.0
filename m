Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB45821AD7A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 05:26:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtjg7-0003Lk-Ti; Fri, 10 Jul 2020 03:26:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jtjg7-0003Lc-8p
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 03:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EB42yh8nb7kWZUUAot+CAmJ6bjAXkP/CR6Yt7smC7MU=; b=RT4H2hOmclFX35g9WslVLhCjt2
 BkNtoOHp3kqH5HnXAzIC6uwPEM/EqDlA399hLfTd5rWRHyhRq3paXJjdNsLdT33D0uvIHwLJ/TOT4
 MsN67dajsjerZ85W4pHmCmlwsqOd8M68yKANYSAaNyrmmrLCzqDBzhHQG7eJRwfzWyvk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EB42yh8nb7kWZUUAot+CAmJ6bjAXkP/CR6Yt7smC7MU=; b=WcVIYO61GWNBKmAmUICujHGt1k
 Kued7FeMNGSZ1pQIRjl4LqxRXeOLznVPN91+CN6SucOpf363vdnyWfvnPGvQHTn5SvBWaQcL5Ki+y
 ccumDT+Avx9dCGaZLXNh1f95ziqfkw1zAFG5vV0kVhsR8w+07jx2HCcFZAFiiOgQBfJU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtjg6-00CojL-71
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 03:26:23 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BADC62065C;
 Fri, 10 Jul 2020 03:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594351576;
 bh=7gmNfMi/rLNIENPbSZx/x5H/MTRJkr2euZEuEvVPgUM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b9CaNGGMcFwZccyYv5fh7EOp8Y1iQNgL/U5aRlkn/hkKwXR6hDo5OEPj2dUz8ncyL
 O+yY0glchFxS3hl8voOv6GiuHIQt4DKSyDS5R3GBod4TnXRwZb954mpzTTR3E+Qf69
 V/qcV/+xeB2c3x7DypQ5D+xqTPX5ktJDR3L5+ypE=
Date: Thu, 9 Jul 2020 20:26:16 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200710032616.GC545837@google.com>
References: <20200709053027.351974-1-jaegeuk@kernel.org>
 <2f4207db-57d1-5b66-f1ee-3532feba5d1f@huawei.com>
 <20200709190545.GA3001066@google.com>
 <ae1a3e8a-6209-8d4b-7235-5c8897076501@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae1a3e8a-6209-8d4b-7235-5c8897076501@huawei.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtjg6-00CojL-71
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't skip writeback of quota data
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/10, Chao Yu wrote:
> On 2020/7/10 3:05, Jaegeuk Kim wrote:
> > On 07/09, Chao Yu wrote:
> >> On 2020/7/9 13:30, Jaegeuk Kim wrote:
> >>> It doesn't need to bypass flushing quota data in background.
> >>
> >> The condition is used to flush quota data in batch to avoid random
> >> small-sized udpate, did you hit any problem here?
> > 
> > I suspect this causes fault injection test being stuck by waiting for inode
> > writeback completion. With this patch, it has been running w/o any issue so far.
> > I keep an eye on this.
> 
> Hmmm.. so that this patch may not fix the root cause, and it may hiding the
> issue deeper.
> 
> How about just keeping this patch in our private branch to let fault injection
> test not be stuck? until we find the root cause in upstream codes.

Well, I don't think this hides something. When the issue happens, I saw inodes
being stuck due to writeback while only quota has some dirty data. At that time,
there was no dirty data page from other inodes.

More specifically, I suspect __writeback_inodes_sb_nr() gives WB_SYNC_NONE and
waits for wb_wait_for_completion().

> 
> Thanks,
> 
> > 
> > Thanks,
> > 
> >>
> >> Thanks,
> >>
> >>>
> >>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> >>> ---
> >>>  fs/f2fs/data.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> >>> index 44645f4f914b6..72e8b50e588c1 100644
> >>> --- a/fs/f2fs/data.c
> >>> +++ b/fs/f2fs/data.c
> >>> @@ -3148,7 +3148,7 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
> >>>  	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
> >>>  		goto skip_write;
> >>>  
> >>> -	if ((S_ISDIR(inode->i_mode) || IS_NOQUOTA(inode)) &&
> >>> +	if (S_ISDIR(inode->i_mode) &&
> >>>  			wbc->sync_mode == WB_SYNC_NONE &&
> >>>  			get_dirty_pages(inode) < nr_pages_to_skip(sbi, DATA) &&
> >>>  			f2fs_available_free_memory(sbi, DIRTY_DENTS))
> >>>
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
