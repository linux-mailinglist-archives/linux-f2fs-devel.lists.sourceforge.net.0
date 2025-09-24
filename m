Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CC9B98975
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Sep 2025 09:44:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=RdEGIYLeSLAXrFrFNgJu9HsaipLK0SepgTBsGZ1lPbs=; b=mAqpEsRlEMO1OmoQwm5w7U+sL9
	p8DSzPUeXQ3B6wPuVsgJjgTgjEgmbXN/RlO57rX8WVYBnRk8s041OgD7SONy6QMWB85Vt0m+pr+GV
	vISrid3e9yY54VO64biNWrmRpBdsw4nHulXQABPaqtf9Qoa9cP5E+aasjknHZucTh0p4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1KAn-0005gj-Ti;
	Wed, 24 Sep 2025 07:44:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yunji0.kang@samsung.com>) id 1v1KAm-0005gZ-J6
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 07:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8MznWO4Eakb7UroODORiUGViNhVOOaZtf1/76Z7mtVo=; b=Fmmmt2f8L2AcVNfyIvizFei7Tp
 l6adnifUWBWj3HAIO7W1ERfH7HgTm8CMIwYN4I/tWvvTugEaI+4uLpf3AVot7BxFC7I+8uXoHBaQf
 hc8Vl3GsB9azZbFfTjBbREH1T+UFeMDZp3kO/fVL43GxaYy/73Y4nATmiuc5S7k91iTA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8MznWO4Eakb7UroODORiUGViNhVOOaZtf1/76Z7mtVo=; b=g
 HujnE5kQ0i5I/fn+SW0Op0ixpZ2NKLJDPgxoRT0mBLrZeYBWUxtl7v4Z4m4nQAnbYR4Ft+VbiOXA4
 Iz8/zFWcXIYCsrFIR7JJbnl3DiMBkWSbgWWN5QC5iw0LVtvSnKRU2iWqnts7PwfzGbkh6YZaRJN7x
 9BwaCs8GZ2Glm8/g=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v1KAk-00048i-TV for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 07:44:20 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250924074406epoutp03bcd735c461471c439412ebcb88ad2ddc~oKDFPsZM00398003980epoutp03A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Sep 2025 07:44:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250924074406epoutp03bcd735c461471c439412ebcb88ad2ddc~oKDFPsZM00398003980epoutp03A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1758699846;
 bh=8MznWO4Eakb7UroODORiUGViNhVOOaZtf1/76Z7mtVo=;
 h=From:To:Cc:Subject:Date:References:From;
 b=OdtYy9EtTxX0ClBlwSBHAfJiMjh591NMxorM12M+Fp96G8/T6v+UQw6JQDsSvnxUB
 N7zUog/ZWauV5clBOc9EsHZ4sQQoHqN5bCA67mnze1lUiYpMu7tUruZKT/VGqFC2PF
 fFmPg4j8vY69vNXqmTi94EjgXmI9oHsc4PJb828s=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPS id
 20250924074406epcas1p28ce30bf68c0c86eb826f9e4e656ef121~oKDEt-O_F0096100961epcas1p2D;
 Wed, 24 Sep 2025 07:44:06 +0000 (GMT)
Received: from epcas1p1.samsung.com (unknown [182.195.36.225]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4cWpkt0d3hz6B9mL; Wed, 24 Sep
 2025 07:44:06 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20250924074405epcas1p3a116daa0efa4a22d1741437b0cf59f8d~oKDD03zKW0502905029epcas1p3S;
 Wed, 24 Sep 2025 07:44:05 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.253.100.173]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250924074405epsmtip279e9ba81d4b06213adb5f19ab45fe0f4~oKDDyWMfv2576525765epsmtip2i;
 Wed, 24 Sep 2025 07:44:05 +0000 (GMT)
From: Yunji Kang <yunji0.kang@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org
Date: Wed, 24 Sep 2025 16:43:58 +0900
Message-Id: <20250924074358.253759-1-yunji0.kang@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMS-MailID: 20250924074405epcas1p3a116daa0efa4a22d1741437b0cf59f8d
X-Msg-Generator: CA
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250924074405epcas1p3a116daa0efa4a22d1741437b0cf59f8d
References: <CGME20250924074405epcas1p3a116daa0efa4a22d1741437b0cf59f8d@epcas1p3.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
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
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v1KAk-00048i-TV
Subject: [f2fs-dev] [PATCH v4] f2fs: readahead node blocks in
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

v4:
 - Removed a specific condition for precache, 
as using the existing mode (LOOKUP_NODE_RA) is sufficient.


 fs/f2fs/data.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 7961e0ddfca3..a20a99d7ba5b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1572,6 +1572,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	pgofs =	(pgoff_t)map->m_lblk;
 	end = pgofs + maxblocks;
 
+	if (flag == F2FS_GET_BLOCK_PRECACHE)
+		mode = LOOKUP_NODE_RA;
+
 next_dnode:
 	if (map->m_may_create) {
 		if (f2fs_lfs_mode(sbi))
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
