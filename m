Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7F674F5A9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Jul 2023 18:37:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qJGN4-0002yl-AP;
	Tue, 11 Jul 2023 16:37:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qJGMy-0002yZ-30
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Jul 2023 16:37:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/lAVWnhVY2YMWP444DXIzJwWbYqB1924lmDJqUSohmM=; b=iBTZ/Fawe/bdeLMT1bAyq2fgoK
 8mf7HxcXpa/Nlkwu5E4qW0RqAnhms+iJ4sxhMxSxU95ym8jI2k8NkDIze/dbz0tHyw8jT7nfQxc1R
 ABFBqnCisSFyyB7eVSkhf2v2QX1mTTnPGu38lizmaW2H4Rbdj+OFUHCg5YB2tluuq+2s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/lAVWnhVY2YMWP444DXIzJwWbYqB1924lmDJqUSohmM=; b=hsbUUxELUJ1ZCBkYP+AT7OCAei
 K/QYkqHUVxs3FCDqBP+NTsrT0OUQeDyN+N8nFsnHhbjFQi5XP7mR1yPnIc5gxHiYbIgLp7PUBCNlo
 5GW1knXgtmD4jL2hvR8lqLkZSKSOeo7/Bv1PQZGEo83zrKqf+vDFnZpgLGds9fVJ7PpE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qJGMx-004eb0-Ad for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Jul 2023 16:37:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E68ED61565;
 Tue, 11 Jul 2023 16:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C128C433C8;
 Tue, 11 Jul 2023 16:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689093457;
 bh=xwrQzJ2dPBefw8SrU0veV0e4RUL16gINKdqQOT1r1Os=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a9bSCGHQml4R4EP5ud3D0GZeI6wk0Hga7xZdCGrwoQrXbNJ+w+vRcBoIA4ahKznoA
 tEIXn6GB/xAMTeBatsy56IhSDzpWBAJ/vT/JMe4oIxwhYVm9b4U1WwL0V2wI+n5YiE
 AySCy+WAnNV/Z8JePQgKHYWm4PqLSIGDJFIK1kouLBl77mC4oHpRvdO+zPFMXd40Mk
 39U1mVgBytAYct5P2BkBc1c5rj5Qse2gEiKn9oDOrTa7Y1Lh0/NiLvhhYEwi8+bqyG
 qLTqvLa4g0LdBTel5b7SfrpeZUtuvxDt23wsgaX5lSgRHQVQL+gxhIKLKcFdFllq/Q
 TELULtaC2yuSg==
Date: Tue, 11 Jul 2023 09:37:35 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZK2FT9CUjxXvQ2K5@google.com>
References: <20230613203947.2745943-1-jaegeuk@kernel.org>
 <ZInmkgjDnAUD5Nk0@google.com>
 <50d5fa8c-4fe9-8a03-be78-0b5383e55b62@kernel.org>
 <ZKP6EJ5dZ4f4wScp@google.com>
 <65143701-4c19-ab66-1500-abd1162639cd@kernel.org>
 <ZKWovWZDiHjMavtB@google.com>
 <cadfb8d7-f5d0-a3ec-cafb-a0c06ad7d290@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cadfb8d7-f5d0-a3ec-cafb-a0c06ad7d290@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/06, Chao Yu wrote: > On 2023/7/6 1:30,
 Jaegeuk Kim wrote:
 > > On 07/04, Chao Yu wrote: > > > On 2023/7/4 18:53, Jaegeuk Kim wrote:
 > > > > On 07/03, Chao Yu wrote: > > > > > On 2023/6/15 0:10, J [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qJGMx-004eb0-Ad
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: do not issue small discard commands
 during checkpoint
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

On 07/06, Chao Yu wrote:
> On 2023/7/6 1:30, Jaegeuk Kim wrote:
> > On 07/04, Chao Yu wrote:
> > > On 2023/7/4 18:53, Jaegeuk Kim wrote:
> > > > On 07/03, Chao Yu wrote:
> > > > > On 2023/6/15 0:10, Jaegeuk Kim wrote:
> > > > > > If there're huge # of small discards, this will increase checkpoint latency
> > > > > > insanely. Let's issue small discards only by trim.
> > > > > > 
> > > > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > > > ---
> > > > > > 
> > > > > >     Change log from v1:
> > > > > >      - move the skip logic to avoid dangling objects
> > > > > > 
> > > > > >     fs/f2fs/segment.c | 2 +-
> > > > > >     1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > > > > > index 8c7af8b4fc47..0457d620011f 100644
> > > > > > --- a/fs/f2fs/segment.c
> > > > > > +++ b/fs/f2fs/segment.c
> > > > > > @@ -2193,7 +2193,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
> > > > > >     			len = next_pos - cur_pos;
> > > > > >     			if (f2fs_sb_has_blkzoned(sbi) ||
> > > > > > -			    (force && len < cpc->trim_minlen))
> > > > > > +					!force || len < cpc->trim_minlen)
> > > > > >     				goto skip;
> > > > > 
> > > > > Sorry for late reply.
> > > > > 
> > > > > We have a configuration for such case, what do you think of setting
> > > > > max_small_discards to zero? otherwise, w/ above change, max_small_discards
> > > > > logic may be broken?
> > > > > 
> > > > > What:           /sys/fs/f2fs/<disk>/max_small_discards
> > > > > Date:           November 2013
> > > > > Contact:        "Jaegeuk Kim" <jaegeuk.kim@samsung.com>
> > > > > Description:    Controls the issue rate of discard commands that consist of small
> > > > >                   blocks less than 2MB. The candidates to be discarded are cached until
> > > > >                   checkpoint is triggered, and issued during the checkpoint.
> > > > >                   By default, it is disabled with 0.
> > > > > 
> > > > > Or, if we prefer to disable small_discards by default, what about below change:
> > > > 
> > > > I think small_discards is fine, but need to avoid long checkpoint latency only.
> > > 
> > > I didn't get you, do you mean we can still issue small discard by
> > > fstrim, so small_discards functionality is fine?
> > 
> > You got the point.
> 
> Well, actually, what I mean is max_small_discards sysfs entry's functionality
> is broken. Now, the entry can not be used to control number of small discards
> committed by checkpoint.

Could you descrbie this problem first?

> 
> I think there is another way to achieve "avoid long checkpoint latency caused
> by committing huge # of small discards", the way is we can set max_small_discards
> to small value or zero, w/ such configuration, it will take checkpoint much less
> time or no time to committing small discard due to below control logic:
> 
> f2fs_flush_sit_entries()
> {
> ...
> 			if (!(cpc->reason & CP_DISCARD)) {
> 				cpc->trim_start = segno;
> 				add_discard_addrs(sbi, cpc, false);
> 			}
> ...
> }
> 
> add_discard_addrs()
> {
> ...
> 	while (force || SM_I(sbi)->dcc_info->nr_discards <=
> 				SM_I(sbi)->dcc_info->max_discards) {
> 
> It will break the loop once nr_discards is larger than max_discards, if
> max_discards is set to zero, checkpoint won't take time to handle small discards.
> 
> ...
> 		if (!de) {
> 			de = f2fs_kmem_cache_alloc(discard_entry_slab,
> 						GFP_F2FS_ZERO, true, NULL);
> 			de->start_blkaddr = START_BLOCK(sbi, cpc->trim_start);
> 			list_add_tail(&de->list, head);
> 		}
> ...
> 	}
> ...
> 
> Thanks,
> 
> > 
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > > 
> > > > >   From eb89d9b56e817e3046d7fa17165b12416f09d456 Mon Sep 17 00:00:00 2001
> > > > > From: Chao Yu <chao@kernel.org>
> > > > > Date: Mon, 3 Jul 2023 09:06:53 +0800
> > > > > Subject: [PATCH] Revert "f2fs: enable small discard by default"
> > > > > 
> > > > > This reverts commit d618ebaf0aa83d175658aea5291e0c459d471d39 in order
> > > > > to disable small discard by default, so that if there're huge number of
> > > > > small discards, it will decrease checkpoint's latency obviously.
> > > > > 
> > > > > Also, this patch reverts 9ac00e7cef10 ("f2fs: do not issue small discard
> > > > > commands during checkpoint"), due to it breaks small discard feature which
> > > > > may be configured via sysfs entry max_small_discards.
> > > > > 
> > > > > Fixes: 9ac00e7cef10 ("f2fs: do not issue small discard commands during checkpoint")
> > > > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > > > ---
> > > > >    fs/f2fs/segment.c | 4 ++--
> > > > >    1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > > > > index 14c822e5c9c9..0a313368f18b 100644
> > > > > --- a/fs/f2fs/segment.c
> > > > > +++ b/fs/f2fs/segment.c
> > > > > @@ -2193,7 +2193,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
> > > > >    			len = next_pos - cur_pos;
> > > > > 
> > > > >    			if (f2fs_sb_has_blkzoned(sbi) ||
> > > > > -					!force || len < cpc->trim_minlen)
> > > > > +			    (force && len < cpc->trim_minlen))
> > > > >    				goto skip;
> > > > > 
> > > > >    			f2fs_issue_discard(sbi, entry->start_blkaddr + cur_pos,
> > > > > @@ -2269,7 +2269,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
> > > > >    	atomic_set(&dcc->queued_discard, 0);
> > > > >    	atomic_set(&dcc->discard_cmd_cnt, 0);
> > > > >    	dcc->nr_discards = 0;
> > > > > -	dcc->max_discards = MAIN_SEGS(sbi) << sbi->log_blocks_per_seg;
> > > > > +	dcc->max_discards = 0;
> > > > >    	dcc->max_discard_request = DEF_MAX_DISCARD_REQUEST;
> > > > >    	dcc->min_discard_issue_time = DEF_MIN_DISCARD_ISSUE_TIME;
> > > > >    	dcc->mid_discard_issue_time = DEF_MID_DISCARD_ISSUE_TIME;
> > > > > -- 
> > > > > 2.40.1
> > > > > 
> > > > > 
> > > > > 
> > > > > >     			f2fs_issue_discard(sbi, entry->start_blkaddr + cur_pos,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
