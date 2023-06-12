Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C75672B766
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jun 2023 07:37:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8aFI-0004xp-MD;
	Mon, 12 Jun 2023 05:37:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+33f57c12507318cbaa86+7232+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q8aF6-0004x3-21 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 05:37:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4trhRw7xARg2lJaXKLjvoI562MgArwdRoegsyL2HFFQ=; b=BDpIUWCW/WtkPk17eErCzbdBpH
 PU12J6VN3YSu2G8GomLrcCT+uLPUTxUkvXGK3lNzHpqWk83MKwSIAPemORcpd5HdQdM+qdC0+FOAJ
 eqUkeoFyhXX9XyURLsIalOfQGjgfMAWtwEM66HxkGR6N1xDgfYk5yg7RiKwpVz0ZBh5g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4trhRw7xARg2lJaXKLjvoI562MgArwdRoegsyL2HFFQ=; b=S
 ntfSROQdaon/CVsxrs7XDB5uEKlbtTwplG7Nx0AXdXkaMkxWfHjDHd1bl9zGPXOv9NDoQ/htqT6gQ
 0N6IkXmmRsZXfygAeBUki3dMEY4Aj4i9+xu+84hn16/U1W6UtPbrsGANvIqZi9zotJD2d7e5vqau+
 MTcm0lTAZve2DDNI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8aF0-0002uR-R6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 05:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=4trhRw7xARg2lJaXKLjvoI562MgArwdRoegsyL2HFFQ=; b=x+c50jeIZW7m/QplkfoSsK/Cxa
 ndP60B4TEdN+GlO6lpj3/whvj6a5ceUGKv002v4x1+ugVx8Gn5KX8WvLxeiALiaQC9RND5PB+tF1P
 q5qVxfbfOwSvVUFc6Zfr0MQtM5l11P7Zjv9QCCFVYZS2BEpRW6s/xDA8KwHChdjbpHGcIMJUYZ/83
 7LVM23YmOY8IfKLq+aFYBL4algEC8Q/++Govj+iwco/61XBPKbLdix3SPCnYTh6EbHIKeUGZNnA04
 nKE2vrOhasKhaJOUBAUvibhP9w6UxWtiysH5Dw8x2J/u+hpZ2NrYhyrpFU1xodjYswsC5nJYABSEm
 H7y1inbQ==;
Received: from
 2a02-8389-2341-5b80-8c8c-28f8-1274-e038.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:8c8c:28f8:1274:e038] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q8aEr-002fGv-1w; Mon, 12 Jun 2023 05:37:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 12 Jun 2023 07:37:11 +0200
Message-Id: <20230612053711.585847-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Since commit a2ad63daa88b ("VFS: add FMODE_CAN_ODIRECT file
 flag") file systems can just set the FMODE_CAN_ODIRECT flag at open time
 instead of wiring up a dummy direct_IO method to indicate support f [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q8aF0-0002uR-R6
Subject: [f2fs-dev] [PATCH] f2fs: set FMODE_CAN_ODIRECT instead of a dummy
 direct_IO method
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since commit a2ad63daa88b ("VFS: add FMODE_CAN_ODIRECT file flag") file
systems can just set the FMODE_CAN_ODIRECT flag at open time instead of
wiring up a dummy direct_IO method to indicate support for direct I/O.

Do that for f2fs so that noop_direct_IO can eventually be removed.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/data.c | 1 -
 fs/f2fs/file.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 7165b1202f539c..5e90416f64daa1 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4067,7 +4067,6 @@ const struct address_space_operations f2fs_dblock_aops = {
 	.migrate_folio	= filemap_migrate_folio,
 	.invalidate_folio = f2fs_invalidate_folio,
 	.release_folio	= f2fs_release_folio,
-	.direct_IO	= noop_direct_IO,
 	.bmap		= f2fs_bmap,
 	.swap_activate  = f2fs_swap_activate,
 	.swap_deactivate = f2fs_swap_deactivate,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5ac53d2627d20d..ca809e366cb79f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -547,6 +547,7 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
 		return err;
 
 	filp->f_mode |= FMODE_NOWAIT;
+	filp->f_mode |= FMODE_CAN_ODIRECT;
 
 	return dquot_file_open(inode, filp);
 }
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
