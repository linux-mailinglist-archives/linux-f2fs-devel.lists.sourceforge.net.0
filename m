Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2459A56323
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Mar 2025 10:01:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tqTa1-0002aH-NJ;
	Fri, 07 Mar 2025 09:01:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tqTZv-0002a6-DE
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 09:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2qj3DX2dJQeHhZpMvHvSbhasfM5n80Tvt1ug7KhEaDs=; b=FXjOqeW+eX77Xhiks+Ia+Q6OQ0
 f1EqKYF3Chk5cZBdurMoB5yPJor3UW/R2vEPMLPH5dQ3JHUJv028t34N+wZEeHwjxf7HpNHHuEAnp
 zzXEJU/b8L8cKTnX8kBxzqppjuhO7oah6pe3ThJgs7lC+wyhKvltAQnUNuF4ixDPo6cs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2qj3DX2dJQeHhZpMvHvSbhasfM5n80Tvt1ug7KhEaDs=; b=W
 SjPdtHerKDT96AKbfTt+hya0aCpE/rrM3OTTqScFAxjEoCMqDbFzPDhGTG+jhVpMi4qkygAUQtoMJ
 8aoTTjky3iNhCCbWuNgeKROP86OBWiWBypynaYRFayRhDhJZ6Sy4l7sicT4lDEagJ+0LT98IBFEA9
 kwqIm5mFBq6MmQeM=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tqTZk-0001Z4-OJ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 09:01:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6AEB8A455A9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  7 Mar 2025 08:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76D4C4CEE9;
 Fri,  7 Mar 2025 09:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741338054;
 bh=BgdGDtmQZmYfEm4wXY0qJxzfCNDevPugUP7zUEtEz3s=;
 h=From:To:Cc:Subject:Date:From;
 b=NlBpu7ieD8SjPx09iDmXe3RrkWfpkeOkePrciXxTn48F45sz7wlh8YNpYLLcmJJkm
 kb4nq3jli2cL8Ib04EU5KOfRwXwWFz79iVZPbNY1SYaj5CbLVMsc8pb3fQcIeBPOSd
 h1FYU+4gnYLrUBLUgdxnh1wS/GQJQM+ZcpbQCQIzPC1Ed83yIhxz4nvtDeAZh7LfdX
 fHrjPCIyjZhasO/lFa5iilfkWchlm/0J3nY8iLF0knCQbej82ApEtl9LwALzLS8R+0
 bUEZ+z3oDoB55CW7RYqXSsoN35qfdbP0INWLAxzsEUW59XpKPCke52DhioZwkCKqEg
 6/L+LHGfpf7fw==
To: jaegeuk@kernel.org
Date: Fri,  7 Mar 2025 17:00:49 +0800
Message-Id: <20250307090049.52182-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  add_default_options() will be reused by fsck family tools,
 including dump, dfrag, resize, sload, label, inject, add a comment for this.
 And also fix to set c.auto_fix only for fsck in add_default_options(). 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tqTZk-0001Z4-OJ
Subject: [f2fs-dev] [PATCH v2] f2fs-tools: fix to set c.auto_fix only for
 fsck
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
v2:
- fix typo in comments
 fsck/main.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index 97cab5d..47ba6c9 100644
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
+		 * global config for fsck family tools, including dump,
+		 * defrag, resize, sload, label and inject.
+		 */
 
 		/* disable nat_bits feature by default */
 		c.disabled_feature |= F2FS_FEATURE_NAT_BITS;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
