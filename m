Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12053B98526
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Sep 2025 07:58:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=zluU6QjrD/XebelhlkZWL5gc+JzBAqfDPg+E4dqrBPA=; b=LRkuUNs8RgWAZFPPywdtQ1bVFF
	B5hhkY/SXMp6YFJoG7NXAPWfXoveNnQN1QfoqEVuVLI/5wFyiStwK3eFi58y4ETPLquTmutyYATm/
	8YWB+tB0Z26TTXmovfJC0MxRfdJwgvMdW+WM2OwvAnopQLDIAmZBMxXvdhtoqS81PyjA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1IWg-00083A-2r;
	Wed, 24 Sep 2025 05:58:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yunji0.kang@samsung.com>) id 1v1IWc-00082i-S8
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 05:58:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UCB1XxSfKnxXgnA8T6WAHTu29rC7boLUIOja/oPIJzk=; b=mbo21tHxwxN5WMc7k3p+gMUoFm
 ALZva4/HOn6AjJMxeVT3w1AE66HGySNZpU6MJkcZ4WZA5IMTER6o2KpQhAZtWkc0oLRgDZngRBIfv
 SNpGPjBjuaxTeh+FoEYsEPgvAF3W7yzKMFlN0SCdV1c3XEbzKOnUISgFxSW2WD0GwN/w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UCB1XxSfKnxXgnA8T6WAHTu29rC7boLUIOja/oPIJzk=; b=U
 bRss3ONIGh6iMGNg0XC4GQFJLYyYHy6/5gyyi+bi6UdepeeaB02nyhRmOtq4rnHScpOTV3ub7dEB/
 uKHBI83FF+IGZMS7ihl+ySqKjqboESJ91aOEN2y+95JnBAeTl8xdiOL8lIIvxyr0hJujXRTNIdd/n
 ZhBirsNqKPRa4saQ=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v1IWc-0007Ew-95 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 05:58:47 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250924055839epoutp01280e8faf5dcc849be221b2d5dd5d3473~oInAWq94b0162501625epoutp01v
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Sep 2025 05:58:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250924055839epoutp01280e8faf5dcc849be221b2d5dd5d3473~oInAWq94b0162501625epoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1758693519;
 bh=UCB1XxSfKnxXgnA8T6WAHTu29rC7boLUIOja/oPIJzk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=ZOUvDTiKPXqM8uzigFbD39ZV3UkVpx9SIuOVoUF9RK+fFcl64IemB/2MSS0hbcvlk
 eUGoGvHuNMphHWCQsdOFt7ylstLElZO018As23ESHiw/KMZZZ7uYPGq4i8ddQbu1c9
 v1tYb0hGGsOaAX2t8SBNP9RpZ5LhBBUklFBhFEuQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPS id
 20250924055838epcas1p262a95f248cb818206ee30ab7e42c3a0c~oIm-kGRQN0075700757epcas1p2o;
 Wed, 24 Sep 2025 05:58:38 +0000 (GMT)
Received: from epcas1p1.samsung.com (unknown [182.195.36.223]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4cWmPB27fXz2SSKj; Wed, 24 Sep
 2025 05:58:38 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20250924055837epcas1p460d67d7f1c900f5cc25c865cb636e950~oIm_3mWWB2706327063epcas1p4z;
 Wed, 24 Sep 2025 05:58:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.253.100.173]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250924055837epsmtip14f3381069af90a29232b03eb53e37f1e~oIm_1Ej8f2471124711epsmtip1b;
 Wed, 24 Sep 2025 05:58:37 +0000 (GMT)
From: Yunji Kang <yunji0.kang@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org
Date: Wed, 24 Sep 2025 14:58:31 +0900
Message-Id: <20250924055831.250805-1-yunji0.kang@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMS-MailID: 20250924055837epcas1p460d67d7f1c900f5cc25c865cb636e950
X-Msg-Generator: CA
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250924055837epcas1p460d67d7f1c900f5cc25c865cb636e950
References: <CGME20250924055837epcas1p460d67d7f1c900f5cc25c865cb636e950@epcas1p4.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In f2fs_precache_extents(), For large files,
 It requires reading
 many node blocks. Instead of reading each node block with synchronous I/O,
 this patch applies readahead so that node blocks can be fetc [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v1IWc-0007Ew-95
Subject: [f2fs-dev] [PATCH v3] f2fs: readahead node blocks in
 F2FS_GET_BLOCK_PRECACHE mode
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
Cc: Sungjong Seo <sj1557.seo@samsung.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In f2fs_precache_extents(), For large files, It requires reading many
node blocks. Instead of reading each node block with synchronous I/O,
this patch applies readahead so that node blocks can be fetched in
advance.

It reduces the overhead of repeated sync reads and improves efficiency
when precaching extents of large files.

I created a file with the same largest extent and executed the test.
For this experiment, I set the file's largest extent with an offset of 0
and a size of 1GB. I configured the remaining area with 100MB extents.

5GB test file:
dd if=/dev/urandom of=test1 bs=1m count=5120
cp test1 test2
fsync test1
dd if=test1 of=test2 bs=1m skip=1024 seek=1024 count=100 conv=notrunc
dd if=test1 of=test2 bs=1m skip=1224 seek=1224 count=100 conv=notrunc
...
dd if=test1 of=test2 bs=1m skip=5024 seek=5024 count=100 conv=notrunc
reboot

I also created 10GB and 20GB files with large extents using the same
method.

ioctl(F2FS_IOC_PRECACHE_EXTENTS) test results are as follows:
  +-----------+---------+---------+-----------+
  | File size | Before  | After   | Reduction |
  +-----------+---------+---------+-----------+
  | 5GB       | 101.8ms | 37.0ms  | 72.1%     |
  | 10GB      | 222.9ms | 56.0ms  | 74.9%     |
  | 20GB      | 446.2ms | 116.4ms | 73.9%     |
  +-----------+---------+---------+-----------+
Tested on a 256GB mobile device with an SM8750 chipset.

Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
Reviewed-by: Sunmin Jeong <s_min.jeong@samsung.com>
Signed-off-by: Yunji Kang <yunji0.kang@samsung.com>
---
v2:
 - Modify the readahead condition check routine for better code
readability.
 - Update the title from 'node block' to 'node blocks'.

v3:
 - Bug fix to allow more node pages to be readahead.
 - Updated with test results.

 fs/f2fs/data.c | 3 +++
 fs/f2fs/f2fs.h | 1 +
 fs/f2fs/node.c | 4 +++-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 7961e0ddfca3..ab3117e3b24a 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1572,6 +1572,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	pgofs =	(pgoff_t)map->m_lblk;
 	end = pgofs + maxblocks;
 
+	if (flag == F2FS_GET_BLOCK_PRECACHE)
+		mode = LOOKUP_NODE_PRECACHE;
+
 next_dnode:
 	if (map->m_may_create) {
 		if (f2fs_lfs_mode(sbi))
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9d3bc9633c1d..3ce41528d48e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -651,6 +651,7 @@ enum {
 					 * look up a node with readahead called
 					 * by get_data_block.
 					 */
+	LOOKUP_NODE_PRECACHE,		/* look up a node for F2FS_GET_BLOCK_PRECACHE */
 };
 
 #define DEFAULT_RETRY_IO_COUNT	8	/* maximum retry read IO or flush count */
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 4254db453b2d..63e9ee7ab911 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -860,7 +860,9 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 			set_nid(parent, offset[i - 1], nids[i], i == 1);
 			f2fs_alloc_nid_done(sbi, nids[i]);
 			done = true;
-		} else if (mode == LOOKUP_NODE_RA && i == level && level > 1) {
+		} else if ((mode == LOOKUP_NODE_RA ||
+                (mode == LOOKUP_NODE_PRECACHE))
+                && i == level && level > 1) {
 			nfolio[i] = f2fs_get_node_folio_ra(parent, offset[i - 1]);
 			if (IS_ERR(nfolio[i])) {
 				err = PTR_ERR(nfolio[i]);
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
