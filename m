Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1A63D0998
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jul 2021 09:21:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m66Xj-0007JT-15; Wed, 21 Jul 2021 07:21:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1m66XU-0007Hy-Jk
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Jul 2021 07:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iqz1gu8smtI/WSbcMLkLO4VdATGiffJbqsfYXKHNGZ4=; b=MSlqvoYC/LzBZeaJvdGV7TCcAJ
 61+sLOpsfh3RbBtTt0lVhWUQDc6mJbCL3f05lEZP53gJWGdlw7IP8GJNABQR3tFoQrmy3sTybeO/W
 pkZNp/AbuaA3CNOvGsPXiIVfnFKO2C1wscU7nWhnzLPqD40ZusLZmF26Ovf5kPoZhZVI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iqz1gu8smtI/WSbcMLkLO4VdATGiffJbqsfYXKHNGZ4=; b=c
 bkgLCLsuCKfG1xFty++Ln79Xdx8dnQsWMFv9eqlxydEXzgzmf2zGxLk7XMrQTalEFUW3pqajwWdUD
 kLxE6VuH7/ETHfJAJASo9/pDY3MtJWerr3csUwRJthmx0apU/IJTF8USVIDN4Kn/ydZP7BYHa1lIN
 YHF1xIZgkH/nWU04=;
Received: from mail-pg1-f182.google.com ([209.85.215.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m66XK-0002fW-TQ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Jul 2021 07:21:08 +0000
Received: by mail-pg1-f182.google.com with SMTP id j73so1069524pge.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Jul 2021 00:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iqz1gu8smtI/WSbcMLkLO4VdATGiffJbqsfYXKHNGZ4=;
 b=lu21NlGOcPgTFAe8GYzyxI0JPTo893eCPZfjPHKvbuOUL78zT/6uxzpBW8K8DQfPgK
 rXodmhLdtJqiHXazrdKFPM2jLe0z/CwruZhC7NiO5grBSv7AzX8cTonRiGJjgyAZIMQV
 qFmghawdnsr19Hn2LC11Pzl1rFsrXVOTfcZTG+hbxApzKZCWC+YP5CUzJcIXPfWPt9Sr
 apRL2YmXPpteNZZnvtJerEk1TWASVNdhyweixpXXNUpO96OEjwwgR6fd6NS8AEIy34Hv
 /0myKPg5ylL9WVrjghH66qUeILikLrJ48wnSsQij1mCCH9QFuG96i9W1iHgyX6RkNajA
 wFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iqz1gu8smtI/WSbcMLkLO4VdATGiffJbqsfYXKHNGZ4=;
 b=W8OZOPvbqbWViwEj54pFvKeyXpLJxnIZl0jBCsvxbrv5quw3g045Ig3z+kNJQEhlqd
 6UoyJryMaP0YtE556ZhlQMcKql/PTxObr96+4EM8x/jPv0zu5lOYk6HGuGQcp8ovAz6Q
 /PQZ6wmfnz+nhh9cCKflgYOR+HxfDdqD/oD/t7l03Ok3kCyQ2pnDoMkawmCrgvy3Qk6v
 Wl/y8hBllVMoRIzKRMPjqOrlFdjHQjzjvZ4hdzEtnwqtKaXNh8C9stcFFdG0YVuuSQ1y
 MTBPNBsShDljv7Qa4pIQI+inIpVA+ePjm5MMXzP5Oieo/timhsyrcVuGGRoJGfSspIEV
 TKpw==
X-Gm-Message-State: AOAM532yq/5EjVtW63FnxvF97Sg8vR8mUMhFqZrE0dzm0blw6KXdE48X
 6MpTUOWcdbjCFbtqkQMvaXmCdv5nlCo=
X-Google-Smtp-Source: ABdhPJyfgcP/8dOuJ8qlI13D8FBpGEZzSI3ulQmZyFMe72jWqZiqN1TjaTZeKmQ/ZXQk8yV5RALavg==
X-Received: by 2002:a63:a1c:: with SMTP id 28mr6955182pgk.445.1626852052504;
 Wed, 21 Jul 2021 00:20:52 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:ceb8:c22e:42fc:5db])
 by smtp.gmail.com with ESMTPSA id 20sm26651156pfi.170.2021.07.21.00.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 00:20:52 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed, 21 Jul 2021 00:20:48 -0700
Message-Id: <20210721072048.3035928-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.32.0.402.g57bb445576-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.182 listed in wl.mailspike.net]
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
X-Headers-End: 1m66XK-0002fW-TQ
Subject: [f2fs-dev] [PATCH] f2fs: change fiemap way in printing compression
 chunk
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

0: 0000000000000000 0000000000000000 0000000000001000 1008 (M/E)
1: 0000000000001000 0000000f15c0f000 0000000000001000 1008 (M/E)
2: 0000000000002000 0000000000000000 0000000000002000 1808 (M/U/E)
3: 0000000000004000 0000000000000000 0000000000001000 1008 (M/E)
4: 0000000000005000 0000000f15c10000 0000000000001000 1008 (M/E)
5: 0000000000006000 0000000000000000 0000000000002000 1808 (M/U/E)
6: 0000000000008000 0000000000000000 0000000000001000 1008 (M/E)
M => FIEMAP_EXTENT_MERGED
E => FIEMAP_EXTENT_ENCODED
U => FIEMAP_EXTENT_UNWRITTEN

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/data.c | 42 ++++++++++++++++--------------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 3a01a1b50104..6e1be876d96b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1845,6 +1845,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	int ret = 0;
 	bool compr_cluster = false;
 	unsigned int cluster_size = F2FS_I(inode)->i_cluster_size;
+	unsigned int count_in_cluster;
 	loff_t maxbytes;
 
 	if (fieinfo->fi_flags & FIEMAP_FLAG_CACHE) {
@@ -1893,7 +1894,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	map.m_seg_type = NO_CHECK_TYPE;
 
 	if (compr_cluster)
-		map.m_len = cluster_size - 1;
+		map.m_len = cluster_size - count_in_cluster;
 
 	ret = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_FIEMAP);
 	if (ret)
@@ -1926,37 +1927,26 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
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
-	if (map.m_pblk == COMPRESS_ADDR) {
-		compr_cluster = true;
-		start_blk++;
-		goto prep_next;
-	}
-
 	logical = blks_to_bytes(inode, start_blk);
-	phys = blks_to_bytes(inode, map.m_pblk);
+	phys = __is_valid_data_blkaddr(map.m_pblk) ?
+		blks_to_bytes(inode, map.m_pblk) : 0;
 	size = blks_to_bytes(inode, map.m_len);
 	flags = 0;
 	if (map.m_flags & F2FS_MAP_UNWRITTEN)
 		flags = FIEMAP_EXTENT_UNWRITTEN;
 
+	if (map.m_pblk == COMPRESS_ADDR) {
+		flags |= FIEMAP_EXTENT_ENCODED;
+		compr_cluster = true;
+		count_in_cluster = 1;
+	} else if (compr_cluster) {
+		flags |= FIEMAP_EXTENT_ENCODED;
+		if (map.m_len > 0)
+			count_in_cluster += map.m_len;
+		if (count_in_cluster == cluster_size)
+			compr_cluster = false;
+	}
+
 	start_blk += bytes_to_blks(inode, size);
 
 prep_next:
-- 
2.32.0.402.g57bb445576-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
