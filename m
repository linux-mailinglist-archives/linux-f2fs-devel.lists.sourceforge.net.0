Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B50A69E37
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Mar 2025 03:23:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tv5Ys-0006H6-6o;
	Thu, 20 Mar 2025 02:23:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tv5Yo-0006Gy-Vo
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Mar 2025 02:23:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f6H4Jedbbn/7Mk64z/C8NQiQ6n2WCvY14Q8pE2Ff4rw=; b=BwgJbun4T/ZuQgpzXoM2zEl84z
 KOkWqkeLNhIyLiy3KOkwYoYTMQtkLiQ4AC2plJ1tb5V8gWcInm3WVL8uQV6MjmGjsR60aAZcnuOpk
 rwb7PYx42px1PKg6nnXEXwTAWBSzZ0DWBimDuaddOfZ6FeM7s/WLV4yx75vwDb2dOfro=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=f6H4Jedbbn/7Mk64z/C8NQiQ6n2WCvY14Q8pE2Ff4rw=; b=l
 ajW1Njf7UCNY6YuaNPMZt6HPvPnwobFBGQdKNJatGR3ThQZ5QwGlYpyrdrOViLzC/hTNlrioyuPe6
 o59K2SA9uTW9Fdk6l/zqAOBUbygqMQaNF+rv3xfExFTMAp6o/WXGAhpyJAyBbpSqSuSC/dkFOSUAs
 VJ0xxe6tF/0axth4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tv5Ye-0007LX-4q for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Mar 2025 02:23:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F2A5768324
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 20 Mar 2025 02:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0316C4CEE4;
 Thu, 20 Mar 2025 02:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742437365;
 bh=W7q6/PTwJrqZQUKTE/L2eAuHe1DXB/d42aG5MQ4jxcA=;
 h=From:To:Cc:Subject:Date:From;
 b=SCk442lmYPaXAGDnk5j7Z3iS8kIKBgaGbOHm5Qqd3iKft7cefuA2aemDt2LhRE6L5
 RPk9Ulu4TfOESGU9MlfQG3eJaCvIJadkpZ6qw6Pn0ycmdcFul8THx3d4ySQKdodBuy
 e0QeN5I6cYzacySyNpk8lJM3WP+MoWQOL06ssfQY4Q9tlSIgyd9kmFpwFi5rVkRstP
 IsUziD6c/kQQdZoWGlIcRc9hOf0D8/W3EXaAMh3Vl/XabFjqaXdYOA2gZUNMLvb+wM
 agp09fdxMq+Wr+uh2S5rQzQB/6r/BLtq9RsM10IpuW5YWJ7miaOiQ8yLzBX3UHvr5I
 jjhKaVBQZi+KQ==
To: jaegeuk@kernel.org
Date: Thu, 20 Mar 2025 10:22:29 +0800
Message-ID: <20250320022230.1938110-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds a proc entry named inject_stats to show total
 injected count for each fault type. cat /proc/fs/f2fs/<dev>/inject_stats
 fault_type injected_count kmalloc 0 kvmalloc 0 page alloc 0 page get 0 alloc
 bio(obsolete) 0 alloc nid 0 orphan 0 no more block 0 too big dir depth 0
 evict_inode f [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tv5Ye-0007LX-4q
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: add a proc entry show inject stats
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

This patch adds a proc entry named inject_stats to show total injected
count for each fault type.

cat /proc/fs/f2fs/<dev>/inject_stats
fault_type              injected_count
kmalloc                 0
kvmalloc                0
page alloc              0
page get                0
alloc bio(obsolete)     0
alloc nid               0
orphan                  0
no more block           0
too big dir depth       0
evict_inode fail        0
truncate fail           0
read IO error           0
checkpoint error        0
discard error           0
write IO error          0
slab alloc              0
dquot initialize        0
lock_op                 0
invalid blkaddr         0
inconsistent blkaddr    0
no free segment         0
inconsistent footer     0

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- add missing CONFIG_F2FS_FAULT_INJECTION
 fs/f2fs/f2fs.h  |  3 +++
 fs/f2fs/super.c |  1 +
 fs/f2fs/sysfs.c | 22 ++++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f1576dc6ec67..986ee5b9326d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -73,6 +73,8 @@ struct f2fs_fault_info {
 	atomic_t inject_ops;
 	int inject_rate;
 	unsigned int inject_type;
+	/* Used to account total count of injection for each type */
+	unsigned int inject_count[FAULT_MAX];
 };
 
 extern const char *f2fs_fault_name[FAULT_MAX];
@@ -1902,6 +1904,7 @@ static inline bool __time_to_inject(struct f2fs_sb_info *sbi, int type,
 	atomic_inc(&ffi->inject_ops);
 	if (atomic_read(&ffi->inject_ops) >= ffi->inject_rate) {
 		atomic_set(&ffi->inject_ops, 0);
+		ffi->inject_count[type]++;
 		f2fs_info_ratelimited(sbi, "inject %s in %s of %pS",
 				f2fs_fault_name[type], func, parent_func);
 		return true;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f087b2b71c89..dfe0604ab558 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -47,6 +47,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 	[FAULT_KVMALLOC]		= "kvmalloc",
 	[FAULT_PAGE_ALLOC]		= "page alloc",
 	[FAULT_PAGE_GET]		= "page get",
+	[FAULT_ALLOC_BIO]		= "alloc bio(obsolete)",
 	[FAULT_ALLOC_NID]		= "alloc nid",
 	[FAULT_ORPHAN]			= "orphan",
 	[FAULT_BLOCK]			= "no more block",
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index c69161366467..46fa94db08a8 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1679,6 +1679,24 @@ static int __maybe_unused disk_map_seq_show(struct seq_file *seq,
 	return 0;
 }
 
+#ifdef CONFIG_F2FS_FAULT_INJECTION
+static int __maybe_unused inject_stats_seq_show(struct seq_file *seq,
+						void *offset)
+{
+	struct super_block *sb = seq->private;
+	struct f2fs_sb_info *sbi = F2FS_SB(sb);
+	struct f2fs_fault_info *ffi = &F2FS_OPTION(sbi).fault_info;
+	int i;
+
+	seq_puts(seq, "fault_type		injected_count\n");
+
+	for (i = 0; i < FAULT_MAX; i++)
+		seq_printf(seq, "%-24s%-10u\n", f2fs_fault_name[i],
+						ffi->inject_count[i]);
+	return 0;
+}
+#endif
+
 int __init f2fs_init_sysfs(void)
 {
 	int ret;
@@ -1770,6 +1788,10 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
 				discard_plist_seq_show, sb);
 	proc_create_single_data("disk_map", 0444, sbi->s_proc,
 				disk_map_seq_show, sb);
+#ifdef CONFIG_F2FS_FAULT_INJECTION
+	proc_create_single_data("inject_stats", 0444, sbi->s_proc,
+				inject_stats_seq_show, sb);
+#endif
 	return 0;
 put_feature_list_kobj:
 	kobject_put(&sbi->s_feature_list_kobj);
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
