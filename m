Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9600AB2458F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Aug 2025 11:38:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6OAXOaaWlcTyUx+xg5vSYe6Il0z+xWbiCcQZ3w9pCY=; b=lEgJ4n2ZXz4kGCHHWSvGVeyXXf
	gyq8s26wJffF91dBaTCN0a2rYQds1s0+VIKmJWfhAfBJ6z6aF0hO1pWUfU70K5U/UgLA4aLucayXy
	e0VjZqah0VTeCxZ1hPKKOZ89HhlIaGMvFqpvgxAIgFprDVT1aoGFrmHPU9t7cS+l9pgk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1um7wa-00060I-BO;
	Wed, 13 Aug 2025 09:38:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1um7wY-000606-0f
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Aug 2025 09:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QX1yHOS3iNusdtYkEEgfT0ZrvEnWSBmajEEebMi+mQI=; b=Xas72a1HPdybq2AijzhPfVVbMH
 eBH293jqJ2+YJ15HdQzXWmVmEipOyo15MfS4L+oAE/MVfuDCaHWeDtkZK6iaxwZq47w2Tc++aopnY
 p3veVHdyaC9qBhaMxz3DzPXVhglolwJj50NEYO07YK40GxKgzeA2I8jrd1bzEDj/XGsw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QX1yHOS3iNusdtYkEEgfT0ZrvEnWSBmajEEebMi+mQI=; b=Ovj5yb2lqjF73p2qf1xXauxt8E
 K/jmcFXYUEHjJ9L3sTNXs/f1j8g2Xet30GwgKRAskPFalCi1stMakbnyZB28tRyxFDTud2WdBJWHl
 5zaP1QcZIFzVvsDQvRiOfVBl4wDc4GKuM3RBQRvC2OMgrgdAB9di6NzZwiPL8cxt0Jck=;
Received: from m16.mail.126.com ([117.135.210.9])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1um7wU-0004Uh-Pt for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Aug 2025 09:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=QX
 1yHOS3iNusdtYkEEgfT0ZrvEnWSBmajEEebMi+mQI=; b=PHPNzeyVYjVUdGXKje
 I8r4tug1rzIF9/XGNqEfO5P/QvQRPLhDRv0syGQ14buPOxWFrmzfyw7Cr0JWOys/
 WRH90GEXU3x85nXVw54AdgcyjRkIoyRiWXMAZm2a+0MZ2VQGUMd0zFfwTR3F+Eu1
 lEfAjZch17mfoErOKIjvpQRQA=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wD3tyv8XJxo_MzyBQ--.54250S3; 
 Wed, 13 Aug 2025 17:38:19 +0800 (CST)
From: Nanzhe Zhao <nzzhao@126.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org
Date: Wed, 13 Aug 2025 17:37:47 +0800
Message-Id: <20250813093755.47599-2-nzzhao@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813093755.47599-1-nzzhao@126.com>
References: <20250813093755.47599-1-nzzhao@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3tyv8XJxo_MzyBQ--.54250S3
X-Coremail-Antispam: 1Uf129KBjvAXoW3Kr17Xr1DJFy3ZFW5ArWfuFg_yoW8JF1kGo
 WSgw4jqw48KrWUArWjkr17WFy7ua98Ca47JF4fCrs8uFnrXa4q9rW7KrsxJa4I9rn5JF12
 939xJF47GFWfX3Wxn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJvtCUUUUU
X-Originating-IP: [58.240.165.118]
X-CM-SenderInfo: xq22xtbr6rjloofrz/1tbiExioz2icVjthxgAAsS
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add f2fs's own per-folio structure to track per-block dirty
 state of a folio. The reason for introducing this structure is that f2fs's
 private flag would conflict with iomap_folio_state's use of the folio->private
 field. Thanks to Mr. Matthew for providing the idea. See for det [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [117.135.210.9 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1um7wU-0004Uh-Pt
Subject: [f2fs-dev] [RFC PATCH 1/9] f2fs: Introduce f2fs_iomap_folio_state
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
Cc: Nanzhe Zhao <nzzhao@126.com>, Barry Song <21cnbao@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Yi Zhang <yi.zhang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add f2fs's own per-folio structure to track
per-block dirty state of a folio.

The reason for introducing this structure is that f2fs's private flag
would conflict with iomap_folio_state's use of the folio->private field.
Thanks to Mr. Matthew for providing the idea. See for details:
[https://lore.kernel.org/linux-f2fs-devel/Z-oPTUrF7kkhzJg_
@casper.infradead.org/]

The memory layout of this structure is the same as iomap_folio_state,
except that we set read_bytes_pending to a magic number. This is because
we need to be able to distinguish it from the original iomap_folio_state.
We additionally allocate an unsigned long at the end of the state array
to store f2fs-specific flags.

This implementation is compatible with high-order folios, order-0 folios,
and metadata folios.
However, it does not support compressed data folios.

Introduction to related functions:

- f2fs_ifs_alloc: Allocates f2fs's own f2fs_iomap_folio_state. If it
  detects that folio->private already has a value, we distinguish
  whether it is f2fs's own flag value or an iomap_folio_state. If it is
  the latter, we will copy its content to our f2fs_iomap_folio_state
  and then free it.

- folio_detach_f2fs_private: Serves as a unified interface to release
  f2fs's private resources, no matter what it is.

- f2fs_ifs_clear_range_uptodate && f2fs_ifs_set_range_dirty: Helper
  functions copied and slightly modified from fs/iomap.

- folio_get_f2fs_ifs: Specifically used to get f2fs_iomap_folio_state.
  It cannot be used to get f2fs's own fields used on compressed folios.
  For the former, we return a null pointer to indicate that the current
  folio does not hold an f2fs_iomap_folio_state. For the latter, we
  directly BUG_ON.

Signed-off-by: Nanzhe Zhao <nzzhao@126.com>
---
 fs/f2fs/Kconfig    |  10 ++
 fs/f2fs/Makefile   |   1 +
 fs/f2fs/f2fs_ifs.c | 221 +++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/f2fs_ifs.h |  79 ++++++++++++++++
 4 files changed, 311 insertions(+)
 create mode 100644 fs/f2fs/f2fs_ifs.c
 create mode 100644 fs/f2fs/f2fs_ifs.h

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 5916a02fb46d..480b8536fa39 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -150,3 +150,13 @@ config F2FS_UNFAIR_RWSEM
 	help
 	  Use unfair rw_semaphore, if system configured IO priority by block
 	  cgroup.
+
+config F2FS_IOMAP_FOLIO_STATE
+	bool "F2FS folio per-block I/O state tracking"
+	depends on F2FS_FS && FS_IOMAP
+	help
+	  Enable a custom F2FS structure for tracking the I/O state
+	  (up-to-date, dirty) on a per-block basis within a memory folio.
+	  This structure stores F2FS private flag in its state flexible
+	  array while keeping compatibility with generic iomap_folio_state.
+	  Must be enabled if using iomap large folios support in F2FS.
\ No newline at end of file
diff --git a/fs/f2fs/Makefile b/fs/f2fs/Makefile
index 8a7322d229e4..3b9270d774e8 100644
--- a/fs/f2fs/Makefile
+++ b/fs/f2fs/Makefile
@@ -10,3 +10,4 @@ f2fs-$(CONFIG_F2FS_FS_POSIX_ACL) += acl.o
 f2fs-$(CONFIG_FS_VERITY) += verity.o
 f2fs-$(CONFIG_F2FS_FS_COMPRESSION) += compress.o
 f2fs-$(CONFIG_F2FS_IOSTAT) += iostat.o
+f2fs-$(CONFIG_F2FS_IOMAP_FOLIO_STATE) += f2fs_ifs.o
diff --git a/fs/f2fs/f2fs_ifs.c b/fs/f2fs/f2fs_ifs.c
new file mode 100644
index 000000000000..6b7503474580
--- /dev/null
+++ b/fs/f2fs/f2fs_ifs.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/fs.h>
+#include <linux/f2fs_fs.h>
+
+#include "f2fs.h"
+#include "f2fs_ifs.h"
+
+/*
+ * Have to set parameter ifs's type to void*
+ * and have to interpret ifs as f2fs_ifs to access its fields because
+ * we cannot see iomap_folio_state definition
+ */
+static void ifs_to_f2fs_ifs(void *ifs, struct f2fs_iomap_folio_state *fifs,
+			    struct folio *folio)
+{
+	struct f2fs_iomap_folio_state *src_ifs =
+		(struct f2fs_iomap_folio_state *)ifs;
+	size_t iomap_longs = f2fs_ifs_iomap_longs(folio);
+
+	fifs->read_bytes_pending = READ_ONCE(src_ifs->read_bytes_pending);
+	atomic_set(&fifs->write_bytes_pending,
+		   atomic_read(&src_ifs->write_bytes_pending));
+	memcpy(fifs->state, src_ifs->state,
+	       iomap_longs * sizeof(unsigned long));
+}
+
+static inline bool is_f2fs_ifs(struct folio *folio)
+{
+	struct f2fs_iomap_folio_state *fifs;
+
+	if (!folio_test_private(folio))
+		return false;
+
+	// first directly test no pointer flag is set or not
+	if (test_bit(PAGE_PRIVATE_NOT_POINTER,
+		     (unsigned long *)&folio->private))
+		return false;
+
+	fifs = (struct f2fs_iomap_folio_state *)folio->private;
+	if (!fifs)
+		return false;
+
+	if (READ_ONCE(fifs->read_bytes_pending) == F2FS_IFS_MAGIC)
+		return true;
+
+	return false;
+}
+
+struct f2fs_iomap_folio_state *f2fs_ifs_alloc(struct folio *folio, gfp_t gfp,
+					      bool force_alloc)
+{
+	struct inode *inode = folio->mapping->host;
+	size_t alloc_size = 0;
+
+	if (!folio_test_large(folio)) {
+		if (!force_alloc) {
+			WARN_ON_ONCE(1);
+			return NULL;
+		}
+		/*
+		 * GC can store private flag in 0 order folio's folio->private
+		 * causes iomap buffered write mistakenly interpret as a pointer
+		 * we add a bool force_alloc to deal with this case
+		 */
+		struct f2fs_iomap_folio_state *fifs;
+
+		alloc_size = sizeof(*fifs) + 2 * sizeof(unsigned long);
+		fifs = kmalloc(alloc_size, gfp);
+		if (!fifs)
+			return NULL;
+		spin_lock_init(&fifs->state_lock);
+		WRITE_ONCE(fifs->read_bytes_pending, F2FS_IFS_MAGIC);
+		atomic_set(&fifs->write_bytes_pending, 0);
+		unsigned int nr_blocks =
+			i_blocks_per_folio(inode, folio);
+		if (folio_test_uptodate(folio))
+			bitmap_set(fifs->state, 0, nr_blocks);
+		if (folio_test_dirty(folio))
+			bitmap_set(fifs->state, nr_blocks, nr_blocks);
+		*f2fs_ifs_private_flags_ptr(fifs, folio) = 0;
+		folio_attach_private(folio, fifs);
+		return fifs;
+	}
+
+	struct f2fs_iomap_folio_state *fifs;
+	void *old_private;
+	size_t iomap_longs;
+	size_t total_longs;
+
+	WARN_ON_ONCE(!inode); // Should have an inode
+
+	old_private = folio_get_private(folio);
+
+	if (old_private) {
+		// Check if it's already our type using the magic number directly
+		if (READ_ONCE(((struct f2fs_iomap_folio_state *)old_private)
+				      ->read_bytes_pending) == F2FS_IFS_MAGIC) {
+			return (struct f2fs_iomap_folio_state *)
+				old_private; // Already ours
+		}
+		// Non-NULL, not ours -> Allocate, Copy, Replace path
+		total_longs = f2fs_ifs_total_longs(folio);
+		alloc_size = sizeof(*fifs) +
+				total_longs * sizeof(unsigned long);
+
+		fifs = kmalloc(alloc_size, gfp);
+		if (!fifs)
+			return NULL;
+
+		spin_lock_init(&fifs->state_lock);
+		*f2fs_ifs_private_flags_ptr(fifs, folio) = 0;
+		// Copy data from the presumed iomap_folio_state (old_private)
+		ifs_to_f2fs_ifs(old_private, fifs, folio);
+		WRITE_ONCE(fifs->read_bytes_pending, F2FS_IFS_MAGIC);
+		folio_change_private(folio, fifs);
+		kfree(old_private);
+		return fifs;
+	}
+
+	iomap_longs = f2fs_ifs_iomap_longs(folio);
+	total_longs = iomap_longs + 1;
+	alloc_size =
+		sizeof(*fifs) + total_longs * sizeof(unsigned long);
+
+	fifs = kzalloc(alloc_size, gfp);
+	if (!fifs)
+		return NULL;
+
+	spin_lock_init(&fifs->state_lock);
+
+	unsigned int nr_blocks = i_blocks_per_folio(inode, folio);
+
+	if (folio_test_uptodate(folio))
+		bitmap_set(fifs->state, 0, nr_blocks);
+	if (folio_test_dirty(folio))
+		bitmap_set(fifs->state, nr_blocks, nr_blocks);
+	WRITE_ONCE(fifs->read_bytes_pending, F2FS_IFS_MAGIC);
+	atomic_set(&fifs->write_bytes_pending, 0);
+	folio_attach_private(folio, fifs);
+	return fifs;
+}
+
+void folio_detach_f2fs_private(struct folio *folio)
+{
+	struct f2fs_iomap_folio_state *fifs;
+
+	if (!folio_test_private(folio))
+		return;
+
+	// Check if it's using direct flags
+	if (test_bit(PAGE_PRIVATE_NOT_POINTER,
+		     (unsigned long *)&folio->private)) {
+		folio_detach_private(folio);
+		return;
+	}
+
+	fifs = folio_detach_private(folio);
+	if (!fifs)
+		return;
+
+	if (is_f2fs_ifs(folio)) {
+		WARN_ON_ONCE(READ_ONCE(fifs->read_bytes_pending) !=
+			     F2FS_IFS_MAGIC);
+		WARN_ON_ONCE(atomic_read(&fifs->write_bytes_pending));
+	} else {
+		WARN_ON_ONCE(READ_ONCE(fifs->read_bytes_pending) != 0);
+		WARN_ON_ONCE(atomic_read(&fifs->write_bytes_pending));
+	}
+
+	kfree(fifs);
+}
+
+struct f2fs_iomap_folio_state *folio_get_f2fs_ifs(struct folio *folio)
+{
+	if (!folio_test_private(folio))
+		return NULL;
+
+	if (test_bit(PAGE_PRIVATE_NOT_POINTER,
+		     (unsigned long *)&folio->private))
+		return NULL;
+	/*
+	 * Note we assume folio->private can be either ifs or f2fs_ifs here.
+	 * Compresssed folios should not call this function
+	 */
+	f2fs_bug_on(F2FS_F_SB(folio),
+		    *((u32 *)folio->private) == F2FS_COMPRESSED_PAGE_MAGIC);
+	return folio->private;
+}
+
+void f2fs_ifs_clear_range_uptodate(struct folio *folio,
+				   struct f2fs_iomap_folio_state *fifs,
+				   size_t off, size_t len)
+{
+	struct inode *inode = folio->mapping->host;
+	unsigned int first_blk = (off >> inode->i_blkbits);
+	unsigned int last_blk = (off + len - 1) >> inode->i_blkbits;
+	unsigned int nr_blks = last_blk - first_blk + 1;
+	unsigned long flags;
+
+	spin_lock_irqsave(&fifs->state_lock, flags);
+	bitmap_clear(fifs->state, first_blk, nr_blks);
+	spin_unlock_irqrestore(&fifs->state_lock, flags);
+}
+
+void f2fs_iomap_set_range_dirty(struct folio *folio, size_t off, size_t len)
+{
+	struct f2fs_iomap_folio_state *fifs = folio_get_f2fs_ifs(folio);
+
+	if (fifs) {
+		struct inode *inode = folio->mapping->host;
+		unsigned int blks_per_folio = i_blocks_per_folio(inode, folio);
+		unsigned int first_blk = (off >> inode->i_blkbits);
+		unsigned int last_blk = (off + len - 1) >> inode->i_blkbits;
+		unsigned int nr_blks = last_blk - first_blk + 1;
+		unsigned long flags;
+
+		spin_lock_irqsave(&fifs->state_lock, flags);
+		bitmap_set(fifs->state, first_blk + blks_per_folio, nr_blks);
+		spin_unlock_irqrestore(&fifs->state_lock, flags);
+	}
+}
diff --git a/fs/f2fs/f2fs_ifs.h b/fs/f2fs/f2fs_ifs.h
new file mode 100644
index 000000000000..3b16deda8a1e
--- /dev/null
+++ b/fs/f2fs/f2fs_ifs.h
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0
+#ifndef F2FS_IFS_H
+#define F2FS_IFS_H
+
+#include <linux/fs.h>
+#include <linux/bug.h>
+#include <linux/f2fs_fs.h>
+#include <linux/mm.h>
+#include <linux/iomap.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/atomic.h>
+
+#include "f2fs.h"
+
+#define F2FS_IFS_MAGIC 0xf2f5
+#define F2FS_IFS_PRIVATE_LONGS 1
+
+/*
+ * F2FS structure for folio private data, mimicking iomap_folio_state layout.
+ * F2FS private flags/data are stored in extra space allocated at the end
+ */
+struct f2fs_iomap_folio_state {
+	spinlock_t state_lock;
+	unsigned int read_bytes_pending;
+	atomic_t write_bytes_pending;
+	/*
+	 * Flexible array member.
+	 * Holds [0...iomap_longs-1] for iomap uptodate/dirty bits.
+	 * Holds [iomap_longs] for F2FS private flags/data (unsigned long).
+	 */
+	unsigned long state[];
+};
+
+static inline bool
+f2fs_ifs_block_is_uptodate(struct f2fs_iomap_folio_state *ifs,
+			   unsigned int block)
+{
+	return test_bit(block, ifs->state);
+}
+
+static inline size_t f2fs_ifs_iomap_longs(const struct folio *folio)
+{
+	struct inode *inode = folio->mapping->host;
+
+	WARN_ON_ONCE(!inode);
+	unsigned int nr_blocks =
+		i_blocks_per_folio(inode, (struct folio *)folio);
+	return BITS_TO_LONGS(2 * nr_blocks);
+}
+
+static inline size_t f2fs_ifs_total_longs(struct folio *folio)
+{
+	return f2fs_ifs_iomap_longs(folio) + F2FS_IFS_PRIVATE_LONGS;
+}
+
+static inline unsigned long *
+f2fs_ifs_private_flags_ptr(struct f2fs_iomap_folio_state *fifs,
+			   const struct folio *folio)
+{
+	return &fifs->state[f2fs_ifs_iomap_longs(folio)];
+}
+
+struct f2fs_iomap_folio_state *f2fs_ifs_alloc(struct folio *folio, gfp_t gfp,
+					      bool force_alloc);
+void folio_detach_f2fs_private(struct folio *folio);
+struct f2fs_iomap_folio_state *folio_get_f2fs_ifs(struct folio *folio);
+
+/*
+ * 0-order and fully dirty folio has no fifs
+ * they store private flag directly in their folio->private field
+ * as original f2fs page private behaviour
+ */
+void f2fs_ifs_clear_range_uptodate(struct folio *folio,
+				   struct f2fs_iomap_folio_state *fifs,
+				   size_t off, size_t len);
+void f2fs_iomap_set_range_dirty(struct folio *folio, size_t off, size_t len);
+
+#endif /* F2FS_IFS_H */
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
