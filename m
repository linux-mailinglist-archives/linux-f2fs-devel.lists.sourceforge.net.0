Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 122CB63A42D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:07:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oza6O-0003zg-PM;
	Mon, 28 Nov 2022 09:07:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1oza6D-0003vI-48
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:06:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BLKXiYJYrg2dlB187g+CWrgI5UTddt8FYxHfk/bEX8w=; b=mM4qebe0X4AJNnjDKiLn9YDQ5h
 gohHgkP9ueVuDFdXvNzBVmTj0mmvRvLrcVBus2yrsaTjq12to5EAl82BVXikut/77b0j8/KhGJleE
 gytBMSkhge8OR+uFVbBgAF8Ud4cmnIXcv7Q4ZxDdga6HK3JyglJLTirADp1nNO9BfuiI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BLKXiYJYrg2dlB187g+CWrgI5UTddt8FYxHfk/bEX8w=; b=BkERbOtTIzQ89p75LQHzQvFqJM
 3G5paygeRQk/jIss8tQr4jdvE10EIpc9JhdsPq5Q2AtX/nRVJ1xHC42zfOhjWYQcY4ldqWqfvdzEu
 Irh329eD+54BBdzMkdwRqBlmUz/DXP1YKT88N7ctNk2fy+YcfUH+4LyZ+6uHRRNAGb5E=;
Received: from mail-pg1-f177.google.com ([209.85.215.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oza63-0004NU-VT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:06:43 +0000
Received: by mail-pg1-f177.google.com with SMTP id w37so4226119pga.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Nov 2022 01:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BLKXiYJYrg2dlB187g+CWrgI5UTddt8FYxHfk/bEX8w=;
 b=ToLYrPdB/98crZI29wTwpCgtIfl/tinLjbghq0UsSmXB2VSNQysz1AWDV7ZjS+w92q
 j3bHP+azMDr6JM7C5wovgdSnbiIozqyUkx3DXGF35KYw5g1fkY77vcpHzlF/A1G84z16
 82FKGw5VhYdmolDeXmI9yADrFBQCtML6NTVcIOO4n+1Vtz3VR3IlwVsuNogkg9TQ6+p0
 1z3N0hQJ9yswmrLj8J+ZuEzK6gYew9JzvDN0DQmhcWeqxXkLhcpwMCF0zJnxbhhjgM9X
 7WuN+5ry+F+ieUwp10pUrAAgtjh4FeCzFfujT4koheU5sT9t6RgapnDHQ2i+bcRiD1eD
 z2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BLKXiYJYrg2dlB187g+CWrgI5UTddt8FYxHfk/bEX8w=;
 b=ZkW9VJyHePkyqgtlLiFr+EW7xjABKnl72FOOP85GyYfqI7QCCQEkqj5BYFcFL2vdrJ
 kHteY7jZKVu0CovlCFu/cc8QiFcXZRIxD4yl1HeTwMKIS3I/KqShj4//uDVAIbSqclvp
 mqOCWeAgX+i0ka2lZ5jcSK2abcjZ0eW9CldGCHVr7yaKQGI4K/7VCRDKfVNTzPxvOEVr
 jPgbxSir0HEInTTWCIGEm3WvEpgBOcp7xRPX9TDrQvHHF7T3Wn+gCNKRSfgFTL2prnp1
 VcDy3JM82V7Rgypfnbi+cBwuIqZZT99KD+Cn1gF15qnUwTbuOtR5V9U/8dOOLsk/Ll0w
 hYhg==
X-Gm-Message-State: ANoB5pm9gUKvy2jkHV/3+4QZOl/N+kllfEW3NGhYDlcZA+gM4iKteymJ
 +Ikh89VUeLFGkgxgETpadVPypxXSCmnZIg==
X-Google-Smtp-Source: AA0mqf6ccGEnOo/fA5QHWcUNY0QKAjGbgqC9jPuTZJv65ymypf+K5I5b6WsUjtvDcm8GUh0Kh7ps5w==
X-Received: by 2002:a05:6a00:4009:b0:563:2ada:30a3 with SMTP id
 by9-20020a056a00400900b005632ada30a3mr32385650pfb.27.1669626394381; 
 Mon, 28 Nov 2022 01:06:34 -0800 (PST)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.252])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a170902ea1100b001811a197797sm8269268plg.194.2022.11.28.01.06.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Nov 2022 01:06:33 -0800 (PST)
From: qixiaoyu1 <qxy65535@gmail.com>
X-Google-Original-From: qixiaoyu1 <qixiaoyu1@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 16:58:59 +0800
Message-Id: <20221128085859.5295-6-qixiaoyu1@xiaomi.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221128085859.5295-1-qixiaoyu1@xiaomi.com>
References: <20221128085859.5295-1-qixiaoyu1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: qixiaoyu1 Signed-off-by: xiongping1 ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 14 ++++++++++++ fs/f2fs/block_age.c | 29 +++++++++++++++++++++++++
 fs/f2fs/f2fs.h | 4 ++++ fs/f2fs/ [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.177 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.177 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oza63-0004NU-VT
Subject: [f2fs-dev] [PATCH 5/5] f2fs: implement data block seperation with
 block update frequency
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

Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
Signed-off-by: xiongping1 <xiongping1@xiaomi.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 14 ++++++++++++
 fs/f2fs/block_age.c                     | 29 +++++++++++++++++++++++++
 fs/f2fs/f2fs.h                          |  4 ++++
 fs/f2fs/segment.c                       |  9 ++++++++
 fs/f2fs/sysfs.c                         | 28 ++++++++++++++++++++++++
 include/trace/events/f2fs.h             |  2 +-
 6 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 483639fb727b..34952666b2fe 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -634,3 +634,17 @@ Date:		July 2022
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	Show the accumulated total revoked atomic write block count after boot.
 		If you write "0" here, you can initialize to "0".
+
+What:		/sys/fs/f2fs/<disk>/hot_data_age_threshold
+Date:		November 2022
+Contact:	"Ping Xiong" <xiongping1@xiaomi.com>
+Description:	When DATA SEPARATION is on, it controls the age threshold to indicate
+		the data blocks as hot. By default it was initialized as 262144 blocks
+		(equals to 1GB).
+
+What:		/sys/fs/f2fs/<disk>/warm_data_age_threshold
+Date:		November 2022
+Contact:	"Ping Xiong" <xiongping1@xiaomi.com>
+Description:	When DATA SEPARATION is on, it controls the age threshold to indicate
+		the data blocks as warm. By default it was initialized as 2621440 blocks
+		(equals to 10GB).
diff --git a/fs/f2fs/block_age.c b/fs/f2fs/block_age.c
index 488461b3f4bf..d0b578544df7 100644
--- a/fs/f2fs/block_age.c
+++ b/fs/f2fs/block_age.c
@@ -17,6 +17,13 @@
 #define LAST_AGE_WEIGHT		30
 #define SAME_AGE_REGION		1024
 
+/*
+ * Define data block with age less than 1GB as hot data
+ * define data block with age less than 10GB but more than 1GB as warm data
+ */
+#define DEF_HOT_DATA_AGE_THRESHOLD	262144
+#define DEF_WARM_DATA_AGE_THRESHOLD	2621440
+
 static struct kmem_cache *age_extent_tree_slab;
 static struct kmem_cache *age_extent_node_slab;
 
@@ -29,6 +36,9 @@ static inline void f2fs_inc_data_block_alloc(struct f2fs_sb_info *sbi)
 static void f2fs_init_block_age_info(struct f2fs_sb_info *sbi)
 {
 	atomic64_set(&sbi->total_data_alloc, 0);
+
+	sbi->hot_data_age_threshold = DEF_HOT_DATA_AGE_THRESHOLD;
+	sbi->warm_data_age_threshold = DEF_WARM_DATA_AGE_THRESHOLD;
 }
 
 static inline bool f2fs_may_age_extent_tree(struct inode *inode)
@@ -697,6 +707,25 @@ unsigned long f2fs_count_age_extent_cache(struct f2fs_sb_info *sbi)
 				atomic_read(&sbi->total_age_ext_node);
 }
 
+int f2fs_get_data_segment_type(struct inode *inode, pgoff_t pgofs)
+{
+	struct age_extent_info ei;
+	struct f2fs_sb_info *sbi =  F2FS_I_SB(inode);
+
+	if (f2fs_lookup_age_extent_cache(inode, pgofs, &ei)) {
+		if (ei.age != 0) {
+			if (ei.age <= sbi->hot_data_age_threshold)
+				return CURSEG_HOT_DATA;
+			else if (ei.age <= sbi->warm_data_age_threshold)
+				return CURSEG_WARM_DATA;
+			else
+				return CURSEG_COLD_DATA;
+		}
+	}
+
+	return NO_CHECK_TYPE;
+}
+
 void f2fs_destroy_age_extent_cache(void)
 {
 	kmem_cache_destroy(age_extent_node_slab);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 23516498b6d0..50f6f21b23bf 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1854,6 +1854,9 @@ struct f2fs_sb_info {
 
 #ifdef CONFIG_F2FS_FS_DATA_SEPARATION
 	atomic64_t total_data_alloc;
+	/* The threshold used for hot and warm data seperation*/
+	unsigned int hot_data_age_threshold;
+	unsigned int warm_data_age_threshold;
 #endif
 
 	/* Reference to checksum algorithm driver via cryptoapi */
@@ -4241,6 +4244,7 @@ void f2fs_update_age_extent_cache(struct inode *inode, pgoff_t fofs,
 void f2fs_update_data_block_age(struct dnode_of_data *dn);
 void f2fs_truncate_age_extent_cache(struct inode *inode, pgoff_t fofs,
 					unsigned int len);
+int f2fs_get_data_segment_type(struct inode *inode, pgoff_t pgofs);
 int __init f2fs_create_age_extent_cache(void);
 void f2fs_destroy_age_extent_cache(void);
 #endif
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index d4c338f332fa..2fa5b22119ac 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3163,6 +3163,9 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 	if (fio->type == DATA) {
 		struct inode *inode = fio->page->mapping->host;
 
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+		int type;
+#endif
 		if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
 			return CURSEG_COLD_DATA_PINNED;
 
@@ -3176,6 +3179,12 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 		}
 		if (file_is_cold(inode) || f2fs_need_compress_data(inode))
 			return CURSEG_COLD_DATA;
+
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+		type = f2fs_get_data_segment_type(inode, fio->page->index);
+		if (type != NO_CHECK_TYPE)
+			return type;
+#endif
 		if (file_is_hot(inode) ||
 				is_inode_flag_set(inode, FI_HOT_DATA) ||
 				f2fs_is_cow_file(inode))
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index df27afd71ef4..68ba8c1c2cb3 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -648,6 +648,25 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		sbi->revoked_atomic_block = 0;
 		return count;
 	}
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	if (!strcmp(a->attr.name, "hot_data_age_threshold")) {
+		if (t == 0 || t >= sbi->warm_data_age_threshold)
+			return -EINVAL;
+		if (t == *ui)
+			return count;
+		*ui = (unsigned int)t;
+		return count;
+	}
+
+	if (!strcmp(a->attr.name, "warm_data_age_threshold")) {
+		if (t == 0 || t <= sbi->hot_data_age_threshold)
+			return -EINVAL;
+		if (t == *ui)
+			return count;
+		*ui = (unsigned int)t;
+		return count;
+	}
+#endif
 
 	*ui = (unsigned int)t;
 
@@ -902,6 +921,11 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, peak_atomic_write, peak_atomic_write);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, committed_atomic_block, committed_atomic_block);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, revoked_atomic_block, revoked_atomic_block);
 
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, hot_data_age_threshold, hot_data_age_threshold);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, warm_data_age_threshold, warm_data_age_threshold);
+#endif
+
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
 static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_urgent_sleep_time),
@@ -995,6 +1019,10 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(peak_atomic_write),
 	ATTR_LIST(committed_atomic_block),
 	ATTR_LIST(revoked_atomic_block),
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	ATTR_LIST(hot_data_age_threshold),
+	ATTR_LIST(warm_data_age_threshold),
+#endif
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index b19c057ff801..0adb26397e68 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1692,7 +1692,7 @@ DECLARE_EVENT_CLASS(f2fs_add_age_extent_node,
 		__entry->blocks = ei->last_blocks;
 	),
 
-	TP_printk("dev = (%d,%d), ino = %lu, node_cnt = %lu, "
+	TP_printk("dev = (%d,%d), ino = %lu, node_cnt = %u, "
 		"age_ext_info(fofs: %u, len: %u, age: %llu, blocks: %llu)",
 		show_dev_ino(__entry),
 		__entry->cnt,
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
