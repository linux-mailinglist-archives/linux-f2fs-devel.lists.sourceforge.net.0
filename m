Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0A5530129
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 May 2022 08:03:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nsegP-0002Dj-AV; Sun, 22 May 2022 06:03:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nsegN-0002Dd-Vw
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 May 2022 06:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2YJVOg3DYp1p518Jxmo9GmErE5roNZogui0twFepFk8=; b=DhaOhGNx2E0+q3D8PZGA0zWlUE
 OMZmbn2AzdaYlUiR0v3FH3yAkBTjns35djzHhq03g5wDK0Fenxfyd1wCEnN7A7xiWbKGZXA8k77w0
 otG59DVEZsZYANJaeWA2cxHWSknpGpInM+NkFP9vogPB4rVBJJUDUa2YSbAGYlm/EegA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2YJVOg3DYp1p518Jxmo9GmErE5roNZogui0twFepFk8=; b=f
 g7eJeCRtnJ8m9paaAQpfh1Fh3x/kVJV3bK7hZyoNQEo2XahEcphjWSz7DnAzRMMCN6EVatr139S2v
 cZDgKTCF1gJxtUNx9AEZrVk5UecJxHOdhlc2QKZATEQUWbiCGhF5h1DMo3MK2wAMRCJBVcul45Xuj
 J1yZVsSH2UngJ5nU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nsegJ-0002uR-SQ
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 May 2022 06:03:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4441660ED5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 22 May 2022 06:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F071C385AA;
 Sun, 22 May 2022 06:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653199382;
 bh=gOARO1Q4FueU1XuIVi4p7R4b2tIJTlPclN4zJWSV7CY=;
 h=From:To:Cc:Subject:Date:From;
 b=jUq7qTQyK6aJB4BDBnJbY7QATbyxeNvv7IgOFLnvs+am8c+W2T2bRoAh1uwAbM9Y2
 P+A+LnZkNlrFj60BOFbOg4Vb9SZl3sJPR3/Li4DWuMpQtmavp1QpF7OQM7lXT/FPV1
 puT9vdQfMQH5nZmbi6udoYuHYCsa8+M76We13pVExO28yFWGi3SQmny/w64kDpsnf5
 kCuiAo/d8k6pJUYFULhMhS1AxWQ2xY5P929OMO+Mr4x2fyy1K5cTWdforJEg5WHihM
 hp1VMCz+x49jyAls/KYLodtlPIBIICSgIwud6HqieQY/R/4ya3DZO5xlSXHP7RiY2W
 pR1Bl7Roe12gQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 21 May 2022 23:03:00 -0700
Message-Id: <20220522060300.94891-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 fsck/f2fs.h
 | 4 ++-- fsck/xattr.h | 2 ++ mkfs/f2fs_format.c | 6 ++++-- tools/f2fscrypt.c
 | 4 ++-- 4 files changed, 10 insertions(+), 6 deletions(-) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nsegJ-0002uR-SQ
Subject: [f2fs-dev] [PATCH] f2fs-tools: move android_config before defining
 them
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
 fsck/f2fs.h        | 4 ++--
 fsck/xattr.h       | 2 ++
 mkfs/f2fs_format.c | 6 ++++--
 tools/f2fscrypt.c  | 4 ++--
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 875f953fb6cc..030d75067a8e 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -20,6 +20,8 @@
 #include <fcntl.h>
 #include <string.h>
 #include <errno.h>
+#include <f2fs_fs.h>
+
 #ifdef HAVE_MNTENT_H
 #include <mntent.h>
 #endif
@@ -35,8 +37,6 @@
 #endif
 #include <assert.h>
 
-#include "f2fs_fs.h"
-
 #define EXIT_ERR_CODE		(-1)
 #define ver_after(a, b) (typecheck(unsigned long long, a) &&            \
 		typecheck(unsigned long long, b) &&                     \
diff --git a/fsck/xattr.h b/fsck/xattr.h
index 4e4b50d47bd7..74aa5418cbd3 100644
--- a/fsck/xattr.h
+++ b/fsck/xattr.h
@@ -35,7 +35,9 @@ struct f2fs_xattr_entry {
 };
 
 #define FS_ENCRYPTION_CONTEXT_FORMAT_V1 1
+#ifndef FS_KEY_DESCRIPTOR_SIZE
 #define FS_KEY_DESCRIPTOR_SIZE 8
+#endif
 #define FS_KEY_DERIVATION_NONCE_SIZE 16
 
 struct fscrypt_context {
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 2759b5a03bc4..3b96d3182ac8 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -8,11 +8,15 @@
  */
 #define _LARGEFILE64_SOURCE
 
+#include "config.h"
+
 #include <stdio.h>
 #include <stdlib.h>
 #include <fcntl.h>
 #include <string.h>
 #include <unistd.h>
+#include <f2fs_fs.h>
+
 #ifdef HAVE_SYS_STAT_H
 #include <sys/stat.h>
 #endif
@@ -21,7 +25,6 @@
 #endif
 #include <time.h>
 
-#include "config.h"
 #ifdef HAVE_UUID_UUID_H
 #include <uuid/uuid.h>
 #endif
@@ -30,7 +33,6 @@
 #define uuid_generate(a)
 #endif
 
-#include "f2fs_fs.h"
 #include "quota.h"
 #include "f2fs_format_utils.h"
 
diff --git a/tools/f2fscrypt.c b/tools/f2fscrypt.c
index b406bcf56640..1233f3a5b103 100644
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
@@ -44,8 +46,6 @@
 #include <linux/fs.h>
 #endif
 
-#include <f2fs_fs.h>
-
 #ifdef HAVE_UUID_UUID_H
 #include <uuid/uuid.h>
 #else
-- 
2.36.1.124.g0e6072fb45-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
