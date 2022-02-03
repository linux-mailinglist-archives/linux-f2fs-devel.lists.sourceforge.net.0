Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6330B4A8A83
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Feb 2022 18:45:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nFgAc-0001pr-Cx; Thu, 03 Feb 2022 17:45:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nFgAR-0001pa-Q8
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Feb 2022 17:45:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kfHL/viJUJGlXG8yMqzCoeQcsp97qFafXWHFmk5ZdEQ=; b=clSAt7VmVvbUwF/gmRDMzQIhi4
 zypcnKMkiBhd79x8NORX+Nja3sQC0I1fVigIEKrZ47KQ6EPzjRHPxChS3d2DkLZ3++uHQHH4YQ0MU
 UaarXIIeoZBOAlqfgBLCV4Wf8BaphywtzkABIEtKzIxCpAChPP+bzQ9YPpmufZbbNkCA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kfHL/viJUJGlXG8yMqzCoeQcsp97qFafXWHFmk5ZdEQ=; b=E
 YteDZ1n5uoW39CXdwtocMrYfowmVZBLXmoFEz1xKFmCJARwdkkLuAD7P9DgEwz6YdBmD42gHrVnMo
 iQtl4m1GueTnfjh01H9PhatifzgmLx4AXthIAVw+CH5HdMl75hbi3W7wJFnB7Jh2N1x6Gb9wbL9uh
 u52WEewM/lWPIZe8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nFgAQ-00FQ5v-13
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Feb 2022 17:45:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A5D7861625
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  3 Feb 2022 17:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0781BC340E8;
 Thu,  3 Feb 2022 17:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643910304;
 bh=DyrbbMDha99ZLIrk4Iwm0D4X4APxgfDAXsZgxbx9bos=;
 h=From:To:Cc:Subject:Date:From;
 b=ObvUoBN72ECn9oacAzvawS0i4S+rhJmPd976wjNWXbPdXayO1i7lgW8YoTCF76920
 Snt6xVsKG8CpryWR6OE6GbkeAPPsuIOz7kajO5ryjw3v+OK+AS2VigoTUPMMOmRFs9
 NBUaqiNFh+yMLZuW/lHbFiBJnCzrCyDBAZog+Ueb8E4PUBtk/49EdzyaNvk0T8qkYb
 b2OVn6OCJpVKQ+PzJ1xy7rG75NrwSlZlEMFk7+XbzwH4Wgo/AqaIsyhQvrdqrC2AYy
 XVhD6I7eY1zwPBx8QKFNj7p9lKYbI7DRKeOn5s6w+YZem4QrRgIuwST/dCfZhcyUtj
 XQQVck0pLPiNg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  3 Feb 2022 09:44:58 -0800
Message-Id: <20220203174458.3598593-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  With this patch, "-g android" enables project quota only.
 Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- mkfs/f2fs_format_main.c
 | 4 ++-- 1 file changed, 2 insertions(+),
 2 deletions(-) diff --git a/mkfs/f2fs_format_main.c
 b/mkfs/f2fs_format_main.c index 8d4dbe1a28b1..c5bbfeb4b807 100644 ---
 a/mkfs/f2fs_format_main.c
 +++ b/mkfs/f2fs_format_main.c @@ -119,7 +119,8 @@ static void add_d [...]
 Content analysis details:   (-5.3 points, 6.0 required)
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
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nFgAQ-00FQ5v-13
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: set project quota by default for -g
 android
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

With this patch, "-g android" enables project quota only.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 mkfs/f2fs_format_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index 8d4dbe1a28b1..c5bbfeb4b807 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -119,7 +119,8 @@ static void add_default_options(void)
 			return;
 
 		c.feature |= cpu_to_le32(F2FS_FEATURE_ENCRYPT);
-		c.feature |= cpu_to_le32(F2FS_FEATURE_QUOTA_INO);
+		c.feature |= cpu_to_le32(F2FS_FEATURE_PRJQUOTA);
+		c.feature |= cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR);
 		c.feature |= cpu_to_le32(F2FS_FEATURE_VERITY);
 		break;
 	}
@@ -128,7 +129,6 @@ static void add_default_options(void)
 	c.feature |= cpu_to_le32(F2FS_FEATURE_CASEFOLD);
 #endif
 #ifdef CONF_PROJID
-	c.feature |= cpu_to_le32(F2FS_FEATURE_QUOTA_INO);
 	c.feature |= cpu_to_le32(F2FS_FEATURE_PRJQUOTA);
 	c.feature |= cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR);
 #endif
-- 
2.35.0.263.gb82422642f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
