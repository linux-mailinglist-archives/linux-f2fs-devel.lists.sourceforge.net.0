Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB216F807D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 May 2023 12:02:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pusGr-0004ga-Lr;
	Fri, 05 May 2023 10:02:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pusGq-0004gR-Px
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 10:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6qumTK+NelXkhB5VDlu/80vlcehzrumCR0Z8roARkTo=; b=Rno1l0QzDuBPIE+l9HRvyr9Rp3
 1q7eYvFFUjdLq+JhU96pNimsnMknNyWp0ACPGLGuR/BQdxKGfCMOFtSYJ38MUbFoRw9E1cVOgrlmx
 9u3ZOP9uu63ZA5JnsWf4pkqMzbYr8YmzrRw6zIiYzMRCPjqB7EUnfGQyPrxiJWvkh26Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6qumTK+NelXkhB5VDlu/80vlcehzrumCR0Z8roARkTo=; b=NCzF4u+6eeNYmkJ3lznGxI0t+s
 W878sWcqDBtBViS06wVroEfnPlWzyZBUK80+IFsG65mopKk/CHMAiysFfbrP47eCQo74ig0v+osqB
 oaOB1mdEGRxZWX/ym4OGylf2IU4zJA3ldlBm4AEPAFBfJpXqxDuUzTWK7DRswwzW0zqs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pusGl-0007k4-Ss for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 10:02:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7FDC763D04
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 May 2023 10:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7672C4339E;
 Fri,  5 May 2023 10:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683280945;
 bh=ZyVrUVlQjetosZr4whKO7s1Es2Z/Kb1syAKYglz/M1c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jhumQTJwgz15rJ8MWb+GX64ZZl3vOqHgmZr4DRKnaVGjkNFuEdshjQnF7DemzFbo6
 N07vBPzeQqL0qBH0g9sfUbiR0oph9kiRPqgnDSjs/E4xydtQK10xWUCeK2hAzdsDTP
 QRuA+OD3k11j5kRQGnWH1dOfJprzoedlrLUN6NrGOrDCubOM3ueZPsSZWJn7zm19ni
 VjzefE3Y+TbJVEBY8XL08FJJ7dI2wQvz6VPg2G8W/+17cnVpmSxD21Z0qpNW2LmSk5
 DKomY4GWGboFcGypWSprZYXYF+Ve7INYKLF16BM98E6GejlYaw3Ttq867vJDgXOp1l
 uIs7hzCHesZXw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri,  5 May 2023 18:02:01 +0800
Message-Id: <20230505100205.1921708-2-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230505100205.1921708-1-chao@kernel.org>
References: <20230505100205.1921708-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit b28f047b28c5 ("f2fs: compress: support chksum")
 renames
 i_padding to i_compress_flag in struct f2fs_inode, adjust f2fs-tools' codes
 as well. Signed-off-by: Chao Yu <chao@kernel.org> --- fsck/mount.c | 2 +-
 include/f2fs_fs.h | 5 ++++- mkfs/f2fs_format.c | 4 ++-- 3 files changed,
 7 insertions(+), 4 deletions(-) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pusGl-0007k4-Ss
Subject: [f2fs-dev] [PATCH 2/6] f2fs-tools: rename i_padding to
 i_compress_flag
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

Commit b28f047b28c5 ("f2fs: compress: support chksum") renames i_padding
to i_compress_flag in struct f2fs_inode, adjust f2fs-tools' codes as well.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/mount.c       | 2 +-
 include/f2fs_fs.h  | 5 ++++-
 mkfs/f2fs_format.c | 4 ++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index df0314d..2e1634f 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -304,7 +304,7 @@ void print_inode_info(struct f2fs_sb_info *sbi,
 			DISP_u64(inode, i_compr_blocks);
 			DISP_u32(inode, i_compress_algrithm);
 			DISP_u32(inode, i_log_cluster_size);
-			DISP_u32(inode, i_padding);
+			DISP_u32(inode, i_compress_flag);
 		}
 	}
 
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index c71b59d..7ad1c40 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1076,7 +1076,10 @@ struct f2fs_inode {
 			__le64 i_compr_blocks;	/* # of compressed blocks */
 			__u8 i_compress_algrithm;	/* compress algrithm */
 			__u8 i_log_cluster_size;	/* log of cluster size */
-			__le16 i_padding;		/* padding */
+			__le16 i_compress_flag;		/* compress flag */
+						/* 0 bit: chksum flag
+						 * [8,15] bits: compress level
+						 */
 			__le32 i_extra_end[0];	/* for attribute size calculation */
 		} __attribute__((packed));
 		__le32 i_addr[DEF_ADDRS_PER_INODE];	/* Pointers to data blocks */
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index d3bb622..11804eb 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -1289,7 +1289,7 @@ static int f2fs_write_root_inode(void)
 	if (c.feature & cpu_to_le32(F2FS_FEATURE_COMPRESSION)) {
 		raw_node->i.i_compress_algrithm = 0;
 		raw_node->i.i_log_cluster_size = 0;
-		raw_node->i.i_padding = 0;
+		raw_node->i.i_compress_flag = 0;
 	}
 
 	data_blk_nor = get_sb(main_blkaddr) +
@@ -1611,7 +1611,7 @@ static int f2fs_write_lpf_inode(void)
 	if (c.feature & cpu_to_le32(F2FS_FEATURE_COMPRESSION)) {
 		raw_node->i.i_compress_algrithm = 0;
 		raw_node->i.i_log_cluster_size = 0;
-		raw_node->i.i_padding = 0;
+		raw_node->i.i_compress_flag = 0;
 	}
 
 	data_blk_nor = f2fs_add_default_dentry_lpf();
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
