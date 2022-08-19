Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EE359A977
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Aug 2022 01:35:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oPBW2-0005JM-QE;
	Fri, 19 Aug 2022 23:35:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oPBW1-0005JD-O2
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Aug 2022 23:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m+r/M+4GAAaG5DDN8rq+0XD94RrIl43ntQ+/u44PZMA=; b=F4DLowBaE7qR6zraNt0H0SNzlA
 iskYCtORDlpU1gsstpFUpHoyX2gLAYR7Xm7OhK/c5LBUgQxVbX7omLRYjkf0zOfrzsot3oV9w6IIt
 bVyu0IYoqvpLp0za/ke/FwBtXV2mY10sVrnKX3Vp9GDme7G8gonulnQnzD23plt0S3AU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m+r/M+4GAAaG5DDN8rq+0XD94RrIl43ntQ+/u44PZMA=; b=dgm9zBAN7DCyoohtKM1RnvT4Xu
 ndRRNelASLudoMff+2u07G6KfQmP3HQXc2pvfsaofFSWlgZSAgfM4M1AjsLjWS71RtHgwOGuTNhJg
 6pFEkFxvo/oOqSwgB0ctMRlqWrMKFzzEVDq4a0cdS4LThVY2u6mtwscpYs+OmiKv0/yE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oPBVx-009ufe-E4 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Aug 2022 23:35:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 33872B829A6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 19 Aug 2022 23:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB439C433C1;
 Fri, 19 Aug 2022 23:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660952090;
 bh=5ezpqGMtjmIlcfSdKrdvj+9d1jz13XFCn3MQZJe3L2g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tIGK5iXthVEYiYngzWv9PQqoBnaTG2nDj/qhANbOUd4j19y0mree68y0HdkN6cJ0o
 4+rUAuS+E1IMutJyM/UHNGy7TNQHeo6MIB0TPq8NdYzn1jmbtREOeNP2QiaxqZ3EvN
 paNBVrHegaFvjRNojs4n/anzpesbyRpmuuaK1LYWgynBqYZBmlfsBH8U1UaR1ij8/s
 n9A6VTQpuyHu7XKPdIY3p+tt1GRyJ5ycPc6ryAHwbiD1jafKiBLxIdReavl+ADBQa/
 QfOpcBRw2CmNztTxrU3otHh2e9T91WpUw2fgRq/c/4WU8qoui+MXLrPnEQpXVsQVpb
 t8SJPiheooVLw==
Date: Fri, 19 Aug 2022 16:34:48 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YwAeGIszLrcNqNbE@google.com>
References: <20220813143709.11909-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220813143709.11909-1-jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We should decrease the frozen counter. Cc: stable@kernel.org
 Fixes: 325163e9892b ("f2fs: add gc_urgent_high_remaining sysfs node")
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- Change log from v1: - fix by refactoring
 the flow 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oPBVx-009ufe-E4
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix wrong continue condition in GC
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
Cc: stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We should decrease the frozen counter.

Cc: stable@kernel.org
Fixes: 325163e9892b ("f2fs: add gc_urgent_high_remaining sysfs node")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

Change log from v1:
 - fix by refactoring the flow

 fs/f2fs/gc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 6da21d405ce1..45f90e3c46d4 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -97,14 +97,10 @@ static int gc_thread_func(void *data)
 		 */
 		if (sbi->gc_mode == GC_URGENT_HIGH) {
 			spin_lock(&sbi->gc_urgent_high_lock);
-			if (sbi->gc_urgent_high_limited) {
-				if (!sbi->gc_urgent_high_remaining) {
-					sbi->gc_urgent_high_limited = false;
-					spin_unlock(&sbi->gc_urgent_high_lock);
-					sbi->gc_mode = GC_NORMAL;
-					continue;
-				}
-				sbi->gc_urgent_high_remaining--;
+			if (sbi->gc_urgent_high_limited &&
+					!sbi->gc_urgent_high_remaining--) {
+				sbi->gc_urgent_high_limited = false;
+				sbi->gc_mode = GC_NORMAL;
 			}
 			spin_unlock(&sbi->gc_urgent_high_lock);
 		}
-- 
2.37.1.595.g718a3a8f04-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
