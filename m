Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F97E6E1181
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Apr 2023 17:56:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmzJ7-0000i6-0I;
	Thu, 13 Apr 2023 15:56:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pmzJ5-0000i0-U7
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 15:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZKMymnsHzzvtAWJBhDLgE92UHvxzXWzQiZwEiEk6HMA=; b=YEujCQbbFYO4OrXKo+h28IprYr
 ggKjgBzTgZ/r85ReO7/Ex6CU7wf+kP+J9CHIjewTFd03Bs4EDYji6RAVYJTOhl8JZVh28LcrhyfBH
 3OW0LJyvMMG60vlVPmjBmJuog6RyjREpRJXLfA+AWaH0JHLRU3CAsqYTTOG3ePRFCR54=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZKMymnsHzzvtAWJBhDLgE92UHvxzXWzQiZwEiEk6HMA=; b=EVWEzfs1oi+Niv16WqVlzzAa+l
 Ub90VSDePAlI3WGFGiGRTqbPCus+GE03XsQPbq5rc5m2m6HXgMnw5rI5pafVtopMtYkDjH+FRwAXc
 Ls4VGSxbn+dMOUFfbk/EpkUc9piSPwhC5bBl/E6E5nZPydvNv2qexhKIio7Jp72+cwBQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmzJ3-0006e6-UL for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 15:56:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81D6C6166F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 13 Apr 2023 15:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBCC2C433D2;
 Thu, 13 Apr 2023 15:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681401371;
 bh=y9HpfTYL9kBGW9nfkCYmmN01yB0vDwslZmn1dH6LDMM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VqE64g/PJEYVfQcBGeksGFjuR3EvZPwS/EinIsxQcsfBM73rq4Th93YsTxznoEmnf
 su+xOrU4DV5cICXTolbQWoOAwqgq92uVM9rRpp9qc85CGr1GvPP8MB2pa38oZYJSiM
 4nq7qo3KWtCgIkcAEnVGiNB0BYJ0xADoEOfeqph8sSpbUEesLv3nvNzFFr0n6sB0Xo
 l1aQyofDq+4l6EQ41OMwLQA5vp8GeO6EGQleRwBOyjUToOGxk6vUrGOU6ExXT43YBo
 McGa8gRj5ByUvaiY7d8Of6dGOhApDw2cTXsxw2MVD7sS8CqJpiUFX69sFbQ5VShy8g
 yNaK7zq1A+69w==
Date: Thu, 13 Apr 2023 08:56:10 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZDgmGoWx2bHNO1zP@google.com>
References: <20230324071028.336982-1-chao@kernel.org>
 <ZCyZGgf4RSEjyHTF@google.com>
 <a4e49177-3959-eb2b-996c-5d07b7390495@kernel.org>
 <ZC2aA+i5+HpdJ6M2@google.com>
 <f4ae2b3a-0aff-8941-4081-9dc53334c590@kernel.org>
 <ZDSaCsLSYLyzUxBQ@google.com>
 <6c9abd05-297a-ea4f-fd5c-9f4d9fb488ab@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c9abd05-297a-ea4f-fd5c-9f4d9fb488ab@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/13, Chao Yu wrote: > On 2023/4/11 7:21, Jaegeuk Kim
 wrote: > > On 04/10, Chao Yu wrote: > > > On 2023/4/5 23:55, Jaegeuk Kim wrote:
 > > > > On 04/05, Chao Yu wrote: > > > > > On 2023/4/5 5:39, J [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pmzJ3-0006e6-UL
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to trigger a checkpoint in the end
 of foreground garbage collection
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

On 04/13, Chao Yu wrote:
> On 2023/4/11 7:21, Jaegeuk Kim wrote:
> > On 04/10, Chao Yu wrote:
> > > On 2023/4/5 23:55, Jaegeuk Kim wrote:
> > > > On 04/05, Chao Yu wrote:
> > > > > On 2023/4/5 5:39, Jaegeuk Kim wrote:
> > > > > > Can we do like this?
> > > > > > 
> > > > > >    From 9a58f0e59364241aa31b555cfe793d278e39b0dc Mon Sep 17 00:00:00 2001
> > > > > > From: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > > > Date: Tue, 4 Apr 2023 14:36:00 -0700
> > > > > > Subject: [PATCH] f2fs: do checkpoint when there's not enough free sections
> > > > > > 
> > > > > > We didn't do checkpoint in FG_GC case, which may cause losing to reclaim prefree
> > > > > > sctions in time.
> > > > > > 
> > > > > > Fixes: 6f8d4455060d ("f2fs: avoid fi->i_gc_rwsem[WRITE] lock in f2fs_gc")
> > > > > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > > > ---
> > > > > >     fs/f2fs/gc.c | 24 +++++++++++-------------
> > > > > >     1 file changed, 11 insertions(+), 13 deletions(-)
> > > > > > 
> > > > > > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > > > > > index 56c53dbe05c9..f1d0dd9c5a6c 100644
> > > > > > --- a/fs/f2fs/gc.c
> > > > > > +++ b/fs/f2fs/gc.c
> > > > > > @@ -1806,6 +1806,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
> > > > > >     	};
> > > > > >     	unsigned int skipped_round = 0, round = 0;
> > > > > >     	unsigned int upper_secs;
> > > > > > +	bool stop_gc = false;
> > > > > >     	trace_f2fs_gc_begin(sbi->sb, gc_type, gc_control->no_bg_gc,
> > > > > >     				gc_control->nr_free_secs,
> > > > > > @@ -1876,19 +1877,15 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
> > > > > >     				(gc_type == FG_GC) ? sec_freed : 0, 0)) {
> > > > > >     		if (gc_type == FG_GC && sec_freed < gc_control->nr_free_secs)
> > > > > >     			goto go_gc_more;
> > > > > > -		goto stop;
> > > > > > -	}
> > > > > > -
> > > > > > -	/* FG_GC stops GC by skip_count */
> > > > > > -	if (gc_type == FG_GC) {
> > > > > > +		stop_gc = true;
> > > > > 
> > > > > I guess below condition is for emergency recycle of prefree segments during
> > > > > foreground GC, in order to avoid exhausting free sections due to to many
> > > > > metadata allocation during CP.
> > > > > 
> > > > > 	if (free_sections(sbi) <= upper_secs + NR_GC_CHECKPOINT_SECS &&
> > > > > 				prefree_segments(sbi)) {
> > > > > 
> > > > > But for common case, free_sections() is close to reserved_segments(), and
> > > > > upper_secs + NR_GC_CHECKPOINT_SECS value may be far smaller than free_sections(),
> > > > > so checkpoint may not be trggered as expected, IIUC.
> > > > > 
> > > > > So it's fine to just trigger CP in the end of foreground garbage collection?
> > > > 
> > > > My major concern is to avoid unnecessary checkpointing given multiple FG_GC
> > > > requests were pending in parallel. And, I don't want to add so many combination
> > > > which gives so many corner cases, and feel f2fs_gc() needs to call checkpoint
> > > > automatically in the worst case scenario only.
> > > 
> > > Alright.
> > > 
> > > > 
> > > > By the way, do we just need to call checkpoint here including FG_GC as well?
> > > 
> > > I didn't get it, do you mean?
> > > 
> > > - f2fs_balance_fs()
> > >   - f2fs_gc() creates prefree segments but not call checkpoint to reclaim
> > > 
> > > - f2fs_balance_fs()
> > >   - f2fs_gc()
> > >    - detect prefree segments created by last f2fs_balance_fs, then call
> > > f2fs_write_checkpoint to reclaim
> > > 
> > > Or could you please provide a draft patch? :-P
> > 
> > Testing this.
> > 
> >  From ec5f37bbe33110257c04e0ec97a80b0111465b52 Mon Sep 17 00:00:00 2001
> > From: Jaegeuk Kim <jaegeuk@kernel.org>
> > Date: Mon, 10 Apr 2023 14:48:50 -0700
> > Subject: [PATCH] f2fs: refactor f2fs_gc to call checkpoint in urgent condition
> > 
> > The major change is to call checkpoint, if there's not enough space while having
> > some prefree segments in FG_GC case.
> 
> I found generic/269 will hang w/ this patch.

Yeah, I got 270 as well. I removed it in the tree first, and will check it out
later.

> 
> Thanks,
> 
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >   fs/f2fs/gc.c | 26 ++++++++++++--------------
> >   1 file changed, 12 insertions(+), 14 deletions(-)
> > 
> > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > index c748cdfb0501..0a823d2e8b9d 100644
> > --- a/fs/f2fs/gc.c
> > +++ b/fs/f2fs/gc.c
> > @@ -1829,7 +1829,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
> >   		goto stop;
> >   	}
> > -	if (gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0)) {
> > +	/* Let's run FG_GC, if we don't have enough space. */
> > +	if (has_not_enough_free_secs(sbi, 0, 0)) {
> > +		gc_type = FG_GC;
> > +
> >   		/*
> >   		 * For example, if there are many prefree_segments below given
> >   		 * threshold, we can make them free by checkpoint. Then, we
> > @@ -1840,8 +1843,6 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
> >   			if (ret)
> >   				goto stop;
> >   		}
> > -		if (has_not_enough_free_secs(sbi, 0, 0))
> > -			gc_type = FG_GC;
> >   	}
> >   	/* f2fs_balance_fs doesn't need to do BG_GC in critical path. */
> > @@ -1868,19 +1869,14 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
> >   	if (seg_freed == f2fs_usable_segs_in_sec(sbi, segno))
> >   		sec_freed++;
> > -	if (gc_type == FG_GC)
> > +	if (gc_type == FG_GC) {
> >   		sbi->cur_victim_sec = NULL_SEGNO;
> > -	if (gc_control->init_gc_type == FG_GC ||
> > -	    !has_not_enough_free_secs(sbi,
> > -				(gc_type == FG_GC) ? sec_freed : 0, 0)) {
> > -		if (gc_type == FG_GC && sec_freed < gc_control->nr_free_secs)
> > -			goto go_gc_more;
> > -		goto stop;
> > -	}
> > -
> > -	/* FG_GC stops GC by skip_count */
> > -	if (gc_type == FG_GC) {
> > +		if (!has_not_enough_free_secs(sbi, sec_freed, 0)) {
> > +			if (sec_freed < gc_control->nr_free_secs)
> > +				goto go_gc_more;
> > +			goto stop;
> > +		}
> >   		if (sbi->skipped_gc_rwsem)
> >   			skipped_round++;
> >   		round++;
> > @@ -1889,6 +1885,8 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
> >   			ret = f2fs_write_checkpoint(sbi, &cpc);
> >   			goto stop;
> >   		}
> > +	} else if (!has_not_enough_free_secs(sbi, 0, 0)) {
> > +		goto stop;
> >   	}
> >   	__get_secs_required(sbi, NULL, &upper_secs, NULL);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
