Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EABC163A48B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:16:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozaFH-0005S9-Fd;
	Mon, 28 Nov 2022 09:16:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+7f5f7765a4bd65a1d96c+7036+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ozaEs-0005QC-CX for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:15:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VEUVq+kcF0dPE4B8MpU7tMh0mbOxws9Vns+F6we+GaA=; b=RZt/5JgocNZfIyfJrDAwC9SYhR
 HL8buSMtzByr0rqlPbHoX6y/lDyHGJEx5ozQu5IDJq4KKPlik3/WONzpz400r1wwca3FOZZTMdiK0
 bJSY1OY109edOWLj8RYFAxf5s61ByK/9GbjATtHxQzh7iJ9UVGmMMNrijSMiC9rNn/rc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VEUVq+kcF0dPE4B8MpU7tMh0mbOxws9Vns+F6we+GaA=; b=ADhVWQl6Rq+CmjTZd4xWk8AXdO
 IpzxrQmaRUJBE1/tGGqlMnHoe5EZ4H+PZ5TLptLgMP2l+kTzViUxWqxv8eemD06MpFYSw62UG74bi
 5RWPDVAh/BtcabuYEB9Cunwwg+geSPxsm2fLfYebU4qT//sUtcEcAqJwlCCk0SxJSHZs=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozaEo-00GRQf-Vh for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:15:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=VEUVq+kcF0dPE4B8MpU7tMh0mbOxws9Vns+F6we+GaA=; b=TVx/rJlgYeL27lDYWvZftBwN5E
 uIvvO4fhdApNFVVH9a7oyX7FkW2rw7tR6mts0aZLjZ5w2/RM9BtPlYVMZrWi6V+0cilxV5mxjKCLi
 Ec8hNQA0X0/34FTw0nM9Xckolq97RxmRYuR3p5DtSrvxXy4iKBFROiwI9OYlfTWKyjW15LrCeEOQX
 V9HdCZbV6+u5c3xJbFFupWfifKOIj0lU3QUkLHxGufG2Yz+vZC0Pp99v2dn0u/TX+5yGzbNK1X/3+
 sk+H1cUuco7jwOGQXnzOK1WKnIrmlzwTF09S726QGk1yA/O9EOhMby6Nzto0AM+URqmGhE4EhLlrB
 v3FraC0Q==;
Received: from [2001:4bb8:192:26e7:4739:fc09:43a5:2665] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ozaEe-000Ykd-S3; Mon, 28 Nov 2022 09:15:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 10:15:10 +0100
Message-Id: <20221128091523.1242584-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221128091523.1242584-1-hch@lst.de>
References: <20221128091523.1242584-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: m_flags is never interchanged with the buffer_heads b_flags
 directly, so use separate codepoints from that. Signed-off-by: Christoph
 Hellwig <hch@lst.de> --- fs/f2fs/f2fs.h | 10 ++++------ 1 file changed, 4
 insertions(+), 6 deletions(-) 
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
X-Headers-End: 1ozaEo-00GRQf-Vh
Subject: [f2fs-dev] [PATCH 02/15] f2fs: decouple F2FS_MAP_ from buffer head
 flags
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

m_flags is never interchanged with the buffer_heads b_flags directly,
so use separate codepoints from that.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/f2fs.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e6355a5683b75c..db2dc3fa73162b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -643,13 +643,11 @@ struct extent_tree {
 };
 
 /*
- * This structure is taken from ext4_map_blocks.
- *
- * Note that, however, f2fs uses NEW and MAPPED flags for f2fs_map_blocks().
+ * State of block returned by f2fs_map_blocks.
  */
-#define F2FS_MAP_NEW		(1 << BH_New)
-#define F2FS_MAP_MAPPED		(1 << BH_Mapped)
-#define F2FS_MAP_UNWRITTEN	(1 << BH_Unwritten)
+#define F2FS_MAP_NEW		(1U << 0)
+#define F2FS_MAP_MAPPED		(1U << 1)
+#define F2FS_MAP_UNWRITTEN	(1U << 2)
 #define F2FS_MAP_FLAGS		(F2FS_MAP_NEW | F2FS_MAP_MAPPED |\
 				F2FS_MAP_UNWRITTEN)
 
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
