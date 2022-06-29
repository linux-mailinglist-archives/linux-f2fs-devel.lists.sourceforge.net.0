Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEA75605D5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jun 2022 18:30:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o6aaD-0005nK-2f; Wed, 29 Jun 2022 16:30:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1o6aaC-0005nD-8D
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Jun 2022 16:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BgA+7vaNISFZNgNHegF6n0jackTSA3tleXfpTUlAyaw=; b=IvsdyHmUoyeeEKgIA1kEud2C2n
 uIvomZtjt8KpFecslDZCUxwUmxAd4OUY7j4AV21z7OrpMReEhqD70yCo5oINb6T++ZSepSYTrkODi
 C9aoM3OClQcbVSKjRqcjdbNVX/92ejCMdN104Mkhz3cYIg/InCpEmBZx68yC9iQA5diA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BgA+7vaNISFZNgNHegF6n0jackTSA3tleXfpTUlAyaw=; b=EM61ZK53qTQt/UtFGtlGzMoWoN
 pnU7w1EZEUS/Hgk16fF0kjTGM0A+oyFe96F0n/yhWD1ccmdrpR05HOlJmFhNri7vf2FgiuST53Sf5
 qorvipXNHc89RDt8VcSJvHYxFbvu6+SUPMH+CGj5YuGVoSOKyNJr8FFA/l2RvHwpaePQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o6aa9-001S2A-Hp
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Jun 2022 16:30:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6064661CAC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Jun 2022 16:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA426C34114;
 Wed, 29 Jun 2022 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656520214;
 bh=Ty+fLcDrCUsxl2YZ2pxLl0PoHycLZyiCQ/QvpV3W9X0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rqis4yST0n3Rm594Q7375njijGRebK9yXVpUBqRMNOO0+Dm1EN18uHHYYF8vJ1bTY
 C0KfkndWMWRX9fYcN0Y8XcjmEgZ31WpB7oaTw/zdJydtX86ZrajGucVqDMUxrUZVvB
 ayisW+7Sb/mBzt/b7KOXNoUEDeY0fa5WFVHBZNVF2MbuUcv4H1aNVk2k3apuXaXwZn
 cFtVm93C2o70lOs6PA+QUyfnpqIuKC9lf/f0XJQ6W0ZCKaIdwzxJzpszNjiOtzNsyw
 mbNzkNOpYLToQ1IqM+fq8U7BDgD8o9/5XdppGQ18f5getWPzNaTdxVViur23ujKX7s
 8chhmLrnSc9eQ==
Date: Wed, 29 Jun 2022 09:30:13 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Yrx+FZpqIAvQdi4A@google.com>
References: <20220617223106.3517374-1-jaegeuk@kernel.org>
 <20220617223106.3517374-2-jaegeuk@kernel.org>
 <c45a9c8b-c73a-76bc-6725-5d7e48e7a3f2@kernel.org>
 <Yq+kiXPyBsXgdYb2@google.com>
 <27138a10-a6b2-edad-1985-687a95b9039b@kernel.org>
 <YrNKMDAgB1/vtoxi@google.com>
 <bba33935-1e5f-ccc4-9bbf-2ebf7d136bac@kernel.org>
 <YrtFtkD4FZ1ILzzI@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YrtFtkD4FZ1ILzzI@google.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 06/28, Jaegeuk Kim wrote: > On 06/28, Chao Yu wrote: >
 > On 2022/6/23 0:58, Jaegeuk Kim wrote: > > > On 06/22, Chao Yu wrote: > >
 > > On 2022/6/20 6:34, Jaegeuk Kim wrote: > > > > > On 06/19, Chao [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
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
X-Headers-End: 1o6aa9-001S2A-Hp
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs: run GCs synchronously given user
 requests
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

On 06/28, Jaegeuk Kim wrote:
> On 06/28, Chao Yu wrote:
> > On 2022/6/23 0:58, Jaegeuk Kim wrote:
> > > On 06/22, Chao Yu wrote:
> > > > On 2022/6/20 6:34, Jaegeuk Kim wrote:
> > > > > On 06/19, Chao Yu wrote:
> > > > > > On 2022/6/18 6:31, Jaegeuk Kim wrote:
> > > > > > > When users set GC_URGENT or GC_MID, they expected to do GCs right away.
> > > > > > > But, there's a condition to bypass it. Let's indicate we need to do now
> > > > > > > in the thread.
> > > > > > 
> > > > > > .should_migrate_blocks is used to force migrating blocks in full
> > > > > > section, so what is the condition here? GC should not never select
> > > > > > a full section, right?
> > > > > 
> > > > > I think it'll move a full section given .victim_segno is not NULL_SEGNO,
> > > > > as __get_victim will give a dirty segment all the time. wdyt?
> > > > 
> > > > However, in gc_thread_fun() victim_segno is NULL_SEGNO all the time.
> > > 
> > > What do you mean? The gc_thread thread sets NULL_SEGNO, which prevents
> > > from selecting the full section. But, f2fs_ioc_flush_device will set the
> > > segno to move, and f2fs_resize_fs calls do_garbage_collect directly.
> > 
> > Yes, but I didn't get why this patch updates .should_migrate_blocks for
> > gc_thread_func() case? If this is added to avoid breaking from below condition,
> > I guess it's not necessary, since victim selected from gc_thread_func() will
> > always be dirty, so get_valid_blocks(sbi, segno, true) == BLKS_PER_SEC(sbi)
> > will be false anyway? or am I missing something?
> 
> I lost the previous test. :( IIRC, once I set GC_URGENT_HIGH, I've seen that
> f2fs_gc couldn't migrate blocks quickly, even or never succeeded. And, I
> also suspected the below condition tho, if I give force_migrate, it
> simply worked. I just realized that that may be caused by large sections
> having non-2MB-aligned zone capacity. Will check it again, as I found
> some buggy flows in that case.

Let me drop this patch, since [1] series could fix the GC issue.

[1] https://lore.kernel.org/linux-f2fs-devel/20220628234733.3330502-1-jaegeuk@kernel.org/T/#t

> 
> > 
> > 		/*
> > 		 * stop BG_GC if there is not enough free sections.
> > 		 * Or, stop GC if the segment becomes fully valid caused by
> > 		 * race condition along with SSR block allocation.
> > 		 */
> > 		if ((gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0)) ||
> > 			(!force_migrate && get_valid_blocks(sbi, segno, true) ==
> > 							BLKS_PER_SEC(sbi)))
> > 			return submitted;
> > 
> > Thanks,
> > 
> > > 
> > > > 
> > > > I guess .should_migrate_blocks should only be set to true for
> > > > F2FS_IOC_FLUSH_DEVICE/F2FS_IOC_RESIZE_FS case? rather than GC_URGENT or GC_MID
> > > > case? See commit 7dede88659df ("f2fs: fix to allow migrating fully valid segment").
> > > > 
> > > > Thanks,
> > > > 
> > > > > 
> > > > > > 
> > > > > > Thanks,
> > > > > > 
> > > > > > > 
> > > > > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > > > > ---
> > > > > > >     fs/f2fs/gc.c | 8 ++++++--
> > > > > > >     1 file changed, 6 insertions(+), 2 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > > > > > > index d5fb426e0747..f4aa3c88118b 100644
> > > > > > > --- a/fs/f2fs/gc.c
> > > > > > > +++ b/fs/f2fs/gc.c
> > > > > > > @@ -37,7 +37,6 @@ static int gc_thread_func(void *data)
> > > > > > >     	unsigned int wait_ms;
> > > > > > >     	struct f2fs_gc_control gc_control = {
> > > > > > >     		.victim_segno = NULL_SEGNO,
> > > > > > > -		.should_migrate_blocks = false,
> > > > > > >     		.err_gc_skipped = false };
> > > > > > >     	wait_ms = gc_th->min_sleep_time;
> > > > > > > @@ -113,7 +112,10 @@ static int gc_thread_func(void *data)
> > > > > > >     				sbi->gc_mode == GC_URGENT_MID) {
> > > > > > >     			wait_ms = gc_th->urgent_sleep_time;
> > > > > > >     			f2fs_down_write(&sbi->gc_lock);
> > > > > > > +			gc_control.should_migrate_blocks = true;
> > > > > > >     			goto do_gc;
> > > > > > > +		} else {
> > > > > > > +			gc_control.should_migrate_blocks = false;
> > > > > > >     		}
> > > > > > >     		if (foreground) {
> > > > > > > @@ -139,7 +141,9 @@ static int gc_thread_func(void *data)
> > > > > > >     		if (!foreground)
> > > > > > >     			stat_inc_bggc_count(sbi->stat_info);
> > > > > > > -		sync_mode = F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC;
> > > > > > > +		sync_mode = F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC ||
> > > > > > > +				sbi->gc_mode == GC_URGENT_HIGH ||
> > > > > > > +				sbi->gc_mode == GC_URGENT_MID;
> > > > > > >     		/* foreground GC was been triggered via f2fs_balance_fs() */
> > > > > > >     		if (foreground)
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
