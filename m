Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAA9869DE0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Feb 2024 18:38:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rf1PQ-0005J0-SJ;
	Tue, 27 Feb 2024 17:38:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rf1PN-0005Ir-L2
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 17:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t1QgWJQHAhRCHMdN/CPoekkaPk+OHaNc0WOHk/AWhqs=; b=Dcu9Ql/xPGdtnkzhkIrGkMuXz+
 z8Sg9OC2cjqgbpIGemNvGRQOGwcUI03omZd+lwD5xwJLgcjz9HFS9fL2mU33GwEPo48ISzAkjoy6g
 pcWObAhLc32MSM8ultlxbZAsC8M21HGB/Jri/U4K50Ed3TEWOheiB/D50q6gJtg+hqGo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t1QgWJQHAhRCHMdN/CPoekkaPk+OHaNc0WOHk/AWhqs=; b=UnRX/4/D5axkf+KrYPKhxw9CNq
 DdL+9ruAXMZ3p5UpEJi7XIdCuL/mgHa53byHSNu+HeYmLUAjObFVNjIBsqxdzF5nDTT5RoQUGQFeu
 GR97XtQyYBTauvjI7ZuJsgo5QoYAlWK6rI2R0nhXt5qxLjjfXux5kFvnFN/6AAjB4OgE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rf1PI-0006lG-6v for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 17:38:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5E3506135B;
 Tue, 27 Feb 2024 17:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3196C433C7;
 Tue, 27 Feb 2024 17:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709055488;
 bh=OUkQH6kfTzC+xEdUPZlVMTxWJ2toj17/yLTfx3I9lws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UNOlCtvo8H56c687FO1GErcA+BvxbXPtHAuGIIIZXgxGd8Vf1EIMyXDKg5jWWgLKL
 qp0X/uhaBebx4nJwl5/tKaYGRW+8tu6UfEq9H3sBaWTUkYXJOKtNQkN5+FD+LSYhnq
 UGU1Hrqk3dzXEw9iD0J492SEmvXgR/oYhbaSCMRiovDUzN4+BN6d9IZw5u2WIiIcZm
 EvoQvP5YZarOv5lR4Jfsr5DO0Nd1xYHzGhcXXM0tJcrNhiDI/80snNkph2aCRlsSyM
 j/EGSDp7rwU9X8Cz08e0S2egyXzzMw6xAUWDIfUnjObWtllVRVcHL3Qjya7iH3WbdH
 aV1fveHuS4i3w==
Date: Tue, 27 Feb 2024 09:38:06 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Message-ID: <Zd4d_qPiG-8-l1J2@google.com>
References: <bb8814a4-09e1-49b7-ab13-391624a0658c@moroto.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bb8814a4-09e1-49b7-ab13-391624a0658c@moroto.mountain>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, I merged two patches, which addresses this. f2fs: stop
 checkpoint when get a out-of-bounds segment f2fs: fix to don't call
 f2fs_stop_checkpoint in spinlock coverage 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rf1PI-0006lG-6v
Subject: Re: [f2fs-dev] [bug report] f2fs: stop checkpoint when get a
 out-of-bounds segment
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
Cc: zhiguo.niu@unisoc.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

I merged two patches, which addresses this.

f2fs: stop checkpoint when get a out-of-bounds segment
f2fs: fix to don't call f2fs_stop_checkpoint in spinlock coverage

On 02/27, Dan Carpenter wrote:
> Hello Zhiguo Niu,
> 
> The patch 7a0392932f97: "f2fs: stop checkpoint when get a
> out-of-bounds segment" from Feb 20, 2024 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	fs/f2fs/checkpoint.c:34 f2fs_stop_checkpoint()
> 	warn: sleeping in atomic context
> 
> fs/f2fs/segment.c
>   2650  static void get_new_segment(struct f2fs_sb_info *sbi,
>   2651                          unsigned int *newseg, bool new_sec, bool pinning)
>   2652  {
>   2653          struct free_segmap_info *free_i = FREE_I(sbi);
>   2654          unsigned int segno, secno, zoneno;
>   2655          unsigned int total_zones = MAIN_SECS(sbi) / sbi->secs_per_zone;
>   2656          unsigned int hint = GET_SEC_FROM_SEG(sbi, *newseg);
>   2657          unsigned int old_zoneno = GET_ZONE_FROM_SEG(sbi, *newseg);
>   2658          bool init = true;
>   2659          int i;
>   2660  
>   2661          spin_lock(&free_i->segmap_lock);
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> preempt disabled here
> 
>   2662  
>   2663          if (!new_sec && ((*newseg + 1) % SEGS_PER_SEC(sbi))) {
>   2664                  segno = find_next_zero_bit(free_i->free_segmap,
>   2665                          GET_SEG_FROM_SEC(sbi, hint + 1), *newseg + 1);
>   2666                  if (segno < GET_SEG_FROM_SEC(sbi, hint + 1))
>   2667                          goto got_it;
>   2668          }
>   2669  
>   2670          /*
>   2671           * If we format f2fs on zoned storage, let's try to get pinned sections
>   2672           * from beginning of the storage, which should be a conventional one.
>   2673           */
>   2674          if (f2fs_sb_has_blkzoned(sbi)) {
>   2675                  segno = pinning ? 0 : max(first_zoned_segno(sbi), *newseg);
>   2676                  hint = GET_SEC_FROM_SEG(sbi, segno);
>   2677          }
>   2678  
>   2679  find_other_zone:
>   2680          secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
>   2681          if (secno >= MAIN_SECS(sbi)) {
>   2682                  secno = find_first_zero_bit(free_i->free_secmap,
>   2683                                                          MAIN_SECS(sbi));
>   2684                  if (secno >= MAIN_SECS(sbi)) {
>   2685                          f2fs_stop_checkpoint(sbi, false,
>                                                           ^^^^^
> This false means we sleep while holding a spin lock.
> 
>   2686                                  STOP_CP_REASON_NO_SEGMENT);
>   2687                          f2fs_bug_on(sbi, 1);
>   2688                  }
>   2689          }
>   2690          segno = GET_SEG_FROM_SEC(sbi, secno);
>   2691          zoneno = GET_ZONE_FROM_SEC(sbi, secno);
> 
> fs/f2fs/checkpoint.c
>     29 void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
>     30                                                 unsigned char reason)
>     31 {
>     32         f2fs_build_fault_attr(sbi, 0, 0);
>     33         if (!end_io)
> --> 34                 f2fs_flush_merged_writes(sbi);
>     35         f2fs_handle_critical_error(sbi, reason, end_io);
>     36 }
> 
> regards,
> dan carpenter
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
