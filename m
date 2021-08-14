Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9486C3EC208
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Aug 2021 12:37:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mEr2U-000194-MW; Sat, 14 Aug 2021 10:37:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <frank.li@vivo.com>) id 1mEr2S-00018t-MV
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 Aug 2021 10:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JLxFXfJsdSWl3EWlYpUqqzXgD4pgtXf3p1PydiBH9zw=; b=VC+9S7/fkSmPNVhD9BdqwVLCh2
 AMmcnwHZZs1MMAQeoiuNP5oRNZBDQWZ0R4TsgL/gDQYYTbkjL1G4gUwazvxDc8etQ8JK66CxptUEJ
 EhotzyMiL9r7XghcRLd0uqQ2HmwV86U2ez2aThmt+qH+YRk7X4pEJJhsOwmT5F4l/5MQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JLxFXfJsdSWl3EWlYpUqqzXgD4pgtXf3p1PydiBH9zw=; b=g5FDJ5fnzv/bL4Q+CxvacRHxxT
 l4tpBJcnNOTa6VpcuHHDhZDsyhhShgEIfYV1eKATXIiQsUag3WvAVEx5Ba9Birg84QIFpyElrPmgV
 n7rQb6zyIyhxS9YwpUnOobH7sJYwEefbDjCqKHfZmC8wM4DpCveUkPr497nUPHxeRYVg=;
Received: from mail-m17636.qiye.163.com ([59.111.176.36])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mEr2P-0003SC-F2
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 Aug 2021 10:37:16 +0000
Received: from comdg01144022.vivo.xyz (unknown [218.104.188.165])
 by mail-m17636.qiye.163.com (Hmail) with ESMTPA id 394F3C4010B;
 Sat, 14 Aug 2021 18:37:06 +0800 (CST)
From: Yangtao Li <frank.li@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 14 Aug 2021 18:37:02 +0800
Message-Id: <20210814103702.52405-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210814103702.52405-1-frank.li@vivo.com>
References: <20210814103702.52405-1-frank.li@vivo.com>
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUJIGEJWSE9IHUkfGU4YQ0
 tIVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PAw6Cio6Cz9JSB8#GTQBViM2
 AjYwCQ5VSlVKTUlDQkhMT0lNQ0tNVTMWGhIXVR0JGhUQVRcSOw0SDRRVGBQWRVlXWRILWUFZSUpD
 VUpLT1VKQ0NVSk1OWVdZCAFZQUxITkw3Bg++
X-HM-Tid: 0a7b443c95ccd996kuws394f3c4010b
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.36 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1mEr2P-0003SC-F2
Subject: [f2fs-dev] [PATCH v6] f2fs: introduce
 /sys/fs/f2fs/<disk>/fsck_stack node
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SBI_NEED_FSCK is an indicator that fsck.f2fs needs to be triggered,
this flag is set in too many places. For some scenes that are not very
reproducible, adding stack information will help locate the problem.

Let's record all fsck stack history, I added F2FS_FSCK_STACK_TRACE
configuration options and sysfs nodes. After opening the configuration
options and enabling the node, it will start recording. The recorded
stack information will not be clear, and we can get information form
kernel log.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  7 ++++
 fs/f2fs/Kconfig                         | 10 ++++++
 fs/f2fs/f2fs.h                          | 45 +++++++++++++++++++++++++
 fs/f2fs/sysfs.c                         | 27 +++++++++++++++
 4 files changed, 89 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index ef4b9218ae1e..047c398093cf 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -493,3 +493,10 @@ Contact:	"Chao Yu" <yuchao0@huawei.com>
 Description:	When ATGC is on, it controls age threshold to bypass GCing young
 		candidates whose age is not beyond the threshold, by default it was
 		initialized as 604800 seconds (equals to 7 days).
+
+What:		/sys/fs/f2fs/<disk>/fsck_stack
+Date:		August 2021
+Contact:	"Yangtao Li" <frank.li@vivo.com>
+Description:	Controls to enable/disable fsck stack trace, you can get stack
+		information from kernel log. Note that the recorded stack information
+		will not be cleared.
diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 7669de7b49ce..f451e567e4a8 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -135,3 +135,13 @@ config F2FS_FS_LZORLE
 	default y
 	help
 	  Support LZO-RLE compress algorithm, if unsure, say Y.
+
+config F2FS_FSCK_STACK_TRACE
+	bool "F2FS fsck stack information record"
+	depends on F2FS_FS
+	depends on STACKDEPOT
+	default y
+	help
+	 Support printing out fsck stack history. With this, you have to
+	 turn on "fsck_stack" sysfs node. Then you can get information
+	 from kernel log.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ee8eb33e2c25..b2d1d1a5a3fc 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -24,6 +24,8 @@
 #include <linux/quotaops.h>
 #include <linux/part_stat.h>
 #include <crypto/hash.h>
+#include <linux/stackdepot.h>
+#include <linux/stacktrace.h>
 
 #include <linux/fscrypt.h>
 #include <linux/fsverity.h>
@@ -117,6 +119,8 @@ typedef u32 nid_t;
 
 #define COMPRESS_EXT_NUM		16
 
+#define FSCK_STACK_DEPTH		64
+
 struct f2fs_mount_info {
 	unsigned int opt;
 	int write_io_size_bits;		/* Write IO size bits */
@@ -1748,6 +1752,11 @@ struct f2fs_sb_info {
 	unsigned int compress_watermark;	/* cache page watermark */
 	atomic_t compress_page_hit;		/* cache hit count */
 #endif
+#ifdef CONFIG_F2FS_FSCK_STACK_TRACE
+	depot_stack_handle_t *fsck_stack_history;
+	unsigned int fsck_count;
+	bool fsck_stack;
+#endif
 };
 
 struct f2fs_private_dio {
@@ -1954,6 +1963,38 @@ static inline struct address_space *NODE_MAPPING(struct f2fs_sb_info *sbi)
 	return sbi->node_inode->i_mapping;
 }
 
+#ifdef CONFIG_F2FS_FSCK_STACK_TRACE
+static void fsck_stack_trace(struct f2fs_sb_info *sbi)
+{
+	unsigned long entries[FSCK_STACK_DEPTH];
+	depot_stack_handle_t stack, *new;
+	unsigned int nr_entries;
+	int i;
+
+	if (!sbi->fsck_stack)
+		return;
+
+	nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 0);
+	nr_entries = filter_irq_stacks(entries, nr_entries);
+	stack = stack_depot_save(entries, nr_entries, GFP_KERNEL);
+	if (!stack)
+		return;
+
+	/* Try to find an existing entry for this backtrace */
+	for (i = 0; i < sbi->fsck_count; i++)
+		if (sbi->fsck_stack_history[i] == stack)
+			return;
+
+	new = krealloc(sbi->fsck_stack_history, (sbi->fsck_count + 1) *
+		       sizeof(*sbi->fsck_stack_history), GFP_KERNEL);
+	if (!new)
+		return;
+
+	sbi->fsck_stack_history = new;
+	sbi->fsck_stack_history[sbi->fsck_count++] = stack;
+}
+#endif
+
 static inline bool is_sbi_flag_set(struct f2fs_sb_info *sbi, unsigned int type)
 {
 	return test_bit(type, &sbi->s_flag);
@@ -1962,6 +2003,10 @@ static inline bool is_sbi_flag_set(struct f2fs_sb_info *sbi, unsigned int type)
 static inline void set_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
 {
 	set_bit(type, &sbi->s_flag);
+#ifdef CONFIG_F2FS_FSCK_STACK_TRACE
+	if (unlikely(type == SBI_NEED_FSCK))
+		fsck_stack_trace(sbi);
+#endif
 }
 
 static inline void clear_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 204de4c2c818..4e786bb797e7 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -306,6 +306,26 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 	if (!strcmp(a->attr.name, "compr_new_inode"))
 		return sysfs_emit(buf, "%u\n", sbi->compr_new_inode);
 #endif
+#ifdef CONFIG_F2FS_FSCK_STACK_TRACE
+	if (!strcmp(a->attr.name, "fsck_stack")) {
+		unsigned long *entries;
+		unsigned int nr_entries;
+		unsigned int i;
+		int count;
+
+		count = sysfs_emit(buf, "%u\n", sbi->fsck_stack);
+		if (!sbi->fsck_stack)
+			return count;
+
+		for (i = 0; i < sbi->fsck_count; i++) {
+			nr_entries = stack_depot_fetch(sbi->fsck_stack_history[i], &entries);
+			if (!entries)
+				return count;
+			stack_trace_print(entries, nr_entries, 0);
+		}
+		return count;
+	}
+#endif
 
 	ui = (unsigned int *)(ptr + a->offset);
 
@@ -740,6 +760,10 @@ F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_count, max_candidate_cou
 F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_weight, age_weight);
 F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_threshold, age_threshold);
 
+#ifdef CONFIG_F2FS_FSCK_STACK_TRACE
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, fsck_stack, fsck_stack);
+#endif
+
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
 static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_urgent_sleep_time),
@@ -812,6 +836,9 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(atgc_candidate_count),
 	ATTR_LIST(atgc_age_weight),
 	ATTR_LIST(atgc_age_threshold),
+#ifdef CONFIG_F2FS_FSCK_STACK_TRACE
+	ATTR_LIST(fsck_stack),
+#endif
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
