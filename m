Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AFC67F722
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Jan 2023 11:30:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pLiU4-00035Q-1E;
	Sat, 28 Jan 2023 10:30:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pLiU2-00035K-Bx
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Jan 2023 10:30:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0h7ZuZC/k9L5VFj3d76CqOEo6/eue9ekb9VSnwqL/r4=; b=SScSWEeBRZgLh0pUXUWn1ITBCz
 a0RdF0Cruu1DOBECMBCGiCeedsHyoOqyGcmQtHIS0oaIPeXNtVvz5Z4jZsy5Aif1JJXfS/tgs4dR+
 8YzEhp4j/CSU+vDUaOuugEMN6EVH8/KHGtn2dUEfLl16tcaQTNLPB6t7Jum+Ozr2bWSM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0h7ZuZC/k9L5VFj3d76CqOEo6/eue9ekb9VSnwqL/r4=; b=X
 1NZGrBKDSf0az7GFJQybWRsuk3Hat4M8x6q/oqqrhvFG9bgiUtz14jtKTa0uPK8q7B/Wu+yHOEK8C
 5ZBdW7ohydyeR7BB6ZpMWMmckjZU3wHBHqqjNHXaluEvO6wNKjWCObLJ17IATKCG4IdVCM3GaO+eA
 rgXrj0WTeoMOmGWQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pLiTw-00055s-GH for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Jan 2023 10:30:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D931F60B9A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 28 Jan 2023 10:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2420C433D2;
 Sat, 28 Jan 2023 10:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674901843;
 bh=OMDEsR/xB/z0SbtzmwsGz8acuqAQkyyx6epXmkF9GwY=;
 h=From:To:Cc:Subject:Date:From;
 b=RGrGAPd6O4mkxgOFiBSp20wAkKOrmkt4+9ekn5hHIokC/1X3PVHAnGrcn8qsmDZKi
 FsmaAAqlRazIdBKzBqAtP23f11k1jZNllaVyi14CCV8vRv7gLWbyB9Aj2blILKBFHq
 47uqhACpKkRIDYOnVOIetvXhgDQF1rmj3IzMNAEi23k8fXcz8Ql+QDOO4KvDHRJt9s
 wMhJ+8J7iR8OcajHT8kfbCIWO8brIOQxyZ3G6o+BKawBhOXLMePpw70hFH3NiYCLzb
 JNaNMRBegqRjLCeLzyU/ax8XaoMxgT+zLXS0KaTi1URdwKK82rfRuMJKMPxB3eTgW9
 ZviESNjvuWtTw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sat, 28 Jan 2023 18:30:11 +0800
Message-Id: <20230128103011.1316979-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: .i_compress_level was introduced by commit 3fde13f817e2
 ("f2fs:
 compress: support compress level"), but never be used. This patch updates
 as below: - load high 8-bits of on-disk .i_compress_flag to in-memory
 .i_compress_level
 - load low 8-bits of on-disk .i_compress_flag to in-memory .i_compress_flag
 - change type of [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pLiTw-00055s-GH
Subject: [f2fs-dev] [PATCH] f2fs: clean up i_compress_flag and
 i_compress_level usage
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

.i_compress_level was introduced by commit 3fde13f817e2 ("f2fs: compress:
support compress level"), but never be used.

This patch updates as below:
- load high 8-bits of on-disk .i_compress_flag to in-memory .i_compress_level
- load low 8-bits of on-disk .i_compress_flag to in-memory .i_compress_flag
- change type of in-memory .i_compress_flag from unsigned short to unsigned
char.

w/ above changes, we can avoid unneeded bit shift whenever during
.init_compress_ctx(), and shrink size of struct f2fs_inode_info.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c |  8 +++-----
 fs/f2fs/f2fs.h     |  7 +++----
 fs/f2fs/inode.c    | 16 +++++++++++++---
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 365ee074d3b3..fdfa3d7c9ebe 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -241,7 +241,7 @@ static int lz4_init_compress_ctx(struct compress_ctx *cc)
 	unsigned int size = LZ4_MEM_COMPRESS;
 
 #ifdef CONFIG_F2FS_FS_LZ4HC
-	if (F2FS_I(cc->inode)->i_compress_flag >> COMPRESS_LEVEL_OFFSET)
+	if (F2FS_I(cc->inode)->i_compress_level)
 		size = LZ4HC_MEM_COMPRESS;
 #endif
 
@@ -267,8 +267,7 @@ static void lz4_destroy_compress_ctx(struct compress_ctx *cc)
 #ifdef CONFIG_F2FS_FS_LZ4HC
 static int lz4hc_compress_pages(struct compress_ctx *cc)
 {
-	unsigned char level = F2FS_I(cc->inode)->i_compress_flag >>
-						COMPRESS_LEVEL_OFFSET;
+	unsigned char level = F2FS_I(cc->inode)->i_compress_level;
 	int len;
 
 	if (level)
@@ -340,8 +339,7 @@ static int zstd_init_compress_ctx(struct compress_ctx *cc)
 	zstd_cstream *stream;
 	void *workspace;
 	unsigned int workspace_size;
-	unsigned char level = F2FS_I(cc->inode)->i_compress_flag >>
-						COMPRESS_LEVEL_OFFSET;
+	unsigned char level = F2FS_I(cc->inode)->i_compress_level;
 
 	if (!level)
 		level = F2FS_ZSTD_DEFAULT_CLEVEL;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b78e28928a0b..631ef653aaa5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -881,7 +881,7 @@ struct f2fs_inode_info {
 	unsigned char i_compress_algorithm;	/* algorithm type */
 	unsigned char i_log_cluster_size;	/* log of cluster size */
 	unsigned char i_compress_level;		/* compress level (lz4hc,zstd) */
-	unsigned short i_compress_flag;		/* compress flag */
+	unsigned char i_compress_flag;		/* compress flag */
 	unsigned int i_cluster_size;		/* cluster size */
 
 	unsigned int atomic_write_cnt;
@@ -4392,9 +4392,8 @@ static inline int set_compress_context(struct inode *inode)
 	if ((F2FS_I(inode)->i_compress_algorithm == COMPRESS_LZ4 ||
 		F2FS_I(inode)->i_compress_algorithm == COMPRESS_ZSTD) &&
 			F2FS_OPTION(sbi).compress_level)
-		F2FS_I(inode)->i_compress_flag |=
-				F2FS_OPTION(sbi).compress_level <<
-				COMPRESS_LEVEL_OFFSET;
+		F2FS_I(inode)->i_compress_level =
+				F2FS_OPTION(sbi).compress_level;
 	F2FS_I(inode)->i_flags |= F2FS_COMPR_FL;
 	set_inode_flag(inode, FI_COMPRESSED_FILE);
 	stat_inc_compr_inode(inode);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index a66c5338ca67..dbf98a295a30 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -460,11 +460,17 @@ static int do_read_inode(struct inode *inode)
 					(fi->i_flags & F2FS_COMPR_FL)) {
 		if (F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
 					i_log_cluster_size)) {
+			unsigned short compress_flag;
+
 			atomic_set(&fi->i_compr_blocks,
 					le64_to_cpu(ri->i_compr_blocks));
 			fi->i_compress_algorithm = ri->i_compress_algorithm;
 			fi->i_log_cluster_size = ri->i_log_cluster_size;
-			fi->i_compress_flag = le16_to_cpu(ri->i_compress_flag);
+			compress_flag = le16_to_cpu(ri->i_compress_flag);
+			fi->i_compress_level = compress_flag >>
+						COMPRESS_LEVEL_OFFSET;
+			fi->i_compress_flag = compress_flag &
+					(BIT(COMPRESS_LEVEL_OFFSET) - 1);
 			fi->i_cluster_size = 1 << fi->i_log_cluster_size;
 			set_inode_flag(inode, FI_COMPRESSED_FILE);
 		}
@@ -686,13 +692,17 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
 		if (f2fs_sb_has_compression(F2FS_I_SB(inode)) &&
 			F2FS_FITS_IN_INODE(ri, F2FS_I(inode)->i_extra_isize,
 							i_log_cluster_size)) {
+			unsigned short compress_flag;
+
 			ri->i_compr_blocks =
 				cpu_to_le64(atomic_read(
 					&F2FS_I(inode)->i_compr_blocks));
 			ri->i_compress_algorithm =
 				F2FS_I(inode)->i_compress_algorithm;
-			ri->i_compress_flag =
-				cpu_to_le16(F2FS_I(inode)->i_compress_flag);
+			compress_flag = F2FS_I(inode)->i_compress_flag |
+				F2FS_I(inode)->i_compress_level <<
+						COMPRESS_LEVEL_OFFSET;
+			ri->i_compress_flag = cpu_to_le16(compress_flag);
 			ri->i_log_cluster_size =
 				F2FS_I(inode)->i_log_cluster_size;
 		}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
