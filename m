Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F76725800D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Aug 2020 20:02:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kCo81-0001h8-U3; Mon, 31 Aug 2020 18:02:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kCo80-0001h1-Dq
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 31 Aug 2020 18:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kp5ww4VqL24ANnO3OFYxBIfcajnl7ZtDJbUZD74rJ1g=; b=PlbVlRNNm3gLnzKn0vfyh3k4HW
 PQ0ULsCAAvAupxmSEys9dgWfyUC223so6wS2Dsxxj/Xf/2AuUjWm0PxaKtJ8E2hafJ6zw8lpxBzWM
 7KFjaJFno1X9jDRt4d4H3lWdGPmHsQAnDq8OUaESO/k/mnsOeqYkdVwaYeN365tVmXmU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Kp5ww4VqL24ANnO3OFYxBIfcajnl7ZtDJbUZD74rJ1g=; b=CcC5EzG9io/Qd9ZpKDS+xM9R/E
 Xf7KKzPe74CZT+rYyKAHjpCGNJ7RMuBTGuSRycOYNTq98EX1B0Lt28zjkH+3V0KDwPaiBX8ks3/lX
 FO+ZeX6iXFq5/v2cXlbBlrOyBdw5FFMyBCa528+pXg/cUBq8E20dQRqraNCNgGCPnNBE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kCo7p-00AtYA-AC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 31 Aug 2020 18:02:00 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B9F422083E;
 Mon, 31 Aug 2020 18:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598896903;
 bh=1BSfVGYPM5em9cDJnKj94QsfZf/L2qKC8T3By5pkXos=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rd9KwLFdgKeEZwSOUv3XU7M7Bf36F9tw2s05UxvyIusTaB5OJfPqVizaYVDFLkzav
 PFI2Be8gDLXplWNqHwMTZLZ30/l3fDp9dmuq/NRUp10+2WxsHRNAXwwA3lpF/P4Rz6
 6aOmsfuqQ/b5s0a9nI/oP/y9TOR3vpJhNzJiYh68=
Date: Mon, 31 Aug 2020 11:01:43 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200831180143.GB3665231@google.com>
References: <20200804131449.50517-1-yuchao0@huawei.com>
 <20200804131449.50517-6-yuchao0@huawei.com>
 <20200825193404.GA2614120@google.com>
 <7986af8c-1fe9-7140-f1c0-d8b4a58f702c@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7986af8c-1fe9-7140-f1c0-d8b4a58f702c@huawei.com>
X-Spam-Score: -0.5 (/)
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
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1kCo7p-00AtYA-AC
Subject: Re: [f2fs-dev] [PATCH v2 5/5] f2fs: support age threshold based
 garbage collection
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

Applied. Thanks.

On 08/31, Chao Yu wrote:
> Hi Jaegeuk,
> 
> I've changed code a bit to fix some bugs, including:
> - gc_idle = 3 (GC_IDLE_AT) description
> - disallow set gc_idle to 3 if atgc is off
> - keep compatibility with checkpoint disabling
> 
> Could you please check and merge below diff?
> 
> From: Chao Yu <yuchao0@huawei.com>
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs |  3 ++-
>  fs/f2fs/gc.c                            | 12 +++++++++++-
>  fs/f2fs/sysfs.c                         | 11 ++++++++---
>  3 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 7f730c4c8df2..834d0becae6d 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -22,7 +22,8 @@ Contact:	"Namjae Jeon" <namjae.jeon@samsung.com>
>  Description:	Controls the victim selection policy for garbage collection.
>  		Setting gc_idle = 0(default) will disable this option. Setting
>  		gc_idle = 1 will select the Cost Benefit approach & setting
> -		gc_idle = 2 will select the greedy approach.
> +		gc_idle = 2 will select the greedy approach & setting
> +		gc_idle = 3 will select the age-threshold based approach.
> 
>  What:		/sys/fs/f2fs/<disk>/reclaim_segments
>  Date:		October 2013
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 6413886e52d4..3c0edb8b4cc5 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -388,6 +388,16 @@ static void add_victim_entry(struct f2fs_sb_info *sbi,
>  	unsigned long long mtime = 0;
>  	unsigned int i;
> 
> +	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
> +		if (p->gc_mode == GC_AT &&
> +			get_valid_blocks(sbi, segno, true) == 0)
> +			return;
> +
> +		if (p->alloc_mode == AT_SSR &&
> +			get_seg_entry(sbi, segno)->ckpt_valid_blocks == 0)
> +			return;
> +	}
> +
>  	for (i = 0; i < sbi->segs_per_sec; i++)
>  		mtime += get_seg_entry(sbi, start + i)->mtime;
>  	mtime = div_u64(mtime, sbi->segs_per_sec);
> @@ -721,7 +731,7 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
>  		/* Don't touch checkpointed data */
>  		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
>  					get_ckpt_valid_blocks(sbi, segno) &&
> -					p.alloc_mode != SSR))
> +					p.alloc_mode == LFS))
>  			goto next;
>  		if (gc_type == BG_GC && test_bit(secno, dirty_i->victim_secmap))
>  			goto next;
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 88ed9969cc86..bacfa9c35e6b 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -375,12 +375,17 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  		return count;
>  	}
>  	if (!strcmp(a->attr.name, "gc_idle")) {
> -		if (t == GC_IDLE_CB)
> +		if (t == GC_IDLE_CB) {
>  			sbi->gc_mode = GC_IDLE_CB;
> -		else if (t == GC_IDLE_GREEDY)
> +		} else if (t == GC_IDLE_GREEDY) {
>  			sbi->gc_mode = GC_IDLE_GREEDY;
> -		else
> +		} else if (t == GC_IDLE_AT) {
> +			if (!sbi->am.atgc_enabled)
> +				return -EINVAL;
> +			sbi->gc_mode = GC_AT;
> +		} else {
>  			sbi->gc_mode = GC_NORMAL;
> +		}
>  		return count;
>  	}
> 
> -- 
> 2.26.2
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
