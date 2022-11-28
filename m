Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4B163A421
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:06:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oza5w-0003sa-HK;
	Mon, 28 Nov 2022 09:06:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1oza5q-0003qd-22
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:06:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L6mvHVs7Emq3x8O+6oK7btk4FzaW3Q9LW/n9YIaMeEY=; b=BAKOuS3L2BRVpTmZP+WLgS+Ptq
 dKeH2gtxBAg5rFpueQsGNltqJfNfH3VqXiUKpLE7d619UIZnKs0c2ionS42uKTfy0+O44vY6QHb43
 K78ZdRc5KOd02/wWh6AI5WfTF8UhhETR680TB7rbUpq9xnecTvfnJdMzzlmHajLN/TEo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L6mvHVs7Emq3x8O+6oK7btk4FzaW3Q9LW/n9YIaMeEY=; b=BgbtqC9nN48XUfbv3bglYQQTxP
 gI0MSqnIMhD879YMo1HP/OcmVqdEjiE35F8fSLqYKc8Jh8Yio/y72dFcC4yjv7pJtif5nGryoaT9J
 QJ4YZCxw1POUmB2IPPqZAwcB5HUUertAerT2cXLJ7AnFDSLAwNS5V9Qu3CvIUBH0ft9A=;
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oza5m-00GQjB-DP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:06:25 +0000
Received: by mail-pj1-f52.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso13356109pjt.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Nov 2022 01:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L6mvHVs7Emq3x8O+6oK7btk4FzaW3Q9LW/n9YIaMeEY=;
 b=aByivIjPectLrfW7PJXAKPBbF9CLRob7SfyWRzgeeaRgkZ5fbyjzDKES1vf+sI8ePP
 nlobNUu993/691YL35O5WEg87gefC5w9TvH3sAfV/4nsJq1MOfkuWt8yyn44d3rfr2ML
 TZlPB7cUR5XVg/bAQ9vnqrdgc2v20LOf4MBnf73zgKmfAZV6EDwphTNETPLkXoAsRx27
 Q2jLgaZcEn6nljMAjg/FBdpZPjouD8UJaTcFPcvlZ6bi9BSlHwQLOKs5yzV5AX8XBqgD
 M2atmyJfSwfyVhQHXchpnq2v9TyYbWfsXF09Ku21JocGu6eDkPNc/QQE1e6iDWwbJvF4
 G8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L6mvHVs7Emq3x8O+6oK7btk4FzaW3Q9LW/n9YIaMeEY=;
 b=7bDq0hqrs8ZbdYquUcNhlUNgJCzQDNAtvc/2cRU8mIkfySg/YpCAZS6xL7/a/3AiEz
 Ew6zrP5gRue6LC9/JaDCIutFMIskzmsscWSn1uiGA0RgUw6sANwly9tWcFmo8HfhusKQ
 fj0udzlQu9GeQ+CPvmKXwemgWIvp2OD28BBBO51r2zjbei8/tE8aj3wO/zH+vHlVY0Ok
 FBkVFlmYAsTlnriP9V3xWsss0LXQUnw1MvSSZE69hbM2rzKuonN4OJaIv/8rnLquNuWq
 WIw0aLLt3/xK5Gq7vu/r09JB9wloGqbWnHEgVgDHiqs6wd6AeATUMJmshr6OE2Wwilhj
 h8Sg==
X-Gm-Message-State: ANoB5pkqcJT+vd4sUFXv29JOU0M///BpSFb7OKTXTJG05eouynkYXxBB
 JqappORWH/6gqn3yp2n5N9Q=
X-Google-Smtp-Source: AA0mqf4a+//HfA9gq2RRbe/0i1+4Up2BVqGPmop8u7/7Zz1BDChPhAJGPm4CBcLk5FzdMo6IqyWhgw==
X-Received: by 2002:a17:90b:394c:b0:213:1935:9744 with SMTP id
 oe12-20020a17090b394c00b0021319359744mr53565330pjb.207.1669626376866; 
 Mon, 28 Nov 2022 01:06:16 -0800 (PST)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.252])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a170902ea1100b001811a197797sm8269268plg.194.2022.11.28.01.06.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Nov 2022 01:06:16 -0800 (PST)
From: qixiaoyu1 <qxy65535@gmail.com>
X-Google-Original-From: qixiaoyu1 <qixiaoyu1@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 16:58:55 +0800
Message-Id: <20221128085859.5295-2-qixiaoyu1@xiaomi.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221128085859.5295-1-qixiaoyu1@xiaomi.com>
References: <20221128085859.5295-1-qixiaoyu1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: xiongping1 Signed-off-by: xiongping1 Signed-off-by:
 qixiaoyu1 --- fs/f2fs/Kconfig | 7 +++++++ fs/f2fs/Makefile | 1 +
 fs/f2fs/block_age.c
 | 28 ++++++++++++++++++++++++++++ fs/f2fs/debug.c | 7 +++++++ fs/f2fs/ [...]
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.52 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.52 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oza5m-00GQjB-DP
Subject: [f2fs-dev] [PATCH 1/5] f2fs: record total data blocks allocated
 since mount
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
Cc: xiongping1 <xiongping1@xiaomi.com>, qixiaoyu1 <qixiaoyu1@xiaomi.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: xiongping1 <xiongping1@xiaomi.com>

Signed-off-by: xiongping1 <xiongping1@xiaomi.com>
Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
---
 fs/f2fs/Kconfig     |  7 +++++++
 fs/f2fs/Makefile    |  1 +
 fs/f2fs/block_age.c | 28 ++++++++++++++++++++++++++++
 fs/f2fs/debug.c     |  7 +++++++
 fs/f2fs/f2fs.h      | 15 +++++++++++++++
 fs/f2fs/segment.c   |  4 ++++
 fs/f2fs/super.c     |  4 ++++
 7 files changed, 66 insertions(+)
 create mode 100644 fs/f2fs/block_age.c

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 03ef087537c7..84915f9c6bc8 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -150,3 +150,10 @@ config F2FS_UNFAIR_RWSEM
 	help
 	  Use unfair rw_semaphore, if system configured IO priority by block
 	  cgroup.
+
+config F2FS_FS_DATA_SEPARATION
+	bool "F2FS hot/cold data separation feature"
+	depends on F2FS_FS
+	help
+	  Enable data blocks separation according to block update frequency.
+
diff --git a/fs/f2fs/Makefile b/fs/f2fs/Makefile
index 8a7322d229e4..70d8f0e23b46 100644
--- a/fs/f2fs/Makefile
+++ b/fs/f2fs/Makefile
@@ -10,3 +10,4 @@ f2fs-$(CONFIG_F2FS_FS_POSIX_ACL) += acl.o
 f2fs-$(CONFIG_FS_VERITY) += verity.o
 f2fs-$(CONFIG_F2FS_FS_COMPRESSION) += compress.o
 f2fs-$(CONFIG_F2FS_IOSTAT) += iostat.o
+f2fs-$(CONFIG_F2FS_FS_DATA_SEPARATION) += block_age.o
diff --git a/fs/f2fs/block_age.c b/fs/f2fs/block_age.c
new file mode 100644
index 000000000000..1e8711a03959
--- /dev/null
+++ b/fs/f2fs/block_age.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * fs/f2fs/block_age.c
+ *
+ * Copyright (c) 2022 xiaomi Co., Ltd.
+ *             http://www.xiaomi.com/
+ */
+#include <linux/fs.h>
+#include <linux/f2fs_fs.h>
+
+#include "f2fs.h"
+#include "segment.h"
+
+static inline void f2fs_inc_data_block_alloc(struct f2fs_sb_info *sbi)
+{
+	atomic64_inc(&sbi->total_data_alloc);
+}
+
+void f2fs_init_block_age_info(struct f2fs_sb_info *sbi)
+{
+	atomic64_set(&sbi->total_data_alloc, 0);
+}
+
+void f2fs_inc_block_alloc_count(struct f2fs_sb_info *sbi, int type)
+{
+	if (IS_DATASEG(type))
+		f2fs_inc_data_block_alloc(sbi);
+}
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index a216dcdf6941..d24abdac20bb 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -81,6 +81,9 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	si->ext_tree = atomic_read(&sbi->total_ext_tree);
 	si->zombie_tree = atomic_read(&sbi->total_zombie_tree);
 	si->ext_node = atomic_read(&sbi->total_ext_node);
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	si->total_data_blocks_alloc = atomic64_read(&sbi->total_data_alloc);
+#endif
 	si->ndirty_node = get_pages(sbi, F2FS_DIRTY_NODES);
 	si->ndirty_dent = get_pages(sbi, F2FS_DIRTY_DENTS);
 	si->ndirty_meta = get_pages(sbi, F2FS_DIRTY_META);
@@ -373,6 +376,10 @@ static int stat_show(struct seq_file *s, void *v)
 			seq_printf(s, "Utilization: %u%% (%u valid blocks)\n",
 				si->utilization, si->valid_count);
 
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+		seq_printf(s, "  - Data Block Allocated: %llu\n",
+			   si->total_data_blocks_alloc);
+#endif
 		seq_printf(s, "  - Node: %u (Inode: %u, ",
 			   si->valid_node_count, si->valid_inode_count);
 		seq_printf(s, "Other: %u)\n  - Data: %u\n",
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e6355a5683b7..686f09846de4 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1807,6 +1807,10 @@ struct f2fs_sb_info {
 	u64 sectors_written_start;
 	u64 kbytes_written;
 
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	atomic64_t total_data_alloc;
+#endif
+
 	/* Reference to checksum algorithm driver via cryptoapi */
 	struct crypto_shash *s_chksum_driver;
 
@@ -3858,6 +3862,9 @@ struct f2fs_stat_info {
 	int main_area_segs, main_area_sections, main_area_zones;
 	unsigned long long hit_largest, hit_cached, hit_rbtree;
 	unsigned long long hit_total, total_ext;
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	unsigned long long total_data_blocks_alloc;
+#endif
 	int ext_tree, zombie_tree, ext_node;
 	int ndirty_node, ndirty_dent, ndirty_meta, ndirty_imeta;
 	int ndirty_data, ndirty_qdata;
@@ -4166,6 +4173,14 @@ void f2fs_init_extent_cache_info(struct f2fs_sb_info *sbi);
 int __init f2fs_create_extent_cache(void);
 void f2fs_destroy_extent_cache(void);
 
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+/*
+ * block_age.c
+ */
+void f2fs_init_block_age_info(struct f2fs_sb_info *sbi);
+void f2fs_inc_block_alloc_count(struct f2fs_sb_info *sbi, int type);
+#endif
+
 /*
  * sysfs.c
  */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index acf3d3fa4363..0cf022fd3560 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3280,6 +3280,10 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 	locate_dirty_segment(sbi, GET_SEGNO(sbi, old_blkaddr));
 	locate_dirty_segment(sbi, GET_SEGNO(sbi, *new_blkaddr));
 
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	f2fs_inc_block_alloc_count(sbi, type);
+#endif
+
 	up_write(&sit_i->sentry_lock);
 
 	if (page && IS_NODESEG(type)) {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3834ead04620..bf799d92282a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4475,6 +4475,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
 	f2fs_join_shrinker(sbi);
 
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	f2fs_init_block_age_info(sbi);
+#endif
+
 	f2fs_tuning_parameters(sbi);
 
 	f2fs_notice(sbi, "Mounted with checkpoint version = %llx",
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
