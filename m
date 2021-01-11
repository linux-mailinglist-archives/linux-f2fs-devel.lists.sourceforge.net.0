Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E4A2F0C28
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Jan 2021 06:16:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kypYo-0002eY-Nv; Mon, 11 Jan 2021 05:16:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kypYn-0002eR-Am
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 05:16:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DyRqOwQ0dcS8usSOyzJO32W3NIEwDXzrQrOJSBGDM8k=; b=SHxeg7vsyKAcvOZqLCgxQzlOrV
 hdfmm6cR+5Cn6AD2JGCOR1qeVLaGGK4/+hk2UnUVhXoPfeLkXKxX6SOIHFtCpvYgSoliHlxoLkdqq
 aV6pLI1N6wVUUSplCKMrLo9NVfCSluuPCxi/+pNZPn68Jz+Ei1qckSIdFWZLJw8wuCzE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DyRqOwQ0dcS8usSOyzJO32W3NIEwDXzrQrOJSBGDM8k=; b=I
 wm9XjeR3ZOL1XvXagV/xub0ikR2R5flJuORUkciiWzebu6p5QiQQ9xP8lBiyjevdOdbhksszkywjX
 uJoQHoPWMPDDSNET4GrYu0y9We3438MMUASxchBcJrh3iiLOgREVlYwSIsimm5vtdEomN91YqgERJ
 fUsVauyRVHkwY/r0=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kypYc-000GxM-QW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 05:16:09 +0000
Received: by mail-pl1-f171.google.com with SMTP id 4so8887119plk.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 Jan 2021 21:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DyRqOwQ0dcS8usSOyzJO32W3NIEwDXzrQrOJSBGDM8k=;
 b=AgDKg1s20J45iQH5qwhv3TmhdxxPLvAzDfabMHjRl5+sa6wU4XoXRUO4TagzEWLZMu
 ZOAB/3PeIcidapklaCcYa2lDR/heMN0++wQXLC9dWK9E2a/0tFAk+LTvzMoA0VP/aGxl
 iqQoNn3D1XNl9V+gx0wql5SpdzoCTRfssWm4rqbF6qBltXU3M6gImGlitnaF9I+wM8gW
 THdh7xTmVJabh7Npo5UC5tTvg2L/0coCFceAObmOxcSoKJ343emW4lfNiWoFPUIGCiI2
 vCDACX+F8M8BhuwXQitmkTbS3fK/skN/sBCJ79A2NgIocR3DTBfgORXULyIqKhjGxpxZ
 0p9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DyRqOwQ0dcS8usSOyzJO32W3NIEwDXzrQrOJSBGDM8k=;
 b=gYsKoJ7/9VWMD3LYzGS9Qw0HT/jUjQ0Lx0iVlbGjUDPKmXyuKUZAY9EqyELcKHpfr1
 k61X3eOp/US65Qc/uPzOQP5j5HpDscIcUeobXk3Lbbe79uRnTIUGbax3Ecf2aIfaN7eu
 KSasaYjuXeuy4c/FZgU2Cz5SV+rObp5IdK9thQ8HyeoIo83pAdzSvd63wTA8UrJUZj/Q
 yS+lL543iKGw9AOA4foHNstJmvE7zAO9pwYujA5er0G3X0Dok7I8E+K+s5ugPFtyMUfY
 hgezI+12UxR3vp/JpfMQGrJMSCVUrNhFX38Wxv/ASpDmpliAloHi6nV86I3S0KO/cvvB
 h+TA==
X-Gm-Message-State: AOAM532XNpv0/EHyx4QZz72eq3wIq9g/jrgnjN1k2mWoV8lDhG6KvCNS
 MOLRjMTZZqOPtJayaxlwp8I=
X-Google-Smtp-Source: ABdhPJyj1nFIXBeuoYXtUXLntnU4m4J8DrUUFvr5hEQQ/QpA01k8GChbNockKwUDbNVDVNIx6phk2w==
X-Received: by 2002:a17:90a:68c3:: with SMTP id
 q3mr15855450pjj.135.1610342152264; 
 Sun, 10 Jan 2021 21:15:52 -0800 (PST)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id i25sm17729224pgb.33.2021.01.10.21.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 21:15:51 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 11 Jan 2021 14:15:42 +0900
Message-Id: <20210111051543.243387-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.171 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kypYc-000GxM-QW
Subject: [f2fs-dev] [PATCH 1/2] f2fs: introduce checkpoint=merge mount option
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
 Documentation/filesystems/f2fs.rst |   6 +
 fs/f2fs/checkpoint.c               | 176 +++++++++++++++++++++++++++++
 fs/f2fs/debug.c                    |   6 +
 fs/f2fs/f2fs.h                     |  24 ++++
 fs/f2fs/super.c                    |  53 ++++++++-
 5 files changed, 261 insertions(+), 4 deletions(-)

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
index 897edb7c951a..11288f435dbe 100644
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
 
@@ -1707,3 +1710,176 @@ void f2fs_destroy_checkpoint_caches(void)
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
+	struct ckpt_req_control *cprc = sbi->cprc_info;
+	struct ckpt_req *req, *next;
+	struct llist_node *dispatch_list;
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
+		req->complete_time = jiffies;
+		req->ret = ret;
+		complete(&req->wait);
+	}
+}
+
+static int issue_checkpoint_thread(void *data)
+{
+	struct f2fs_sb_info *sbi = data;
+	struct ckpt_req_control *cprc = sbi->cprc_info;
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
+	struct ckpt_req_control *cprc = sbi->cprc_info;
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
+	req->owner = current;
+	init_completion(&req->wait);
+}
+
+int f2fs_issue_checkpoint(struct f2fs_sb_info *sbi)
+{
+	struct ckpt_req_control *cprc = sbi->cprc_info;
+	struct ckpt_req req;
+
+	if (!cprc || !cprc->f2fs_issue_ckpt)
+		return __write_checkpoint_sync(sbi);
+
+	init_ckpt_req(&req);
+
+	req.queue_time = jiffies;
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
+int f2fs_create_ckpt_req_control(struct f2fs_sb_info *sbi)
+{
+	dev_t dev = sbi->sb->s_bdev->bd_dev;
+	struct ckpt_req_control *cprc;
+	bool need_free = true;
+
+	if (sbi->cprc_info) {
+		cprc = sbi->cprc_info;
+		if (cprc->f2fs_issue_ckpt)
+			return 0;
+
+		need_free = false;
+		goto init_thread;
+	}
+
+	cprc = f2fs_kzalloc(sbi, sizeof(struct ckpt_req_control), GFP_KERNEL);
+	if (!cprc)
+		return -ENOMEM;
+	atomic_set(&cprc->issued_ckpt, 0);
+	atomic_set(&cprc->total_ckpt, 0);
+	atomic_set(&cprc->queued_ckpt, 0);
+	init_waitqueue_head(&cprc->ckpt_wait_queue);
+	init_llist_head(&cprc->issue_list);
+	sbi->cprc_info = cprc;
+
+init_thread:
+	if (!test_opt(sbi, MERGE_CHECKPOINT))
+		return 0;
+
+	cprc->f2fs_issue_ckpt = kthread_run(issue_checkpoint_thread, sbi,
+			"f2fs_ckpt-%u:%u", MAJOR(dev), MINOR(dev));
+	if (IS_ERR(cprc->f2fs_issue_ckpt)) {
+		int err = PTR_ERR(cprc->f2fs_issue_ckpt);
+
+		if (need_free) {
+			kvfree(cprc);
+			sbi->cprc_info = NULL;
+		}
+		return err;
+	}
+
+	set_task_ioprio(cprc->f2fs_issue_ckpt, DEFAULT_CHECKPOINT_IOPRIO);
+
+	return 0;
+}
+
+void f2fs_destroy_ckpt_req_control(struct f2fs_sb_info *sbi, bool free)
+{
+	struct ckpt_req_control *cprc = sbi->cprc_info;
+
+	if (cprc && cprc->f2fs_issue_ckpt) {
+		struct task_struct *ckpt_task = cprc->f2fs_issue_ckpt;
+
+		cprc->f2fs_issue_ckpt = NULL;
+		kthread_stop(ckpt_task);
+
+		flush_remained_ckpt_reqs(sbi, NULL);
+	}
+
+	if (free) {
+		kvfree(cprc);
+		sbi->cprc_info = NULL;
+	}
+}
+
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 197c914119da..6ee81afae6b7 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -120,6 +120,9 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 			atomic_read(&SM_I(sbi)->dcc_info->discard_cmd_cnt);
 		si->undiscard_blks = SM_I(sbi)->dcc_info->undiscard_blks;
 	}
+	si->nr_issued_ckpt = atomic_read(&sbi->cprc_info->issued_ckpt);
+	si->nr_total_ckpt = atomic_read(&sbi->cprc_info->total_ckpt);
+	si->nr_queued_ckpt = atomic_read(&sbi->cprc_info->queued_ckpt);
 	si->total_count = (int)sbi->user_block_count / sbi->blocks_per_seg;
 	si->rsvd_segs = reserved_segments(sbi);
 	si->overp_segs = overprovision_segments(sbi);
@@ -417,6 +420,9 @@ static int stat_show(struct seq_file *s, void *v)
 				si->meta_count[META_NAT]);
 		seq_printf(s, "  - ssa blocks : %u\n",
 				si->meta_count[META_SSA]);
+		seq_printf(s, "CP merge (Queued: %4d, Issued: %4d, Total: %4d)\n",
+				si->nr_queued_ckpt, si->nr_issued_ckpt,
+				si->nr_total_ckpt);
 		seq_printf(s, "GC calls: %d (BG: %d)\n",
 			   si->call_count, si->bg_gc);
 		seq_printf(s, "  - data segments : %d (%d)\n",
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bb11759191dc..4de5285df17d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -97,6 +97,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
 #define F2FS_MOUNT_DISABLE_CHECKPOINT	0x02000000
 #define F2FS_MOUNT_NORECOVERY		0x04000000
 #define F2FS_MOUNT_ATGC			0x08000000
+#define F2FS_MOUNT_MERGE_CHECKPOINT	0x10000000
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
 #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
@@ -266,6 +267,24 @@ struct fsync_node_entry {
 	unsigned int seq_id;	/* sequence id */
 };
 
+struct ckpt_req {
+	struct completion wait;
+	struct llist_node llnode;
+	int ret;
+	struct task_struct *owner;
+	unsigned long queue_time;	/* request queued time in jiffies */
+	unsigned long complete_time;	/* request completed time in jiffies */
+};
+
+struct ckpt_req_control {
+	struct task_struct *f2fs_issue_ckpt;	/* checkpoint task */
+	wait_queue_head_t ckpt_wait_queue;	/* waiting queue for wake-up */
+	atomic_t issued_ckpt;			/* # of actually issued ckpts */
+	atomic_t total_ckpt;			/* # of total ckpts */
+	atomic_t queued_ckpt;			/* # of queued ckpts */
+	struct llist_head issue_list;		/* list for command issue */
+};
+
 /* for the bitmap indicate blocks to be discarded */
 struct discard_entry {
 	struct list_head list;	/* list head */
@@ -1404,6 +1423,7 @@ struct f2fs_sb_info {
 	wait_queue_head_t cp_wait;
 	unsigned long last_time[MAX_TIME];	/* to store time in jiffies */
 	long interval_time[MAX_TIME];		/* to store thresholds */
+	struct ckpt_req_control *cprc_info;	/* for checkpoint request control */
 
 	struct inode_management im[MAX_INO_ENTRY];	/* manage inode cache */
 
@@ -3418,6 +3438,9 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc);
 void f2fs_init_ino_entry_info(struct f2fs_sb_info *sbi);
 int __init f2fs_create_checkpoint_caches(void);
 void f2fs_destroy_checkpoint_caches(void);
+int f2fs_issue_checkpoint(struct f2fs_sb_info *sbi);
+int f2fs_create_ckpt_req_control(struct f2fs_sb_info *sbi);
+void f2fs_destroy_ckpt_req_control(struct f2fs_sb_info *sbi, bool free);
 
 /*
  * data.c
@@ -3530,6 +3553,7 @@ struct f2fs_stat_info {
 	int nr_discarding, nr_discarded;
 	int nr_discard_cmd;
 	unsigned int undiscard_blks;
+	int nr_issued_ckpt, nr_total_ckpt, nr_queued_ckpt;
 	int inline_xattr, inline_inode, inline_dir, append, update, orphans;
 	int compr_inode;
 	unsigned long long compr_blocks;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b4a07fe62d1a..5cd89c231223 100644
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
+	 * flush all issued checkpoints and destroy checkpoint request control.
+	 * after then, all checkpoints should be done by each process context.
+	 */
+	f2fs_destroy_ckpt_req_control(sbi, true);
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
+		f2fs_destroy_ckpt_req_control(sbi, false);
+	} else {
+		err = f2fs_create_ckpt_req_control(sbi);
+		if (err) {
+			f2fs_err(sbi,
+				"Failed to initialize F2FS issue_checkpoint_thread (%d)",
+				err);
+			goto restore_gc;
+		}
+	}
+
 	/*
 	 * We stop issue flush thread if FS is mounted as RO
 	 * or if flush_merge is not passed in mount option.
@@ -3701,6 +3735,15 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
 	f2fs_init_fsync_node_info(sbi);
 
+	/* setup checkpoint request control */
+	err = f2fs_create_ckpt_req_control(sbi);
+	if (err) {
+		f2fs_err(sbi,
+		    "Failed to initialize F2FS checkpoint request control (%d)",
+		    err);
+		goto free_cprc;
+	}
+
 	/* setup f2fs internal modules */
 	err = f2fs_build_segment_manager(sbi);
 	if (err) {
@@ -3910,6 +3953,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 free_sm:
 	f2fs_destroy_segment_manager(sbi);
 	f2fs_destroy_post_read_wq(sbi);
+free_cprc:
+	f2fs_destroy_ckpt_req_control(sbi, true);
 free_devices:
 	destroy_device_list(sbi);
 	kvfree(sbi->ckpt);
-- 
2.30.0.284.gd98b1dd5eaa7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
