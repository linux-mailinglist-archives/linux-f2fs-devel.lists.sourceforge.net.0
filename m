Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3828ACF083A
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 04 Jan 2026 03:08:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1LihSFFMUkt4Miv8aRVii4JXlNfqqgnUBYt4zb/lEo=; b=kfHh8Km/BkhMNatK8QIXijfFXc
	TbbDh3GWHWi/8gN3ONwHbA7xS6ZQjR2SvOsKWZ8SwbQZs3qUr7M/RLsM4J8wNemtv7dtSAcuU3AL6
	tSFEJ9vw4WjR8jIPCUVbtnrdspXAZf2ovvyzZjS23Tanj5EeA3unaYDYy7wgmKbkOwsI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcDXj-0001pz-VQ;
	Sun, 04 Jan 2026 02:08:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vcDXh-0001pb-Om
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HVgHni5YF9PfUSO0EX4pWEifmaFhbMk1jWfn9mJ0deM=; b=QkSlfO9oK+3U7h6G76GPHzsopY
 nOyed6L/A84bJmkbA2VNaEZIld+kDmlhIf7Mi3iA4qfOKdBtcynm2qUbDmmCrsaZad7wLbEGdgmcN
 uWnsY1KVtNJfeT5euOtlJ8qi+dqJzBrKJ9c+P/GJTYET0udNUKh4oIl46E+ztYGJnL48=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HVgHni5YF9PfUSO0EX4pWEifmaFhbMk1jWfn9mJ0deM=; b=iJPFcccOfSnnrJH8iOlsWVdA2A
 HhyRUfY4PofEHH8+XyOKdFeZnkuIlvDO680/9mKV1i7LulSP1035hd/f/t+iFzIdWpF1lZ+ofqx4V
 MW136LNommLNSkzv9NDCjJ/TesSPln3lzUKYKDtRwrpLXm0hdM/8NnVC40vFH9w7c8DQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vcDXg-0005oL-W2 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7370160017
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  4 Jan 2026 02:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D04FC113D0;
 Sun,  4 Jan 2026 02:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767492503;
 bh=W0yO1mb514gSqoLuovAJ34o3UI0GC/4sRsKz3W44jVU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uVAVoZP0+35ky8MowQG3YZzgsYpa9v4MsY14ago2gdWTopZkJktHIlg4DhaSLtqbd
 NIK0f5ckWIkQSi/CqrNs+DZbxNfye6xuVtby9aA4uBpAnLBUXzEd8eJ4wsm4ijdp9Q
 f/1KQGWP9eVFViZ4KA6yUNxZH0huwEuH3CsLEkDrqGkrWH3E0kogFtfomizpGpOib3
 fouFd3+buUwUqokocFb73iPbEUtiTcPbukbDKqyOy77+yAG50gmrTIMBssNNx+hgqW
 si5CP6BrAe/COtRdl0zuqVNTBj5u1Od/UxDWOwxrfJam379VkDnzC5b1YsuE6Qjk/C
 Ivpb9qRVQshBA==
To: jaegeuk@kernel.org
Date: Sun,  4 Jan 2026 10:07:29 +0800
Message-ID: <20260104020729.1064529-14-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.358.g0dd7633a29-goog
In-Reply-To: <20260104020729.1064529-1-chao@kernel.org>
References: <20260104020729.1064529-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds a new sysfs node in
 /sys/fs/f2fs/<disk>/inject_lock_timeout, 
 it relies on CONFIG_F2FS_FAULT_INJECTION kernel config. It can be used to
 simulate different type of timeout in lock duration. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vcDXg-0005oL-W2
Subject: [f2fs-dev] [PATCH 14/14] f2fs: sysfs: introduce inject_lock_timeout
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

This patch adds a new sysfs node in /sys/fs/f2fs/<disk>/inject_lock_timeout,
it relies on CONFIG_F2FS_FAULT_INJECTION kernel config.

It can be used to simulate different type of timeout in lock duration.

==========     ===============================
Flag_Value     Flag_Description
==========     ===============================
0x00000000     No timeout (default)
0x00000001     Simulate running time
0x00000002     Simulate IO type sleep time
0x00000003     Simulate Non-IO type sleep time
0x00000004     Simulate runnable time
==========     ===============================

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 14 +++++++
 fs/f2fs/checkpoint.c                    |  2 +-
 fs/f2fs/f2fs.h                          | 22 +++++++++--
 fs/f2fs/segment.c                       |  2 +-
 fs/f2fs/super.c                         | 49 +++++++++++++++++++++++++
 fs/f2fs/sysfs.c                         |  9 +++++
 6 files changed, 93 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 4b0bec3c0746..ca9ed3b44b31 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -948,3 +948,17 @@ Description:	This is a threshold, once a thread enters critical region that lock
 		elapsed time exceeds this threshold, f2fs will print tracepoint to dump information
 		of related context. This sysfs entry can be used to control the value of threshold,
 		by default, the value is 500 ms.
+
+What:		/sys/fs/f2fs/<disk>/inject_timeout_type
+Date:		December 2025
+Contact:	"Chao Yu" <chao@kernel.org>
+Description:	This sysfs entry can be used to change type of injected timeout:
+		==========     ===============================
+		Flag_Value     Flag_Description
+		==========     ===============================
+		0x00000000     No timeout (default)
+		0x00000001     Simulate running time
+		0x00000002     Simulate IO type sleep time
+		0x00000003     Simulate Non-IO type sleep time
+		0x00000004     Simulate runnable time
+		==========     ===============================
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index f2ab5ba8fb6a..3dfc83a0813e 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -64,7 +64,7 @@ static inline void trace_lock_elapsed_time_end(struct f2fs_rwsem *sem,
 		return;
 
 	if (time_to_inject(sem->sbi, FAULT_LOCK_TIMEOUT))
-		f2fs_io_schedule_timeout_killable(DEFAULT_FAULT_TIMEOUT);
+		f2fs_schedule_timeout_killable(DEFAULT_FAULT_TIMEOUT, true);
 
 	get_lock_elapsed_time(&tts);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4f8eb1292ebf..ded41b416ed7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -73,7 +73,8 @@ enum {
 enum fault_option {
 	FAULT_RATE	= 1,	/* only update fault rate */
 	FAULT_TYPE	= 2,	/* only update fault type */
-	FAULT_ALL	= 4,	/* reset all fault injection options/stats */
+	FAULT_TIMEOUT	= 4,	/* only update fault timeout type */
+	FAULT_ALL	= 8,	/* reset all fault injection options/stats */
 };
 
 #ifdef CONFIG_F2FS_FAULT_INJECTION
@@ -83,6 +84,7 @@ struct f2fs_fault_info {
 	unsigned int inject_type;
 	/* Used to account total count of injection for each type */
 	unsigned int inject_count[FAULT_MAX];
+	unsigned int inject_lock_timeout;	/* inject lock timeout */
 };
 
 extern const char *f2fs_fault_name[FAULT_MAX];
@@ -184,6 +186,15 @@ enum f2fs_lock_name {
 	LOCK_NAME_IO_RWSEM,
 };
 
+enum f2fs_timeout_type {
+	TIMEOUT_TYPE_NONE,
+	TIMEOUT_TYPE_RUNNING,
+	TIMEOUT_TYPE_IO_SLEEP,
+	TIMEOUT_TYPE_NONIO_SLEEP,
+	TIMEOUT_TYPE_RUNNABLE,
+	TIMEOUT_TYPE_MAX,
+};
+
 /*
  * An implementation of an rwsem that is explicitly unfair to readers. This
  * prevents priority inversion when a low-priority reader acquires the read lock
@@ -4927,6 +4938,7 @@ static inline bool f2fs_need_verity(const struct inode *inode, pgoff_t idx)
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 extern int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
 					unsigned long type, enum fault_option fo);
+extern void f2fs_simulate_lock_timeout(struct f2fs_sb_info *sbi);
 #else
 static inline int f2fs_build_fault_attr(struct f2fs_sb_info *sbi,
 					unsigned long rate, unsigned long type,
@@ -4934,6 +4946,10 @@ static inline int f2fs_build_fault_attr(struct f2fs_sb_info *sbi,
 {
 	return 0;
 }
+static inline void f2fs_simulate_lock_timeout(struct f2fs_sb_info *sbi)
+{
+	return;
+}
 #endif
 
 static inline bool is_journalled_quota(struct f2fs_sb_info *sbi)
@@ -4984,14 +5000,14 @@ static inline void __f2fs_schedule_timeout(long timeout, bool io)
 #define f2fs_schedule_timeout(timeout)			\
 			__f2fs_schedule_timeout(timeout, false)
 
-static inline void f2fs_io_schedule_timeout_killable(long timeout)
+static inline void f2fs_schedule_timeout_killable(long timeout, bool io)
 {
 	unsigned long last_time = jiffies + timeout;
 
 	while (jiffies < last_time) {
 		if (fatal_signal_pending(current))
 			return;
-		__f2fs_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT, true);
+		__f2fs_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT, io);
 	}
 }
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 469d37c37398..587ae3b4bfd8 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -372,7 +372,7 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
 
 out:
 	if (time_to_inject(sbi, FAULT_ATOMIC_TIMEOUT))
-		f2fs_io_schedule_timeout_killable(DEFAULT_FAULT_TIMEOUT);
+		f2fs_schedule_timeout_killable(DEFAULT_FAULT_TIMEOUT, true);
 
 	if (ret) {
 		sbi->revoked_atomic_block += fi->atomic_write_cnt;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1915d194153e..fe6a6d96e7ea 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -97,8 +97,57 @@ int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
 		f2fs_info(sbi, "build fault injection type: 0x%lx", type);
 	}
 
+	if (fo & FAULT_TIMEOUT) {
+		if (type >= TIMEOUT_TYPE_MAX)
+			return -EINVAL;
+		ffi->inject_lock_timeout = (unsigned int)type;
+		f2fs_info(sbi, "build fault timeout injection type: 0x%lx", type);
+	}
+
 	return 0;
 }
+
+static void inject_timeout(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_fault_info *ffi = &F2FS_OPTION(sbi).fault_info;
+	enum f2fs_timeout_type type = ffi->inject_lock_timeout;
+	unsigned long start_time = jiffies;
+	unsigned long timeout = HZ;
+
+	switch (type) {
+	case TIMEOUT_TYPE_RUNNING:
+		while (!time_after(jiffies, start_time + timeout)) {
+			if (fatal_signal_pending(current))
+				return;
+			;
+		}
+		break;
+	case TIMEOUT_TYPE_IO_SLEEP:
+		f2fs_schedule_timeout_killable(timeout, true);
+		break;
+	case TIMEOUT_TYPE_NONIO_SLEEP:
+		f2fs_schedule_timeout_killable(timeout, false);
+		break;
+	case TIMEOUT_TYPE_RUNNABLE:
+		while (!time_after(jiffies, start_time + timeout)) {
+			if (fatal_signal_pending(current))
+				return;
+			schedule();
+		}
+		break;
+	default:
+		return;
+	}
+}
+
+void f2fs_simulate_lock_timeout(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_lock_context lc;
+
+	f2fs_lock_op(sbi, &lc);
+	inject_timeout(sbi);
+	f2fs_unlock_op(sbi, &lc);
+}
 #endif
 
 /* f2fs-wide shrinker description */
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index e95aa23c5bef..91bc0544ba1f 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -35,6 +35,7 @@ enum {
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 	FAULT_INFO_RATE,	/* struct f2fs_fault_info */
 	FAULT_INFO_TYPE,	/* struct f2fs_fault_info */
+	FAULT_INFO_TIMEOUT,	/* struct f2fs_fault_info */
 #endif
 	RESERVED_BLOCKS,	/* struct f2fs_sb_info */
 	CPRC_INFO,	/* struct ckpt_req_control */
@@ -570,6 +571,12 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 			return -EINVAL;
 		return count;
 	}
+	if (a->struct_type == FAULT_INFO_TIMEOUT) {
+		if (f2fs_build_fault_attr(sbi, 0, t, FAULT_TIMEOUT))
+			return -EINVAL;
+		f2fs_simulate_lock_timeout(sbi);
+		return count;
+	}
 #endif
 	if (a->struct_type == RESERVED_BLOCKS) {
 		spin_lock(&sbi->stat_lock);
@@ -1277,6 +1284,7 @@ STAT_INFO_RO_ATTR(gc_background_calls, gc_call_count[BACKGROUND]);
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 FAULT_INFO_GENERAL_RW_ATTR(FAULT_INFO_RATE, inject_rate);
 FAULT_INFO_GENERAL_RW_ATTR(FAULT_INFO_TYPE, inject_type);
+FAULT_INFO_GENERAL_RW_ATTR(FAULT_INFO_TIMEOUT, inject_lock_timeout);
 #endif
 
 /* RESERVED_BLOCKS ATTR */
@@ -1406,6 +1414,7 @@ static struct attribute *f2fs_attrs[] = {
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 	ATTR_LIST(inject_rate),
 	ATTR_LIST(inject_type),
+	ATTR_LIST(inject_lock_timeout),
 #endif
 	ATTR_LIST(data_io_flag),
 	ATTR_LIST(node_io_flag),
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
