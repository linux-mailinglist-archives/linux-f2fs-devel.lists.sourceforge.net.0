Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A71105256D6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 May 2022 23:05:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npFzx-0002x0-2t; Thu, 12 May 2022 21:05:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1npFzv-0002wq-P1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 21:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MvaPs9PPRCso8Cyng3QtD4BXa4xGVjaWFJf9Wff7L5M=; b=GK17nJi2s3AdQJ+o261th+RW91
 ugzakOLJ8yQHfVOqdAcSiqnUPh+DfIrUlCnaxQs9y8qkq1/2jiQ+P52pRWaO1N6neoGwE8mm4vkoj
 oXpGt3M7Pi/yvmxnj6ODDRgKIckwVMbw8nelsFkSjNJE3dRNgehjPK8G4XFn4TbYTqU0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MvaPs9PPRCso8Cyng3QtD4BXa4xGVjaWFJf9Wff7L5M=; b=FyxMh27KogVNt8KUSsF2UPtUo2
 3gZDbeAFbSwuuv7u/8nh5xN6B+p/vU8ZRW8dhpjj4mSaytq8zyHjdyVKwZc1Xx1KBKn581lNCUYw0
 2BL1soAVPEo1vqmsragZ78gkACiDCZXVffEO3tmfVb9zy4XA/5HBPWYw/a8dMGwQMT9E=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npFzt-0006vr-6f
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 21:05:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AA29FB8290E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 May 2022 21:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F39C385B8;
 Thu, 12 May 2022 21:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652389510;
 bh=8b8yIycXYuwnaJ406/9sz6HbsqXEqBJ0DuflynEfHaA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=of152Ns5DycT3vO6iszfj6AWOFGbEbDPjkhrOYNdImgrcMooMjA4MvdWcDG6Y/PM1
 Tm5f0kPtcl5UtZY40pcVAtSo69hcG4DuUnkFb/8s1FRGOPInWaxrp3Ed/2tr5YycR7
 /oMvQM1VEZX/i2o9ebq1wkLyRE6PHLU4njRcAPxmF+yuVijvjyEkajceNCXPnQVCxj
 rYmH/DgoneaW61+a4Dko/g0QHVLPmqT9KZwjqwqYANzRHzzPdu/s6vGil0UwP5mL8a
 asRonNPdJZsAEs4Sncc/cx7P+bJlI6ktJglh6Y2J8Dj+FFxCALm1WvJaTgjikHU3r8
 u4gcRx2NJSo7Q==
Date: Thu, 12 May 2022 14:05:08 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Yn12hPhKOqWNGpdM@google.com>
References: <20220506232032.1264078-1-jaegeuk@kernel.org>
 <20220506232032.1264078-4-jaegeuk@kernel.org>
 <77e870dd-fd7a-f58e-79fb-d0e5b8fbfc16@kernel.org>
 <YnlHdgHix+3qlc1a@google.com>
 <42c23c83-1914-e8dd-c765-df3d6d872532@kernel.org>
 <Ynvoszmp7+64NdZg@google.com>
 <ab569309-f639-33af-ebb3-909a02158d02@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab569309-f639-33af-ebb3-909a02158d02@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/12, Chao Yu wrote: > On 2022/5/12 0:47, Jaegeuk Kim
 wrote: > > > > > > @@ -147,6 +147,7 @@ static int gc_thread_func(void *data)
 > > > > > > gc_control.init_gc_type = sync_mode ? FG_GC : BG_GC; [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1npFzt-0006vr-6f
Subject: Re: [f2fs-dev] [PATCH 4/5] f2fs: do not stop GC when requiring a
 free section
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

On 05/12, Chao Yu wrote:
> On 2022/5/12 0:47, Jaegeuk Kim wrote:
> > > > > > @@ -147,6 +147,7 @@ static int gc_thread_func(void *data)
> > > > > >     		gc_control.init_gc_type = sync_mode ? FG_GC : BG_GC;
> > > > > >     		gc_control.no_bg_gc = foreground;
> > > > > > +		gc_control.nr_free_secs = foreground ? 1 : 0;
> 
> [snip]
> 
> > 
> > I mean gc_control->nr_free_secs should be 0.
> 
> [snip]
> 
> > > > > > @@ -528,7 +528,8 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
> > > > > >     				.init_gc_type = BG_GC,
> > > > > >     				.no_bg_gc = true,
> > > > > >     				.should_migrate_blocks = false,
> > > > > > -				.err_gc_skipped = false };
> > > > > > +				.err_gc_skipped = false,
> > > > > > +				.nr_free_secs = 1 };
> 
> Oh, so, in above two paths, when .nr_free_secs is 1, no_bg_gc should be true
> to keep skipping BG_GC flow.
> 
> How about adding a check condition in f2fs_gc() to avoid invalid argument
> usage in future?

Sent out v2. Could you please check?

> 
> From: Chao Yu <chao@kernel.org>
> 
> ---
>  fs/f2fs/gc.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 385282017317..a98276fd3cc1 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1799,10 +1799,19 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>  			gc_type = FG_GC;
>  	}
> 
> -	/* f2fs_balance_fs doesn't need to do BG_GC in critical path. */
> -	if (gc_type == BG_GC && gc_control->no_bg_gc) {
> -		ret = -EINVAL;
> -		goto stop;
> +	if (gc_type == BG_GC) {
> +		/* f2fs_balance_fs doesn't need to do BG_GC in critical path. */
> +		if (gc_control->no_bg_gc) {
> +			ret = -EINVAL;
> +			goto stop;
> +		}
> +		/*
> +		 * BG_GC never guarantee that blocks are migrated synchronously.
> +		 */
> +		if (gc_control->nr_free_secs) {
> +			ret = -EINVAL;
> +			goto stop;
> +		}
>  	}
>  retry:
>  	ret = __get_victim(sbi, &segno, gc_type);
> -- 
> 2.25.1
> 
> 
> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
