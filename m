Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF4F8FAB9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2019 08:17:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hyVXy-0002hE-Ow; Fri, 16 Aug 2019 06:17:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chandan@linux.ibm.com>) id 1hyVXw-0002gX-2b
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 06:17:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZlLz6w5MdRDzd0IGZCF3txeu5Ul4SrlqBTrxC9XXwhQ=; b=SrTEjAULNtG0G4BvxgTbswfCz6
 5MhJAHWLgsQAIMrTm5VGCDZnjsKrqRATguHgKQOkksXi42ToQNPw3mdbaztIOOcEec9pNXmaQ8ymU
 tYTof6XNkupXugHcc7D2lxGXhak0J65rbWydMktWnrQQ2VdvqZsefjnWd9TLgeTx3/qs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZlLz6w5MdRDzd0IGZCF3txeu5Ul4SrlqBTrxC9XXwhQ=; b=ZXIxkqHvUGPKJlKHkvEB8e5g0L
 EsJa/vh9Qmb5th52tA0+OeKWMX12TmecLh3nxX5z10pUz4bEsFVm/sqGChd3WIucKcYZ23m31JxL/
 FUmtC06pusdGnP6mQ9JY3BigDw6F3LxtBDVo4TsrZueb5Lcy6wH4DU9oKiOvzGFGOjnY=;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hyVXl-005YI0-CL
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 06:17:07 +0000
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7G64RPu137739
 for <linux-f2fs-devel@lists.sourceforge.net>; Fri, 16 Aug 2019 02:16:51 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2udp3yss81-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>; Fri, 16 Aug 2019 02:16:51 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-f2fs-devel@lists.sourceforge.net> from <chandan@linux.ibm.com>;
 Fri, 16 Aug 2019 07:16:50 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 16 Aug 2019 07:16:46 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7G6GjiN12583234
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Aug 2019 06:16:45 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB52F112064;
 Fri, 16 Aug 2019 06:16:45 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD114112061;
 Fri, 16 Aug 2019 06:16:42 +0000 (GMT)
Received: from localhost.in.ibm.com (unknown [9.124.35.23])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 16 Aug 2019 06:16:42 +0000 (GMT)
From: Chandan Rajendra <chandan@linux.ibm.com>
To: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org
Date: Fri, 16 Aug 2019 11:47:58 +0530
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190816061804.14840-1-chandan@linux.ibm.com>
References: <20190816061804.14840-1-chandan@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19081606-2213-0000-0000-000003BC996C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011597; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01247516; UDB=6.00658410; IPR=6.01029025; 
 MB=3.00028195; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-16 06:16:49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081606-2214-0000-0000-00005FAA3692
Message-Id: <20190816061804.14840-3-chandan@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908160066
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hyVXl-005YI0-CL
Subject: [f2fs-dev] [PATCH V4 2/8] FS: Introduce read callbacks
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
Cc: hch@infradead.org, tytso@mit.edu, ebiggers@kernel.org,
 Chandan Rajendra <chandan@linux.ibm.com>, adilger.kernel@dilger.ca,
 chandanrmail@gmail.com, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Read callbacks implements a state machine to be executed after a
buffered read I/O is completed. They help in further processing the file
data read from the backing store. Currently, decryption is the only post
processing step to be supported.

The execution of the state machine is to be initiated by the endio
function associated with the read operation.

Signed-off-by: Chandan Rajendra <chandan@linux.ibm.com>
---
 fs/Kconfig                     |   3 +
 fs/Makefile                    |   1 +
 fs/ext4/Kconfig                |   1 +
 fs/f2fs/Kconfig                |   1 +
 fs/read_callbacks.c            | 285 +++++++++++++++++++++++++++++++++
 include/linux/read_callbacks.h |  48 ++++++
 6 files changed, 339 insertions(+)
 create mode 100644 fs/read_callbacks.c
 create mode 100644 include/linux/read_callbacks.h

diff --git a/fs/Kconfig b/fs/Kconfig
index 3e6d3101f3ff..2d96a58d7418 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -20,6 +20,9 @@ if BLOCK
 config FS_IOMAP
 	bool
 
+config FS_READ_CALLBACKS
+	bool
+
 source "fs/ext2/Kconfig"
 source "fs/ext4/Kconfig"
 source "fs/jbd2/Kconfig"
diff --git a/fs/Makefile b/fs/Makefile
index 427fec226fae..942808f83472 100644
--- a/fs/Makefile
+++ b/fs/Makefile
@@ -53,6 +53,7 @@ obj-$(CONFIG_SYSCTL)		+= drop_caches.o
 
 obj-$(CONFIG_FHANDLE)		+= fhandle.o
 obj-$(CONFIG_FS_IOMAP)		+= iomap.o
+obj-$(CONFIG_FS_READ_CALLBACKS) += read_callbacks.o
 
 obj-y				+= quota/
 
diff --git a/fs/ext4/Kconfig b/fs/ext4/Kconfig
index 06f77ca7f36e..2e24df67f085 100644
--- a/fs/ext4/Kconfig
+++ b/fs/ext4/Kconfig
@@ -38,6 +38,7 @@ config EXT4_FS
 	select CRYPTO
 	select CRYPTO_CRC32C
 	select FS_IOMAP
+	select FS_READ_CALLBACKS if FS_ENCRYPTION
 	help
 	  This is the next generation of the ext3 filesystem.
 
diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index e57cc754d543..1e1424940d1b 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -4,6 +4,7 @@ config F2FS_FS
 	select CRYPTO
 	select CRYPTO_CRC32
 	select F2FS_FS_XATTR if FS_ENCRYPTION
+	select FS_READ_CALLBACKS if FS_ENCRYPTION
 	help
 	  F2FS is based on Log-structured File System (LFS), which supports
 	  versatile "flash-friendly" features. The design has been focused on
diff --git a/fs/read_callbacks.c b/fs/read_callbacks.c
new file mode 100644
index 000000000000..32d9b8d17964
--- /dev/null
+++ b/fs/read_callbacks.c
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This file tracks the state machine that needs to be executed after reading
+ * data from files that are encrypted and/or have verity metadata associated
+ * with them.
+ */
+#include <linux/module.h>
+#include <linux/mm.h>
+#include <linux/pagemap.h>
+#include <linux/bio.h>
+#include <linux/buffer_head.h>
+#include <linux/fscrypt.h>
+#include <linux/read_callbacks.h>
+#include <linux/blk_types.h>
+
+#define NUM_PREALLOC_READ_CALLBACK_CTXS	128
+
+static struct kmem_cache *read_callbacks_ctx_cache;
+static mempool_t *read_callbacks_ctx_pool;
+
+/* Read callback state machine steps */
+enum read_callbacks_step {
+	STEP_INITIAL = 0,
+	STEP_DECRYPT,
+};
+
+struct read_callbacks_ctx {
+	struct inode *inode;
+	struct bio *bio;
+	struct buffer_head *bh;
+	union {
+		end_bio_func_t end_bio;
+
+		struct {
+			end_bh_func_t end_bh;
+			int bh_uptodate;
+		};
+	};
+	struct work_struct work;
+	unsigned int enabled_steps;
+	enum read_callbacks_step cur_step;
+};
+
+static void read_callbacks(struct read_callbacks_ctx *ctx);
+
+static void free_read_callbacks_ctx(struct read_callbacks_ctx *ctx)
+{
+	mempool_free(ctx, read_callbacks_ctx_pool);
+}
+
+static struct read_callbacks_ctx *get_read_callbacks_ctx(struct inode *inode)
+{
+	struct read_callbacks_ctx *ctx = NULL;
+	unsigned int enabled_steps = 0;
+
+	if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode))
+		enabled_steps |= 1 << STEP_DECRYPT;
+
+	if (enabled_steps) {
+		ctx = mempool_alloc(read_callbacks_ctx_pool, GFP_NOFS);
+		if (!ctx)
+			return ERR_PTR(-ENOMEM);
+
+		ctx->inode = inode;
+		ctx->enabled_steps = enabled_steps;
+		ctx->cur_step = STEP_INITIAL;
+	}
+
+	return ctx;
+}
+
+static void decrypt_bio(struct bio *bio)
+{
+	struct bio_vec *bv;
+	int i;
+	struct bvec_iter_all iter_all;
+
+	bio_for_each_segment_all(bv, bio, i, iter_all) {
+		struct page *page = bv->bv_page;
+		int ret = fscrypt_decrypt_pagecache_blocks(page, bv->bv_len,
+							   bv->bv_offset);
+		if (ret)
+			SetPageError(page);
+	}
+}
+
+static void decrypt_bh(struct buffer_head *bh)
+{
+	struct page *page;
+	int ret;
+
+	page = bh->b_page;
+
+	ret = fscrypt_decrypt_pagecache_blocks(page, bh->b_size,
+					bh_offset(bh));
+	if (ret)
+		SetPageError(page);
+}
+
+static void decrypt_work(struct work_struct *work)
+{
+	struct read_callbacks_ctx *ctx =
+		container_of(work, struct read_callbacks_ctx, work);
+
+	if (ctx->bio)
+		decrypt_bio(ctx->bio);
+	else
+		decrypt_bh(ctx->bh);
+
+	read_callbacks(ctx);
+}
+
+static void read_callbacks(struct read_callbacks_ctx *ctx)
+{
+	/*
+	 * We use different work queues for decryption and for verity because
+	 * verity may require reading metadata pages that need decryption, and
+	 * we shouldn't recurse to the same workqueue.
+	 */
+	switch (++ctx->cur_step) {
+	case STEP_DECRYPT:
+		if (ctx->enabled_steps & (1 << STEP_DECRYPT)) {
+			INIT_WORK(&ctx->work, decrypt_work);
+			fscrypt_enqueue_decrypt_work(&ctx->work);
+			return;
+		}
+		ctx->cur_step++;
+		/* fall-through */
+	default:
+		if (ctx->bio)
+			ctx->end_bio(ctx->bio);
+		else
+			ctx->end_bh(ctx->bh, ctx->bh_uptodate);
+
+		mempool_free(ctx, read_callbacks_ctx_pool);
+	}
+}
+
+/**
+ * read_callbacks_setup_bio() - Initialize the read callbacks state machine
+ * @inode: The file on which read I/O is performed.
+ * @bio: bio holding page cache pages on which read I/O is performed.
+ * @bh: Buffer head on which read I/O is performed.
+ * @page_op: Function to perform filesystem specific operations on a page.
+ *
+ * Based on the nature of the file's data (e.g. encrypted), this function
+ * computes the steps that need to be performed after data is read of the
+ * backing disk. This information is saved in a context structure. A pointer
+ * to the context structure is then stored in bio->bi_private for later
+ * usage.
+ *
+ * Return: 0 on success; An error code on failure.
+ */
+int read_callbacks_setup_bio(struct inode *inode, struct bio *bio)
+{
+	struct read_callbacks_ctx *ctx = get_read_callbacks_ctx(inode);
+
+	if (ctx) {
+		if (IS_ERR(ctx))
+			return PTR_ERR(ctx);
+		ctx->bio = bio;
+		ctx->bh = NULL;
+		bio->bi_private = ctx;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(read_callbacks_setup_bio);
+
+/**
+ * read_callbacks_setup_bh() - Initialize the read callbacks state machine
+ * @inode: The file on which read I/O is performed.
+ * @bio: bio holding page cache pages on which read I/O is performed.
+ * @bh: Buffer head on which read I/O is performed.
+ * @page_op: Function to perform filesystem specific operations on a page.
+ *
+ * Based on the nature of the file's data (e.g. encrypted), this function
+ * computes the steps that need to be performed after data is read of the
+ * backing disk. This information is saved in a context structure. A pointer
+ * to the context structure is then stored in bio->bi_private for later
+ * usage.
+ *
+ * Return: 0 on success; An error code on failure.
+ */
+int read_callbacks_setup_bh(struct inode *inode, struct buffer_head *bh)
+{
+	struct read_callbacks_ctx *ctx = get_read_callbacks_ctx(inode);
+
+	if (ctx) {
+		if (IS_ERR(ctx))
+			return PTR_ERR(ctx);
+		ctx->bio = NULL;
+		ctx->bh = bh;
+		bh->b_private = ctx;
+		set_buffer_read_cb(bh);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(read_callbacks_setup_bh);
+
+/**
+ * read_callbacks_endio_bio() - Initiate the read callbacks state machine.
+ * @bio: bio on which read I/O operation has just been completed.
+ * @end_bio: Callback to invoke on @bio after state machine completion.
+ *
+ * Initiates the execution of the read callbacks state machine when the read
+ * operation has been completed sucessfully. If there was an error associated
+ * with the bio, this function frees the read callbacks context structure stored
+ * in bio->bi_private (if any).
+ *
+ * If read callbacks state machine isn't executed, we end up invoking the
+ * @end_bio function passed in as an argument.
+ */
+void read_callbacks_endio_bio(struct bio *bio, end_bio_func_t end_bio)
+{
+	struct read_callbacks_ctx *ctx = bio->bi_private;
+
+	if (ctx) {
+		if (!bio->bi_status) {
+			ctx->end_bio = end_bio;
+			read_callbacks(ctx);
+			return;
+		}
+
+		free_read_callbacks_ctx(ctx);
+	}
+
+	end_bio(bio);
+}
+EXPORT_SYMBOL(read_callbacks_endio_bio);
+
+/**
+ * read_callbacks_endio_bh() - Initiate the read callbacks state machine.
+ * @bh: buffer head on which read I/O operation has just been completed.
+ * @uptodate: Buffer head's I/O status.
+ * @end_bh: Callback to invoke on on @bh after state machine completion.
+ *
+ * Initiates the execution of the read callbacks state machine when the read
+ * operation has been completed sucessfully. If there was an error associated
+ * with the buffer head, this function frees the read callbacks context
+ * structure stored in bh->b_private (if any).
+ *
+ * If read callbacks state machine isn't executed, we end up invoking the
+ * @end_bh function passed in as an argument.
+ */
+void read_callbacks_endio_bh(struct buffer_head *bh, int uptodate, end_bh_func_t end_bh)
+{
+	struct read_callbacks_ctx *ctx = bh->b_private;
+
+	if (buffer_read_cb(bh)) {
+		clear_buffer_read_cb(bh);
+		if (uptodate) {
+			ctx->end_bh = end_bh;
+			ctx->bh_uptodate = uptodate;
+			read_callbacks(ctx);
+			return;
+		}
+
+		free_read_callbacks_ctx(ctx);
+	}
+
+	end_bh(bh, uptodate);
+}
+EXPORT_SYMBOL(read_callbacks_endio_bh);
+
+static int __init init_read_callbacks(void)
+{
+	read_callbacks_ctx_cache = KMEM_CACHE(read_callbacks_ctx, 0);
+	if (!read_callbacks_ctx_cache)
+		goto fail;
+	read_callbacks_ctx_pool =
+		mempool_create_slab_pool(NUM_PREALLOC_READ_CALLBACK_CTXS,
+					 read_callbacks_ctx_cache);
+	if (!read_callbacks_ctx_pool)
+		goto fail_free_cache;
+	return 0;
+
+fail_free_cache:
+	kmem_cache_destroy(read_callbacks_ctx_cache);
+fail:
+	return -ENOMEM;
+}
+
+fs_initcall(init_read_callbacks);
diff --git a/include/linux/read_callbacks.h b/include/linux/read_callbacks.h
new file mode 100644
index 000000000000..0d709dd81b4e
--- /dev/null
+++ b/include/linux/read_callbacks.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _READ_CALLBACKS_H
+#define _READ_CALLBACKS_H
+
+#include <linux/blk_types.h>
+
+typedef void (*end_bio_func_t)(struct bio *bio);
+typedef void (*end_bh_func_t)(struct buffer_head *bh, int uptodate);
+
+#ifdef CONFIG_FS_READ_CALLBACKS
+int read_callbacks_setup_bio(struct inode *inode, struct bio *bio);
+int read_callbacks_setup_bh(struct inode *inode, struct buffer_head *bh);
+void read_callbacks_endio_bio(struct bio *bio, end_bio_func_t end_bio);
+void read_callbacks_endio_bh(struct buffer_head *bh, int uptodate, end_bh_func_t end_bh);
+
+static inline bool read_callbacks_failed(struct page *page)
+{
+	return PageError(page);
+}
+#else
+static inline int read_callbacks_setup_bio(struct inode *inode, struct bio *bio)
+{
+	return 0;
+}
+
+static inline int read_callbacks_setup_bh(struct inode *inode, struct buffer_head *bh)
+{
+	return 0;
+}
+
+static inline void read_callbacks_endio_bio(struct bio *bio,
+					end_bio_func_t end_bio)
+{
+	end_bio(bio);
+}
+
+static inline void read_callbacks_endio_bh(struct buffer_head *bh, int uptodate, end_bh_func_t end_bh)
+{
+	end_bh(bh, uptodate);
+}
+
+static inline bool read_callbacks_failed(struct page *page)
+{
+	return false;
+}
+#endif
+
+#endif	/* _READ_CALLBACKS_H */
-- 
2.19.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
