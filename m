Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6095E33AD1C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Mar 2021 09:12:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lLiLQ-0004sM-6L; Mon, 15 Mar 2021 08:12:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <daeho43@gmail.com>) id 1lLiLP-0004sF-Dz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Mar 2021 08:12:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R2DgrG9cCQ/VyW56awRmKaR+vSbaA2HjfGG10SFlQJ8=; b=dmDzYppUL3gLG/JHyUU3craHlx
 UFhEwhGVKjVDSoo6+s6LBJNeF8HLlYXwa1XEBEUiVgsFeQnb6b4LCPjUCWRCFhzV+YxDJAMgwNEoB
 w6rLUcJkLCnlZw4Vgz3A+atJwuHvAjFTp/IRyGSelLNUXbv9mta/QjQsd4PSLObMaMxg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=R2DgrG9cCQ/VyW56awRmKaR+vSbaA2HjfGG10SFlQJ8=; b=S
 c8A0zcCPYqaETc+ML9s25dES5o+Cxi+jIO3/V5v6oghcYoK9tXv0LajyU0Gl1Pwf/3aMf2sbSkkMX
 hIQCUDumBh8PC52yLjD1M/xF0bAUoVH7cQrN9O9cbzZU7rzVBQ4u+k0QMr0vx31Vgkf4vjYnS9R08
 wN3dYOn55Do7BMG8=;
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lLiLF-0000fK-Rs
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Mar 2021 08:12:55 +0000
Received: by mail-pf1-f178.google.com with SMTP id x7so6065798pfi.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Mar 2021 01:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R2DgrG9cCQ/VyW56awRmKaR+vSbaA2HjfGG10SFlQJ8=;
 b=f1AUZBH2EO04x7ODrbKy01jzjCPMEXgrzXxsAEAvbc1X/cXuNUjqPcf/5duQGB5//g
 HI+LT8TD1ggVT3lXRu2NIkKNPyYB+8gZz921R3BviON/WFxCxdBHsb/STb8Pxkum9QRM
 fLdpvu3Ad9y48G32l5DvK80z4UcS4rt+Sgmetx2Hh4+pHIkg5NsV9uxZtapFQNU7rQQ4
 5f1IRJD1bFCZ1NEgqZIAEcVCdTJz+X4r1cCT9vpKYXG8rZ3G0SkeRti9tgNgmlmi0PEj
 jfm/Wu2l+Am9DY59eqg8Q8cZ6jRlCeSty+tT+xvaGKg4zLO7dGXmJQigrC7CEZbBd7we
 Z2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R2DgrG9cCQ/VyW56awRmKaR+vSbaA2HjfGG10SFlQJ8=;
 b=XKflOYFTPwfwNs9iMuRGNcH/ZM9WE4lj4n+Jl6+ACg2tl0q2xKq86Jc36N/kRjj3z0
 8HhK959P/+jXTZ7Tn3k3/9LbkST35wSDW2zPsVi3Y3DivcGIlhAgolQQLlKQkKLOpqvs
 xmFG7y8drsgGHdM5BWzg8HORA7zI0HdxAIHvmwsGeW8yJW+J/o3xTXNj4DsBE2/LAriY
 kTtiGfFMyHd/isKdcTMK9M5l0u3Y0gOxZGLOcepVD1gI8l7U1ccn/aUy4ML5rdo5agaN
 FlIFCnb4iH/2mJ0thPn8fvO08dIaGXj04GagkRp3OhmBWcF5gUX3sQKUrNqJlV6FcO1n
 ju6w==
X-Gm-Message-State: AOAM53127n/N+hmmQqPmCyCX6QLHE7L/c+/mIvyFVuIG+Dyg4iz+VedF
 REhk7zMrqhTC4z94nAXcgIY=
X-Google-Smtp-Source: ABdhPJxm2AMkqacPwylIlil+tnlWhN57D/cpL5ino0UMZKCtSf2vHXEd0WVc/kTeOrHVw+Hs9LRaDA==
X-Received: by 2002:a62:17c4:0:b029:1f5:7cfe:ebc4 with SMTP id
 187-20020a6217c40000b02901f57cfeebc4mr23243360pfx.5.1615795960209; 
 Mon, 15 Mar 2021 01:12:40 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:546:2cb6:224c:a739])
 by smtp.gmail.com with ESMTPSA id d2sm9909424pjx.42.2021.03.15.01.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 01:12:39 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 15 Mar 2021 17:12:33 +0900
Message-Id: <20210315081233.3603648-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.178 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.178 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lLiLF-0000fK-Rs
Subject: [f2fs-dev] [PATCH v5] f2fs: add sysfs nodes to get runtime
 compression stat
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

I've added new sysfs nodes to show runtime compression stat since mount.
compr_written_block - show the block count written after compression
compr_saved_block - show the saved block count with compression
compr_new_inode - show the count of inode newly enabled for compression

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2: thanks to kernel test robot <lkp@intel.com>, fixed compile issue
    related to kernel config
v3: changed sysfs nodes' names and made them runtime stat, not
    persistent on disk
v4: changed sysfs nodes' desctiption
v5: changed not to use atomic values
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 24 ++++++++++++++++
 fs/f2fs/compress.c                      |  1 +
 fs/f2fs/f2fs.h                          | 19 +++++++++++++
 fs/f2fs/sysfs.c                         | 38 +++++++++++++++++++++++++
 4 files changed, 82 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index cbeac1bebe2f..ddd4bd6116fc 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -409,3 +409,27 @@ Description:	Give a way to change checkpoint merge daemon's io priority.
 		I/O priority "3". We can select the class between "rt" and "be",
 		and set the I/O priority within valid range of it. "," delimiter
 		is necessary in between I/O class and priority number.
+
+What:		/sys/fs/f2fs/<disk>/compr_written_block
+Date:		March 2021
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	Show the block count written after compression since mount. Note
+		that when the compressed blocks are deleted, this count doesn't
+		decrease. If you write "0" here, you can initialize
+		compr_written_block and compr_saved_block to "0".
+
+What:		/sys/fs/f2fs/<disk>/compr_saved_block
+Date:		March 2021
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	Show the saved block count with compression since mount. Note
+		that when the compressed blocks are deleted, this count doesn't
+		decrease. If you write "0" here, you can initialize
+		compr_written_block and compr_saved_block to "0".
+
+What:		/sys/fs/f2fs/<disk>/compr_new_inode
+Date:		March 2021
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	Show the count of inode newly enabled for compression since mount.
+		Note that when the compression is disabled for the files, this count
+		doesn't decrease. If you write "0" here, you can initialize
+		compr_new_inode to "0".
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 77fa342de38f..3c9d797dbdd6 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1353,6 +1353,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	if (fio.compr_blocks)
 		f2fs_i_compr_blocks_update(inode, fio.compr_blocks - 1, false);
 	f2fs_i_compr_blocks_update(inode, cc->nr_cpages, true);
+	add_compr_block_stat(inode, cc->nr_cpages);
 
 	set_inode_flag(cc->inode, FI_APPEND_WRITE);
 	if (cc->cluster_idx == 0)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e2d302ae3a46..ae7e08aa7d87 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1623,6 +1623,11 @@ struct f2fs_sb_info {
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	struct kmem_cache *page_array_slab;	/* page array entry */
 	unsigned int page_array_slab_size;	/* default page array slab size */
+
+	/* For runtime compression statistics */
+	u64 compr_written_block;
+	u64 compr_saved_block;
+	u32 compr_new_inode;
 #endif
 };
 
@@ -3955,6 +3960,18 @@ int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi);
 void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi);
 int __init f2fs_init_compress_cache(void);
 void f2fs_destroy_compress_cache(void);
+#define inc_compr_inode_stat(inode)					\
+	do {								\
+		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);		\
+		sbi->compr_new_inode++;					\
+	} while (0)
+#define add_compr_block_stat(inode, blocks)				\
+	do {								\
+		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);		\
+		int diff = F2FS_I(inode)->i_cluster_size - blocks;	\
+		sbi->compr_written_block += blocks;			\
+		sbi->compr_saved_block += diff;				\
+	} while (0)
 #else
 static inline bool f2fs_is_compressed_page(struct page *page) { return false; }
 static inline bool f2fs_is_compress_backend_ready(struct inode *inode)
@@ -3983,6 +4000,7 @@ static inline int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi) { return
 static inline void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi) { }
 static inline int __init f2fs_init_compress_cache(void) { return 0; }
 static inline void f2fs_destroy_compress_cache(void) { }
+#define inc_compr_inode_stat(inode)		do { } while (0)
 #endif
 
 static inline void set_compress_context(struct inode *inode)
@@ -4006,6 +4024,7 @@ static inline void set_compress_context(struct inode *inode)
 	F2FS_I(inode)->i_flags |= F2FS_COMPR_FL;
 	set_inode_flag(inode, FI_COMPRESSED_FILE);
 	stat_inc_compr_inode(inode);
+	inc_compr_inode_stat(inode);
 	f2fs_mark_inode_dirty_sync(inode, true);
 }
 
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index e38a7f6921dd..a166eebbe019 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -12,6 +12,7 @@
 #include <linux/seq_file.h>
 #include <linux/unicode.h>
 #include <linux/ioprio.h>
+#include <linux/sysfs.h>
 
 #include "f2fs.h"
 #include "segment.h"
@@ -282,6 +283,17 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 		return len;
 	}
 
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	if (!strcmp(a->attr.name, "compr_written_block"))
+		return sysfs_emit(buf, "%llu\n", sbi->compr_written_block);
+
+	if (!strcmp(a->attr.name, "compr_saved_block"))
+		return sysfs_emit(buf, "%llu\n", sbi->compr_saved_block);
+
+	if (!strcmp(a->attr.name, "compr_new_inode"))
+		return sysfs_emit(buf, "%u\n", sbi->compr_new_inode);
+#endif
+
 	ui = (unsigned int *)(ptr + a->offset);
 
 	return sprintf(buf, "%u\n", *ui);
@@ -458,6 +470,24 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	if (!strcmp(a->attr.name, "compr_written_block") ||
+		!strcmp(a->attr.name, "compr_saved_block")) {
+		if (t != 0)
+			return -EINVAL;
+		sbi->compr_written_block = 0;
+		sbi->compr_saved_block = 0;
+		return count;
+	}
+
+	if (!strcmp(a->attr.name, "compr_new_inode")) {
+		if (t != 0)
+			return -EINVAL;
+		sbi->compr_new_inode = 0;
+		return count;
+	}
+#endif
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -668,6 +698,9 @@ F2FS_FEATURE_RO_ATTR(sb_checksum, FEAT_SB_CHECKSUM);
 F2FS_FEATURE_RO_ATTR(casefold, FEAT_CASEFOLD);
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 F2FS_FEATURE_RO_ATTR(compression, FEAT_COMPRESSION);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_written_block, compr_written_block);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_saved_block, compr_saved_block);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_new_inode, compr_new_inode);
 #endif
 
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
@@ -730,6 +763,11 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(moved_blocks_foreground),
 	ATTR_LIST(moved_blocks_background),
 	ATTR_LIST(avg_vblocks),
+#endif
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	ATTR_LIST(compr_written_block),
+	ATTR_LIST(compr_saved_block),
+	ATTR_LIST(compr_new_inode),
 #endif
 	NULL,
 };
-- 
2.31.0.rc2.261.g7f71774620-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
