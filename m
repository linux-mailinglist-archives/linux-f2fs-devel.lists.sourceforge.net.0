Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7414EB0D036
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Jul 2025 05:20:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b+zhCQboU22cGIWfc3ef+8M6wJ21c0+6pg8awZxKLwE=; b=RMzai5jV86yz84U0dSfALi9y0j
	UJ/uSue/Uock1pdjDbUrg3sDSFueAk/yYPV1GrS2lnL6vdJj+9HDfkDOEmIn4ogkR5v9u+gyizwVe
	rGtnPx8I/gw+OR1o0LVQOpcPRI2E8GtlOUph0GEqp73ex0F0+UMlu1rvXWOXJY1yuFRw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ue3YO-0003o0-17;
	Tue, 22 Jul 2025 03:20:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ue3YM-0003ns-Bh
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 03:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BK/okO1ez6eMRGfkdJ9jtsUsC+rfRF19KSxdCsSmB0A=; b=g8lYWDMVP+F9IrY/PBIohp3tHp
 z18PDZ3vl2UOhwGBAwfYwnGyq8er7Ln5AyAkMOuwJVyudOcx35TSgTZuMz6FKCsTHt75CcVY19gXO
 DqVYtC5DJ2Aw4ZfzZh4+0UHHemZ95YSNNLD18B0iRm2+VC84lTHIYDfzNRy30DoAoZcA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BK/okO1ez6eMRGfkdJ9jtsUsC+rfRF19KSxdCsSmB0A=; b=H
 5/MFxV5L95fPFjEqi/W9BzvW6Ka5iyTlJoqg/4QaO4pXud3koi6nTxYaSjWkr6LGqK8f7hBJbvosS
 a3xXpRr/T0QChmWp//c75oyYYy8MjXMCVE926DcRd/rnIhV2uGPvFAgPVpq9bVuFd099KV2o/4gz9
 a30vi8EMxdm4FrQo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ue3YM-0003tp-Ox for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 03:20:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 721684176A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Jul 2025 03:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90837C4CEED;
 Tue, 22 Jul 2025 03:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753154420;
 bh=g0F5/bh16M/8gNMTQL3FWzT1/azn7eamvV7/4Zx7ygs=;
 h=From:To:Cc:Subject:Date:From;
 b=vJd7IMP7Vp25rkqDQibD/AkmOVzr5Q5ITSBfsTvh+twtwgSS7cRK7ibjTUwZ2gHay
 OREiMopReKyxDA4RucyWqR/CRpLGbX17r5HxPt1SOVjsbB2daR4pEGEMKxbK3veaeU
 veEpSJgQyIMOX5Dl+NcMsvPZgFb8rTdjhH13QUCMo77xqgPV47ogB5wfzD4ANdFCds
 XUFQ8JRao6i+DvYp1CyC9B2oZoaI2YHg7gXDNs78ORpyt4YyXPUa0C5OYfHSgU1F2L
 pLGC/uZS8EuZ4DEMSJozcV+gVqBlNpuAhgj06C+KqfL6CPDnWBT1fbvYfLL/w/TwTj
 yEOWK1pEeyiNQ==
To: jaegeuk@kernel.org
Date: Tue, 22 Jul 2025 11:20:08 +0800
Message-ID: <20250722032008.2871359-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As we know, Android is the only user of casefold feature,
 in casefolded directory, creating a filename w/ character has ignorable code
 points in buggy kernel v6.12 is a very rare case, we don't get an [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ue3YM-0003tp-Ox
Subject: [f2fs-dev] [PATCH] fsck.f2fs: disable linear lookup by default
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As we know, Android is the only user of casefold feature, in casefolded
directory, creating a filename w/ character has ignorable code points in
buggy kernel v6.12 is a very rare case, we don't get any report that user
can not access file w/ character has ignorable code points till now.

Let's disable linear lookup in fsck for Android by default, once there is
any related bug report of unicode code points, we can enable it again.

mkfs.f2fs -f -O casefold -C utf8 /dev/vdb
dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       0 : 0]
fsck.f2fs /dev/vdb -g android
dump.f2fs -d3 /dev/vdb |grep s_encoding_flags
s_encoding_flags                        [0x       2 : 2]

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/main.c     | 5 ++++-
 man/fsck.f2fs.8 | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index c5d4159..e05c23a 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -91,7 +91,7 @@ void fsck_usage()
 	MSG(0, "  --no-kernel-check skips detecting kernel change\n");
 	MSG(0, "  --kernel-check checks kernel change\n");
 	MSG(0, "  --debug-cache to debug cache when -c is used\n");
-	MSG(0, "  --nolinear-lookup=X X=1: disable linear lookup, X=0: enable linear lookup\n");
+	MSG(0, "  --nolinear-lookup=X X=1: disable linear lookup, X=0: enable linear lookup. For android case, it will disable linear lookup by default\n");
 	MSG(0, "  --fault_injection=%%d to enable fault injection with specified injection rate\n");
 	MSG(0, "  --fault_type=%%d to configure enabled fault injection type\n");
 	exit(1);
@@ -224,6 +224,9 @@ static void add_default_options(void)
 		if (c.func == FSCK) {
 			/* -a */
 			c.auto_fix = 1;
+
+			/* disable linear lookup by default */
+			c.nolinear_lookup = LINEAR_LOOKUP_DISABLE;
 		} else if (c.func == RESIZE) {
 			c.force = 1;
 		}
diff --git a/man/fsck.f2fs.8 b/man/fsck.f2fs.8
index 89cc455..c20c431 100644
--- a/man/fsck.f2fs.8
+++ b/man/fsck.f2fs.8
@@ -68,7 +68,7 @@ Specify the level of debugging options.
 The default number is 0, which shows basic debugging messages.
 .TP
 .BI \--nolinear-lookup
-Tune linear lookup fallback, must specify an argument, 0: enable linear lookup, 1: disable linear lookup.
+Tune linear lookup fallback, must specify an argument, 0: enable linear lookup, 1: disable linear lookup. For android case, it will disable linear lookup by default.
 .TP
 .BI \-\-fault_injection=%d " enable fault injection"
 Enable fault injection in all supported types with specified injection rate.
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
