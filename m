Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5518BCC47
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 May 2024 12:46:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s3vrA-0002tV-LO;
	Mon, 06 May 2024 10:46:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s3vr9-0002tO-BI
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 May 2024 10:46:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qop69MkRQ1b4f5eWPHR20uQUxF2EcEJUv7qbqg5o0oc=; b=eZx7aBjFLB792T/O+fUdUL9UDw
 FB//f6K3QH6IMBEIxKsGVRL7lR/EckvkGd4i+X16w5wzqxOiiITpcuh7THVCx4c2ETbQUIcdYhjkL
 VOv++0ztVkAFBDK6wM+k9zl5Lx06ljLbLtvLaYh9FA2xDsEK5nR4cuFHunMPZtMpTE/E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qop69MkRQ1b4f5eWPHR20uQUxF2EcEJUv7qbqg5o0oc=; b=fjwSBBm/cV/o6Eq1I7q1UcefYu
 mOicDwC74DhGrijZWTK+kHicM+dLffURTWsCuPb9P73jCpQbDReGP6U6GiRrvSmbDHCA0CloGmeVP
 xQ5zCfgmUaYpsXxbI4cHZCe3izewOLCY6QhlUcSVrdHkdVyXMuGnz96m8dVoAQLwD4Dc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s3vr8-00058f-Fp for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 May 2024 10:46:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 27AC46117B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 May 2024 10:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5BFBC4AF18;
 Mon,  6 May 2024 10:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714992352;
 bh=ujeNWZnZlwotBG7o+WYiKDn4iCBwSQc+8Bif1ZGJ0Ns=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YV6qHBPbcPC67A9nuHjPMpbW32y9pTdI8DVPfhUx9PovciXUiwhd3+Q0r/sqfl481
 UhgFYT9v/y36fBzQ4SecdPVaqGffrbe4TtEUf2wNWWp8F5fptrGy8yf2RYrrKIA+8o
 EBGSo4ZTDhCuFVoabmbmX6HqqL/IIVyBvptqSWiABC0nMrIVE2StSiqAi+5VYYrS4j
 yGDAHp9ZAuNXyhlhOLeH7l4c7euNhPq9/Ioxj1sRSN7feJqDB0O6cK9h5lOwkwBSxU
 K4J++WVvbcedm5EtXtCs8w40fQO2N4oC6QuyYtY6bGplMOgcRfnrBNA9ziERW0F0h5
 XcuuD+eW99OzA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon,  6 May 2024 18:45:38 +0800
Message-Id: <20240506104538.778116-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240506104538.778116-1-chao@kernel.org>
References: <20240506104538.778116-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  type of f2fs_inode.i_gc_failures,
 f2fs_inode_info.i_gc_failures, 
 and f2fs_sb_info.gc_pin_file_threshold is __le16, unsigned int, and u64,
 so it will cause truncation during comparison and persistence. 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s3vr8-00058f-Fp
Subject: [f2fs-dev] [PATCH 2/2] f2fs: fix to limit gc_pin_file_threshold
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

type of f2fs_inode.i_gc_failures, f2fs_inode_info.i_gc_failures, and
f2fs_sb_info.gc_pin_file_threshold is __le16, unsigned int, and u64,
so it will cause truncation during comparison and persistence.

Unifying variable of these three variables to unsigned short, and
add an upper boundary limitation for gc_pin_file_threshold.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  2 +-
 fs/f2fs/f2fs.h                          |  4 ++--
 fs/f2fs/file.c                          | 11 ++++++-----
 fs/f2fs/gc.h                            |  1 +
 fs/f2fs/sysfs.c                         |  7 +++++++
 5 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 1a4d83953379..cad6c3dc1f9c 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -331,7 +331,7 @@ Date:		January 2018
 Contact:	Jaegeuk Kim <jaegeuk@kernel.org>
 Description:	This indicates how many GC can be failed for the pinned
 		file. If it exceeds this, F2FS doesn't guarantee its pinning
-		state. 2048 trials is set by default.
+		state. 2048 trials is set by default, and 65535 as maximum.
 
 What:		/sys/fs/f2fs/<disk>/extension_list
 Date:		February 2018
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 400ff8e1abe0..3dff45cd6cde 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -813,7 +813,7 @@ struct f2fs_inode_info {
 	unsigned char i_dir_level;	/* use for dentry level for large dir */
 	union {
 		unsigned int i_current_depth;	/* only for directory depth */
-		unsigned int i_gc_failures;	/* for gc failure statistic */
+		unsigned short i_gc_failures;	/* for gc failure statistic */
 	};
 	unsigned int i_pino;		/* parent inode number */
 	umode_t i_acl_mode;		/* keep file acl mode temporarily */
@@ -1672,7 +1672,7 @@ struct f2fs_sb_info {
 	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
 
 	/* threshold for gc trials on pinned files */
-	u64 gc_pin_file_threshold;
+	unsigned short gc_pin_file_threshold;
 	struct f2fs_rwsem pin_sem;
 
 	/* maximum # of trials to find a victim segment for SSR and GC */
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 200cafc75dce..1b1b08923f7d 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3194,16 +3194,17 @@ int f2fs_pin_file_control(struct inode *inode, bool inc)
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 
-	/* Use i_gc_failures for normal file as a risk signal. */
-	if (inc)
-		f2fs_i_gc_failures_write(inode, fi->i_gc_failures + 1);
-
-	if (fi->i_gc_failures > sbi->gc_pin_file_threshold) {
+	if (fi->i_gc_failures >= sbi->gc_pin_file_threshold) {
 		f2fs_warn(sbi, "%s: Enable GC = ino %lx after %x GC trials",
 			  __func__, inode->i_ino, fi->i_gc_failures);
 		clear_inode_flag(inode, FI_PIN_FILE);
 		return -EAGAIN;
 	}
+
+	/* Use i_gc_failures for normal file as a risk signal. */
+	if (inc)
+		f2fs_i_gc_failures_write(inode, fi->i_gc_failures + 1);
+
 	return 0;
 }
 
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 9c0d06c4d19a..a8ea3301b815 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -26,6 +26,7 @@
 #define LIMIT_FREE_BLOCK	40 /* percentage over invalid + free space */
 
 #define DEF_GC_FAILED_PINNED_FILES	2048
+#define MAX_GC_FAILED_PINNED_FILES	USHRT_MAX
 
 /* Search max. number of dirty segments to select a victim segment */
 #define DEF_MAX_VICTIM_SEARCH 4096 /* covers 8GB */
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 7aa3844e7a80..09d3ecfaa4f1 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -681,6 +681,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "gc_pin_file_threshold")) {
+		if (t > MAX_GC_FAILED_PINNED_FILES)
+			return -EINVAL;
+		sbi->gc_pin_file_threshold = t;
+		return count;
+	}
+
 	if (!strcmp(a->attr.name, "gc_reclaimed_segments")) {
 		if (t != 0)
 			return -EINVAL;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
