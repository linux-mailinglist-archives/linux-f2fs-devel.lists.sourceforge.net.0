Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 895BDB8380C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Sep 2025 10:21:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=I/hjBKAQtjNEkQjhMAbaX5lnAwQuFbATXn5Qagct46k=; b=JhizIGoYbK9vYoobMsfTYmS+sr
	ofEhwXBRf29giLQHO7SJp2aaT75/nKJzZnKcpTUpinU7GdBsue+gX5anKUPkI9zsfbFmf3LTBxb0J
	5BNy3DGa/TBDlaTEH7OLtbzENHHgmUhdG2hgE53L4mgqR07cbf75nUU2y5RlKQ8Mpj10=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uz9ss-0005c2-DY;
	Thu, 18 Sep 2025 08:20:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yunji0.kang@samsung.com>) id 1uz9sq-0005bG-EQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Sep 2025 08:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G1sAa6fcz6csqtPywTkaHuC/J9PhwCV/rwBo//lJ5yY=; b=ZvtrlYCYu3NDHaXVgMBWHz+4uN
 qrefSbHvTV4O8TRJEGUlLqVc+W1ZcKljNztfVybfdcrVbe1X2TB2Qi8mFFafW0a0MjiL6q3rXrCEj
 Uwd3H43P3HZBIuwmj6x3mzk91TzTn28f6ZlBHMl9cOJupxBhEH556e5L7I5YRFqt0G8s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=G1sAa6fcz6csqtPywTkaHuC/J9PhwCV/rwBo//lJ5yY=; b=O
 tMAc0WWKJ9s43Jhh6QzYVPlojvEIzdZr4C1JbCnPZ9PwyyHzV5iryBryWWCYWy3XDXupMA6F8hR87
 T/pqqLXmxaoVE+qYREHbge/wgMIITb0/wjEJZpRGxae7lF0+mJ8ogiE9UocX29wFCDWEaMaZpth2i
 JlvoqTbp1R2DSotg=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uz9sp-0003Zo-Ck for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Sep 2025 08:20:52 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250918082039epoutp01f37d593272f6a632d37647e69d41ef15~mUrRgeoPE2886928869epoutp01D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 Sep 2025 08:20:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250918082039epoutp01f37d593272f6a632d37647e69d41ef15~mUrRgeoPE2886928869epoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1758183639;
 bh=G1sAa6fcz6csqtPywTkaHuC/J9PhwCV/rwBo//lJ5yY=;
 h=From:To:Cc:Subject:Date:References:From;
 b=KFxbazDxKjLAE/14WthMr6fuZTIMiVQ5G8GsoSxp1ePwe7gY8WeU92Aqyvu9SMjsy
 i3fyPg/Xh1DwIujxxx4pFvjf2BLcvv1Pzl7G7BJwl3lO23snogVnH9VncGS6ISCOH8
 giER9UItmVYMQcvPCX1yTzWbGq2iNQoNwDcMvQ64=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPS id
 20250918082038epcas1p19c4e495928afed9bb8ed26c9829ef1ab~mUrQ-kf9d2767627676epcas1p1N;
 Thu, 18 Sep 2025 08:20:38 +0000 (GMT)
Received: from epcas1p3.samsung.com (unknown [182.195.38.248]) by
 epsnrtp03.localdomain (Postfix) with ESMTP id 4cS7qp3H3kz3hhTB; Thu, 18 Sep
 2025 08:20:38 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250918082037epcas1p1eb201d3b6d5780c0bff3ba32740ccdcf~mUrQUeeYQ2767627676epcas1p1I;
 Thu, 18 Sep 2025 08:20:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.253.100.173]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250918082037epsmtip2806780d30bdff83afa286d5fa7e42f86~mUrQR31l_0085600856epsmtip2k;
 Thu, 18 Sep 2025 08:20:37 +0000 (GMT)
From: Yunji Kang <yunji0.kang@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org
Date: Thu, 18 Sep 2025 17:20:23 +0900
Message-Id: <20250918082023.57381-1-yunji0.kang@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMS-MailID: 20250918082037epcas1p1eb201d3b6d5780c0bff3ba32740ccdcf
X-Msg-Generator: CA
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250918082037epcas1p1eb201d3b6d5780c0bff3ba32740ccdcf
References: <CGME20250918082037epcas1p1eb201d3b6d5780c0bff3ba32740ccdcf@epcas1p1.samsung.com>
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uz9sp-0003Zo-Ck
Subject: [f2fs-dev] [PATCH v2] f2fs: readahead node blocks in
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
  | 5GB       | 101.8ms | 72.1ms  | 29.2%     |
  | 10GB      | 222.9ms | 149.5ms | 32.9%     |
  | 20GB      | 446.2ms | 276.3ms | 38.1%     |
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

 fs/f2fs/data.c | 3 +++
 fs/f2fs/f2fs.h | 1 +
 fs/f2fs/node.c | 5 ++++-
 3 files changed, 8 insertions(+), 1 deletion(-)

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
index 4254db453b2d..d4bf3ce715c5 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -860,7 +860,10 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 			set_nid(parent, offset[i - 1], nids[i], i == 1);
 			f2fs_alloc_nid_done(sbi, nids[i]);
 			done = true;
-		} else if (mode == LOOKUP_NODE_RA && i == level && level > 1) {
+		} else if ((i == level && level > 1) &&
+				(mode == LOOKUP_NODE_RA ||
+				(mode == LOOKUP_NODE_PRECACHE &&
+				offset[i - 1] % MAX_RA_NODE == 0))) {
 			nfolio[i] = f2fs_get_node_folio_ra(parent, offset[i - 1]);
 			if (IS_ERR(nfolio[i])) {
 				err = PTR_ERR(nfolio[i]);
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
