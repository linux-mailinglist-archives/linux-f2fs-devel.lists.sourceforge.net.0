Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 698EF3D5251
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jul 2021 06:18:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m7s4h-0004Jn-Rq; Mon, 26 Jul 2021 04:18:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <daeho43@gmail.com>) id 1m7s4g-0004Jg-IL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Jul 2021 04:18:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2thOxj6ctqmCSeGKTO0PklZgYjLXVrYMprKtsyIwFdQ=; b=bHfd1ZWY9duNajf9BzIq2yilVd
 Vkl2Fd/ttd6RYw8ppnNRUzA2EgxmkG3oeO32mSj7VymKxtD9tNCMddAibJV6xP1IxDLxTySPuqdpu
 DGvJLFU8HtIfAN5p91lCZ7VxOyyXWejh5Rg3tfPcWEW4Ed/l46dVZGiNqT3QL0y8LE3c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2thOxj6ctqmCSeGKTO0PklZgYjLXVrYMprKtsyIwFdQ=; b=m
 0cz4qedRG9FrsCgoDEH263vhJWxmgIRHMUnXorOd0U5HNHtyALaoBfJzgrnATXW8LepYpQOMCA+y8
 Edb2oMV4hesQ3Q40FJnBRdOf7hTecX7c/kXIfuvqLQAxoUVxABFDL66Hm5GkSxqoELRIHfiD0zJlk
 7BslX/3whEmFwvWk=;
Received: from mail-pl1-f176.google.com ([209.85.214.176])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m7s4T-002kaU-Bp
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Jul 2021 04:18:42 +0000
Received: by mail-pl1-f176.google.com with SMTP id t21so9935664plr.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 25 Jul 2021 21:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2thOxj6ctqmCSeGKTO0PklZgYjLXVrYMprKtsyIwFdQ=;
 b=E6YnqwG/l7j6GsLDG5sI85c1f8k6puuOIXFTKw6dDIyNb62iLh9Z33ha1+QyWqGuP/
 kKX4DRToWTQLcXCA2vST3jgzUTJe1lfUTYduJzTCKGokXH9RmW0LVG8Weaz4FO3zBE5B
 3gxFQ/Zuv0Ig8h4hcKdqNEnZgMIEX6ytdTPEXIZC2ysnIcjzbMn/Jl1X+IZYgNB3ZOMZ
 LOokuS9jPRZ+8bCGwQhxeeCMpn93OqBherjNZgmwWXuK6MoauqGmVICkZmqSR+4lc1Xd
 AbF+hglHjbEwEtf5rI8/6KuKK5lCOTifjKVjSM7E3YxOwc92kqzDqEhOPG6igezBArQG
 IczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2thOxj6ctqmCSeGKTO0PklZgYjLXVrYMprKtsyIwFdQ=;
 b=TLtX7JnlivkffBog9p9kXS+6zZklDc/c6GT1xZFcBFfyHJn0OjyTfyJY/vD8WqtPis
 KG90+kA+m+gW2r/Z2jL1WpZaIFAVs4YOjOst35YaQF4vkzwEFnFKl7C2+FibHZRHTL5b
 TngiQ9Q6alIlWG+AKH7o5i/PVFsfCLIaeRGUaCazW8X/5BFPy5gJK1gTcyMX7MYn1DA6
 ZxBCkfjn+6f26kRy2MEZgv14uiX4gBS4uaqVA1g7ZcZyI87151DXA54QFlYCDYgilzHv
 SGTWxgB/fbmzjRp6Io0ffD0vBJ74PGGQqoEG8mTUgwPT4281bokFH6oyQXPw+grRLLyD
 cCHw==
X-Gm-Message-State: AOAM530LYfyGhEcvaV/uF+H/kIWdxfNn8Ex8O0T8ZSqcop5bK/0h73E0
 ATekCTFtjX0I8eS639txb7AJB6HZsB4=
X-Google-Smtp-Source: ABdhPJyVj60F7grBg+B2l5aaIJhEeGR0fJFaQCZV0mjDO8r2qBHGpC67A0/P31g3pOyL6B4ETeAtEA==
X-Received: by 2002:a17:90b:1194:: with SMTP id
 gk20mr24693980pjb.181.1627273103758; 
 Sun, 25 Jul 2021 21:18:23 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:cb45:e631:40f9:6a6])
 by smtp.gmail.com with ESMTPSA id d2sm12147861pjd.24.2021.07.25.21.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 21:18:23 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Sun, 25 Jul 2021 21:18:19 -0700
Message-Id: <20210726041819.2059593-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.176 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.176 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m7s4T-002kaU-Bp
Subject: [f2fs-dev] [PATCH v4] f2fs: change fiemap way in printing
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
Cc: Daeho Jeong <daehojeong@google.com>, Eric Biggers <ebiggers@google.com>
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
Tested-by: Eric Biggers <ebiggers@google.com>

---
v4: initialized count_in_cluster
v3: fix the missing last extent flag issue
v2: changed the print format
---
 fs/f2fs/data.c | 75 ++++++++++++++++++++++++++++----------------------
 1 file changed, 42 insertions(+), 33 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 3a01a1b50104..1a716c3b5457 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1843,8 +1843,9 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	u64 logical = 0, phys = 0, size = 0;
 	u32 flags = 0;
 	int ret = 0;
-	bool compr_cluster = false;
+	bool compr_cluster = false, compr_appended;
 	unsigned int cluster_size = F2FS_I(inode)->i_cluster_size;
+	unsigned int count_in_cluster = 0;
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
