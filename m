Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0396E163A83
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 03:49:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4FQh-0002fK-LB; Wed, 19 Feb 2020 02:49:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1j4FQg-0002fD-CS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 02:49:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gFv21cXMXjbvxLOv83YjhiTNKVBFCtfn4/N7BOSvaLI=; b=I+YwODep9uj2LSdePE2NHVS3L5
 hziD9r6saTw1gyzifG7kB7rX7XipqjN78R8IEvABhzxlHxZmJdGaeAl+YCzVbEKFwDhdCiOkyAtZi
 ERtePLkz5hpQYk6lf7gxTTWMsqGEqkpkDcVg9L1oB1hbzJ3zw3g8tqEN6hSlwFnLCDp4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gFv21cXMXjbvxLOv83YjhiTNKVBFCtfn4/N7BOSvaLI=; b=WMSsCDjF0kDIfEzp6xZJT86fGv
 DdqhA5UNg5A8pZLCIY4usY+8Ed3pT7jEoYLApVXF+GWdluJGIrh+cViJcMdpvLBXu8k7BYHX75Ij/
 j8xhf3tUlqSbdhLRbq34DrAgKtgBiq34mzJildkwQt3gR4MttaRcMtLw4hSyjve4m2N4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4FQc-00H9Bo-Dz
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 02:49:38 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 858F824654;
 Wed, 19 Feb 2020 02:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582080568;
 bh=pOEc9MEZ6T3vljY0q9joT1dIPADh7c/sUtPf/8kggMk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tkBphdEXciG/bwBiAOIIhSYPuMeHdIWO0uxMZpL3fzTZhoAR1aoCXZO/tH87u8s9U
 KPcA7GhWRjiysUMR0tEoGNPW/ip5Ngqm2Y0pywj2dgV8OA9GYlDt1gRcmo18BgvkWB
 Yij4dbl2lXpt1mvwI2Uo7AbpdKRdT54rsW7Hqq2k=
Date: Tue, 18 Feb 2020 18:49:28 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200219024928.GA96609@google.com>
References: <20200218102136.32150-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218102136.32150-1-yuchao0@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1j4FQc-00H9Bo-Dz
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: avoid __GFP_NOFAIL in
 f2fs_bio_alloc
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

On 02/18, Chao Yu wrote:
> __f2fs_bio_alloc() won't fail due to memory pool backend, remove unneeded
> __GFP_NOFAIL flag in __f2fs_bio_alloc().

It it safe for old kernels as well when thinking backports?

> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/data.c | 12 ++++--------
>  fs/f2fs/f2fs.h |  2 +-
>  2 files changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index baf12318ec64..3a4ece26928c 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -54,17 +54,13 @@ static inline struct bio *__f2fs_bio_alloc(gfp_t gfp_mask,
>  	return bio_alloc_bioset(gfp_mask, nr_iovecs, &f2fs_bioset);
>  }
>  
> -struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi, int npages, bool no_fail)
> +struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi, int npages, bool noio)
>  {
> -	struct bio *bio;
> -
> -	if (no_fail) {
> +	if (noio) {
>  		/* No failure on bio allocation */
> -		bio = __f2fs_bio_alloc(GFP_NOIO, npages);
> -		if (!bio)
> -			bio = __f2fs_bio_alloc(GFP_NOIO | __GFP_NOFAIL, npages);
> -		return bio;
> +		return __f2fs_bio_alloc(GFP_NOIO, npages);
>  	}
> +
>  	if (time_to_inject(sbi, FAULT_ALLOC_BIO)) {
>  		f2fs_show_injection_info(sbi, FAULT_ALLOC_BIO);
>  		return NULL;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 5316ac3eacdf..65f569949d42 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3343,7 +3343,7 @@ void f2fs_destroy_checkpoint_caches(void);
>   */
>  int __init f2fs_init_bioset(void);
>  void f2fs_destroy_bioset(void);
> -struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi, int npages, bool no_fail);
> +struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi, int npages, bool noio);
>  int f2fs_init_bio_entry_cache(void);
>  void f2fs_destroy_bio_entry_cache(void);
>  void f2fs_submit_bio(struct f2fs_sb_info *sbi,
> -- 
> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
