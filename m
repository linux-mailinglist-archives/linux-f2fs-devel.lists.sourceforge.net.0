Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E315D2CCEFF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 07:12:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkhrB-0002vN-5k; Thu, 03 Dec 2020 06:12:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kkhm3-0002jd-Dh
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 06:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z92OVo44RqEr+pK+EWF4aEiJh9A7Ij2ah0rKWdjFbr0=; b=i3DVecu956iuNeBl7gfB3tIWHD
 MIlJFHc0s+Hj87yBh5o7w29hh5pjUdAYyqmXqT8lS3IU0g2Rh8ruN7waXApfMF21QPbrnVIaR4CJQ
 JwYbSi9NShf8QOMwnDJv++uj0rGBBjBm9TNbnmQExSla4kNpunwPiGt1gmvAudoYkZDw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z92OVo44RqEr+pK+EWF4aEiJh9A7Ij2ah0rKWdjFbr0=; b=QRmPRUVqw8Rvp2m+UtuHeR1w+4
 Tyoq75EiFd9FKXXxwiqc4s6XT/g9FFt6g1NTUTDYd5ABh5w9cJhxwhtJESznSJ3b0WiZihBLC7v5Z
 QF5+39W0wixxBgrUFwXVah31Adi1V/pVttYSTkNOUW09uaSJrR+QSu9vm30/ZRMT0Ik4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkhlt-00CjVJ-U5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 06:07:27 +0000
Date: Wed, 2 Dec 2020 22:07:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1606975625;
 bh=4kjEtMFrjeavxN2mKqcqGSsSXeUIsDMbjS/Wf+Mx0Pg=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=CNLKdNI9nav5vjFiwqpHfrqa7SXQ6v+4dePorn5Eg16hdtZTBTzPd+tYZWN3U9l44
 vZSmWU1IJVsGnGqIx8p87LRPDCxyE7BkqxfI21iqJjY8lDT1q0CV+3ZMFAiio9gPdC
 lwxr/vFiSI/xOanTRDPbsEQWC8RzrN5438XfqhvGtR2ol0GhOWTVFvdZKYaEzHTye1
 8h18Igg0otkF9koO/n1u1r6ZZ88Pc+1Z4Zjmh2hN5A6Tld/6gWbZ6b2WvFrk7GSnlf
 wBmycrI6GhoEXGUyAbi+Eh0MalQcEuLbLL740WeKgfZGxnhfOMD+4GOOt1zyc7wyGV
 ej9vku+173V2Q==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Message-ID: <X8iAh7quYw77O6XC@google.com>
References: <20201109170012.2129411-1-jaegeuk@kernel.org>
 <20201112053414.GB3826485@google.com>
 <20201112054051.GA4092972@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112054051.GA4092972@google.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kkhlt-00CjVJ-U5
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: avoid race condition for shinker
 count
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
Cc: Light Hsieh <Light.Hsieh@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/11, Jaegeuk Kim wrote:
> Light reported sometimes shinker gets nat_cnt < dirty_nat_cnt resulting in
> wrong do_shinker work. Let's avoid to get stale data by using nat_tree_lock.
> 
> Reported-by: Light Hsieh <Light.Hsieh@mediatek.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
> v3:
>  - fix to use NM_I(sbi)
> 
>  fs/f2fs/shrinker.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> index d66de5999a26..555712ba06d8 100644
> --- a/fs/f2fs/shrinker.c
> +++ b/fs/f2fs/shrinker.c
> @@ -18,7 +18,11 @@ static unsigned int shrinker_run_no;
>  
>  static unsigned long __count_nat_entries(struct f2fs_sb_info *sbi)
>  {
> -	long count = NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;
> +	long count;
> +
> +	down_read(&NM_I(sbi)->nat_tree_lock);
> +	count = NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;
> +	up_read(&NM_I(sbi)->nat_tree_lock);

I just fosund this can give kernel hang due to the following backtrace.
f2fs_shrink_count
shrink_slab
shrink_node
do_try_to_free_pages
try_to_free_pages
__alloc_pages_nodemask
alloc_pages_current
allocate_slab
__slab_alloc
__slab_alloc
kmem_cache_alloc
add_free_nid
f2fs_flush_nat_entries
f2fs_write_checkpoint

Let me just check like this.

From 971163330224449d90aac90957ea38f77d494f0f Mon Sep 17 00:00:00 2001
From: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 6 Nov 2020 13:22:05 -0800
Subject: [PATCH] f2fs: avoid race condition for shrinker count

Light reported sometimes shinker gets nat_cnt < dirty_nat_cnt resulting in
wrong do_shinker work. Let's avoid to return insane overflowed value.

Reported-by: Light Hsieh <Light.Hsieh@mediatek.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/shrinker.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index d66de5999a26..75b5b4aaed99 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -18,9 +18,9 @@ static unsigned int shrinker_run_no;
 
 static unsigned long __count_nat_entries(struct f2fs_sb_info *sbi)
 {
-	long count = NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;
-
-	return count > 0 ? count : 0;
+	if (NM_I(sbi)->nat_cnt > NM_I(sbi)->dirty_nat_cnt)
+		return NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;
+	return 0;
 }
 
 static unsigned long __count_free_nids(struct f2fs_sb_info *sbi)
-- 
2.29.2.454.gaff20da3a2-goog



>  
>  	return count > 0 ? count : 0;
>  }
> -- 
> 2.29.2.299.gdc1121823c-goog
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
