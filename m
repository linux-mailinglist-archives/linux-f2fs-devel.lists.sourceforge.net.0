Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D186EC512
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Apr 2023 07:49:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pqp5H-0006KN-DG;
	Mon, 24 Apr 2023 05:49:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e16e2fc4419b117693a1+7183+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pqp5F-0006KG-Pd for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 05:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bS05QMoD6j6YpGz1rHCHZCzEMuRJxwEBMPELLNqMvVM=; b=VdkDPaOl+f5FiwyO3azaDS5Yuy
 pyWiDGY0gP5fZwskPvHGyfwSzzjQxGWhXg523ZemniuSG0/m//cul85XmjWkBfcRk6bqICZT+zo9w
 nqTs7sayLLbGUOMxYfBVFQtKtBYzRAx3cL6AGUVZ0o3wIyllgk90M6r1eIXQ3IXdZolw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bS05QMoD6j6YpGz1rHCHZCzEMuRJxwEBMPELLNqMvVM=; b=LDW7dcRWHt/+Z/NzViAS14Vui6
 Xn2hX1qg8r5JcjhyWEU+RyNcBT5B8CC7do5dGQWmghLLbHyxJqJyR7PqUeOC+6s0S3PnazXcpY6+v
 KEVz5vx7T5otEmtss1Y5IQ1ivW+9qTSijNmaSYumYo1Lk0XWAYDqHvZb9jreYOONbKbI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pqp5E-0003Tt-ML for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 05:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=bS05QMoD6j6YpGz1rHCHZCzEMuRJxwEBMPELLNqMvVM=; b=QAuUTMs9c0fPPuxtegrv+eZFd7
 m1Lb/Zn2oEdFxGNTL6MyQ1wn8x4GTSTmoDmXSEpvoQtz2+8sgXF6o1xdmIGxAfsSLMFUF2Rdb/QCw
 QELH8/3nG4bNASqOdAHA35mLeydY1xzz4dUPnNEsh0dTA/um5YWXh/LZcV75W2WYGokrA0cEhf1qA
 KKw6r1pxS24iVwx30XkH6ewxhXLH1nN6hYHJDiHEFB82PfR4sJADmcttvzNs0seHtisbFo0Bbqa9V
 n3yxCEfgi9duwfR5Ke4/YsTw+fVVP3Ub8FBS1iXniGGQbGngJEVnnvGoIEv6ORCKaN3u1LbDCqCFv
 PHlgzFNw==;
Received: from [2001:4bb8:189:a74f:e8a5:5f73:6d2:23b8] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pqp54-00FOuy-17; Mon, 24 Apr 2023 05:49:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 24 Apr 2023 07:49:13 +0200
Message-Id: <20230424054926.26927-5-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424054926.26927-1-hch@lst.de>
References: <20230424054926.26927-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Fold emergency_thaw_bdev into it's only caller, to prepare
 for buffer.c to be built only when buffer_head support is enabled.
 Signed-off-by:
 Christoph Hellwig <hch@lst.de> --- fs/buffer.c | 6 ------ fs/internal.h |
 6 ------ fs/super.c | 4 +++- 3 files changed, 3 insertions(+), 13 deletions(-)
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pqp5E-0003Tt-ML
Subject: [f2fs-dev] [PATCH 04/17] fs: remove emergency_thaw_bdev
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
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
 cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fold emergency_thaw_bdev into it's only caller, to prepare for buffer.c
to be built only when buffer_head support is enabled.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/buffer.c   | 6 ------
 fs/internal.h | 6 ------
 fs/super.c    | 4 +++-
 3 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index eb14fbaa7d35f7..58e0007892b1c7 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -563,12 +563,6 @@ static int osync_buffers_list(spinlock_t *lock, struct list_head *list)
 	return err;
 }
 
-void emergency_thaw_bdev(struct super_block *sb)
-{
-	while (sb->s_bdev && !thaw_bdev(sb->s_bdev))
-		printk(KERN_WARNING "Emergency Thaw on %pg\n", sb->s_bdev);
-}
-
 /**
  * sync_mapping_buffers - write out & wait upon a mapping's "associated" buffers
  * @mapping: the mapping which wants those buffers written
diff --git a/fs/internal.h b/fs/internal.h
index dc4eb91a577a80..cad87784eb5e0f 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -23,16 +23,10 @@ struct mnt_idmap;
  */
 #ifdef CONFIG_BLOCK
 extern void __init bdev_cache_init(void);
-
-void emergency_thaw_bdev(struct super_block *sb);
 #else
 static inline void bdev_cache_init(void)
 {
 }
-static inline int emergency_thaw_bdev(struct super_block *sb)
-{
-	return 0;
-}
 #endif /* CONFIG_BLOCK */
 
 /*
diff --git a/fs/super.c b/fs/super.c
index 04bc62ab7dfea9..d8f0a28d1850b1 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1026,7 +1026,9 @@ static void do_thaw_all_callback(struct super_block *sb)
 {
 	down_write(&sb->s_umount);
 	if (sb->s_root && sb->s_flags & SB_BORN) {
-		emergency_thaw_bdev(sb);
+		if (IS_ENABLED(CONFIG_BLOCK))
+			while (sb->s_bdev && !thaw_bdev(sb->s_bdev))
+				pr_warn("Emergency Thaw on %pg\n", sb->s_bdev);
 		thaw_super_locked(sb);
 	} else {
 		up_write(&sb->s_umount);
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
