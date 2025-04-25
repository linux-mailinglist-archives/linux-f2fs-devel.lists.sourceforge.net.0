Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 547F0A9C438
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Apr 2025 11:51:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u8FiT-0007Tf-Qh;
	Fri, 25 Apr 2025 09:51:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u8FiR-0007TO-Uo
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Apr 2025 09:51:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EMLW62hlAnmIlD0WKLCFUZkO6tZcUW44wW/78Bh8N6k=; b=H9VG9elVaVzvwbKO2J+rsQQ0oa
 9WwlUmzMjyDc7QjzzktTvL/oSbM7S/7qjaynL84aqBXsANgCRS7JxoUat5e64/Am9IJGhL2P0ikWQ
 wnpVXUIN3rj/PAkRybe3TPo4lYaSR1ulPP+IQY+R4A8I+R4vgKDhMCSlMqvKsqIXwkFg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EMLW62hlAnmIlD0WKLCFUZkO6tZcUW44wW/78Bh8N6k=; b=a
 uGNyV+B2f3O8HFkHF+wXXBTEOzPE9e3e/YS9tYsjrw9E1CeiFU6By2eJfIWBBZi/SDBMtqvXYSiuK
 Rb0frfVFn5mKUgrs/tdR0fv8J9avllBVTCitMrPVRcP9Ew5oWJggef5vom76d8zgHnMvkwmvnRjLj
 bhuIIvHEwXx8QV+A=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u8FiC-0002le-T6 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Apr 2025 09:51:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 44C2BA4D174
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Apr 2025 09:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D3BC4CEED;
 Fri, 25 Apr 2025 09:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745574661;
 bh=goSww0P5SFEYhcqCWdBoe88SPIL4JuxXLc5uGO6rmaw=;
 h=From:To:Cc:Subject:Date:From;
 b=KAy93lcei+DzfvhvdLUJJhaZdqf7ej28LnCI1gBYT4eX/K69uKyfDaNQ80PQyaTBN
 XufgvYNTk3Dkg3PQFdlA+5G7aQc66o9lkhO4lkcdRPXygzxrdURe5Ov+XrpQ99ErM9
 7rNuL7wf8rEXfTbG9Aje/BEz00OVflJIYZaRnMFHIYa9hv0cKOyZwuwREI517EKj7/
 yimkEutthYVEDBDeuS0ZwjyeWrXUz/3xCWCA2xyzHomI8LH27zZTMvquJ7OJn5fVLj
 U9NQo6SYXCWJvWphmSEmo/3r36K+2w86B6UOYkYOa7oRYfoWq6BU9iShkaWi2ElwFx
 ewRlGQKRxnlbg==
To: jaegeuk@kernel.org
Date: Fri, 25 Apr 2025 17:50:55 +0800
Message-ID: <20250425095055.1129285-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
MIME-Version: 1.0
X-Spam-Score: -2.8 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Support to inject a timeout fault into function, currently
 it only support to inject timeout to commit_atomic_write flow to reproduce
 inconsistent bug, like the bug fixed by commit f098aeba04c9 ("f2fs [...] 
 Content analysis details:   (-2.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u8FiC-0002le-T6
Subject: [f2fs-dev] [PATCH] f2fs: support FAULT_TIMEOUT
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Support to inject a timeout fault into function, currently it only
support to inject timeout to commit_atomic_write flow to reproduce
inconsistent bug, like the bug fixed by commit f098aeba04c9 ("f2fs:
fix to avoid atomicity corruption of atomic file").

By default, the new type fault will inject 1000ms timeout, and the
timeout process can be interrupted by SIGKILL.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  1 +
 Documentation/filesystems/f2fs.rst      |  1 +
 fs/f2fs/f2fs.h                          | 17 +++++++++++++++++
 fs/f2fs/segment.c                       |  3 +++
 fs/f2fs/super.c                         |  1 +
 5 files changed, 23 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index c805a48dd3dc..0dd0936e31b0 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -735,6 +735,7 @@ Description:	Support configuring fault injection type, should be
 		FAULT_BLKADDR_CONSISTENCE        0x000080000
 		FAULT_NO_SEGMENT                 0x000100000
 		FAULT_INCONSISTENT_FOOTER        0x000200000
+		FAULT_TIMEOUT                    0x000400000 (1000ms)
 		===========================      ===========
 
 What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 95c64b5b5638..6dcafcf3bf54 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -207,6 +207,7 @@ fault_type=%d		 Support configuring fault injection type, should be
 			 FAULT_BLKADDR_CONSISTENCE        0x000080000
 			 FAULT_NO_SEGMENT                 0x000100000
 			 FAULT_INCONSISTENT_FOOTER        0x000200000
+			 FAULT_TIMEOUT                    0x000400000 (1000ms)
 			 ===========================      ===========
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index be752d833a06..3e0d1f9b62ba 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -63,6 +63,7 @@ enum {
 	FAULT_BLKADDR_CONSISTENCE,
 	FAULT_NO_SEGMENT,
 	FAULT_INCONSISTENT_FOOTER,
+	FAULT_TIMEOUT,
 	FAULT_MAX,
 };
 
@@ -613,6 +614,9 @@ enum {
 /* congestion wait timeout value, default: 20ms */
 #define	DEFAULT_IO_TIMEOUT	(msecs_to_jiffies(20))
 
+/* timeout value injected, default: 1000ms */
+#define DEFAULT_FAULT_TIMEOUT	(msecs_to_jiffies(1000))
+
 /* maximum retry quota flush count */
 #define DEFAULT_RETRY_QUOTA_FLUSH_COUNT		8
 
@@ -4830,6 +4834,19 @@ static inline void f2fs_io_schedule_timeout(long timeout)
 	io_schedule_timeout(timeout);
 }
 
+static inline void f2fs_io_schedule_timeout_killable(long timeout)
+{
+	while (timeout) {
+		if (fatal_signal_pending(current))
+			return;
+		set_current_state(TASK_UNINTERRUPTIBLE);
+		io_schedule_timeout(DEFAULT_IO_TIMEOUT);
+		if (timeout <= DEFAULT_IO_TIMEOUT)
+			return;
+		timeout -= DEFAULT_IO_TIMEOUT;
+	}
+}
+
 static inline void f2fs_handle_page_eio(struct f2fs_sb_info *sbi,
 				struct folio *folio, enum page_type type)
 {
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 037d06d58fda..b1ce8a41becd 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -371,6 +371,9 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
 	}
 
 out:
+	if (time_to_inject(sbi, FAULT_TIMEOUT))
+		f2fs_io_schedule_timeout_killable(DEFAULT_FAULT_TIMEOUT);
+
 	if (ret) {
 		sbi->revoked_atomic_block += fi->atomic_write_cnt;
 	} else {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index de88084f9861..1c33d90c4c92 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -65,6 +65,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 	[FAULT_BLKADDR_CONSISTENCE]	= "inconsistent blkaddr",
 	[FAULT_NO_SEGMENT]		= "no free segment",
 	[FAULT_INCONSISTENT_FOOTER]	= "inconsistent footer",
+	[FAULT_TIMEOUT]			= "timeout",
 };
 
 int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
