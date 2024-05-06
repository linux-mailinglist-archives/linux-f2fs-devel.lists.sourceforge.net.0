Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1168BCC48
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 May 2024 12:46:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s3vr8-0002i1-2f;
	Mon, 06 May 2024 10:46:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s3vr6-0002hq-TY
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 May 2024 10:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YwtzIVBRLXvAfr4UlszVe59kDltAJIrJRMH5c41aXSQ=; b=Lflbj4bE7ARZ971lehztx8lSj6
 TCCqQNMufDy97eUZlC+/7DcGWijmm+NE7MJjQnFJtoTBgtGwFGVf3soq1jkUfHw5f+kJCmNM197rW
 IsebQyd7WnnNbeaXoqZ/T06ilFbC17NV/f4y1ugDSYOkXy29QKSJfSaxUC2M1OqruKTI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YwtzIVBRLXvAfr4UlszVe59kDltAJIrJRMH5c41aXSQ=; b=f
 Dbmjz/6pY1SGWtdQ1IWneuepo4wfkcbCaYgKYMBb6zxiIsWonN3kkO635zrBxImaSFqr10uMcCzfl
 sr51MrDLwMKyOZRsZgciN8ty7W1WVYkJSuNXKJEMH6C8Am4g8xqUmeufioARuEzcATlVvBGOxmURB
 dNQJtfpGud1XLIvI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s3vr6-00058X-Om for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 May 2024 10:46:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6A20261173
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 May 2024 10:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1DBC116B1;
 Mon,  6 May 2024 10:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714992350;
 bh=5FXL1w0kKd3v0/c9H8JOMPfU9RVcvwO4fWYHuVk8glE=;
 h=From:To:Cc:Subject:Date:From;
 b=r1nk7Np7JNO5Kym3vyWEHhbHQsp/9VFNe2U/ZPA9DqjwZQ+N7LTlpMI3GX8xb+7Ps
 PeywSepD8oFBV9bap2jeKm4XyMIoZNi/9P/8FJuFSz4DTRhk87KAbQu2/GbU/yS7Do
 cMdXXDV4xMe0RDIpoLfvnxtDN2LPrCpYhQeP9vlynn+bqWmCnZdyy9+grHnM2uP980
 Y+PCFEoWFVwe20f4sQ46R7GhWCDQLFJgv991UBogfjsMBnC8f98VGOEjVrQRFAq2ta
 TBfIjFmDpUKyUu7pYTQ2SLnCnkFEbrzG0Lbye/Psp5XeSnkjGWwDPABMHz5agSjx5D
 /PJM9SuewHLHQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon,  6 May 2024 18:45:37 +0800
Message-Id: <20240506104538.778116-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: After commit 3db1de0e582c ("f2fs: change the current atomic
 write way"), we removed all GC_FAILURE_ATOMIC usage,
 let's change i_gc_failures[]
 array to i_pin_failure for cleanup. Meanwhile, let's define i_current_depth
 and i_gc_failures as union variable due to they won't be valid at the same
 time. Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s3vr6-00058X-Om
Subject: [f2fs-dev] [PATCH 1/2] f2fs: remove unused GC_FAILURE_PIN
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

After commit 3db1de0e582c ("f2fs: change the current atomic write way"),
we removed all GC_FAILURE_ATOMIC usage, let's change i_gc_failures[]
array to i_pin_failure for cleanup.

Meanwhile, let's define i_current_depth and i_gc_failures as union
variable due to they won't be valid at the same time.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h     | 14 +++++---------
 fs/f2fs/file.c     | 12 +++++-------
 fs/f2fs/inode.c    |  6 ++----
 fs/f2fs/recovery.c |  3 +--
 4 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b03d75e4eedc..400ff8e1abe0 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -765,11 +765,6 @@ enum {
 
 #define DEF_DIR_LEVEL		0
 
-enum {
-	GC_FAILURE_PIN,
-	MAX_GC_FAILURE
-};
-
 /* used for f2fs_inode_info->flags */
 enum {
 	FI_NEW_INODE,		/* indicate newly allocated inode */
@@ -816,9 +811,10 @@ struct f2fs_inode_info {
 	unsigned long i_flags;		/* keep an inode flags for ioctl */
 	unsigned char i_advise;		/* use to give file attribute hints */
 	unsigned char i_dir_level;	/* use for dentry level for large dir */
-	unsigned int i_current_depth;	/* only for directory depth */
-	/* for gc failure statistic */
-	unsigned int i_gc_failures[MAX_GC_FAILURE];
+	union {
+		unsigned int i_current_depth;	/* only for directory depth */
+		unsigned int i_gc_failures;	/* for gc failure statistic */
+	};
 	unsigned int i_pino;		/* parent inode number */
 	umode_t i_acl_mode;		/* keep file acl mode temporarily */
 
@@ -3133,7 +3129,7 @@ static inline void f2fs_i_depth_write(struct inode *inode, unsigned int depth)
 static inline void f2fs_i_gc_failures_write(struct inode *inode,
 					unsigned int count)
 {
-	F2FS_I(inode)->i_gc_failures[GC_FAILURE_PIN] = count;
+	F2FS_I(inode)->i_gc_failures = count;
 	f2fs_mark_inode_dirty_sync(inode, true);
 }
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ac9d6380e433..200cafc75dce 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3196,13 +3196,11 @@ int f2fs_pin_file_control(struct inode *inode, bool inc)
 
 	/* Use i_gc_failures for normal file as a risk signal. */
 	if (inc)
-		f2fs_i_gc_failures_write(inode,
-				fi->i_gc_failures[GC_FAILURE_PIN] + 1);
+		f2fs_i_gc_failures_write(inode, fi->i_gc_failures + 1);
 
-	if (fi->i_gc_failures[GC_FAILURE_PIN] > sbi->gc_pin_file_threshold) {
+	if (fi->i_gc_failures > sbi->gc_pin_file_threshold) {
 		f2fs_warn(sbi, "%s: Enable GC = ino %lx after %x GC trials",
-			  __func__, inode->i_ino,
-			  fi->i_gc_failures[GC_FAILURE_PIN]);
+			  __func__, inode->i_ino, fi->i_gc_failures);
 		clear_inode_flag(inode, FI_PIN_FILE);
 		return -EAGAIN;
 	}
@@ -3266,7 +3264,7 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 	}
 
 	set_inode_flag(inode, FI_PIN_FILE);
-	ret = F2FS_I(inode)->i_gc_failures[GC_FAILURE_PIN];
+	ret = F2FS_I(inode)->i_gc_failures;
 done:
 	f2fs_update_time(sbi, REQ_TIME);
 out:
@@ -3281,7 +3279,7 @@ static int f2fs_ioc_get_pin_file(struct file *filp, unsigned long arg)
 	__u32 pin = 0;
 
 	if (is_inode_flag_set(inode, FI_PIN_FILE))
-		pin = F2FS_I(inode)->i_gc_failures[GC_FAILURE_PIN];
+		pin = F2FS_I(inode)->i_gc_failures;
 	return put_user(pin, (u32 __user *)arg);
 }
 
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 1423cd27a477..9a8c2b63f56d 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -408,8 +408,7 @@ static int do_read_inode(struct inode *inode)
 	if (S_ISDIR(inode->i_mode))
 		fi->i_current_depth = le32_to_cpu(ri->i_current_depth);
 	else if (S_ISREG(inode->i_mode))
-		fi->i_gc_failures[GC_FAILURE_PIN] =
-					le16_to_cpu(ri->i_gc_failures);
+		fi->i_gc_failures = le16_to_cpu(ri->i_gc_failures);
 	fi->i_xattr_nid = le32_to_cpu(ri->i_xattr_nid);
 	fi->i_flags = le32_to_cpu(ri->i_flags);
 	if (S_ISREG(inode->i_mode))
@@ -679,8 +678,7 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
 		ri->i_current_depth =
 			cpu_to_le32(F2FS_I(inode)->i_current_depth);
 	else if (S_ISREG(inode->i_mode))
-		ri->i_gc_failures =
-			cpu_to_le16(F2FS_I(inode)->i_gc_failures[GC_FAILURE_PIN]);
+		ri->i_gc_failures = cpu_to_le16(F2FS_I(inode)->i_gc_failures);
 	ri->i_xattr_nid = cpu_to_le32(F2FS_I(inode)->i_xattr_nid);
 	ri->i_flags = cpu_to_le32(F2FS_I(inode)->i_flags);
 	ri->i_pino = cpu_to_le32(F2FS_I(inode)->i_pino);
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index e7bf15b8240a..496aee53c38a 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -330,8 +330,7 @@ static int recover_inode(struct inode *inode, struct page *page)
 	F2FS_I(inode)->i_advise = raw->i_advise;
 	F2FS_I(inode)->i_flags = le32_to_cpu(raw->i_flags);
 	f2fs_set_inode_flags(inode);
-	F2FS_I(inode)->i_gc_failures[GC_FAILURE_PIN] =
-				le16_to_cpu(raw->i_gc_failures);
+	F2FS_I(inode)->i_gc_failures = le16_to_cpu(raw->i_gc_failures);
 
 	recover_inline_flags(inode, raw);
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
