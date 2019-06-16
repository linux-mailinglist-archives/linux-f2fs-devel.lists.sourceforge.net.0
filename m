Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC5C475E3
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 16 Jun 2019 18:21:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hcXud-0004lx-Fv; Sun, 16 Jun 2019 16:21:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chandan@linux.ibm.com>) id 1hcXuW-0004le-9N
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 16 Jun 2019 16:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6k2TYZ/oEzkERO4Gso2IgEQqbqAazwP4guaa+0ZWof8=; b=HfbBUYcVMnH+61Rp4fL/mGTj7z
 pgMMxaw/C7B9fMFJuM9xEHjAriYWcn/OTtZfuAHOYyEDo9CrKCTq9IXIvag0LBzHvZkaek6INAyND
 md2HH0R73n4l+qwdiYUJhS2kfME9ErBTFOY7aqsmuXz7bLk3jaeK0PS/i5InREhi9VqQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6k2TYZ/oEzkERO4Gso2IgEQqbqAazwP4guaa+0ZWof8=; b=HIkwGsHCEDHaRLxA3oolnB5RkO
 iN0Z4VkeX2HDgktm+7hi2zcFcAqblYLIjb5yGOA/ZHnNbxT0Fw99KOs9sU55rN6IsSVa0aVWZxRbc
 cJXhlPRM7g0VfwwvW6H5HjZpQnNOOAI49YZCuCTzJG1rkoziHk8Hk2ZR1sjst2P52w+k=;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hcXuV-00GjT7-1b
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 16 Jun 2019 16:21:40 +0000
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5GG6SZ8063723; Sun, 16 Jun 2019 12:08:00 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t5e9te9e1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 16 Jun 2019 12:08:00 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5GG6cp7064406;
 Sun, 16 Jun 2019 12:07:59 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t5e9te9ds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 16 Jun 2019 12:07:59 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5GG045T026306;
 Sun, 16 Jun 2019 16:07:59 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 2t4ra5sb6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 16 Jun 2019 16:07:59 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5GG7v7121627154
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 16 Jun 2019 16:07:57 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D1616E04C;
 Sun, 16 Jun 2019 16:07:57 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DD736E050;
 Sun, 16 Jun 2019 16:07:53 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.102.1.181])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun, 16 Jun 2019 16:07:53 +0000 (GMT)
From: Chandan Rajendra <chandan@linux.ibm.com>
To: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org
Date: Sun, 16 Jun 2019 21:38:07 +0530
Message-Id: <20190616160813.24464-2-chandan@linux.ibm.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190616160813.24464-1-chandan@linux.ibm.com>
References: <20190616160813.24464-1-chandan@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-16_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906160155
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hcXuV-00GjT7-1b
Subject: [f2fs-dev] [PATCH V3 1/7] FS: Introduce read callbacks
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
 jaegeuk@kernel.org
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
 fs/Makefile                    |   2 +
 fs/crypto/Kconfig              |   1 +
 fs/crypto/bio.c                |  11 +++
 fs/read_callbacks.c            | 174 +++++++++++++++++++++++++++++++++
 include/linux/fscrypt.h        |   5 +
 include/linux/read_callbacks.h |  38 +++++++
 7 files changed, 234 insertions(+)
 create mode 100644 fs/read_callbacks.c
 create mode 100644 include/linux/read_callbacks.h

diff --git a/fs/Kconfig b/fs/Kconfig
index f1046cf6ad85..d869859c88da 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -21,6 +21,9 @@ if BLOCK
 config FS_IOMAP
 	bool
 
+config FS_READ_CALLBACKS
+       bool
+
 source "fs/ext2/Kconfig"
 source "fs/ext4/Kconfig"
 source "fs/jbd2/Kconfig"
diff --git a/fs/Makefile b/fs/Makefile
index c9aea23aba56..a1a06f0db5c1 100644
--- a/fs/Makefile
+++ b/fs/Makefile
@@ -21,6 +21,8 @@ else
 obj-y +=	no-block.o
 endif
 
+obj-$(CONFIG_FS_READ_CALLBACKS) += read_callbacks.o
+
 obj-$(CONFIG_PROC_FS) += proc_namespace.o
 
 obj-y				+= notify/
diff --git a/fs/crypto/Kconfig b/fs/crypto/Kconfig
index 24ed99e2eca0..7752f9964280 100644
--- a/fs/crypto/Kconfig
+++ b/fs/crypto/Kconfig
@@ -9,6 +9,7 @@ config FS_ENCRYPTION
 	select CRYPTO_CTS
 	select CRYPTO_SHA256
 	select KEYS
+	select FS_READ_CALLBACKS if BLOCK
 	help
 	  Enable encryption of files and directories.  This
 	  feature is similar to ecryptfs, but it is more memory
diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index 82da2510721f..f677ff93d464 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -24,6 +24,7 @@
 #include <linux/module.h>
 #include <linux/bio.h>
 #include <linux/namei.h>
+#include <linux/read_callbacks.h>
 #include "fscrypt_private.h"
 
 static void __fscrypt_decrypt_bio(struct bio *bio, bool done)
@@ -68,6 +69,16 @@ void fscrypt_enqueue_decrypt_bio(struct fscrypt_ctx *ctx, struct bio *bio)
 }
 EXPORT_SYMBOL(fscrypt_enqueue_decrypt_bio);
 
+void fscrypt_decrypt_work(struct work_struct *work)
+{
+	struct read_callbacks_ctx *ctx =
+		container_of(work, struct read_callbacks_ctx, work);
+
+	fscrypt_decrypt_bio(ctx->bio);
+
+	read_callbacks(ctx);
+}
+
 int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 				sector_t pblk, unsigned int len)
 {
diff --git a/fs/read_callbacks.c b/fs/read_callbacks.c
new file mode 100644
index 000000000000..a4196e3de05f
--- /dev/null
+++ b/fs/read_callbacks.c
@@ -0,0 +1,174 @@
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
+#include <linux/fscrypt.h>
+#include <linux/read_callbacks.h>
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
+static void put_read_callbacks_ctx(struct read_callbacks_ctx *ctx)
+{
+	mempool_free(ctx, read_callbacks_ctx_pool);
+}
+
+static void end_read_callbacks_bio(struct bio *bio)
+{
+	struct read_callbacks_ctx *ctx;
+	struct page *page;
+	struct bio_vec *bv;
+	struct bvec_iter_all iter_all;
+
+	ctx = bio->bi_private;
+
+	bio_for_each_segment_all(bv, bio, iter_all) {
+		page = bv->bv_page;
+
+		if (bio->bi_status || PageError(page)) {
+			ClearPageUptodate(page);
+			SetPageError(page);
+		} else {
+			SetPageUptodate(page);
+		}
+
+		if (ctx->page_op)
+			ctx->page_op(bio, page);
+
+		unlock_page(page);
+	}
+
+	put_read_callbacks_ctx(ctx);
+
+	bio_put(bio);
+}
+
+/**
+ * read_callbacks() - Execute the read callbacks state machine.
+ * @ctx: The context structure tracking the current state.
+ *
+ * For each state, this function enqueues a work into appropriate subsystem's
+ * work queue. After performing further processing of the data in the bio's
+ * pages, the subsystem should invoke read_calbacks() to continue with the next
+ * state in the state machine.
+ */
+void read_callbacks(struct read_callbacks_ctx *ctx)
+{
+	/*
+	 * We use different work queues for decryption and for verity because
+	 * verity may require reading metadata pages that need decryption, and
+	 * we shouldn't recurse to the same workqueue.
+	 */
+	switch (++ctx->cur_step) {
+	case STEP_DECRYPT:
+		if (ctx->enabled_steps & (1 << STEP_DECRYPT)) {
+			INIT_WORK(&ctx->work, fscrypt_decrypt_work);
+			fscrypt_enqueue_decrypt_work(&ctx->work);
+			return;
+		}
+		ctx->cur_step++;
+		/* fall-through */
+	default:
+		end_read_callbacks_bio(ctx->bio);
+	}
+}
+EXPORT_SYMBOL(read_callbacks);
+
+/**
+ * read_callbacks_end_bio() - Initiate the read callbacks state machine.
+ * @bio: bio on which read I/O operation has just been completed.
+ *
+ * Initiates the execution of the read callbacks state machine when the read
+ * operation has been completed successfully. If there was an error associated
+ * with the bio, this function frees the read callbacks context structure stored
+ * in bio->bi_private (if any).
+ *
+ * Return: 1 to indicate that the bio has been handled (including unlocking the
+ * pages); 0 otherwise.
+ */
+int read_callbacks_end_bio(struct bio *bio)
+{
+	if (!bio->bi_status && bio->bi_private) {
+		read_callbacks((struct read_callbacks_ctx *)(bio->bi_private));
+		return 1;
+	}
+
+	if (bio->bi_private)
+		put_read_callbacks_ctx((struct read_callbacks_ctx *)(bio->bi_private));
+
+	return 0;
+}
+EXPORT_SYMBOL(read_callbacks_end_bio);
+
+/**
+ * read_callbacks_setup() - Initialize the read callbacks state machine
+ * @inode: The file on which read I/O is performed.
+ * @bio: bio holding page cache pages on which read I/O is performed.
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
+int read_callbacks_setup(struct inode *inode, struct bio *bio,
+			end_page_op_t page_op)
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
+			return -ENOMEM;
+		ctx->bio = bio;
+		ctx->inode = inode;
+		ctx->enabled_steps = enabled_steps;
+		ctx->cur_step = STEP_INITIAL;
+		ctx->page_op = page_op;
+		bio->bi_private = ctx;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(read_callbacks_setup);
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
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index bd8f207a2fb6..159b8ddcd670 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -235,6 +235,7 @@ static inline bool fscrypt_match_name(const struct fscrypt_name *fname,
 extern void fscrypt_decrypt_bio(struct bio *);
 extern void fscrypt_enqueue_decrypt_bio(struct fscrypt_ctx *ctx,
 					struct bio *bio);
+extern void fscrypt_decrypt_work(struct work_struct *work);
 extern int fscrypt_zeroout_range(const struct inode *, pgoff_t, sector_t,
 				 unsigned int);
 
@@ -440,6 +441,10 @@ static inline void fscrypt_enqueue_decrypt_bio(struct fscrypt_ctx *ctx,
 {
 }
 
+static inline void fscrypt_decrypt_work(struct work_struct *work)
+{
+}
+
 static inline int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 					sector_t pblk, unsigned int len)
 {
diff --git a/include/linux/read_callbacks.h b/include/linux/read_callbacks.h
new file mode 100644
index 000000000000..aa1ec8ed7a6a
--- /dev/null
+++ b/include/linux/read_callbacks.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _READ_CALLBACKS_H
+#define _READ_CALLBACKS_H
+
+typedef void (*end_page_op_t)(struct bio *bio, struct page *page);
+
+struct read_callbacks_ctx {
+	struct bio *bio;
+	struct inode *inode;
+	struct work_struct work;
+	unsigned int cur_step;
+	unsigned int enabled_steps;
+	end_page_op_t page_op;
+};
+
+#ifdef CONFIG_FS_READ_CALLBACKS
+void read_callbacks(struct read_callbacks_ctx *ctx);
+int read_callbacks_end_bio(struct bio *bio);
+int read_callbacks_setup(struct inode *inode, struct bio *bio,
+			end_page_op_t page_op);
+#else
+static inline void read_callbacks(struct read_callbacks_ctx *ctx)
+{
+}
+
+static inline int read_callbacks_end_bio(struct bio *bio)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int read_callbacks_setup(struct inode *inode,
+				struct bio *bio, end_page_op_t page_op)
+{
+	return -EOPNOTSUPP;
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
