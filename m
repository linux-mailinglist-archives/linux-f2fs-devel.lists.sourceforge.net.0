Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XE12E10/gGlH5QIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 07:08:29 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87492C87B9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 07:08:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cD7Mpb4M8sI22GlSDk5ChwhD0F74ihzBAuS3R2pNMx4=; b=Eb29jWtinLzPgYaygWuq3MPuBM
	dT/T1fQG3N22wJDGS03V/y/r/fQOEUadu/yGjshx9OC5x6AjVyh6HP7HT3gBTUkLoT2LuFj4WbvuN
	ErPUmM9Hkkgc11K3e5X9BqAtaswHfBJOFjqq5Txc6pSbrSCBQkn5/1UlytQlCQ+9RQTc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vmn6l-0007op-VQ;
	Mon, 02 Feb 2026 06:08:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+1250474bd6e1e3d30609+8198+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vmn6k-0007oj-Un for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 06:08:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4zvXifu7/G3LbK7p292UW2gwOyz2+BN+bEMUfIr4RF8=; b=Ix2CTFx4ZXZYOwTA4fHcAkCL/+
 5Z4En8OebiY9nsKfXM+jExJ+XhDZ9OF3/mYMlfv4OfiPXwyL70GDVggA5Jb/XG67LsQD4NFqYSTN3
 yIieoNtc7W52O0wsNPHMs6fSUilozKQdx0klNIIb60kDA2MBk4hSy5SwIjYTHnWEreBA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4zvXifu7/G3LbK7p292UW2gwOyz2+BN+bEMUfIr4RF8=; b=XNeIN/42hK6cIC3qdupUBgnnpq
 8A+sLEqy9WHybPIjvtx1HFdDm8WUxub03KOA8mi7lxTD+ehsuSxfN0ouOuHC1WLwLV2+Z9+PE+x0F
 7CyAvnIC3F7Db+oS1nmVuhu1RQF3Kbl9mOi8QjNRQv7Q979bBcMtNwW4rpkMBY/ejIgQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vmn6k-0007ov-FW for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 06:08:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=4zvXifu7/G3LbK7p292UW2gwOyz2+BN+bEMUfIr4RF8=; b=sr8htu/IWaOxZ/cXXcqQYxneEE
 BtsMmQ8K4VXfJ+ircRa+/xP64GiWucfOwnEOHRPDykYJTscyVqSfCf7bNYsySu0pgbIdRRmgwHhph
 uXMJlv4D9VGYhgVK7n2PhEKO4v6SIe9cuHPIapw3bekMLuoJc1/nB6KuC5uofAQ9EggN2KQ2HLk3H
 yWsifBWgyxF+SaNIyoxIybcpi9M3lhGDhhsIdBBdp2rZZNCosQgAzBDitDb2BzmoicVSJvJr3iUl1
 0HzhaUzm4MHnS8cN0dr5l3gPLcOtxnMsjUrhmypEWW5XVm8DzISB33m5OrLlHCBfzjDz2IXqj1Xf9
 z2BR8hZg==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vmn6c-00000004Ujr-2N4Q; Mon, 02 Feb 2026 06:08:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon,  2 Feb 2026 07:06:32 +0100
Message-ID: <20260202060754.270269-4-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260202060754.270269-1-hch@lst.de>
References: <20260202060754.270269-1-hch@lst.de>
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
 Content preview: Keep all the read into pagecache code in a single file.
 Signed-off-by:
 Christoph Hellwig <hch@lst.de> --- fs/ext4/ext4.h | 4 ++-- fs/ext4/inode.c
 | 27 fs/ext4/readpage.c | 31 ++++++++++++++++++++++++++++++- 3 files changed, 
 32 i [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vmn6k-0007ov-FW
Subject: [f2fs-dev] [PATCH 03/11] ext4: move ->read_folio and ->readahead to
 readahead.c
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
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 87492C87B9
X-Rspamd-Action: no action

Keep all the read into pagecache code in a single file.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ext4/ext4.h     |  4 ++--
 fs/ext4/inode.c    | 27 ---------------------------
 fs/ext4/readpage.c | 31 ++++++++++++++++++++++++++++++-
 3 files changed, 32 insertions(+), 30 deletions(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 56112f201cac..a8a448e20ef8 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -3735,8 +3735,8 @@ static inline void ext4_set_de_type(struct super_block *sb,
 }
 
 /* readpages.c */
-extern int ext4_mpage_readpages(struct inode *inode,
-		struct readahead_control *rac, struct folio *folio);
+int ext4_read_folio(struct file *file, struct folio *folio);
+void ext4_readahead(struct readahead_control *rac);
 extern int __init ext4_init_post_read_processing(void);
 extern void ext4_exit_post_read_processing(void);
 
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 8c2ef98fa530..e98954e7d0b3 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3380,33 +3380,6 @@ static sector_t ext4_bmap(struct address_space *mapping, sector_t block)
 	return ret;
 }
 
-static int ext4_read_folio(struct file *file, struct folio *folio)
-{
-	int ret = -EAGAIN;
-	struct inode *inode = folio->mapping->host;
-
-	trace_ext4_read_folio(inode, folio);
-
-	if (ext4_has_inline_data(inode))
-		ret = ext4_readpage_inline(inode, folio);
-
-	if (ret == -EAGAIN)
-		return ext4_mpage_readpages(inode, NULL, folio);
-
-	return ret;
-}
-
-static void ext4_readahead(struct readahead_control *rac)
-{
-	struct inode *inode = rac->mapping->host;
-
-	/* If the file has inline data, no need to do readahead. */
-	if (ext4_has_inline_data(inode))
-		return;
-
-	ext4_mpage_readpages(inode, rac, NULL);
-}
-
 static void ext4_invalidate_folio(struct folio *folio, size_t offset,
 				size_t length)
 {
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index 267594ef0b2c..bf84952ebf94 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -45,6 +45,7 @@
 #include <linux/pagevec.h>
 
 #include "ext4.h"
+#include <trace/events/ext4.h>
 
 #define NUM_PREALLOC_POST_READ_CTXS	128
 
@@ -209,7 +210,7 @@ static inline loff_t ext4_readpage_limit(struct inode *inode)
 	return i_size_read(inode);
 }
 
-int ext4_mpage_readpages(struct inode *inode,
+static int ext4_mpage_readpages(struct inode *inode,
 		struct readahead_control *rac, struct folio *folio)
 {
 	struct bio *bio = NULL;
@@ -394,6 +395,34 @@ int ext4_mpage_readpages(struct inode *inode,
 	return 0;
 }
 
+int ext4_read_folio(struct file *file, struct folio *folio)
+{
+	int ret = -EAGAIN;
+	struct inode *inode = folio->mapping->host;
+
+	trace_ext4_read_folio(inode, folio);
+
+	if (ext4_has_inline_data(inode))
+		ret = ext4_readpage_inline(inode, folio);
+
+	if (ret == -EAGAIN)
+		return ext4_mpage_readpages(inode, NULL, folio);
+
+	return ret;
+}
+
+void ext4_readahead(struct readahead_control *rac)
+{
+	struct inode *inode = rac->mapping->host;
+
+	/* If the file has inline data, no need to do readahead. */
+	if (ext4_has_inline_data(inode))
+		return;
+
+	ext4_mpage_readpages(inode, rac, NULL);
+}
+
+
 int __init ext4_init_post_read_processing(void)
 {
 	bio_post_read_ctx_cache = KMEM_CACHE(bio_post_read_ctx, SLAB_RECLAIM_ACCOUNT);
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
