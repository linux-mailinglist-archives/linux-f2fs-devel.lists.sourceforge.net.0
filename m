Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FD62F5AA0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Jan 2021 07:23:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kzw2c-0002j4-NE; Thu, 14 Jan 2021 06:23:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kzw2a-0002iw-9n
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Jan 2021 06:23:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I191mTcJzapBf4uXvh9ICSruFNR3i4kWL2B1T7MkUtM=; b=lLjtrlMVrVbMvdkJNw9YHOiXwm
 Luzulzni0G8K3LhAWhVANIap3Bo7FyG7ecN/sTN42E1yqkwTVAQLy80vi0uTH/IGSAGaeY0BejyfZ
 wgQ3BBtRS7gDQJxeO2jqfXTm96fixxXVK+uKLzs5b8XhYBFstJSpbzgEvmWH/otLCSFM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=I191mTcJzapBf4uXvh9ICSruFNR3i4kWL2B1T7MkUtM=; b=e
 l2eUbnjwgxzT1Zug2phQ+ZPEIyIL48unUecjmu7h9+jLjeMtcZX2AlTCPjl1a1PERhcUwN7K1u/C8
 0p5XEXRoxlSERljH2oN3xqBPtayd4tqU13iC2tlmnZUPfuL5Qj5XKMgP1ciG7POdK+Bw/PEbzeLLM
 2tc+nhHBXmy2dXzE=;
Received: from mail-pj1-f44.google.com ([209.85.216.44])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kzw2Q-006nlw-GG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Jan 2021 06:23:28 +0000
Received: by mail-pj1-f44.google.com with SMTP id p15so2443347pjv.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 Jan 2021 22:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I191mTcJzapBf4uXvh9ICSruFNR3i4kWL2B1T7MkUtM=;
 b=FTEiOQbIMRX2XNIz0wlq2kb3StNmbrK5NzOAeleMZ5qMw5eT4CZAHsr8WIrVlolXqW
 POxIootqVtqrUdNngUCyp19XfofeuCjPUJoiMd5BXvCkgG+Gyxhy7kvbcZ5b0IUbYuAj
 38qfRhySRr4aHFmlv186tL7GP+b6FcqJbR/p1QzvzJAHqaUk8co0M12aAE2ymLjwpPLZ
 HIQWTThgOxnzCL0eXLbwfnLkg0yrRs9czpoxHBBOPKe0to0LfIunQPwb4BjWWhCc9Ii7
 +tGm77entx0W5+iLLilfpl8+wmwMTTS7kXPv/5BkeS/IUxZf2yFlaMLRn7tv4LQ2Pylo
 fyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I191mTcJzapBf4uXvh9ICSruFNR3i4kWL2B1T7MkUtM=;
 b=Fo5EkSBjXkns+f/EvEnps2V9DBcIhHNCTY+qNjbgRB8juGvKykJ/7QN1io7NrzeMaU
 wjCvZueeCg9k8jQV2VGYqA3xxht9Bcri9ySKmIdx7yVRKuv+j3wesBfGwjbu0leWNhzG
 rRbJZy8cwiRL4SWYZ8XbOAgodjtQx9+kF4yuE/CMkCeCiqf6TlbPo/boBak+gyxZEKg9
 oGczgw/iOl7HQewRz/TNVh4SoExSxebyXTBlFvmZWl8JIg+OSitOWgTdJ7nYRO5j5Ozu
 pt4jpJEvWfPOeITQNaQ5qI7quHOvugd/0GMBFduVSGRMOLagtABlDcUf2AjJhKuAQ67g
 Dlug==
X-Gm-Message-State: AOAM531tOzlkcdN1mrn2BNmI7/zfiS4jPpfKhY245As7i3PLviolz6kR
 lj0XjhG4HG+/2U+1VGW+fm8=
X-Google-Smtp-Source: ABdhPJyNkT7eSB/JxWoBDKLfpT9KR8KThZmzlpoRBt2+G5lsaWbVmhkMBXXJ6lLkERFsiS8ypSfCmQ==
X-Received: by 2002:a17:902:b282:b029:da:fd05:7766 with SMTP id
 u2-20020a170902b282b02900dafd057766mr6113822plr.52.1610605392331; 
 Wed, 13 Jan 2021 22:23:12 -0800 (PST)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id g26sm4189131pfo.35.2021.01.13.22.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 22:23:11 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 14 Jan 2021 15:23:01 +0900
Message-Id: <20210114062302.3809664-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.30.0.296.g2bfb1c46d8-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.44 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.44 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kzw2Q-006nlw-GG
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: introduce checkpoint=merge mount
 option
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
Cc: Sungjong Seo <sj1557.seo@samsung.com>, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

We've added a new mount option "checkpoint=merge", which creates a
kernel daemon and makes it to merge concurrent checkpoint requests as
much as possible to eliminate redundant checkpoint issues. Plus, we
can eliminate the sluggish issue caused by slow checkpoint operation
when the checkpoint is done in a process context in a cgroup having
low i/o budget and cpu shares, and The below verification result
explains this.
The basic idea has come from https://opensource.samsung.com.

[Verification]
Android Pixel Device(ARM64, 7GB RAM, 256GB UFS)
Create two I/O cgroups (fg w/ weight 100, bg w/ wight 20)
Set "strict_guarantees" to "1" in BFQ tunables

In "fg" cgroup,
- thread A => trigger 1000 checkpoint operations
  "for i in `seq 1 1000`; do touch test_dir1/file; fsync test_dir1;
   done"
- thread B => gererating async. I/O
  "fio --rw=write --numjobs=1 --bs=128k --runtime=3600 --time_based=1
       --filename=test_img --name=test"

In "bg" cgroup,
- thread C => trigger repeated checkpoint operations
  "echo $$ > /dev/blkio/bg/tasks; while true; do touch test_dir2/file;
   fsync test_dir2; done"

We've measured thread A's execution time.

[ w/o patch ]
Elapsed Time: Avg. 68 seconds
[ w/  patch ]
Elapsed Time: Avg. 48 seconds

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Sungjong Seo <sj1557.seo@samsung.com>
---
v2:
- inlined ckpt_req_control into f2fs_sb_info and collected stastics
  of checkpoint merge operations
---
 Documentation/filesystems/f2fs.rst |   6 ++
 fs/f2fs/checkpoint.c               | 163 +++++++++++++++++++++++++++++
 fs/f2fs/debug.c                    |  12 +++
 fs/f2fs/f2fs.h                     |  27 +++++
 fs/f2fs/super.c                    |  56 +++++++++-
 5 files changed, 260 insertions(+), 4 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index dae15c96e659..bccc021bf31a 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -247,6 +247,12 @@ checkpoint=%s[:%u[%]]	 Set to "disable" to turn off checkpointing. Set to "enabl
 			 hide up to all remaining free space. The actual space that
 			 would be unusable can be viewed at /sys/fs/f2fs/<disk>/unusable
 			 This space is reclaimed once checkpoint=enable.
+			 Here is another option "merge", which creates a kernel daemon
+			 and makes it to merge concurrent checkpoint requests as much
+			 as possible to eliminate redundant checkpoint issues. Plus,
+			 we can eliminate the sluggish issue caused by slow checkpoint
+			 operation when the checkpoint is done in a process context in
+			 a cgroup having low i/o budget and cpu shares.
 compress_algorithm=%s	 Control compress algorithm, currently f2fs supports "lzo",
 			 "lz4", "zstd" and "lzo-rle" algorithm.
 compress_log_size=%u	 Support configuring compress cluster size, the size will
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 897edb7c951a..e0668cec3b80 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -13,6 +13,7 @@
 #include <linux/f2fs_fs.h>
 #include <linux/pagevec.h>
 #include <linux/swap.h>
+#include <linux/kthread.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -20,6 +21,8 @@
 #include "trace.h"
 #include <trace/events/f2fs.h>
 
+#define DEFAULT_CHECKPOINT_IOPRIO (IOPRIO_PRIO_VALUE(IOPRIO_CLASS_BE, 3))
+
 static struct kmem_cache *ino_entry_slab;
 struct kmem_cache *f2fs_inode_entry_slab;
 
@@ -1707,3 +1710,163 @@ void f2fs_destroy_checkpoint_caches(void)
 	kmem_cache_destroy(ino_entry_slab);
 	kmem_cache_destroy(f2fs_inode_entry_slab);
 }
+
+static int __write_checkpoint_sync(struct f2fs_sb_info *sbi)
+{
+	struct cp_control cpc = { .reason = CP_SYNC, };
+	int err;
+
+	down_write(&sbi->gc_lock);
+	err = f2fs_write_checkpoint(sbi, &cpc);
+	up_write(&sbi->gc_lock);
+
+	return err;
+}
+
+static void __checkpoint_and_complete_reqs(struct f2fs_sb_info *sbi)
+{
+	struct ckpt_req_control *cprc = &sbi->cprc_info;
+	struct ckpt_req *req, *next;
+	struct llist_node *dispatch_list;
+	u64 sum_diff = 0, diff, count = 0;
+	int ret;
+
+	dispatch_list = llist_del_all(&cprc->issue_list);
+	if (!dispatch_list)
+		return;
+	dispatch_list = llist_reverse_order(dispatch_list);
+
+	ret = __write_checkpoint_sync(sbi);
+	atomic_inc(&cprc->issued_ckpt);
+
+	llist_for_each_entry_safe(req, next, dispatch_list, llnode) {
+		atomic_dec(&cprc->queued_ckpt);
+		atomic_inc(&cprc->total_ckpt);
+		diff = (u64)ktime_ms_delta(ktime_get(), req->queue_time);
+		req->ret = ret;
+		complete(&req->wait);
+
+		sum_diff += diff;
+		count++;
+	}
+
+	spin_lock(&cprc->stat_lock);
+	cprc->cur_time = (unsigned int)div64_u64(sum_diff, count);
+	if (cprc->peak_time < cprc->cur_time)
+		cprc->peak_time = cprc->cur_time;
+	spin_unlock(&cprc->stat_lock);
+}
+
+static int issue_checkpoint_thread(void *data)
+{
+	struct f2fs_sb_info *sbi = data;
+	struct ckpt_req_control *cprc = &sbi->cprc_info;
+	wait_queue_head_t *q = &cprc->ckpt_wait_queue;
+repeat:
+	if (kthread_should_stop())
+		return 0;
+
+	sb_start_intwrite(sbi->sb);
+
+	if (!llist_empty(&cprc->issue_list))
+		__checkpoint_and_complete_reqs(sbi);
+
+	sb_end_intwrite(sbi->sb);
+
+	wait_event_interruptible(*q,
+		kthread_should_stop() || !llist_empty(&cprc->issue_list));
+	goto repeat;
+}
+
+static void flush_remained_ckpt_reqs(struct f2fs_sb_info *sbi,
+		struct ckpt_req *wait_req)
+{
+	struct ckpt_req_control *cprc = &sbi->cprc_info;
+
+	if (!llist_empty(&cprc->issue_list)) {
+		__checkpoint_and_complete_reqs(sbi);
+	} else {
+		/* already dispatched by issue_checkpoint_thread */
+		if (wait_req)
+			wait_for_completion(&wait_req->wait);
+	}
+}
+
+static void init_ckpt_req(struct ckpt_req *req)
+{
+	memset(req, 0, sizeof(struct ckpt_req));
+
+	init_completion(&req->wait);
+	req->queue_time = ktime_get();
+}
+
+int f2fs_issue_checkpoint(struct f2fs_sb_info *sbi)
+{
+	struct ckpt_req_control *cprc = &sbi->cprc_info;
+	struct ckpt_req req;
+
+	if (!cprc || !cprc->f2fs_issue_ckpt)
+		return __write_checkpoint_sync(sbi);
+
+	init_ckpt_req(&req);
+
+	llist_add(&req.llnode, &cprc->issue_list);
+	atomic_inc(&cprc->queued_ckpt);
+
+	/* update issue_list before we wake up issue_checkpoint thread */
+	smp_mb();
+
+	if (waitqueue_active(&cprc->ckpt_wait_queue))
+		wake_up(&cprc->ckpt_wait_queue);
+
+	if (cprc->f2fs_issue_ckpt)
+		wait_for_completion(&req.wait);
+	else
+		flush_remained_ckpt_reqs(sbi, &req);
+
+	return req.ret;
+}
+
+int f2fs_start_ckpt_thread(struct f2fs_sb_info *sbi)
+{
+	dev_t dev = sbi->sb->s_bdev->bd_dev;
+	struct ckpt_req_control *cprc = &sbi->cprc_info;
+
+	if (cprc->f2fs_issue_ckpt)
+		return 0;
+
+	cprc->f2fs_issue_ckpt = kthread_run(issue_checkpoint_thread, sbi,
+			"f2fs_ckpt-%u:%u", MAJOR(dev), MINOR(dev));
+	if (IS_ERR(cprc->f2fs_issue_ckpt))
+		return PTR_ERR(cprc->f2fs_issue_ckpt);
+
+	set_task_ioprio(cprc->f2fs_issue_ckpt, DEFAULT_CHECKPOINT_IOPRIO);
+
+	return 0;
+}
+
+void f2fs_stop_ckpt_thread(struct f2fs_sb_info *sbi)
+{
+	struct ckpt_req_control *cprc = &sbi->cprc_info;
+
+	if (cprc->f2fs_issue_ckpt) {
+		struct task_struct *ckpt_task = cprc->f2fs_issue_ckpt;
+
+		cprc->f2fs_issue_ckpt = NULL;
+		kthread_stop(ckpt_task);
+
+		flush_remained_ckpt_reqs(sbi, NULL);
+	}
+}
+
+void f2fs_init_ckpt_req_control(struct f2fs_sb_info *sbi)
+{
+	struct ckpt_req_control *cprc = &sbi->cprc_info;
+
+	atomic_set(&cprc->issued_ckpt, 0);
+	atomic_set(&cprc->total_ckpt, 0);
+	atomic_set(&cprc->queued_ckpt, 0);
+	init_waitqueue_head(&cprc->ckpt_wait_queue);
+	init_llist_head(&cprc->issue_list);
+	spin_lock_init(&cprc->stat_lock);
+}
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 197c914119da..91855d5721cd 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -120,6 +120,13 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 			atomic_read(&SM_I(sbi)->dcc_info->discard_cmd_cnt);
 		si->undiscard_blks = SM_I(sbi)->dcc_info->undiscard_blks;
 	}
+	si->nr_issued_ckpt = atomic_read(&sbi->cprc_info.issued_ckpt);
+	si->nr_total_ckpt = atomic_read(&sbi->cprc_info.total_ckpt);
+	si->nr_queued_ckpt = atomic_read(&sbi->cprc_info.queued_ckpt);
+	spin_lock(&sbi->cprc_info.stat_lock);
+	si->cur_ckpt_time = sbi->cprc_info.cur_time;
+	si->peak_ckpt_time = sbi->cprc_info.peak_time;
+	spin_unlock(&sbi->cprc_info.stat_lock);
 	si->total_count = (int)sbi->user_block_count / sbi->blocks_per_seg;
 	si->rsvd_segs = reserved_segments(sbi);
 	si->overp_segs = overprovision_segments(sbi);
@@ -417,6 +424,11 @@ static int stat_show(struct seq_file *s, void *v)
 				si->meta_count[META_NAT]);
 		seq_printf(s, "  - ssa blocks : %u\n",
 				si->meta_count[META_SSA]);
+		seq_printf(s, "CP merge (Queued: %4d, Issued: %4d, Total: %4d, "
+				"Cur time: %4d(ms), Peak time: %4d(ms))\n",
+				si->nr_queued_ckpt, si->nr_issued_ckpt,
+				si->nr_total_ckpt, si->cur_ckpt_time,
+				si->peak_ckpt_time);
 		seq_printf(s, "GC calls: %d (BG: %d)\n",
 			   si->call_count, si->bg_gc);
 		seq_printf(s, "  - data segments : %d (%d)\n",
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bb11759191dc..f2ae075aa723 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -97,6 +97,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
 #define F2FS_MOUNT_DISABLE_CHECKPOINT	0x02000000
 #define F2FS_MOUNT_NORECOVERY		0x04000000
 #define F2FS_MOUNT_ATGC			0x08000000
+#define F2FS_MOUNT_MERGE_CHECKPOINT	0x10000000
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
 #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
@@ -266,6 +267,25 @@ struct fsync_node_entry {
 	unsigned int seq_id;	/* sequence id */
 };
 
+struct ckpt_req {
+	struct completion wait;		/* completion for checkpoint done */
+	struct llist_node llnode;	/* llist_node to be linked in wait queue */
+	int ret;			/* return code of checkpoint */
+	ktime_t queue_time;		/* request queued time */
+};
+
+struct ckpt_req_control {
+	struct task_struct *f2fs_issue_ckpt;	/* checkpoint task */
+	wait_queue_head_t ckpt_wait_queue;	/* waiting queue for wake-up */
+	atomic_t issued_ckpt;		/* # of actually issued ckpts */
+	atomic_t total_ckpt;		/* # of total ckpts */
+	atomic_t queued_ckpt;		/* # of queued ckpts */
+	struct llist_head issue_list;	/* list for command issue */
+	spinlock_t stat_lock;		/* lock for below checkpoint time stats */
+	unsigned int cur_time;		/* cur wait time in msec for currently issued checkpoint */
+	unsigned int peak_time;		/* peak wait time in msec until now */
+};
+
 /* for the bitmap indicate blocks to be discarded */
 struct discard_entry {
 	struct list_head list;	/* list head */
@@ -1404,6 +1424,7 @@ struct f2fs_sb_info {
 	wait_queue_head_t cp_wait;
 	unsigned long last_time[MAX_TIME];	/* to store time in jiffies */
 	long interval_time[MAX_TIME];		/* to store thresholds */
+	struct ckpt_req_control cprc_info;	/* for checkpoint request control */
 
 	struct inode_management im[MAX_INO_ENTRY];	/* manage inode cache */
 
@@ -3418,6 +3439,10 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc);
 void f2fs_init_ino_entry_info(struct f2fs_sb_info *sbi);
 int __init f2fs_create_checkpoint_caches(void);
 void f2fs_destroy_checkpoint_caches(void);
+int f2fs_issue_checkpoint(struct f2fs_sb_info *sbi);
+int f2fs_start_ckpt_thread(struct f2fs_sb_info *sbi);
+void f2fs_stop_ckpt_thread(struct f2fs_sb_info *sbi);
+void f2fs_init_ckpt_req_control(struct f2fs_sb_info *sbi);
 
 /*
  * data.c
@@ -3530,6 +3555,8 @@ struct f2fs_stat_info {
 	int nr_discarding, nr_discarded;
 	int nr_discard_cmd;
 	unsigned int undiscard_blks;
+	int nr_issued_ckpt, nr_total_ckpt, nr_queued_ckpt;
+	unsigned int cur_ckpt_time, peak_ckpt_time;
 	int inline_xattr, inline_inode, inline_dir, append, update, orphans;
 	int compr_inode;
 	unsigned long long compr_blocks;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b4a07fe62d1a..1c1771be8a16 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -143,6 +143,7 @@ enum {
 	Opt_checkpoint_disable_cap,
 	Opt_checkpoint_disable_cap_perc,
 	Opt_checkpoint_enable,
+	Opt_checkpoint_merge,
 	Opt_compress_algorithm,
 	Opt_compress_log_size,
 	Opt_compress_extension,
@@ -213,6 +214,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_checkpoint_disable_cap, "checkpoint=disable:%u"},
 	{Opt_checkpoint_disable_cap_perc, "checkpoint=disable:%u%%"},
 	{Opt_checkpoint_enable, "checkpoint=enable"},
+	{Opt_checkpoint_merge, "checkpoint=merge"},
 	{Opt_compress_algorithm, "compress_algorithm=%s"},
 	{Opt_compress_log_size, "compress_log_size=%u"},
 	{Opt_compress_extension, "compress_extension=%s"},
@@ -872,6 +874,9 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		case Opt_checkpoint_enable:
 			clear_opt(sbi, DISABLE_CHECKPOINT);
 			break;
+		case Opt_checkpoint_merge:
+			set_opt(sbi, MERGE_CHECKPOINT);
+			break;
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 		case Opt_compress_algorithm:
 			if (!f2fs_sb_has_compression(sbi)) {
@@ -1040,6 +1045,12 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		return -EINVAL;
 	}
 
+	if (test_opt(sbi, DISABLE_CHECKPOINT) &&
+			test_opt(sbi, MERGE_CHECKPOINT)) {
+		f2fs_err(sbi, "checkpoint=merge cannot be used with checkpoint=disable\n");
+		return -EINVAL;
+	}
+
 	/* Not pass down write hints if the number of active logs is lesser
 	 * than NR_CURSEG_PERSIST_TYPE.
 	 */
@@ -1245,6 +1256,12 @@ static void f2fs_put_super(struct super_block *sb)
 	/* prevent remaining shrinker jobs */
 	mutex_lock(&sbi->umount_mutex);
 
+	/*
+	 * flush all issued checkpoints and stop checkpoint issue thread.
+	 * after then, all checkpoints should be done by each process context.
+	 */
+	f2fs_stop_ckpt_thread(sbi);
+
 	/*
 	 * We don't need to do checkpoint when superblock is clean.
 	 * But, the previous checkpoint was not done by umount, it needs to do
@@ -1347,10 +1364,13 @@ int f2fs_sync_fs(struct super_block *sb, int sync)
 		struct cp_control cpc;
 
 		cpc.reason = __get_cp_reason(sbi);
-
-		down_write(&sbi->gc_lock);
-		err = f2fs_write_checkpoint(sbi, &cpc);
-		up_write(&sbi->gc_lock);
+		if (test_opt(sbi, MERGE_CHECKPOINT) && cpc.reason == CP_SYNC) {
+			err = f2fs_issue_checkpoint(sbi);
+		} else {
+			down_write(&sbi->gc_lock);
+			err = f2fs_write_checkpoint(sbi, &cpc);
+			up_write(&sbi->gc_lock);
+		}
 	}
 	f2fs_trace_ios(NULL, 1);
 
@@ -1674,6 +1694,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 	if (test_opt(sbi, DISABLE_CHECKPOINT))
 		seq_printf(seq, ",checkpoint=disable:%u",
 				F2FS_OPTION(sbi).unusable_cap);
+	if (test_opt(sbi, MERGE_CHECKPOINT))
+		seq_puts(seq, ",checkpoint=merge");
 	if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_POSIX)
 		seq_printf(seq, ",fsync_mode=%s", "posix");
 	else if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT)
@@ -1954,6 +1976,18 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		}
 	}
 
+	if (!test_opt(sbi, MERGE_CHECKPOINT)) {
+		f2fs_stop_ckpt_thread(sbi);
+	} else {
+		err = f2fs_start_ckpt_thread(sbi);
+		if (err) {
+			f2fs_err(sbi,
+			    "Failed to start F2FS issue_checkpoint_thread (%d)",
+			    err);
+			goto restore_gc;
+		}
+	}
+
 	/*
 	 * We stop issue flush thread if FS is mounted as RO
 	 * or if flush_merge is not passed in mount option.
@@ -3701,6 +3735,18 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
 	f2fs_init_fsync_node_info(sbi);
 
+	/* setup checkpoint request control and start checkpoint issue thread */
+	f2fs_init_ckpt_req_control(sbi);
+	if (test_opt(sbi, MERGE_CHECKPOINT)) {
+		err = f2fs_start_ckpt_thread(sbi);
+		if (err) {
+			f2fs_err(sbi,
+			    "Failed to start F2FS issue_checkpoint_thread (%d)",
+			    err);
+			goto stop_ckpt_thread;
+		}
+	}
+
 	/* setup f2fs internal modules */
 	err = f2fs_build_segment_manager(sbi);
 	if (err) {
@@ -3910,6 +3956,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 free_sm:
 	f2fs_destroy_segment_manager(sbi);
 	f2fs_destroy_post_read_wq(sbi);
+stop_ckpt_thread:
+	f2fs_stop_ckpt_thread(sbi);
 free_devices:
 	destroy_device_list(sbi);
 	kvfree(sbi->ckpt);
-- 
2.30.0.296.g2bfb1c46d8-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
