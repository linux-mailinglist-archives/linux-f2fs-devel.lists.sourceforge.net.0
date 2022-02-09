Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B26C4B0002
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Feb 2022 23:18:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nHvI3-0005To-V5; Wed, 09 Feb 2022 22:18:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nHvI2-0005Th-FB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Feb 2022 22:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BN0XnKuounckgURXSLkI1Oe6bCfjC1RMQ31QFFRCMbE=; b=amnK9pxJNCpYOsZysuDt6Purpx
 NYY+63mxkGp3FpI+Q4V8YRs1fCZuefiO3n+WGKsCfPhzH+GKY3dzm007XEWfymLijyOpAtAb0AJ5Q
 M7iZrrqSkTHGeNXbr/XVHPp0VOOWe5a6hsrnIa+l3KFGWr3LcD8+8gOcOLUgHwW3gJOk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BN0XnKuounckgURXSLkI1Oe6bCfjC1RMQ31QFFRCMbE=; b=T
 0k11+f8K2GpMWzeSZcn3LbLRmdgHkAtTZMF6fEymdRhPtZ1n7fzEIW2+txqRLYrqYjRbtmcUnH90x
 l+dDCfmJ1+pmZPxffiv87UC6TtrJ1KgWiUWGTkTUfVOpwqyumMTANpt/ulRL0cgk+o0VO2BoOz182
 KTROUrog+hK/EQgA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nHvHy-0008HV-8N
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Feb 2022 22:18:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D5B0F61C30
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  9 Feb 2022 22:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F05C340E7;
 Wed,  9 Feb 2022 22:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644445088;
 bh=mKtzZ7u8oOXNgfBTqCx4lyRPt93ddwpItBAAFVKYCsE=;
 h=From:To:Cc:Subject:Date:From;
 b=O68nKLxR/m/8XAS001V3BNNppiqwRzHTSlTd3s9PgRdxGpnfjOEjvQEgVdP/OuVRq
 9RuhWGgTmbBQYAWI08yteloWtS0x6hetJ+KlQmqhBsOctuPU7Em8OL0Vs4lfB/NDtv
 ERSCgrbUa8MQIhSDZ4eiVzm1uYZI+K8p/TCk22hs/f6J+u4gUSqOYPYXP6dS0UXZCH
 nCdOgS2c8+5ouO0vTR20pIZJ2xly5WnHGqkZMQGwVaB3pioZvHtqxKLWJJ7kNHNTfz
 2TtAeFvJzssMtT1hy3GBFRWkBndiZMLYoFjb/nSeS1P0FgRGFcR+ZIooTTLjW0E9s5
 UC56UZeiSr2bA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  9 Feb 2022 14:18:04 -0800
Message-Id: <20220209221804.1102945-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 lib/libf2fs.c
 | 2 +- mkfs/f2fs_format.c | 2 +- mkfs/f2fs_format_main.c | 4 ++-- 3 files
 changed, 4 insertions(+),
 4 deletions(-) diff --git a/lib/libf2fs.c b/lib/libf2fs.c
 index 420dfdae56da..94fb91d46d28 100644 --- a/lib/libf2fs.c +++
 b/lib/libf2fs.c
 @@ -952,7 +952,7 @@ int get_device_info(int i) c.kd = open("/proc/version",
 O [...] Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nHvHy-0008HV-8N
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: fix wrong indentation and clean up
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

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 lib/libf2fs.c           | 2 +-
 mkfs/f2fs_format.c      | 2 +-
 mkfs/f2fs_format_main.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 420dfdae56da..94fb91d46d28 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -952,7 +952,7 @@ int get_device_info(int i)
 		c.kd = open("/proc/version", O_RDONLY);
 #endif
 		if (c.kd < 0) {
-			MSG(0, "\tInfo: No support kernel version!\n");
+			MSG(0, "Info: not exist /proc/version!\n");
 			c.kd = -2;
 		}
 	}
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 864d2851bd6a..dba0cec61e60 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -578,10 +578,10 @@ static int f2fs_prepare_super_block(void)
 	if (c.kd >= 0) {
 		dev_read_version(c.version, 0, VERSION_LEN);
 		get_kernel_version(c.version);
-		MSG(0, "Info: format version with\n  \"%s\"\n", c.version);
 	} else {
 		get_kernel_uname_version(c.version);
 	}
+	MSG(0, "Info: format version with\n  \"%s\"\n", c.version);
 
 	memcpy(sb->version, c.version, VERSION_LEN);
 	memcpy(sb->init_version, c.version, VERSION_LEN);
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index 6efe35fff2d2..9e910e78d540 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -24,7 +24,7 @@
 
 #include "config.h"
 #ifdef HAVE_LIBBLKID
-#  include <blkid.h>
+#include <blkid.h>
 #endif
 
 #include "f2fs_fs.h"
@@ -78,7 +78,7 @@ static void mkfs_usage()
 
 static void f2fs_show_info()
 {
-	MSG(0, "\n\tF2FS-tools: mkfs.f2fs Ver: %s (%s)\n\n",
+	MSG(0, "\n    F2FS-tools: mkfs.f2fs Ver: %s (%s)\n\n",
 				F2FS_TOOLS_VERSION,
 				F2FS_TOOLS_DATE);
 	if (c.heap == 0)
-- 
2.35.0.263.gb82422642f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
