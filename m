Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9831A9CA3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 13:37:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOgLt-0000KU-Bo; Wed, 15 Apr 2020 11:37:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1jOgLs-0000KJ-J8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:37:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kXEGyejFACuh4FKp0QfQycaxJtKofsJnoq8c26/+ubo=; b=JczGPCoApWy/CDKg8ogc+GHQVv
 5bdkDCldqc78CIlTN86etqmhWNubs5TWdfHs67CFL5xcKK/mlj9xCH5OI9w4XspBR4t2eRJdpFO8Q
 IQMHueXnJeOQOR3BsQm/j0ElgMd4KEVG1uVHRJ0OntysTAN0F9c6spNrncgizzk4TH1c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kXEGyejFACuh4FKp0QfQycaxJtKofsJnoq8c26/+ubo=; b=K1D993zqvhWRgXEJdzBBBK5zZ4
 mJ66KqovxDMR5R+wUvIQLUR5WJRI+WU5mRHNBjSCLEX4moOdlxSGbfdGHOo9pa1MUH+FkYhyfPzmr
 5ow5PC6Mm2f+/TyvtozyQtczfk/MY+5HXBB2OsWpvQ25RVHWlCNJcEFGuYvgEwDhXW/k=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOgLr-00GSmp-CV
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:37:08 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 306F520737;
 Wed, 15 Apr 2020 11:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586950621;
 bh=DB1F7DmshMsLEY2YqueSwvxRlGpbDWkuaDaxP+9e9Q0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gAxO4S1SJxQXDreBEWehxYJKlq01OzhfwiS+bVtTCEbqYPBqGLTRcgGFXddZ+a1Y/
 6cLS8AyCM9C1DeVqNxsklvSCAZizhKjJGhePEwfk6KBDbz9ve069Tt6KlelpJOXH4M
 wd4H6GzMw3FxhgL65gBGcUTVJBrefn8tOagzCRIw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 15 Apr 2020 07:34:28 -0400
Message-Id: <20200415113445.11881-113-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415113445.11881-1-sashal@kernel.org>
References: <20200415113445.11881-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jOgLr-00GSmp-CV
Subject: [f2fs-dev] [PATCH AUTOSEL 5.6 113/129] f2fs: fix to account
 compressed blocks in f2fs_compressed_blocks()
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit 1a67cbe141cf991af252a88143d0fd975be2d9e7 ]

por_fsstress reports inconsistent status in orphan inode, the root cause
of this is in f2fs_write_raw_pages() we decrease i_compr_blocks incorrectly
due to wrong calculation in f2fs_compressed_blocks().

So this patch exposes below two functions based on __f2fs_cluster_blocks:
- f2fs_compressed_blocks: get count of compressed blocks in compressed cluster
- f2fs_cluster_blocks: get count of valid blocks (including reserved blocks)
in compressed cluster.

Then use f2fs_compress_blocks() to get correct compressed blocks count in
f2fs_write_raw_pages().

sanity_check_inode: inode (ino=ad80) hash inconsistent i_compr_blocks:2, i_blocks:1, run fsck to fix

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/compress.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index ad8e25a1fbc26..11b13b881ada5 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -536,8 +536,7 @@ static bool __cluster_may_compress(struct compress_ctx *cc)
 	return true;
 }
 
-/* return # of compressed block addresses */
-static int f2fs_compressed_blocks(struct compress_ctx *cc)
+static int __f2fs_cluster_blocks(struct compress_ctx *cc, bool compr)
 {
 	struct dnode_of_data dn;
 	int ret;
@@ -560,8 +559,13 @@ static int f2fs_compressed_blocks(struct compress_ctx *cc)
 
 			blkaddr = datablock_addr(dn.inode,
 					dn.node_page, dn.ofs_in_node + i);
-			if (blkaddr != NULL_ADDR)
-				ret++;
+			if (compr) {
+				if (__is_valid_data_blkaddr(blkaddr))
+					ret++;
+			} else {
+				if (blkaddr != NULL_ADDR)
+					ret++;
+			}
 		}
 	}
 fail:
@@ -569,6 +573,18 @@ static int f2fs_compressed_blocks(struct compress_ctx *cc)
 	return ret;
 }
 
+/* return # of compressed blocks in compressed cluster */
+static int f2fs_compressed_blocks(struct compress_ctx *cc)
+{
+	return __f2fs_cluster_blocks(cc, true);
+}
+
+/* return # of valid blocks in compressed cluster */
+static int f2fs_cluster_blocks(struct compress_ctx *cc, bool compr)
+{
+	return __f2fs_cluster_blocks(cc, false);
+}
+
 int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index)
 {
 	struct compress_ctx cc = {
@@ -578,7 +594,7 @@ int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index)
 		.cluster_idx = index >> F2FS_I(inode)->i_log_cluster_size,
 	};
 
-	return f2fs_compressed_blocks(&cc);
+	return f2fs_cluster_blocks(&cc, false);
 }
 
 static bool cluster_may_compress(struct compress_ctx *cc)
@@ -627,7 +643,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 	bool prealloc;
 
 retry:
-	ret = f2fs_compressed_blocks(cc);
+	ret = f2fs_cluster_blocks(cc, false);
 	if (ret <= 0)
 		return ret;
 
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
