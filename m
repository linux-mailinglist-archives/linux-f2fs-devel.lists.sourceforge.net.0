Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B579390ABE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 May 2021 22:51:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lle1o-0000bd-C7; Tue, 25 May 2021 20:51:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lle1m-0000bD-1M
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 20:51:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=POZfKH0NRYSLtghBVRkiwxp4AouclKjqK8MJkmbjMdo=; b=d6CbsqB12DPJIrMzcgrGB17XiI
 q5ZyBjMn7Jju6s4kAjanVSnjr2B+opH0+qhOp2iY3mZpPUJwyByKSkkuFwSi4tQIkMVnN9UQL4IL+
 L0b/LmXIfVJngLrM6tNlrMKTkUhUUvJ+jzOSIQG+jEeTupgcHrytRIN7OptEackfszQs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=POZfKH0NRYSLtghBVRkiwxp4AouclKjqK8MJkmbjMdo=; b=b
 z+O3fmnwC1shMl9XsqtnTb8hNYMod/j4BVZOYuBo0vPFANUkUM0J8MxUEblPN3NVT67/8sGG1vqIs
 +USpYMwQzPpsxBmk+Pp2q8mYWKWCPlfBthqh/PCnKVlPa41FfsexE9aC27LtElfneAjpaBoKvCr9u
 1XmFAc5lWeuFTZZM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lle1k-005n8f-Sf
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 20:51:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B669613F5;
 Tue, 25 May 2021 20:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621975903;
 bh=7EeKALyij/Ijkt0y597BE1cK3wgovhTXLCP66d7vNbQ=;
 h=From:To:Cc:Subject:Date:From;
 b=jXXRDgUDfUjHSNPzUOuQro+IlP/5a7c1KVhntL5Qx4i+nYmZ4Ou5NVNWUQ42xwwAn
 iawRKa8QU8KZO4HGbIp2ykfn8NR0/WkvYvPwOSvuXXpuvC+xJG3g+j/O8cXDMYykHK
 wXS1u+SLle2D1MXV2ZBPFpOlsPHSuJY15tMkWPNtmVkSL5SUK92vllMQnP76kZa9sN
 /dBm1Bo7QxNqkn5tf07VYbZrQJNE0VUTPhoA0NK2dpeGwP/UtmuF3ZQ/sluTYk8r3a
 GUW7qdUaKBmWDNd+dGh8F2ihMBsujid24uLgeUgbiJljqKEFlJPLK54HnX/JCPGMC9
 yL/6njYSpoyXg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 25 May 2021 13:51:38 -0700
Message-Id: <20210525205138.2512855-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lle1k-005n8f-Sf
Subject: [f2fs-dev] [PATCH] sload.f2fs: use F2FS_COMPRESS_RELEASED instead
 of IMMUTABLE bit
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's use F2FS_COMPRESS_RELEASED to disallow writes only.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/segment.c    | 6 +++---
 include/f2fs_fs.h | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/fsck/segment.c b/fsck/segment.c
index 0b257364fd5b..0156690ed9aa 100644
--- a/fsck/segment.c
+++ b/fsck/segment.c
@@ -521,9 +521,9 @@ int f2fs_build_file(struct f2fs_sb_info *sbi, struct dentry *de)
 		node_blk->i.i_compress_algrithm = c.compress.alg;
 		node_blk->i.i_log_cluster_size =
 				c.compress.cc.log_cluster_size;
-		node_blk->i.i_flags = cpu_to_le32(
-				F2FS_COMPR_FL |
-				(c.compress.readonly ? FS_IMMUTABLE_FL : 0));
+		node_blk->i.i_flags = cpu_to_le32(F2FS_COMPR_FL);
+		if (c.compress.readonly)
+			node_blk->i.i_inline |= F2FS_COMPRESS_RELEASED;
 		ASSERT(write_inode(node_blk, ni.blk_addr) >= 0);
 
 		while (!eof && (n = bulkread(fd, rbuf, c.compress.cc.rlen,
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 4c1d06cdae39..8969ae2ebc34 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -889,6 +889,8 @@ struct f2fs_extent {
 #define F2FS_DATA_EXIST		0x08	/* file inline data exist flag */
 #define F2FS_INLINE_DOTS	0x10	/* file having implicit dot dentries */
 #define F2FS_EXTRA_ATTR		0x20	/* file having extra attribute */
+#define F2FS_PIN_FILE		0x40	/* file should not be gced */
+#define F2FS_COMPRESS_RELEASED	0x80	/* file released compressed blocks */
 
 #if !defined(offsetof)
 #define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
