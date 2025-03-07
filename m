Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CC6A55D9C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Mar 2025 03:20:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tqNKI-0003Zb-0Z;
	Fri, 07 Mar 2025 02:20:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tqNKG-0003ZT-Ee
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 02:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c71k2zIi85f9gEBJ00K76uD93cOObV7kYF9yAk7KKlU=; b=M0dJ7+rRHA+sKFpE3STu4py5BA
 P2s62hg7YCTaSbFafzuhxiuHl3LnOK+KnpWNreQweA9r0Bfto0ITriMRpKYLOSNq7pLuNKTGI9BCw
 3qDCLPD9pZnZSmcmsm0DbnJoT6e0Urq+RZHdxYRSwsXok3JCnN4/F1KkJRhv8tr/3zmo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=c71k2zIi85f9gEBJ00K76uD93cOObV7kYF9yAk7KKlU=; b=d
 eb14eiyNGRjpK4Ie3TgAahO39RyryxSCmOLedXC+ThEDzIqVhxNxU2KG0l6YakGO/eAn8QBdQSc19
 g+J3lk7GTlyTLaa7ika0zNiB6obeVTt+FHxP8ufQXuE+X0bEkZ8KlNcESd/BgMWPjfMHiomnUu2IX
 CB8+mo+x6ekiV1W8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tqNK6-0005CN-8m for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 02:20:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1688C5C5A30
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  7 Mar 2025 02:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B9ABC4CEEA;
 Fri,  7 Mar 2025 02:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741314020;
 bh=TMlLP2+0/ZNTKOQowPdmX3+VJQp3wKbolgYF+SRys2c=;
 h=From:To:Cc:Subject:Date:From;
 b=DeLYwMMDaTf8VgKrKzwfZwulC4uxU/SiHFN0NE+MHQOXsAGxORkDzw7r4IYMllbHa
 H0EcNBGcPc+VUuau64iVgQeJUPDSZE+uqUOGqmbZqdp2ifKr41BE0HQ6qY2yBKWFk7
 rP4MXnb2omk+TcL2kq1sy0AJiOqHqahcmgFqzfmOlraB/XbLSwAzdDYWjvO4PlPmbk
 OnTP7VWsjQkQpeiLuRcROF4WibIVNgkV+IrO1GkWFLa3IwHLrQJt9LbyE5gc9fz08h
 2411YDhPlTZEKR9r2lhubuOelceF5402qV+5LNm0w/kB4m8ypnmb20b3lVulK/KBzN
 vY7EXk9wYx1kQ==
To: jaegeuk@kernel.org
Date: Fri,  7 Mar 2025 10:20:13 +0800
Message-Id: <20250307022013.12009-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  add_default_options() will be reused by fsck family tools,
 including dump, dfrag, resize, sload, label, inject, add a comment for this.
 And also fix to set c.auto_fix only for fsck in add_default_options(). 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tqNK6-0005CN-8m
Subject: [f2fs-dev] [PATCH] f2fs-tools: fix to set c.auto_fix only for fsck
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

add_default_options() will be reused by fsck family tools, including
dump, dfrag, resize, sload, label, inject, add a comment for this.

And also fix to set c.auto_fix only for fsck in add_default_options().

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/main.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index 97cab5d..2384a80 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -215,17 +215,19 @@ static void error_out(char *prog)
 		MSG(0, "\nWrong program.\n");
 }
 
-static void __add_fsck_options(void)
-{
-	/* -a */
-	c.auto_fix = 1;
-}
-
 static void add_default_options(void)
 {
 	switch (c.defset) {
 	case CONF_ANDROID:
-		__add_fsck_options();
+		if (c.func == FSCK) {
+			/* -a */
+			c.auto_fix = 1;
+		}
+
+		/*
+		 * global config for fsck family including inject, lable, sload,
+		 * resize, defrag and dump.
+		 */
 
 		/* disable nat_bits feature by default */
 		c.disabled_feature |= F2FS_FEATURE_NAT_BITS;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
