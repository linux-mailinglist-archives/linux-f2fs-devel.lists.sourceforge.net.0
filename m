Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oB74NP4qemnK3gEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 16:27:58 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67380A3CA7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 16:27:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2L0FGGvuGdNfNxGAEJpdzu+iSqblT0IMao17GqwQAM=; b=Ln0NYkEmj9iUUGYvc/NIAzGh9H
	zR63rK+cwECAUEyPOYgh2bgQG65ufJdXcthSY+euJsXl3MUI1+yC7n8SRQo71eAZ1a/iCeJRZ2paq
	bTgv4XZ8yZBGJgYhWy60cXPylKY7EaZrp/KgP1ncvxxabeuo1IGrgBSHpxuFjMoOwjTU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vl7SR-0006w6-Ko;
	Wed, 28 Jan 2026 15:27:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+97ec6e74097c8d3e794e+8193+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vl7SP-0006vY-AG for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 15:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hUAqEc59OqndWFQYZRxKv7dVUe5Vgp361WDh/DQTsVE=; b=HbEgixXEtXuBs6zA5NfI6wB8JY
 l1eukhL2RCOABTN8i5CVjtpAN7m6cKKGf977yJ8dY1l09hIQKtfdNltVg5GrPHWVrVT4Mr+GC1Mqa
 HO6KhwfUc0eZ6/Kv2RMxzt67Yn1lL4gZkYcqqW5j5gD5ObiAIWgDE+udvHdd1oMql2FE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hUAqEc59OqndWFQYZRxKv7dVUe5Vgp361WDh/DQTsVE=; b=GRr7TLzIoWUqbNNR1+t0pQJ+Kq
 ROj56JDzag8/Fk6z9qv7PYSCLgyilG3rN6zZpK5qmKGJeP3wzKYIx6LdSMplSVJ3eEhUJfE4OJ4da
 ai9M6ryLV+QBs84FttPukfxluQohR1vTS9F+3EupxVl0RzlJjYsk29CSkT+/I9MSylug=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vl7SE-0002UA-CC for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 15:27:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=hUAqEc59OqndWFQYZRxKv7dVUe5Vgp361WDh/DQTsVE=; b=FQXZqcmDLkw4PxhiZ4rX8hq5s0
 X4YQJyGhSEz2Zmv4nwlN9OaV+Sd0zSDuR90vWcnaWbUP2DwnCtPT/lCk+EB29c+ul5zUlWaFNB4np
 PPz34IWwEjNr+JE9YlQ5ZW6rzXN/rPBJq68mPF6hHTgH7YxRO57bM4CXXLAuTRmhyyOuBhENM5axX
 Diim7PpbZW73Cxpudf/58gHedTNLRFAYfXtrZmYvXCfF4UNGEjLvZviHO5FH2BRIB2/faWO7xpzCc
 O+FwKwV7FMmHPm/NHwaaOLMMoP1KbHu9KmBmvwX07LhvyY5ZMznwJOEu/iIZP2FyJtEKcvhayG3Pa
 g36Ox2Bw==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vl7S1-0000000GHQh-1Rje; Wed, 28 Jan 2026 15:27:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Wed, 28 Jan 2026 16:26:18 +0100
Message-ID: <20260128152630.627409-7-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260128152630.627409-1-hch@lst.de>
References: <20260128152630.627409-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: ext4 and f2fs are largely using the same code to read a page
 full of Merkle tree blocks from the page cache, and the upcoming xfs fsverity
 support would add another copy. Move the ext4 code to fs/verity/ and use
 it in f2fs as well. For f2fs this removes the previous f2fs-specific error
 injection, but otherwise the behavior remains unchanged. 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vl7SE-0002UA-CC
Subject: [f2fs-dev] [PATCH 06/15] fsverity: start consolidating pagecache
 code
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, "Darrick J. Wong" <djwong@kernel.org>,
 Andrey Albershteyn <aalbersh@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[15];
	ARC_NA(0.00)[];
	ASN_FAIL(0.00)[7.38.105.216.asn.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lst.de:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,suse.cz:email]
X-Rspamd-Queue-Id: 67380A3CA7
X-Rspamd-Action: no action

ext4 and f2fs are largely using the same code to read a page full
of Merkle tree blocks from the page cache, and the upcoming xfs
fsverity support would add another copy.

Move the ext4 code to fs/verity/ and use it in f2fs as well.  For f2fs
this removes the previous f2fs-specific error injection, but otherwise
the behavior remains unchanged.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
 fs/ext4/verity.c         | 17 +----------------
 fs/f2fs/verity.c         | 17 +----------------
 fs/verity/Makefile       |  1 +
 fs/verity/pagecache.c    | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/fsverity.h |  3 +++
 5 files changed, 44 insertions(+), 32 deletions(-)
 create mode 100644 fs/verity/pagecache.c

diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index 2ce4cf8a1e31..a071860ad36a 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -361,23 +361,8 @@ static struct page *ext4_read_merkle_tree_page(struct inode *inode,
 					       pgoff_t index,
 					       unsigned long num_ra_pages)
 {
-	struct folio *folio;
-
 	index += ext4_verity_metadata_pos(inode) >> PAGE_SHIFT;
-
-	folio = __filemap_get_folio(inode->i_mapping, index, FGP_ACCESSED, 0);
-	if (IS_ERR(folio) || !folio_test_uptodate(folio)) {
-		DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, index);
-
-		if (!IS_ERR(folio))
-			folio_put(folio);
-		else if (num_ra_pages > 1)
-			page_cache_ra_unbounded(&ractl, num_ra_pages, 0);
-		folio = read_mapping_folio(inode->i_mapping, index, NULL);
-		if (IS_ERR(folio))
-			return ERR_CAST(folio);
-	}
-	return folio_file_page(folio, index);
+	return generic_read_merkle_tree_page(inode, index, num_ra_pages);
 }
 
 static int ext4_write_merkle_tree_block(struct file *file, const void *buf,
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index c1c4d8044681..d37e584423af 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -259,23 +259,8 @@ static struct page *f2fs_read_merkle_tree_page(struct inode *inode,
 					       pgoff_t index,
 					       unsigned long num_ra_pages)
 {
-	struct folio *folio;
-
 	index += f2fs_verity_metadata_pos(inode) >> PAGE_SHIFT;
-
-	folio = f2fs_filemap_get_folio(inode->i_mapping, index, FGP_ACCESSED, 0);
-	if (IS_ERR(folio) || !folio_test_uptodate(folio)) {
-		DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, index);
-
-		if (!IS_ERR(folio))
-			folio_put(folio);
-		else if (num_ra_pages > 1)
-			page_cache_ra_unbounded(&ractl, num_ra_pages, 0);
-		folio = read_mapping_folio(inode->i_mapping, index, NULL);
-		if (IS_ERR(folio))
-			return ERR_CAST(folio);
-	}
-	return folio_file_page(folio, index);
+	return generic_read_merkle_tree_page(inode, index, num_ra_pages);
 }
 
 static int f2fs_write_merkle_tree_block(struct file *file, const void *buf,
diff --git a/fs/verity/Makefile b/fs/verity/Makefile
index 435559a4fa9e..ddb4a88a0d60 100644
--- a/fs/verity/Makefile
+++ b/fs/verity/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_FS_VERITY) += enable.o \
 			   init.o \
 			   measure.o \
 			   open.o \
+			   pagecache.o \
 			   read_metadata.o \
 			   verify.o
 
diff --git a/fs/verity/pagecache.c b/fs/verity/pagecache.c
new file mode 100644
index 000000000000..f67248e9e768
--- /dev/null
+++ b/fs/verity/pagecache.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2019 Google LLC
+ */
+
+#include <linux/fsverity.h>
+#include <linux/pagemap.h>
+
+/**
+ * generic_read_merkle_tree_page - generic ->read_merkle_tree_page helper
+ * @inode:	inode containing the Merkle tree
+ * @index:	0-based index of the Merkle tree page in the inode
+ * @num_ra_pages: The number of Merkle tree pages that should be prefetched.
+ *
+ * The caller needs to adjust @index from the Merkle-tree relative index passed
+ * to ->read_merkle_tree_page to the actual index where the Merkle tree is
+ * stored in the page cache for @inode.
+ */
+struct page *generic_read_merkle_tree_page(struct inode *inode, pgoff_t index,
+		unsigned long num_ra_pages)
+{
+	struct folio *folio;
+
+	folio = __filemap_get_folio(inode->i_mapping, index, FGP_ACCESSED, 0);
+	if (IS_ERR(folio) || !folio_test_uptodate(folio)) {
+		DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, index);
+
+		if (!IS_ERR(folio))
+			folio_put(folio);
+		else if (num_ra_pages > 1)
+			page_cache_ra_unbounded(&ractl, num_ra_pages, 0);
+		folio = read_mapping_folio(inode->i_mapping, index, NULL);
+		if (IS_ERR(folio))
+			return ERR_CAST(folio);
+	}
+	return folio_file_page(folio, index);
+}
+EXPORT_SYMBOL_GPL(generic_read_merkle_tree_page);
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index e22cf84fe83a..121703625cc8 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -309,4 +309,7 @@ static inline int fsverity_file_open(struct inode *inode, struct file *filp)
 
 void fsverity_cleanup_inode(struct inode *inode);
 
+struct page *generic_read_merkle_tree_page(struct inode *inode, pgoff_t index,
+		unsigned long num_ra_pages);
+
 #endif	/* _LINUX_FSVERITY_H */
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
