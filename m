Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 11893338CB0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Mar 2021 13:25:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lKgrW-0005Dc-TR; Fri, 12 Mar 2021 12:25:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1lKgrV-0005DV-9A
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Mar 2021 12:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=heFiHRJ+yDXxsvP4FofmW3y6eiqEITqgGlgBBBwjlWI=; b=gp6FRb+U9v7fGSFmLG9wGG9UbF
 aOp0UJKl/5t6DL8X/Zk1CAVPva2rjfndhFVZtZa6LnocUsZSKY0GzcEHV1+pgRF0CieILO4MrBFSw
 bi1pYTNXVlWnlOGfJPPA9wx/jxXrJmP++otHGdNlSU++W+ClfEet33bEKSVGpmLk/QF0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=heFiHRJ+yDXxsvP4FofmW3y6eiqEITqgGlgBBBwjlWI=; b=E
 IneEY5KRk0e/jSiE/zyOLKN6diLDVL9Z/OoxH3+bM521HLhoeoGa4xCPSszGpajbufaIDMvyZ6w42
 bvSF6edRA+u9Fm7nVnLG/zrqyhOJXzaYcWjm+qyAyniaE1Dw+JQmc2R6VDfjHWAs+DIvcWOUTeLx9
 ejw+NjLP8PNsmFZE=;
Received: from mail-pj1-f48.google.com ([209.85.216.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lKgrP-00010c-OI
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Mar 2021 12:25:49 +0000
Received: by mail-pj1-f48.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso10992396pjb.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Mar 2021 04:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=heFiHRJ+yDXxsvP4FofmW3y6eiqEITqgGlgBBBwjlWI=;
 b=rc85kEb472JL3UTVxb/VSg9CshQzVlWaps9ym3rGDLm9Kev+oXifXhdSNATALoko3r
 T/EPPKN33y8081b0eCP/BJJ0FdwQI1Q+En1+BKnnzH1Qcd3saEaQiEtmSzO74NIffsYk
 CRw/rN+q/3p7OFTnPletzuXHCNFIE6UMvuNSEqARRu8mf7g+ZrCzDfJBV+RyAAViSmHw
 4GIx+mopjgpqdJ+uALQcKr7eU5sNaI/6Q05JMw7b0TJyYwA8PfigWJPDzwq8YLRU1qYC
 bxgE3wdxwiwt8bfzTfnpuUljLtcP5bqEbRAdRFxmbpPz1/QnqV8CHlWTFKXKdwIgpag2
 16yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=heFiHRJ+yDXxsvP4FofmW3y6eiqEITqgGlgBBBwjlWI=;
 b=iJpd6j64K/JqKyDTi3QaKK54gfXF9Rm9WhCy0kTraaMhO1mbzq7JYx3UVMIfsyMYe7
 3rJEM7iK2/GEEObnz2zOKbfeaAwJPaE612rbhl2rLcTdbJ0XsHk6lcVKy6nEKnCwcqig
 UoLYhO9oEmb3+54xOyUd7C/fu2qUxGCfgNYNRSXqGbd9GpkUvJkLPD8iJyrl4l4ltDo1
 JphsiPfxhiljPvhuoGgq+3uuO/npbZAYIZNorNotAa57lgQgPTD9BL8Q3rc4WnK1diRs
 7kuDOKYWd7HoaNnrt7w4ZluVSIdrGr8xRE/otaEPRcNiwwjoHdnYraLHQvZAf/Gsozyx
 X1dw==
X-Gm-Message-State: AOAM532GKHLQuvlHcR2aoXpRSI9Q44fcORv0ueFw8GHgmHjC+OupYfSv
 +O5P7Z2ioIFWkEiVYAoJcsE=
X-Google-Smtp-Source: ABdhPJw49vEPwgasfueeMIIdV9hd8xf4AElMcbJp+JvjHlOxYZneNew9PD1sNKND+95PUq5jk5+aWw==
X-Received: by 2002:a17:90a:bd97:: with SMTP id
 z23mr14381546pjr.189.1615551938111; 
 Fri, 12 Mar 2021 04:25:38 -0800 (PST)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:addc:c0e1:9aed:6202])
 by smtp.gmail.com with ESMTPSA id iq6sm2208956pjb.31.2021.03.12.04.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 04:25:37 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 12 Mar 2021 21:25:31 +0900
Message-Id: <20210312122531.2717093-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.48 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.48 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lKgrP-00010c-OI
Subject: [f2fs-dev] [PATCH v4] f2fs: add sysfs nodes to get runtime
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
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 24 ++++++++++
 fs/f2fs/compress.c                      |  1 +
 fs/f2fs/f2fs.h                          | 19 ++++++++
 fs/f2fs/super.c                         |  7 +++
 fs/f2fs/sysfs.c                         | 58 +++++++++++++++++++++++++
 5 files changed, 109 insertions(+)

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
index e2d302ae3a46..2c989f8caf05 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1623,6 +1623,11 @@ struct f2fs_sb_info {
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	struct kmem_cache *page_array_slab;	/* page array entry */
 	unsigned int page_array_slab_size;	/* default page array slab size */
+
+	/* For runtime compression statistics */
+	atomic64_t compr_written_block;
+	atomic64_t compr_saved_block;
+	atomic_t compr_new_inode;
 #endif
 };
 
@@ -3955,6 +3960,18 @@ int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi);
 void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi);
 int __init f2fs_init_compress_cache(void);
 void f2fs_destroy_compress_cache(void);
+#define inc_compr_inode_stat(inode)					\
+	do {								\
+		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);		\
+		atomic_inc(&sbi->compr_new_inode);			\
+	} while (0)
+#define add_compr_block_stat(inode, blocks)				\
+	do {								\
+		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);		\
+		int diff = F2FS_I(inode)->i_cluster_size - blocks;	\
+		atomic64_add(blocks, &sbi->compr_written_block);	\
+		atomic64_add(diff, &sbi->compr_saved_block);		\
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
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 7069793752f1..88d9ecdee8d3 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3260,6 +3260,13 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 
 	init_rwsem(&sbi->sb_lock);
 	init_rwsem(&sbi->pin_sem);
+
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	/* For runtime compression statistics */
+	atomic64_set(&sbi->compr_written_block, 0);
+	atomic64_set(&sbi->compr_saved_block, 0);
+	atomic_set(&sbi->compr_new_inode, 0);
+#endif
 }
 
 static int init_percpu_info(struct f2fs_sb_info *sbi)
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index e38a7f6921dd..2b6e5e6e1286 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -282,6 +282,38 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 		return len;
 	}
 
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	if (!strcmp(a->attr.name, "compr_written_block")) {
+		u64 bcount;
+		int len;
+
+		bcount = atomic64_read(&sbi->compr_written_block);
+
+		len = scnprintf(buf, PAGE_SIZE, "%llu\n", bcount);
+		return len;
+	}
+
+	if (!strcmp(a->attr.name, "compr_saved_block")) {
+		u64 bcount;
+		int len;
+
+		bcount = atomic64_read(&sbi->compr_saved_block);
+
+		len = scnprintf(buf, PAGE_SIZE, "%llu\n", bcount);
+		return len;
+	}
+
+	if (!strcmp(a->attr.name, "compr_new_inode")) {
+		u32 icount;
+		int len;
+
+		icount = atomic_read(&sbi->compr_new_inode);
+
+		len = scnprintf(buf, PAGE_SIZE, "%u\n", icount);
+		return len;
+	}
+#endif
+
 	ui = (unsigned int *)(ptr + a->offset);
 
 	return sprintf(buf, "%u\n", *ui);
@@ -458,6 +490,24 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	if (!strcmp(a->attr.name, "compr_written_block") ||
+		!strcmp(a->attr.name, "compr_saved_block")) {
+		if (t != 0)
+			return -EINVAL;
+		atomic64_set(&sbi->compr_written_block, 0);
+		atomic64_set(&sbi->compr_saved_block, 0);
+		return count;
+	}
+
+	if (!strcmp(a->attr.name, "compr_new_inode")) {
+		if (t != 0)
+			return -EINVAL;
+		atomic_set(&sbi->compr_new_inode, 0);
+		return count;
+	}
+#endif
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -668,6 +718,9 @@ F2FS_FEATURE_RO_ATTR(sb_checksum, FEAT_SB_CHECKSUM);
 F2FS_FEATURE_RO_ATTR(casefold, FEAT_CASEFOLD);
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 F2FS_FEATURE_RO_ATTR(compression, FEAT_COMPRESSION);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_written_block, compr_written_block);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_saved_block, compr_saved_block);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_new_inode, compr_new_inode);
 #endif
 
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
@@ -730,6 +783,11 @@ static struct attribute *f2fs_attrs[] = {
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
