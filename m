Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C53B3D2F03
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 23:19:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6g6W-0007TY-FQ; Thu, 22 Jul 2021 21:19:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1m6g6V-0007TS-0V
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 21:19:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MtB0Pe+HpTTnpOXUl0i7ZYxuksvA1VGHCZTzux/Ivfg=; b=GMYXXQQlwGZQA2bjGzAULmEJoH
 eNXUgrufmLhU1Y7aGxhf5JodJ0111rv8bYbzPOn8PPjqZoB3e2Uiy0gC/TjtH6YBdVw4Qka1OVz3R
 +HoU5NEPSsJMBeSBU1krErjORnWud+LjrjdFjmiJn59UjIadKW3GOl8OSojxZe6XZNso=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MtB0Pe+HpTTnpOXUl0i7ZYxuksvA1VGHCZTzux/Ivfg=; b=k
 MBchdtfOZkOCUAThYzoOzvUhoov2Uc3Rjq7k3RXjBuXows/nV0IXY0zYqGQemK+d1qse+l1nrMu5B
 3yE/2L3ugfA3vKoCIi9qkRMoJCHJvgBeUqrcHVR47sOkbL70qkluDQHZ1DMjKhbeb1EPgWRjQsxxs
 vL+WNYWMbDTQHScI=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m6g6O-00HC9l-IT
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 21:19:38 +0000
Received: by mail-pl1-f182.google.com with SMTP id e5so813297pla.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jul 2021 14:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MtB0Pe+HpTTnpOXUl0i7ZYxuksvA1VGHCZTzux/Ivfg=;
 b=UXwwYtj2Rm1+R18AqC/evMp6rEzaA+7UNZLMn8pdAlQg6NKkkO9xURhifbhi0FWXa7
 gSh85TvDKY2CYR+TvliJTFSaXJDPdQzYvL0YbsRfYs2RpaQ/7tNh/XLHM8wRNipWiyEf
 mm7F+RKjnDRebiWp6mLW7NB9K0nZNHQX6R6gH1HnZT5BotoNxFmkUjIRmmaT9RoA+uwJ
 LVqXne2rLT8QrJz+pO3d1cmawMpmT3FWnyLfVupx5CU7BdpsckAJg0UInDwPlnd1AHlr
 U2kALZunJcGPXX1rtvMAlCfit5+CjTUZBNaTXVA9tqvoVwVpVPT0dzGBbGB2vVLagvGY
 U7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MtB0Pe+HpTTnpOXUl0i7ZYxuksvA1VGHCZTzux/Ivfg=;
 b=ptCk4gKROpe5+9TGfGd8XElIoLgiF/WuHffQx1WlDFJyiqJSNW8FVy89WRgkJpqUNO
 kxe3Bki7OUUiLWg/nTszpIdsz1wq13467C+l6Yffwpn+/hPoiSxJqHz++ywXzvJ8Drxy
 lM5tFGmie/9XrsLNGj8Afy4dOsitUaRRfAYDfbU56B52GmQrGLsGZ4SPnYKQr+D9cYZs
 mEOpilDqHLg44VzUthgZrYdVE3PYQ9c1Gy0pj/tTVF5okhR1OY3bEJdGgM2m316mfl1A
 M47Z4KylQZbtAbACLeFpuoBGQtXAM8TxoN/Gm/s1G6zCfVQbsTpg1pX2Hl+3eJNsrmBs
 iQmg==
X-Gm-Message-State: AOAM530OBPF9RdW1kinjTZg8bVZE9cxA6J0ni8nrxkAEL0dbqulhrM2M
 Lsd58gA5fu9Fm1iT/y/e5CI=
X-Google-Smtp-Source: ABdhPJwsvXCwP/KZNqFOpPbQyGno5OlH3c/2TTMgc96WP5XWHCEjoicbXCSpFWIVhS7A6S01L/ch7w==
X-Received: by 2002:a05:6a00:1307:b029:308:1e2b:a24b with SMTP id
 j7-20020a056a001307b02903081e2ba24bmr1601407pfu.57.1626988766870; 
 Thu, 22 Jul 2021 14:19:26 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:4610:babe:3aeb:2b63])
 by smtp.gmail.com with ESMTPSA id s21sm6984489pfw.69.2021.07.22.14.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 14:19:26 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 22 Jul 2021 14:19:21 -0700
Message-Id: <20210722211921.3791312-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1m6g6O-00HC9l-IT
Subject: [f2fs-dev] [PATCH v2] f2fs: change fiemap way in printing
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

   Logical          Physical         Length           Flags
0: 0000000000000000 0000000fdf692000 0000000000004000 1008
1: 0000000000004000 0000000fdf693000 0000000000004000 1008
2: 0000000000008000 0000000fdf694000 0000000000004000 1008
3: 000000000000c000 0000000fdf695000 0000000000004000 1008
4: 0000000000010000 0000000fdf696000 000000000000c000 1000
5: 000000000001c000 0000000f8c60d000 0000000000010000 1000
6: 000000000002c000 0000000f8c61d000 0000000000004000 1008
7: 0000000000030000 0000000f8c620000 0000000000004000 1008
8: 0000000000034000 0000000f8c623000 0000000000001000 1008
9: 0000000000035000 0000000fc7af4000 0000000000003000 1008

Flags
0x1000 => FIEMAP_EXTENT_MERGED
0x0008 => FIEMAP_EXTENT_ENCODED

Signed-off-by: Daeho Jeong <daehojeong@google.com>

---
v2: changed the print format
---
 fs/f2fs/data.c | 76 ++++++++++++++++++++++++++++----------------------
 1 file changed, 42 insertions(+), 34 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 3a01a1b50104..058dc751e3a6 100644
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
@@ -1892,8 +1893,10 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
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
@@ -1903,11 +1906,23 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	if (!(map.m_flags & F2FS_MAP_FLAGS)) {
 		start_blk = next_pgofs;
 
-		if (blks_to_bytes(inode, start_blk) < blks_to_bytes(inode,
+		if (blks_to_bytes(inode, start_blk) >= blks_to_bytes(inode,
 						max_inode_blocks(inode)))
+			flags |= FIEMAP_EXTENT_LAST;
+		else if (!compr_cluster)
 			goto prep_next;
+	}
+
+	compr_appended = false;
+	/* In a case of compressed cluster, append this to the last extent */
+	if (compr_cluster && ((map.m_flags & F2FS_MAP_UNWRITTEN) ||
+			!(map.m_flags & F2FS_MAP_FLAGS))) {
+		unsigned int appended_blks = cluster_size - count_in_cluster + 1;
 
-		flags |= FIEMAP_EXTENT_LAST;
+		size += blks_to_bytes(inode, appended_blks);
+		if (map.m_flags & F2FS_MAP_UNWRITTEN)
+			start_blk += appended_blks;
+		compr_appended = true;
 	}
 
 	if (size) {
@@ -1926,38 +1941,31 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
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
