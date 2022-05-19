Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AD252E0C9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 May 2022 01:46:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrpqY-0001Fh-IV; Thu, 19 May 2022 23:46:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nrpqW-0001Fa-Sl
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 23:46:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZJMQnoOmFIPyoKgfQ90zpO3P6zEWDHJyIq3zp/melMw=; b=AuRQg/FAny9EE7YO0SLdRbbElQ
 yM0/mCVPHR4hTSRvgeqI/nXtsoiRJrZWP6KYRjCjE9SLqYBINi8Z5gWrw+gfBB+/gbxhdoubiR52+
 qVmmg19k3MQ8qMjeXDeDG8ITsb+qFHk0YE8Qq9rYwGhTrNWVLC32dnUCJUYa8m7e93R8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZJMQnoOmFIPyoKgfQ90zpO3P6zEWDHJyIq3zp/melMw=; b=X
 gHpZgw08OqFWe36zLwZ1s2JWvmhVTxkziS+4LPqWlBRIqH0l/N1sw6hXq83RSOHNhOMGnGSP/EKzO
 Q8ReJmJugIVvAkMdBJTeGQVA5XkTkNGLoSspnQdPRkXhnzUtA6/Ug3rhuklT3U8hJchYoZ6X7VvvQ
 XvarzUDQo5jyFBRs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrpqT-0005mT-8E
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 23:46:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9F98861943
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 May 2022 23:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A79CC34114;
 Thu, 19 May 2022 23:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653003970;
 bh=Avz3NS341GIKNvrbHCsb0QR52KTGHnXO1tC+K2bl/Ms=;
 h=From:To:Cc:Subject:Date:From;
 b=GWhJca0jI2QEy51EkeEIu9d+08m2pYmwLEGcWFQ9E0MbGsqxVRa30NfsPykyPQorb
 te/3mXZHumKZn0/tpabyVBDW5Z6ihBgfrfKe6NJ9x4bJcGkceFavXR4NEsr4cDsgCv
 TYPhRxpXjzIWSeHCmeb7/IK8lgMGOUkT/8NrRFm905jdsO3KPr4ZcE9XsFVbrQJ9bR
 afpn6Lc6PzmXRJuuGxufZsFp+Roc07D8L7IZ3vbQ1qbwsBe/KQP8MRSNO1ejYRbY3M
 HhgN2ulZclGTIpyeFUTkNYJxy8eYtjK7d+4lduUmrWYkFunG8oCM44ZNseTCxJDODo
 d4t2A15YzTdqA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 19 May 2022 16:46:04 -0700
Message-Id: <20220519234605.633645-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We need to get the definitions first. Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> --- fsck/f2fs.h | 5 +++-- mkfs/f2fs_format.c | 5
 +++-- tools/f2fscrypt.c | 3 ++- 3 files changed, 8 insertions(+),
 5 deletions(-)
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nrpqT-0005mT-8E
Subject: [f2fs-dev] [PATCH 1/2] f2fs-tools: adjust config file first
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

We need to get the definitions first.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/f2fs.h        | 5 +++--
 mkfs/f2fs_format.c | 5 +++--
 tools/f2fscrypt.c  | 3 ++-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 875f953fb6cc..f1f867339abd 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -11,6 +11,9 @@
 #ifndef _F2FS_H_
 #define _F2FS_H_
 
+#include "config.h"
+#include <f2fs_fs.h>
+
 #include <stdlib.h>
 #include <unistd.h>
 #include <stdio.h>
@@ -35,8 +38,6 @@
 #endif
 #include <assert.h>
 
-#include "f2fs_fs.h"
-
 #define EXIT_ERR_CODE		(-1)
 #define ver_after(a, b) (typecheck(unsigned long long, a) &&            \
 		typecheck(unsigned long long, b) &&                     \
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 2759b5a03bc4..df6fa8a9381b 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -8,6 +8,9 @@
  */
 #define _LARGEFILE64_SOURCE
 
+#include "config.h"
+#include <f2fs_fs.h>
+
 #include <stdio.h>
 #include <stdlib.h>
 #include <fcntl.h>
@@ -21,7 +24,6 @@
 #endif
 #include <time.h>
 
-#include "config.h"
 #ifdef HAVE_UUID_UUID_H
 #include <uuid/uuid.h>
 #endif
@@ -30,7 +32,6 @@
 #define uuid_generate(a)
 #endif
 
-#include "f2fs_fs.h"
 #include "quota.h"
 #include "f2fs_format_utils.h"
 
diff --git a/tools/f2fscrypt.c b/tools/f2fscrypt.c
index 4c5d87036225..0d916c1b1f25 100644
--- a/tools/f2fscrypt.c
+++ b/tools/f2fscrypt.c
@@ -21,6 +21,8 @@
 #endif
 
 #include "config.h"
+#include <f2fs_fs.h>
+
 #include <assert.h>
 #include <errno.h>
 #include <getopt.h>
@@ -55,7 +57,6 @@ typedef unsigned char uuid_t[16];
 #ifdef HAVE_SYS_KEY_H
 #include <sys/key.h>
 #endif
-#include <f2fs_fs.h>
 
 #define F2FS_MAX_KEY_SIZE		64
 #define F2FS_MAX_PASSPHRASE_SIZE	1024
-- 
2.36.1.124.g0e6072fb45-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
