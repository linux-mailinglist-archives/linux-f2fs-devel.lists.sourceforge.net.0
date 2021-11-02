Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ACF442677
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Nov 2021 06:00:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mhlua-0005Id-Fc; Tue, 02 Nov 2021 05:00:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hj514.kim@samsung.com>) id 1mhluX-0005IW-38
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Nov 2021 05:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WKn/BVJBPuSgKrX5cmF0YdA2s8a1xgWW2i433EPMESM=; b=FsBYxBlCwbDp4xCRa4Gyic3tMt
 3mLTYogRStnRJgHECr5qTYXf5T2AYZD64kfeJQ0TkQyb05hIcBYRlr6UprNGXRLpKEVFLmZt/fAZd
 zP5elEOcyu0dlZwAhU83k4NQlTLdctxqAI+0xkZvy4EfQKEyfbuFyPqpodTF9yq/sbZw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WKn/BVJBPuSgKrX5cmF0YdA2s8a1xgWW2i433EPMESM=; b=L
 rJPZXAmpQM7oJ1N3Dg/yw/ogJNJ3Cdqdn8MeN33nGBIsgnvnTH6bDV4do3qkCmx1P/7qIOi0gnwpm
 zmi7MWJXzA6YLnGDjAhhpb+Sbk3GqcncGYhSYuIsa0Qo+/eU5c56YCtwgL6WBCwLOgfLpG3gKZcvb
 ps2JNH4YXYT3a1z4=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mhluL-0008Bh-8D
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Nov 2021 05:00:37 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20211102045955epoutp04bc5880472acea24451985c535680e1a0~zofxrkfVC2247522475epoutp04F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Nov 2021 04:59:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20211102045955epoutp04bc5880472acea24451985c535680e1a0~zofxrkfVC2247522475epoutp04F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1635829195;
 bh=WKn/BVJBPuSgKrX5cmF0YdA2s8a1xgWW2i433EPMESM=;
 h=From:To:Cc:Subject:Date:References:From;
 b=HZRsZqScumyk+BqTHHn7J+tbqenNduaNKRV+Yr6QOgnoat2D35FnxHg/Nwd5otQcs
 IiCoKUdAxp4KosdmOm/ikgKs7Kajj7G6nOsAeF+pbV7Bg5cNGrKGpTeWhcnOME5vga
 sAVqLaTMPAE5p/lq6aIfvnkh8kWB1ZUc7WL6FrU4=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20211102045954epcas1p20ab663155684ac09a5ddf5f33899c62a~zofxTYFBB0432904329epcas1p2M;
 Tue,  2 Nov 2021 04:59:54 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.240]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4HjyPh5Kkkz4x9QX; Tue,  2 Nov
 2021 04:59:52 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 FA.D6.64085.8C5C0816; Tue,  2 Nov 2021 13:59:52 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20211102045952epcas1p44cb6fd41baa76a19e0924c4b6b3cf1e6~zofvFj3hZ2819028190epcas1p4S;
 Tue,  2 Nov 2021 04:59:52 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20211102045952epsmtrp119beb3d708136b4320c619bb9c9d77c0~zofvE7Joc1589715897epsmtrp1F;
 Tue,  2 Nov 2021 04:59:52 +0000 (GMT)
X-AuditID: b6c32a35-9adff7000000fa55-a4-6180c5c80719
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 D7.7B.29871.8C5C0816; Tue,  2 Nov 2021 13:59:52 +0900 (KST)
Received: from hj514.kim-office (unknown [10.253.100.146]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20211102045952epsmtip2bf96a17323f8a2206a9eff7f0745bde5~zofu8f3fQ0962409624epsmtip2p;
 Tue,  2 Nov 2021 04:59:52 +0000 (GMT)
From: Hyeong-Jun Kim <hj514.kim@samsung.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Date: Tue,  2 Nov 2021 13:59:49 +0900
Message-Id: <20211102045949.63530-1-hj514.kim@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCKsWRmVeSWpSXmKPExsWy7bCmnu6Jow2JBs03NSxOTz3LZDG94yCb
 xZP1s5gtLi1yt7i8aw6bxZZ/R1gd2Dw2repk89i94DOTR9+WVYwenzfJBbBEZdtkpCampBYp
 pOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5+AToumXmAO1WUihLzCkFCgUkFhcr
 6dvZFOWXlqQqZOQXl9gqpRak5BSYFegVJ+YWl+al6+WlllgZGhgYmQIVJmRnPNu+jq3gvnDF
 k66NTA2MT/i6GDk5JARMJK73vGcCsYUEdjBKvPlY3sXIBWR/YpTYfXUqO4TzjVFi4ZX37DAd
 R15fYoRI7GWUmH2qmRXCec8osX7WKVaQKjYBHYkPs1YygtgiAvYSn79fZwEpYhboYpTYsWYz
 G0hCWMBN4mXrTzCbRUBVYs3lHrBDeAWsJD4ems0GsU5eYual7+wQcUGJkzOfsIDYzEDx5q2z
 mSFqDrFLTJ1qAGG7SFzsaGKCsIUlXh3fAnW2lMTL/jYou17i+JVPYFdLCLQwSjxe+groUg4g
 x17i/SULEJNZQFNi/S59iHJFiZ2/5zJCrOWTePe1hxWimleio00IokRZYvPdw1AXS0o8XfSX
 EcL2kPj9roMNEryxEt9v72KawCg/C8kzs5A8Mwth8QJG5lWMYqkFxbnpqcWGBYbwSE3Oz93E
 CE5+WqY7GCe+/aB3iJGJg/EQowQHs5IIb8SFmkQh3pTEyqrUovz4otKc1OJDjKbA4J3ILCWa
 nA9Mv3kl8YYmlgYmZkYmFsaWxmZK4ryf5QoThQTSE0tSs1NTC1KLYPqYODilGpj86tS+T9fl
 v/l6VYb4/5v+ZZM3Cmr7X7896d2boCsZD79Jiyt+KPFq6J29/t53FYbKLyqLX9jXFj2a0isk
 seyvBP+V02VF6+87cGdM+PT1+dLbPvOu1b+s6NrrEF160TRvUdbj73FW22P8J576c+VCU9A3
 3/3fjUyflFQ82JBfauy+rWSqXuLiBwprRT6KTBLLndBu2ZeQv3bLxDu/T4UknbFe+MX4G+e8
 P32Td57gf792X9GpXYlKRbnh3I/25da8uPDX4j1TUs7D8EnTine6N8nuviN1OdFGh/N8RFf3
 rG2pOtP1zTdKBz15cnkjH3ubxba5J9pWqeua2v+4NPPp1w/nTi5xi5cV8Vy7dt4eCyWW4oxE
 Qy3mouJEAPjR2wEHBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMLMWRmVeSWpSXmKPExsWy7bCSvO6Jow2JBodfiFqcnnqWyWJ6x0E2
 iyfrZzFbXFrkbnF51xw2iy3/jrA6sHlsWtXJ5rF7wWcmj74tqxg9Pm+SC2CJ4rJJSc3JLEst
 0rdL4Mp4tn0dW8F94YonXRuZGhif8HUxcnJICJhIHHl9ibGLkYtDSGA3o8TCZwtYuxg5gBKS
 EvPWl0OYwhKHDxdDlLxllFjbMJMNpJdNQEfiw6yVjCC2iICjxK/Xi1hBipgF+hgl/t1dBlYk
 LOAm8bL1J5jNIqAqseZyDxOIzStgJfHx0Gw2iCPkJWZe+s4OEReUODnzCQuIzQwUb946m3kC
 I98sJKlZSFILGJlWMUqmFhTnpucWGxYY5qWW6xUn5haX5qXrJefnbmIEh6OW5g7G7as+6B1i
 ZOJgPMQowcGsJMIbcaEmUYg3JbGyKrUoP76oNCe1+BCjNAeLkjjvha6T8UIC6YklqdmpqQWp
 RTBZJg5OqQYmnYPvdi6ZxVijlm4ec5fxrtHtviuJletOWp98JLokWveZXeVlyyOnXK+f2el0
 J66RZ+VjmdDNqTpnr29n+KHXneSj32F69dYud7sbzu9vfF1/oIv/mJid+zWxrA23mtbuMLK6
 nc31N7r0L1eCb7Aat8+LJ+bTnY6f/ZcReTlmEW/X9q21H9Y2XXReqXx624ESARfZHN/oy/rn
 D2wIuOLZzS36KIRj4eTrDy//WdP9Yo5Sxhq/66t/nY3IN744S1I41mbzSgUBeR2vR767v11V
 kl7MYP12eufiVcqbetKnLOnL2JP9ny/B7VLe0Qnr929QybO9pnbrzfLFf4UjjZSEOLqunt7S
 0ui+ti1Ge0masxJLcUaioRZzUXEiAM0xi4O2AgAA
X-CMS-MailID: 20211102045952epcas1p44cb6fd41baa76a19e0924c4b6b3cf1e6
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211102045952epcas1p44cb6fd41baa76a19e0924c4b6b3cf1e6
References: <CGME20211102045952epcas1p44cb6fd41baa76a19e0924c4b6b3cf1e6@epcas1p4.samsung.com>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Encrypted pages during GC are read and cached in
 META_MAPPING.
 However, due to cached pages in META_MAPPING, there is an issue where newly
 written pages are lost by IPU or DIO writes. Thread A - f2fs_gc() Thread
 B /* phase 3 */ down_write(i_gc_rwsem) ra_data_block() ---- (a)
 up_write(i_gc_rwsem)
 f2fs_direct_IO() : - down_read(i_gc_rwsem) - __blockdev_direct_io() -
 get_data_block_di [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.34 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1mhluL-0008Bh-8D
Subject: [f2fs-dev] [PATCH v3] F2FS: invalidate META_MAPPING before IPU/DIO
 write
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
Cc: sj1557.seo@samsung.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Encrypted pages during GC are read and cached in META_MAPPING.
However, due to cached pages in META_MAPPING, there is an issue where
newly written pages are lost by IPU or DIO writes.

Thread A - f2fs_gc()            Thread B
/* phase 3 */
down_write(i_gc_rwsem)
ra_data_block()       ---- (a)
up_write(i_gc_rwsem)
                                f2fs_direct_IO() :
                                 - down_read(i_gc_rwsem)
                                 - __blockdev_direct_io()
                                 - get_data_block_dio_write()
                                 - f2fs_dio_submit_bio()  ---- (b)
                                 - up_read(i_gc_rwsem)
/* phase 4 */
down_write(i_gc_rwsem)
move_data_block()     ---- (c)
up_write(i_gc_rwsem)

(a) In phase 3 of f2fs_gc(), up-to-date page is read from storage and
    cached in META_MAPPING.
(b) In thread B, writing new data by IPU or DIO write on same blkaddr as
    read in (a). cached page in META_MAPPING become out-dated.
(c) In phase 4 of f2fs_gc(), out-dated page in META_MAPPING is copied to
    new blkaddr. In conclusion, the newly written data in (b) is lost.

To address this issue, invalidating pages in META_MAPPING before IPU or
DIO write.

---
v3:
 - Use sbi instead of fio->sbi in f2fs_inplace_write_data()
v2:
 - Update patch description with race condition

Fixes: 6aa58d8ad20a ("f2fs: readahead encrypted block during GC")
Signed-off-by: Hyeong-Jun Kim <hj514.kim@samsung.com>
---
 fs/f2fs/data.c    | 2 ++
 fs/f2fs/segment.c | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 74e1a350c1d8..9f754aaef558 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1708,6 +1708,8 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 		 */
 		f2fs_wait_on_block_writeback_range(inode,
 						map->m_pblk, map->m_len);
+		invalidate_mapping_pages(META_MAPPING(sbi),
+						map->m_pblk, map->m_pblk);
 
 		if (map->m_multidev_dio) {
 			block_t blk_addr = map->m_pblk;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 526423fe84ce..df9ed75f0b7a 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3652,6 +3652,9 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 		goto drop_bio;
 	}
 
+	invalidate_mapping_pages(META_MAPPING(sbi),
+				fio->new_blkaddr, fio->new_blkaddr);
+
 	stat_inc_inplace_blocks(fio->sbi);
 
 	if (fio->bio && !(SM_I(sbi)->ipu_policy & (1 << F2FS_IPU_NOCACHE)))
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
