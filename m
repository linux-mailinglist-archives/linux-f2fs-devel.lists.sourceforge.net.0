Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CD66E5419
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Apr 2023 23:48:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1poWiM-0003VE-HE;
	Mon, 17 Apr 2023 21:48:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1poWiL-0003V8-GR
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Apr 2023 21:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+kgrDYngG6xXXPq9hry/bAFeoyaH0FEAkz9XRMLi+CE=; b=WlPyuiWDH805RGN6eLgIg3WxV+
 4pYaiKdD0nwFUf4mzqUGwaY/A+wuCcqcUNWLaiqcBgB7FdtarIpk3GTbwl/4CEgox/wRJHpnDN1Le
 ZtRyTQlupG8u7MgJwcouiJP/+Pdum6FgatOhyQh+rfPZkDF20orARJioEyisr8hjXSc4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+kgrDYngG6xXXPq9hry/bAFeoyaH0FEAkz9XRMLi+CE=; b=MQwz/R87pe+wQGX/Eayckrr8BT
 hEyYXOhmbm8em0d2QhLww/bvzTvWDu5ztwmeZHARCR+WC2u1zbHv4zCaWSBNgU4mVRMYujxmS5X3U
 bvzEh43BWI0HPCxDL2q8renUWmU7IiNmAYACHVzK5KNTzxxYk1oRsLnhvKQ8XmcQIFyc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1poWiJ-00Atu6-Ta for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Apr 2023 21:48:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 481F060B4E;
 Mon, 17 Apr 2023 21:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8F6C433D2;
 Mon, 17 Apr 2023 21:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681768114;
 bh=l7EKhS+MQ/bn6Fh8FhQoSl6PfJDZiTpsBuhVXODfHTw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HO5J4O3/zDpAssc+h9vDa2NDUxJRHqstSxmYnho8aWwD2x73VDe0U/hSGc0oc6Bxh
 ALQdAvtIA1dM9ZKEZlLaXisY+jHnKD73WfW+366kjJ7W7DJqt/9KtZuf5xd3uXHVaj
 Ujafxiaaph64bwrVKN+T0RkKTLqYNuC05H5nrGIB4BVcgkeb69x9ezgVvLIBAaWOdA
 8FHvAhhg07coJHZ9OwI4+becFOGmZ2dST0k4dAfrcR0dOosuZlxNuYteq+tbelZtEh
 KkaR24OIJQ3f4aq80pDoGpSFvnGGQ11PDCEhWF2PwzCAM2kA3VWtc3lhw/2GJLVvcf
 DDfPzo8vqhOVQ==
Date: Mon, 17 Apr 2023 14:48:32 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yonggil Song <yonggil.song@samsung.com>
Message-ID: <ZD2+sJcf3NALjEDC@google.com>
References: <20230414035146.1381029-1-chao@kernel.org>
 <CGME20230414035331epcas2p2bdf8280ca5eb9a5050dd2cc5dfff0f14@epcms2p2>
 <20230417030715epcms2p23a6154070f7140a5ae49c6e07114b88e@epcms2p2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230417030715epcms2p23a6154070f7140a5ae49c6e07114b88e@epcms2p2>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/17, Yonggil Song wrote: > >Fixed a xfstests failure.
 > > > >From 400c722c2117660b83190c88e5442d63fbbffe6e Mon Sep 17 00:00:00
 2001 > >From: Jaegeuk Kim <jaegeuk@kernel.org> > >Date: Mon, 10 Apr [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1poWiJ-00Atu6-Ta
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: support checkpoint command
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/17, Yonggil Song wrote:
> >Fixed a xfstests failure.
> >
> >From 400c722c2117660b83190c88e5442d63fbbffe6e Mon Sep 17 00:00:00 2001
> >From: Jaegeuk Kim <jaegeuk@kernel.org>
> >Date: Mon, 10 Apr 2023 14:48:50 -0700
> >Subject: [PATCH] f2fs: refactor f2fs_gc to call checkpoint in urgent condition
> >
> >The major change is to call checkpoint, if there's not enough space while having
> >some prefree segments in FG_GC case.
> >
> >Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> >---
> > fs/f2fs/gc.c | 27 +++++++++++++--------------
> > 1 file changed, 13 insertions(+), 14 deletions(-)
> >
> >diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> >index c748cdfb0501..ba5775dcade6 100644
> >--- a/fs/f2fs/gc.c
> >+++ b/fs/f2fs/gc.c
> >@@ -1829,7 +1829,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
> > 		goto stop;
> > 	}
> > 
> >-	if (gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0)) {
> >+	/* Let's run FG_GC, if we don't have enough space. */
> >+	if (has_not_enough_free_secs(sbi, 0, 0)) {
> >+		gc_type = FG_GC;
> >+
> 
> Hi, Jaegeuk & Chao
> 
> Would it be possible to clarify if this patch is intended to perform checkpoint every gc round?

Intention is to trigger checkpoint when there's not enough free space. So, it's
not for every gc round.

> 
> Thanks.
> 
> > 		/*
> > 		 * For example, if there are many prefree_segments below given
> > 		 * threshold, we can make them free by checkpoint. Then, we
> >@@ -1840,8 +1843,6 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
> > 			if (ret)
> > 				goto stop;
> > 		}
> >-		if (has_not_enough_free_secs(sbi, 0, 0))
> >-			gc_type = FG_GC;
> > 	}
> > 
> > 	/* f2fs_balance_fs doesn't need to do BG_GC in critical path. */
> >@@ -1868,19 +1869,15 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
> > 	if (seg_freed == f2fs_usable_segs_in_sec(sbi, segno))
> > 		sec_freed++;
> > 
> >-	if (gc_type == FG_GC)
> >+	if (gc_type == FG_GC) {
> > 		sbi->cur_victim_sec = NULL_SEGNO;
> > 
> >-	if (gc_control->init_gc_type == FG_GC ||
> >-	    !has_not_enough_free_secs(sbi,
> >-				(gc_type == FG_GC) ? sec_freed : 0, 0)) {
> >-		if (gc_type == FG_GC && sec_freed < gc_control->nr_free_secs)
> >-			goto go_gc_more;
> >-		goto stop;
> >-	}
> >-
> >-	/* FG_GC stops GC by skip_count */
> >-	if (gc_type == FG_GC) {
> >+		if (!has_not_enough_free_secs(sbi, sec_freed, 0)) {
> >+			if (!gc_control->no_bg_gc &&
> >+			    sec_freed < gc_control->nr_free_secs)
> >+				goto go_gc_more;
> >+			goto stop;
> >+		}
> > 		if (sbi->skipped_gc_rwsem)
> > 			skipped_round++;
> > 		round++;
> >@@ -1889,6 +1886,8 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
> > 			ret = f2fs_write_checkpoint(sbi, &cpc);
> > 			goto stop;
> > 		}
> >+	} else if (!has_not_enough_free_secs(sbi, 0, 0)) {
> >+		goto stop;
> > 	}
> > 
> > 	__get_secs_required(sbi, NULL, &upper_secs, NULL);
> >-- 
> >2.40.0.634.g4ca3ef3211-goog
> >
> >
> >
> >_______________________________________________
> >Linux-f2fs-devel mailing list
> >Linux-f2fs-devel@lists.sourceforge.net
> >https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
