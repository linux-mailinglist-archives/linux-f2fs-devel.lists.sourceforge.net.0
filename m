Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1689D9B423C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 07:16:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5fWY-0005Gj-Gy;
	Tue, 29 Oct 2024 06:16:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Xiuhong.Wang@unisoc.com>) id 1t5fWW-0005Ga-Nh
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 06:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P0uP27/nJZWh2Di7NFUsXORWLiUfi/z1q8Jr+OpiZ5M=; b=GEB/4aeNddjN610Fm93ZytUodq
 /r27zAT2V1mSIYZEZZM+51oQcqcLArpjmjyW/iGpYfz9Oo8TQehafkJ12byez1faVy5sgEQ4DCFLx
 tahxrc5I9bn5LLJKF8bWx6mzgB4PZu21e6+fKupb+ZXwfUAmsLh2gNCVbln+RGr+RWj4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=P0uP27/nJZWh2Di7NFUsXORWLiUfi/z1q8Jr+OpiZ5M=; b=R
 QmFG4LK6xwEefIo4c+JqhmyNYYmFK71PFQhPX2Bfgt1U2uEQfSspps4mSehAzNL0/ZblGjxLFy4Ua
 +LPiX5a1W919BKu/oKVHz+RVv2jTino6coFZ4oBW8bP2vbZAzSPJLsTXk8rZgxHL2waS6aTYk/B4z
 mrBucefGMUyfrmPc=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5fWV-0004FJ-8e for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 06:16:13 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 49T6Ffvu064824;
 Tue, 29 Oct 2024 14:15:41 +0800 (+08)
 (envelope-from Xiuhong.Wang@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Xd0NT58GQz2K9xtV;
 Tue, 29 Oct 2024 14:15:05 +0800 (CST)
Received: from tj10379pcu1.spreadtrum.com (10.5.32.15) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Tue, 29 Oct 2024 14:15:38 +0800
From: Xiuhong Wang <xiuhong.wang@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
Date: Tue, 29 Oct 2024 14:15:35 +0800
Message-ID: <20241029061535.2676673-1-xiuhong.wang@unisoc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 49T6Ffvu064824
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  After enable 16K page size, an infinite loop may occur in
 fiemap (fm_length=UINT64_MAX) on a file, such as the 16KB scratch.img during
 the remount operation in Android. The condition for whether fiemap continues
 to map is to check whether the number of bytes corresponding to the next
 map.m_lblk exceeds blks_to_bytes(inode,max_inode_blocks(inode)) if there are
 HOLE. T [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1t5fWV-0004FJ-8e
Subject: [f2fs-dev] [PATCH] f2fs: fix fiemap failure issue when page size is
 16KB
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
Cc: ke.wang@unisoc.com, xiuhong.wang.cn@gmail.com, hao_hao.wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

After enable 16K page size, an infinite loop may occur in
fiemap (fm_length=UINT64_MAX) on a file, such as the 16KB
scratch.img during the remount operation in Android.

The condition for whether fiemap continues to map is to check
whether the number of bytes corresponding to the next map.m_lblk
exceeds blks_to_bytes(inode,max_inode_blocks(inode)) if there are HOLE.
The latter does not take into account the maximum size of a file with 16KB
page size, so the loop cannot be jumped out.

The following is the fail trace:
When f2fs_map_blocks reaches map.m_lblk=3936, it needs to go to the
first direct node block, so the map is 3936 + 4090 = 8026,
The next map is the second direct node block, that is,
8026 + 4090 = 12116,
The next map is the first indirect node block, that is,
12116 + 4090 * 4090 = 16740216,
The next map is the second indirect node block, that is,
16740216 + 4090 * 4090 = 33468316,
The next map is the first double indirect node block, that is,
33468316 + 4090 * 4090 * 4090 = 68451397316
Since map.m_lblk represents the address of a block, which is 32
bits, truncation will occur, that is, 68451397316 becomes
4026887876, and the number of bytes corresponding to the block
number does not exceed blks_to_bytes(inode,max_inode_blocks(inode)),
so the loop will not be jumped out.
The next time, it will be considered that it should still be a
double indirect node block, that is,
4026887876 + 4090 * 4090 * 4090 = 72444816876, which will be
truncated to 3725340140, and the loop will not be jumped out.

156.374871: f2fs_map_blocks: dev = (254,57), ino = 7449, file offset = 0, start blkaddr = 0x8e00, len = 0x200, flags = 2,seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0
156.374916: f2fs_map_blocks: dev = (254,57), ino = 7449, file offset = 512, start blkaddr = 0x0, len = 0x0, flags = 0 , seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0
156.374920: f2fs_map_blocks: dev = (254,57), ino = 7449, file offset = 513, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0
......
156.385747: f2fs_map_blocks: dev = (254,57), ino = 7449, file offset = 3935, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0
156.385752: f2fs_map_blocks: dev = (254,57), ino = 7449, file offset = 3936, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0
156.385755: f2fs_map_blocks: dev = (254,57), ino = 7449, file offset = 8026, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0
156.385758: f2fs_map_blocks: dev = (254,57), ino = 7449, file offset = 12116, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0
156.385761: f2fs_map_blocks: dev = (254,57), ino = 7449, file offset = 16740216, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0
156.385764: f2fs_map_blocks: dev = (254,57), ino = 7449, file offset = 33468316, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0
156.385767: f2fs_map_blocks: dev = (254,57), ino = 7449, file offset = 4026887876, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0
156.385770: f2fs_map_blocks: dev = (254,57), ino = 7449, file offset = 3725340140, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0
156.385772: f2fs_map_blocks: dev = (254,57), ino = 7449, file offset = 4026887876, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0
156.385775: f2fs_map_blocks: dev = (254,57), ino = 7449, file offset = 3725340140, start blkaddr = 0x0, len = 0x0, flags = 0, seg_type = 8, may_create = 0, multidevice = 0, flag = 1, err = 0

Commit a6a010f5def5 ("f2fs: Restrict max filesize for 16K f2fs")
has set the maximum allowed file size to (U32_MAX + 1) * F2FS_BLKSIZE,
so max_file_blocks should be used here to limit it, that is,
maxbytes defined above. And the max_inode_blocks function is not
called by other functions except here, so cleanup it.

Signed-off-by: Xiuhong Wang <xiuhong.wang@unisoc.com>
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/data.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 94f7b084f601..f33cdccb3e7f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1901,25 +1901,6 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 	return (err < 0 ? err : 0);
 }
 
-static loff_t max_inode_blocks(struct inode *inode)
-{
-	loff_t result = ADDRS_PER_INODE(inode);
-	loff_t leaf_count = ADDRS_PER_BLOCK(inode);
-
-	/* two direct node blocks */
-	result += (leaf_count * 2);
-
-	/* two indirect node blocks */
-	leaf_count *= NIDS_PER_BLOCK;
-	result += (leaf_count * 2);
-
-	/* one double indirect node block */
-	leaf_count *= NIDS_PER_BLOCK;
-	result += leaf_count;
-
-	return result;
-}
-
 int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		u64 start, u64 len)
 {
@@ -1992,8 +1973,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	if (!compr_cluster && !(map.m_flags & F2FS_MAP_FLAGS)) {
 		start_blk = next_pgofs;
 
-		if (blks_to_bytes(inode, start_blk) < blks_to_bytes(inode,
-						max_inode_blocks(inode)))
+		if (blks_to_bytes(inode, start_blk) < maxbytes)
 			goto prep_next;
 
 		flags |= FIEMAP_EXTENT_LAST;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
