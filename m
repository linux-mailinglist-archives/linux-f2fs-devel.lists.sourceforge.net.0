Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5FAA953EB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Apr 2025 18:16:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u6tom-0008P9-IZ;
	Mon, 21 Apr 2025 16:16:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1u6tol-0008P2-7w
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Apr 2025 16:16:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sw5joAi4KwYdFB1NLY2WoCDynsGBNXrFFgOHMWvKXgY=; b=HykTqh7t8NVndiXmGjD7vehd84
 8rE74RdBiDMoaQ1W3PtyofyBYJ0d3XBjE2zEABIc3HjT/PRzuL+U1cQFW0PQQaD3Jm7yFcFh9e8or
 Wzl+pp1qCinxPiDkTjUWVqYWkxPDjITc+8B775VNOY/V5OlPk+h6MAtpXM4bQa3YNOQw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Sw5joAi4KwYdFB1NLY2WoCDynsGBNXrFFgOHMWvKXgY=; b=N
 OcnMq70ovromT9tpyTeynpB5PSlf+FUqkSEKX94398Ef7b+b2anZUgVgH9HF3nvX4VlQFYfmZTm1s
 1IVMn4Qc+kGPbbsgN75i9HtADeBQjwvwQkVZhEWcO55uVEooQCuD8rkUyyns4vIofKq6bAGg9D2G9
 OtmQQXE+NvPOcPMY=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u6toW-00019M-1m for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Apr 2025 16:16:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3EB5FA4BD5E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Apr 2025 16:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE68CC4CEE4;
 Mon, 21 Apr 2025 16:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745252157;
 bh=ijd7Th6XjvQmAHyaLdqyRMKXfm4BvzeeCU8FYlVFV3Y=;
 h=From:To:Cc:Subject:Date:From;
 b=JzCa6VnlwjUwFbMOGGzf1DrSxX06KkJS/Cx/ZwmwfHP5Uw2EuPBO5YLx8EphXQnZg
 4H3sqo06cEb5XkuI4WZrJe/DHlNiXHsvBKVtiFSB2XoCaynI589j9eao0QdcznIRqG
 zFoVRi0d1v3XAEFGOCRO83FDapfCoxxK2A++0BdaCymXDX0MKbV7OnLaExHRwlv8DC
 UpkkfML7r3T7Du6KKUxqeCwT5peHR7hzsmvXCFJLNgqU1VEAfyGqmR54MyM4XarS4X
 ar+5Wac3IuB5vsDAuKIdS6btwOEyp6XR/9j1vLuWBQqTKUO1YgiF3OCpTb0EadKd35
 ig1Sq8PzljOVw==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 21 Apr 2025 16:15:55 +0000
Message-ID: <20250421161555.1630917-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
MIME-Version: 1.0
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If the device support write hints, let's assign it in Android
 devices. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- fsck/main.c
 | 4 ++++ mkfs/f2fs_format_main.c | 4 ++++ 2 files changed, 8 insertions(+)
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u6toW-00019M-1m
Subject: [f2fs-dev] [PATCH] f2fs-tools: enable write hint by default
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If the device support write hints, let's assign it in Android devices.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/main.c             | 4 ++++
 mkfs/f2fs_format_main.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/fsck/main.c b/fsck/main.c
index 423a9a63782c..cb51673aeda8 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -233,6 +233,10 @@ static void add_default_options(void)
 
 		/* disable nat_bits feature by default */
 		c.disabled_feature |= F2FS_FEATURE_NAT_BITS;
+
+		/* enable write hitn by default */
+		c.need_whint = true;
+		c.whint = WRITE_LIFE_NOT_SET;
 	}
 	c.quota_fix = 1;
 }
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index 5b4569d9e3ab..3a8fde021373 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -156,6 +156,10 @@ static void add_default_options(void)
 		c.feature |= F2FS_FEATURE_PRJQUOTA;
 		c.feature |= F2FS_FEATURE_EXTRA_ATTR;
 		c.feature |= F2FS_FEATURE_VERITY;
+
+		/* enable write hitn by default */
+		c.need_whint = true;
+		c.whint = WRITE_LIFE_NOT_SET;
 		break;
 	}
 #ifdef CONF_CASEFOLD
-- 
2.49.0.805.g082f7c87e0-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
