Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E85913D35B3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 09:49:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6pwK-0006yM-R7; Fri, 23 Jul 2021 07:49:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1m6pwB-0006xW-Vo
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 07:49:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lEkO8gO6Y372IlYBK3JguJ1jBTlnwMBiXGhnUtq9/P0=; b=BsHTHxH/Bi0JPciuygS95XT9l+
 AQ7kXQitcnrbHMRp5nEUxnwJMVdmE46anFnUyGCNCYgNxGSTcyEs5ozvL4t/1WppW3X9eKM+wgVUN
 mbNVsDxgh3ZnYbhcbT2FChPeeVgj7iMPuRb491zprCizIIMC3z7UzJDEY/RCgp93YLDQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lEkO8gO6Y372IlYBK3JguJ1jBTlnwMBiXGhnUtq9/P0=; b=e
 bb3fEHL0niXhKXcTGNii7L7t48t/4ue53SkwUW+YB8dlVOfYBVbx4FMOIXhxGoviuFnB1BBVrpHGa
 Gu7ggReZEL5EFomSlzCOzNu/1Y801M7rUfZqbsG2+H5YEk0V99WIlKNawhVBuM3ugZ82i1mcN/qwg
 78GKHarYaGZio/rM=;
Received: from mail-pl1-f169.google.com ([209.85.214.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m6pwA-0005I7-L0
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 07:49:39 +0000
Received: by mail-pl1-f169.google.com with SMTP id k1so2117477plt.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 23 Jul 2021 00:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lEkO8gO6Y372IlYBK3JguJ1jBTlnwMBiXGhnUtq9/P0=;
 b=tHVMYjeTgXnLbuliKbZR98nOPSUuT14Wr448SkZPlHED05aXCsN6a6ienQbza85BIW
 hpaEMQEDm4oX4qrNGYGOthE0tY9Yl5dIkZLMrVUUzoosI3dasaYdfGdClNlZsuSABk18
 qDAzhfivMAH4EDedjnwEQA0Jadsc/R5+lMHBZBXQMHBlrwwPFJVPIp2UCZ4j+kWFTwpg
 9og8W7eqQZKe39bpF3nX30uk4tadDbd3tIkSlKQvvn++CD8OsXXBirBoivMsJwiWpOSb
 ZI6kOBnseXPPyE32irK/EgCghfCcDlc/0LlOlZzypqPD0mxcaSpeOancfnDpJeon+pzc
 8HSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lEkO8gO6Y372IlYBK3JguJ1jBTlnwMBiXGhnUtq9/P0=;
 b=ELZ1pTvzPpheW0+9gXyHsZStiUP7PSjOgklBPH4AndyYd2ftJL9ZWEj40qLUudPI0O
 Bms1K7Cf4tdB7+LE2sEKCbyxLuu0rUw0JeIiWBE+TrRoGU1e6N7lbg+EeZYqSJtR0vh7
 th38EXMZfTvCGFAYN7rWv+SkYguWqxNRED1U46DVUA9hNXgqZYMgNcGNgw10oV1ECZoO
 BL80CQ/fYg/QNcGCloxnkO5G9GZyWd+M5vKBEOX26f5YiO7Wf4h2wOmvavptHTDbVE2I
 b/XwguotTujNfx6FZfWmQAvXHBpHWV2gfryla6JKUYwO1wBDF+uPpNcIXr2wdy4kiEpG
 oEDQ==
X-Gm-Message-State: AOAM531lqKQ21Y+Iy9zIKaxFImxUXrgrHkOxBC5ERxNUpsGXqEvdAqDK
 datcMdO3N6d7y4+eT36sZlw=
X-Google-Smtp-Source: ABdhPJwNP57FHef6iXOx5uq5Ix7GZqt1vwuT7xj1c7b08fQA61B2FqZYNM1SirpD1K/0kg5PpalAgA==
X-Received: by 2002:a05:6a00:180d:b029:331:bcb5:1589 with SMTP id
 y13-20020a056a00180db0290331bcb51589mr3413182pfa.27.1627026572916; 
 Fri, 23 Jul 2021 00:49:32 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:4610:babe:3aeb:2b63])
 by smtp.gmail.com with ESMTPSA id c24sm14873204pfp.129.2021.07.23.00.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 00:49:32 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 23 Jul 2021 00:49:28 -0700
Message-Id: <20210723074928.1659385-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.169 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.169 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1m6pwA-0005I7-L0
Subject: [f2fs-dev] [PATCH v3] f2fs: change fiemap way in printing
 compression chunk
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

When we print out a discontinuous compression chunk, it shows like a
continuous chunk now. To show it more correctly, I've changed the way of
printing fiemap info like below. Plus, eliminated NEW_ADDR(-1) in fiemap
info, since it is not in fiemap user api manual.

Let's assume 16KB compression cluster.

<before>
   Logical          Physical         Length           Flags
0:  0000000000000000 00000002c091f000 0000000000004000 1008
1:  0000000000004000 00000002c0920000 0000000000004000 1008
  ...
9:  0000000000034000 0000000f8c623000 0000000000004000 1008
10: 0000000000038000 000000101a6eb000 0000000000004000 1008

<after>
0:  0000000000000000 00000002c091f000 0000000000004000 1008
1:  0000000000004000 00000002c0920000 0000000000004000 1008
  ...
9:  0000000000034000 0000000f8c623000 0000000000001000 1008
10: 0000000000035000 000000101a6ea000 0000000000003000 1008
11: 0000000000038000 000000101a6eb000 0000000000002000 1008
12: 000000000003a000 00000002c3544000 0000000000002000 1008

Flags
0x1000 => FIEMAP_EXTENT_MERGED
0x0008 => FIEMAP_EXTENT_ENCODED

Signed-off-by: Daeho Jeong <daehojeong@google.com>

---
v3: fix the missing last extent flag issue
v2: changed the print format
---
 fs/f2fs/data.c | 75 ++++++++++++++++++++++++++++----------------------
 1 file changed, 42 insertions(+), 33 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 3a01a1b50104..29b09a74cdc9 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1843,8 +1843,9 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	u64 logical = 0, phys = 0, size = 0;
 	u32 flags = 0;
 	int ret = 0;
-	bool compr_cluster = false;
+	bool compr_cluster = false, compr_appended;
 	unsigned int cluster_size = F2FS_I(inode)->i_cluster_size;
+	unsigned int count_in_cluster;
 	loff_t maxbytes;
 
 	if (fieinfo->fi_flags & FIEMAP_FLAG_CACHE) {
@@ -1892,15 +1893,17 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	map.m_next_pgofs = &next_pgofs;
 	map.m_seg_type = NO_CHECK_TYPE;
 
-	if (compr_cluster)
-		map.m_len = cluster_size - 1;
+	if (compr_cluster) {
+		map.m_lblk += 1;
+		map.m_len = cluster_size - count_in_cluster;
+	}
 
 	ret = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_FIEMAP);
 	if (ret)
 		goto out;
 
 	/* HOLE */
-	if (!(map.m_flags & F2FS_MAP_FLAGS)) {
+	if (!compr_cluster && !(map.m_flags & F2FS_MAP_FLAGS)) {
 		start_blk = next_pgofs;
 
 		if (blks_to_bytes(inode, start_blk) < blks_to_bytes(inode,
@@ -1910,6 +1913,14 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		flags |= FIEMAP_EXTENT_LAST;
 	}
 
+	compr_appended = false;
+	/* In a case of compressed cluster, append this to the last extent */
+	if (compr_cluster && ((map.m_flags & F2FS_MAP_UNWRITTEN) ||
+			!(map.m_flags & F2FS_MAP_FLAGS))) {
+		compr_appended = true;
+		goto skip_fill;
+	}
+
 	if (size) {
 		flags |= FIEMAP_EXTENT_MERGED;
 		if (IS_ENCRYPTED(inode))
@@ -1926,38 +1937,36 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	if (start_blk > last_blk)
 		goto out;
 
-	if (compr_cluster) {
-		compr_cluster = false;
-
-
-		logical = blks_to_bytes(inode, start_blk - 1);
-		phys = blks_to_bytes(inode, map.m_pblk);
-		size = blks_to_bytes(inode, cluster_size);
-
-		flags |= FIEMAP_EXTENT_ENCODED;
-
-		start_blk += cluster_size - 1;
-
-		if (start_blk > last_blk)
-			goto out;
-
-		goto prep_next;
-	}
-
+skip_fill:
 	if (map.m_pblk == COMPRESS_ADDR) {
 		compr_cluster = true;
-		start_blk++;
-		goto prep_next;
-	}
-
-	logical = blks_to_bytes(inode, start_blk);
-	phys = blks_to_bytes(inode, map.m_pblk);
-	size = blks_to_bytes(inode, map.m_len);
-	flags = 0;
-	if (map.m_flags & F2FS_MAP_UNWRITTEN)
-		flags = FIEMAP_EXTENT_UNWRITTEN;
+		count_in_cluster = 1;
+	} else if (compr_appended) {
+		unsigned int appended_blks = cluster_size -
+						count_in_cluster + 1;
+		size += blks_to_bytes(inode, appended_blks);
+		start_blk += appended_blks;
+		compr_cluster = false;
+	} else {
+		logical = blks_to_bytes(inode, start_blk);
+		phys = __is_valid_data_blkaddr(map.m_pblk) ?
+			blks_to_bytes(inode, map.m_pblk) : 0;
+		size = blks_to_bytes(inode, map.m_len);
+		flags = 0;
+
+		if (compr_cluster) {
+			flags = FIEMAP_EXTENT_ENCODED;
+			count_in_cluster += map.m_len;
+			if (count_in_cluster == cluster_size) {
+				compr_cluster = false;
+				size += blks_to_bytes(inode, 1);
+			}
+		} else if (map.m_flags & F2FS_MAP_UNWRITTEN) {
+			flags = FIEMAP_EXTENT_UNWRITTEN;
+		}
 
-	start_blk += bytes_to_blks(inode, size);
+		start_blk += bytes_to_blks(inode, size);
+	}
 
 prep_next:
 	cond_resched();
-- 
2.32.0.432.gabb21c7263-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
