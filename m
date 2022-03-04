Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AC44CCBA9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Mar 2022 03:20:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nPxYI-0002fJ-77; Fri, 04 Mar 2022 02:20:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nPxYG-0002fC-Lq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Mar 2022 02:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/ijuFBKGVboqCWMc+PDqQWoQoghSmwfwjtDxmszn33o=; b=YH6z84mJlE+pdXspglEzV9E/JE
 JtlVRULIMPjtYLUPaV8BEZpb6flZ94My8MtFaq7ttq8Msgfnxm6laWegblr5Qqj36CJ0FNciZzclt
 pY3KCCdKtzoxtlbRFrJEigkzSIzlqXtRUV3odL0+rqG29D2KPoZSDoUReNVoS0Wd4R9I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/ijuFBKGVboqCWMc+PDqQWoQoghSmwfwjtDxmszn33o=; b=bMolSti5ooIYqowz0mH4jXcr/S
 ovy/XJUNE1vGrwbF4wTVhwrwlDi5QIJpHGYFYNcDQCtHdXhUA/Xnnbj1e+YxJ8q+Nd7HfE2b9DUD0
 USLWOvUI658+FNvmDm/wbdWhTwQTsfhOEGIX50g3by6JvWTXGoIf5OYBNbVf/hMABNtk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nPxYE-004IYt-4B
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Mar 2022 02:20:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D569CB826B2;
 Fri,  4 Mar 2022 02:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96AB4C004E1;
 Fri,  4 Mar 2022 02:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646360406;
 bh=3b0cLQyDCqM0TDt3vJsTsrKxsQmAHGD01Z3OiT/e01Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UbW9s459ecjdA534L+ORHl+e7av8fMKEU8P0l+yQfX6Rh8new88cvTe4y3aAuXfzO
 K3bdiRvAkCK/Bg40Olc+lQ+tmzJXwkf7NVk+K84JXsyJIggFuHQP7Q5P4+ozPDDTyY
 JqZiPGZP2+Ff3XPM6r+Lo8xCMGOxJkE4K+Np2NJx0n9nTKnJjQYRRgE3raPdHTwe26
 c6zw3Ev4YLGs8j9ZcAQRASHhNkGczxu37JvD5GgVJWTf4Y5ULYurLt+IePWt2dQt6h
 GfrxFM+n9BZa9oJv6QgfAOP8KIhJvsRHTAq7iee/LIKgoSQBNYi4V7/1yw+ahxDzjy
 9yFJ/tZCCwvzQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  3 Mar 2022 18:19:55 -0800
Message-Id: <20220304021955.2524246-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
In-Reply-To: <20220304021955.2524246-1-jaegeuk@kernel.org>
References: <20220304021955.2524246-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Unfair rwsem should be used when blk-cg is on. Otherwise,
 there is regression. FYI, we noticed a -26.7% regression of aim7.jobs-per-min
 due to commit: commit: e4544b63a7ee49e7fbebf35ece0a6acd3b9617ae ("f2fs: move
 f2fs to use reader-unfair rwsems")
 https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git
 master Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nPxYE-004IYt-4B
Subject: [f2fs-dev] [PATCH 2/2] f2fs: introduce F2FS_UNFAIR_RWSEM to support
 unfair rwsem
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Unfair rwsem should be used when blk-cg is on. Otherwise, there is regression.

FYI, we noticed a -26.7% regression of aim7.jobs-per-min due to commit:

commit: e4544b63a7ee49e7fbebf35ece0a6acd3b9617ae ("f2fs: move f2fs to use reader-unfair rwsems")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

in testcase: aim7
on test machine: 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU @ 2.10GHz with 128G memory
with following parameters:

	disk: 4BRD_12G
	md: RAID0
	fs: f2fs
	test: sync_disk_rw
	load: 100
	cpufreq_governor: performance
	ucode: 0x500320a

test-description: AIM7 is a traditional UNIX system level benchmark suite which is used to test and measure the performance of multiuser system.
test-url: https://sourceforge.net/projects/aimbench/files/aim-suite7/

Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/Kconfig |  7 +++++++
 fs/f2fs/f2fs.h  | 10 ++++++++++
 2 files changed, 17 insertions(+)

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index f46a7339d6cf..03ef087537c7 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -143,3 +143,10 @@ config F2FS_IOSTAT
 	  Support getting IO statistics through sysfs and printing out periodic
 	  IO statistics tracepoint events. You have to turn on "iostat_enable"
 	  sysfs node to enable this feature.
+
+config F2FS_UNFAIR_RWSEM
+	bool "F2FS unfair rw_semaphore"
+	depends on F2FS_FS && BLK_CGROUP
+	help
+	  Use unfair rw_semaphore, if system configured IO priority by block
+	  cgroup.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index efc4f1fe2ffd..68d791ec8b27 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -132,7 +132,9 @@ typedef u32 nid_t;
 
 struct f2fs_rwsem {
         struct rw_semaphore internal_rwsem;
+#ifdef CONFIG_F2FS_UNFAIR_RWSEM
         wait_queue_head_t read_waiters;
+#endif
 };
 
 struct f2fs_mount_info {
@@ -2131,7 +2133,9 @@ static inline void __init_f2fs_rwsem(struct f2fs_rwsem *sem,
 		const char *sem_name, struct lock_class_key *key)
 {
 	__init_rwsem(&sem->internal_rwsem, sem_name, key);
+#ifdef CONFIG_F2FS_UNFAIR_RWSEM
 	init_waitqueue_head(&sem->read_waiters);
+#endif
 }
 
 static inline int f2fs_rwsem_is_locked(struct f2fs_rwsem *sem)
@@ -2146,7 +2150,11 @@ static inline int f2fs_rwsem_is_contended(struct f2fs_rwsem *sem)
 
 static inline void f2fs_down_read(struct f2fs_rwsem *sem)
 {
+#ifdef CONFIG_F2FS_UNFAIR_RWSEM
 	wait_event(sem->read_waiters, down_read_trylock(&sem->internal_rwsem));
+#else
+	down_read(&sem->internal_rwsem);
+#endif
 }
 
 static inline int f2fs_down_read_trylock(struct f2fs_rwsem *sem)
@@ -2181,7 +2189,9 @@ static inline int f2fs_down_write_trylock(struct f2fs_rwsem *sem)
 static inline void f2fs_up_write(struct f2fs_rwsem *sem)
 {
 	up_write(&sem->internal_rwsem);
+#ifdef CONFIG_F2FS_UNFAIR_RWSEM
 	wake_up_all(&sem->read_waiters);
+#endif
 }
 
 static inline void f2fs_lock_op(struct f2fs_sb_info *sbi)
-- 
2.35.1.616.g0bdcbb4464-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
