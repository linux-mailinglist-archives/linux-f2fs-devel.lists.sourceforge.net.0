Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B94F33DA30E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Jul 2021 14:26:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m957A-00088F-Lk; Thu, 29 Jul 2021 12:26:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1m9577-00087p-Tg
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Jul 2021 12:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5pTIvEz4fpKG/k+B+ws2QsTj1+s4IufUzjDbHXLzhCY=; b=f/sZl+cPPtAPZ7Pgo819PC37Eb
 pHB492vzkFHV1mZBD4UfPF5+3DJ5N91Kb8YAALkkowkRC+NdC6DQomHuA3Y2ozT5AYcZhZJxP7kCO
 bCkIt+wxI9Tb4OuKf6SU2XKnLisGnrujU3xVV66nkg8XB2Ao9FdoNNtq5gfMaAlq/WGw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5pTIvEz4fpKG/k+B+ws2QsTj1+s4IufUzjDbHXLzhCY=; b=h
 LG2Lko3/WSu7Vu6Tw62mRUItDcN5xWAp0P+o9CtNDuxpAsaQq7TuZRUZvvacVpbICJ9xuQdLbnfk9
 hsTHgPjS3DjsvQBdn+jtfHO+gPtkXqv6FsJrOL1TrId3v15sBg2OkL5WKevU95osG4rsM/Kg+Jb0N
 mIrPDHnB0RFfM0CU=;
Received: from mail-m17654.qiye.163.com ([59.111.176.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m956y-006V4w-IA
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Jul 2021 12:26:13 +0000
Received: from comdg01144017.vivo.xyz (unknown [218.104.188.164])
 by mail-m17654.qiye.163.com (Hmail) with ESMTPA id 06B25200E8;
 Thu, 29 Jul 2021 20:25:53 +0800 (CST)
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 29 Jul 2021 20:25:22 +0800
Message-Id: <20210729122522.149960-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRkaHx5WS00eHhgdQk8ZGh
 1DVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mz46Aww*Mj8DEzlNK0gcLT88
 DCEwCklVSlVKTUlMTk1KTk5PTktMVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WUlKQ1VKS09VSkNDVUpNT1lXWQgBWUFJT01KNwY+
X-HM-Tid: 0a7af23a70e6d9fdkuws06b25200e8
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [59.111.176.54 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1m956y-006V4w-IA
Subject: [f2fs-dev] [PATCH] f2fs: fix missing inplace count in overwrite
 with direct io
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
Cc: Fengnan Chang <changfengnan@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For now, overwrite file with direct io use inplace policy, but not
counted, fix it.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/data.c | 6 ++++++
 fs/f2fs/f2fs.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d2cf48c5a2e4..60510acf91ec 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1477,6 +1477,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 		if (flag == F2FS_GET_BLOCK_DIO)
 			f2fs_wait_on_block_writeback_range(inode,
 						map->m_pblk, map->m_len);
+		if (!f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
+				map->m_may_create)
+			stat_add_inplace_blocks(sbi, map->m_len);
 		goto out;
 	}
 
@@ -1526,6 +1529,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 			blkaddr = dn.data_blkaddr;
 			set_inode_flag(inode, FI_APPEND_WRITE);
 		}
+		if (!create && !f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
+				map->m_may_create)
+			stat_inc_inplace_blocks(sbi);
 	} else {
 		if (create) {
 			if (unlikely(f2fs_cp_error(sbi))) {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 867f2c5d9559..3a9df28e6fd7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3804,6 +3804,8 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 		((sbi)->block_count[(curseg)->alloc_type]++)
 #define stat_inc_inplace_blocks(sbi)					\
 		(atomic_inc(&(sbi)->inplace_count))
+#define stat_add_inplace_blocks(sbi, count)				\
+		(atomic_add(count, &(sbi)->inplace_count))
 #define stat_update_max_atomic_write(inode)				\
 	do {								\
 		int cur = F2FS_I_SB(inode)->atomic_files;	\
-- 
2.29.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
