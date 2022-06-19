Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B4D550D7E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jun 2022 00:35:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o33VV-0008VX-Bj; Sun, 19 Jun 2022 22:35:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1o33VT-0008VR-JZ
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 22:34:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QV17p0w9XgpqM9XxzcT/Vg72qk+RTqVv3P6avWx8VrI=; b=CCO2OjNvT4iNg4cHg+1L3CHhkY
 sYxLau8BeuoJcvEJ9VAtMIv79QwIIRBsGbySmTYHZsOeX+PycD4RhKokRVxci4KbawYtzSxtCvMGG
 m4gY+roTEH1+uLKtcpxqQDxr9NRhCpUkW5EHOIOSfh6iSXLO0jQUmaTeoIBapCiF4Wb4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QV17p0w9XgpqM9XxzcT/Vg72qk+RTqVv3P6avWx8VrI=; b=KBIvabnuFPQoZa37k26xU9fStq
 i8QsnuO3dQnjfgYno2g6MoF2IJgHPfGg0u5LfnNkSs7l41We5UbKFL9z22B4gnXaADVde3JNE/kUJ
 YfKXyw1hAoOahEgt7yfEH/P3EB6G9A5gCpR+9eHLAKX3sc0QvHVReTS7+fONOHtkQwqI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o33VQ-0007mc-AG
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 22:34:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4402B612CB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 19 Jun 2022 22:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 869F7C34114;
 Sun, 19 Jun 2022 22:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655678091;
 bh=9ArPk07pQBsppiwazyBIRWoKZ16tPzVNYnmugvt2wek=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cBHgnH5iwJizv1FllI2HR2uHHHwTN/1WXyI/GZAluzxj6MEDcxwqThk+5wEcG3zQS
 Xo/nMax4HzTPEGbAkvDfU4EJSFquqrfquyJ9BHyLjPiPOvRO6ZpDIDMEm/z/cmv5mk
 GYbbIHUlC1kCTWDXws3wbM9xsM4MLZ+i7b5Y5P3kafXaQjX4s/odKK0Woe5mxvrK4d
 VylKDGd67kXFeu6fj0GMj85O+r3f0GVJ6tGv8G1ghOMkynagU1/Wo9fTfmlvpbFYez
 seFETcNS+PMz3IzqUkS5ttS+Iu3GWfP5ywVA+rOLX2NCvZq59DR1XBXixz0SdwKrux
 drBkckbvAraFQ==
Date: Sun, 19 Jun 2022 15:34:49 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Yq+kiXPyBsXgdYb2@google.com>
References: <20220617223106.3517374-1-jaegeuk@kernel.org>
 <20220617223106.3517374-2-jaegeuk@kernel.org>
 <c45a9c8b-c73a-76bc-6725-5d7e48e7a3f2@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c45a9c8b-c73a-76bc-6725-5d7e48e7a3f2@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 06/19, Chao Yu wrote: > On 2022/6/18 6:31, Jaegeuk Kim
 wrote: > > When users set GC_URGENT or GC_MID, they expected to do GCs right
 away. > > But, there's a condition to bypass it. Let's indicate w [...] 
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
X-Headers-End: 1o33VQ-0007mc-AG
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

On 06/19, Chao Yu wrote:
> On 2022/6/18 6:31, Jaegeuk Kim wrote:
> > When users set GC_URGENT or GC_MID, they expected to do GCs right away.
> > But, there's a condition to bypass it. Let's indicate we need to do now
> > in the thread.
> 
> .should_migrate_blocks is used to force migrating blocks in full
> section, so what is the condition here? GC should not never select
> a full section, right?

I think it'll move a full section given .victim_segno is not NULL_SEGNO,
as __get_victim will give a dirty segment all the time. wdyt?

> 
> Thanks,
> 
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >   fs/f2fs/gc.c | 8 ++++++--
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > index d5fb426e0747..f4aa3c88118b 100644
> > --- a/fs/f2fs/gc.c
> > +++ b/fs/f2fs/gc.c
> > @@ -37,7 +37,6 @@ static int gc_thread_func(void *data)
> >   	unsigned int wait_ms;
> >   	struct f2fs_gc_control gc_control = {
> >   		.victim_segno = NULL_SEGNO,
> > -		.should_migrate_blocks = false,
> >   		.err_gc_skipped = false };
> >   	wait_ms = gc_th->min_sleep_time;
> > @@ -113,7 +112,10 @@ static int gc_thread_func(void *data)
> >   				sbi->gc_mode == GC_URGENT_MID) {
> >   			wait_ms = gc_th->urgent_sleep_time;
> >   			f2fs_down_write(&sbi->gc_lock);
> > +			gc_control.should_migrate_blocks = true;
> >   			goto do_gc;
> > +		} else {
> > +			gc_control.should_migrate_blocks = false;
> >   		}
> >   		if (foreground) {
> > @@ -139,7 +141,9 @@ static int gc_thread_func(void *data)
> >   		if (!foreground)
> >   			stat_inc_bggc_count(sbi->stat_info);
> > -		sync_mode = F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC;
> > +		sync_mode = F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC ||
> > +				sbi->gc_mode == GC_URGENT_HIGH ||
> > +				sbi->gc_mode == GC_URGENT_MID;
> >   		/* foreground GC was been triggered via f2fs_balance_fs() */
> >   		if (foreground)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
