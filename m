Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6553144134F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Nov 2021 06:54:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mhQHG-0004z5-UT; Mon, 01 Nov 2021 05:54:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hj514.kim@samsung.com>) id 1mhQHF-0004yx-4X
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Nov 2021 05:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s26XtAoUeNsGxfGSeq6N3awANG4u5mCRCZ15ODJh9is=; b=Ty8Ec2BJ00jSH4a3527T2qtMV4
 Rap71nzi5fgvPNLfIVkUF04kOahxrBxWrOF7u6Za6fDW6rJKh9JCFKDni6c9HS9K5k9BTCrUIKuYf
 PU3SPAEQflVdAmj50/XRAqvoa7qbGp/5xJm7HYStaPCp6Pal2i/l14pGsPFUo8ira3tE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=s26XtAoUeNsGxfGSeq6N3awANG4u5mCRCZ15ODJh9is=; b=J
 mUX8p1QiKb0tlxyVwFspuroV5kmanexS221DBwaVu0FQuQNUjLXTsfGtEMJgHjStE0aM4cBDScGsv
 +lRtBf8RjUwMCgLHYI5RdKRJJqQHHTvfoJoEA7aKYQqfXCbytaVF5o1ihsIJsk6gkorQcjUmXwYlH
 +yqRKQHiFyoVeXEU=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mhQDE-00AOuw-Tu
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Nov 2021 05:54:36 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20211101054223epoutp0151d34e7e29311af6299bfd772f8ebc2e~zVbktNQiF2200222002epoutp010
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Nov 2021 05:42:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20211101054223epoutp0151d34e7e29311af6299bfd772f8ebc2e~zVbktNQiF2200222002epoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1635745343;
 bh=s26XtAoUeNsGxfGSeq6N3awANG4u5mCRCZ15ODJh9is=;
 h=From:To:Cc:Subject:Date:References:From;
 b=QgBGbFGlTnNrKP0x9fa+35IJWK7yZ3geB1evF/Nbw3R6g7BVtzjohQOL2YCb/XhfF
 FkDIkvsi7upxP5OetMIwJihPp29fdns7c4dYQNxTKVKYIzlQdPc36edMAgDdkpkUlB
 tzv05xargJ12wo8OlE9EAxgYuGeJems+OZtJeCfI=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20211101054223epcas1p1eec90b8beba62f5409947eb0bbc4dcc0~zVbkXcLZ-1778317783epcas1p19;
 Mon,  1 Nov 2021 05:42:23 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.38.242]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4HjMP82Y1Sz4x9QK; Mon,  1 Nov
 2021 05:42:20 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 24.75.08277.93E7F716; Mon,  1 Nov 2021 14:42:17 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20211101054217epcas1p3c695f37ab925f47156bd45e3adb5ed94~zVbfD8FcX2690626906epcas1p3b;
 Mon,  1 Nov 2021 05:42:17 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211101054217epsmtrp26067122406458d63755dfb7ad87637ba~zVbfDTckf3079730797epsmtrp2V;
 Mon,  1 Nov 2021 05:42:17 +0000 (GMT)
X-AuditID: b6c32a36-203ff70000002055-47-617f7e396a1e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 35.92.29871.93E7F716; Mon,  1 Nov 2021 14:42:17 +0900 (KST)
Received: from hj514.kim-office (unknown [10.253.100.146]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20211101054217epsmtip179140532a14e2de28a05b685463fe4f9~zVbe4chzI2028820288epsmtip1Y;
 Mon,  1 Nov 2021 05:42:17 +0000 (GMT)
From: Hyeong-Jun Kim <hj514.kim@samsung.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Date: Mon,  1 Nov 2021 14:42:14 +0900
Message-Id: <20211101054214.24456-1-hj514.kim@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPKsWRmVeSWpSXmKPExsWy7bCmnq5lXX2iwZ/Tehanp55lspjecZDN
 4sn6WcwWlxa5W1zeNYfNgdVj06pONo/dCz4zefRtWcXo8XmTXABLVLZNRmpiSmqRQmpecn5K
 Zl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtBaJYWyxJxSoFBAYnGxkr6dTVF+
 aUmqQkZ+cYmtUmpBSk6BWYFecWJucWleul5eaomVoYGBkSlQYUJ2xqX+moIG/oqdnW+ZGxjv
 cHcxcnJICJhInNo/mbmLkYtDSGAHo8SrBxuhnE+MEtNXP2SEcL4xSnybf4EFpuXI8W4WiMRe
 oJYJ19khnPeMEmf6GtlAqtgEdCQ+zFrJCGKLCNhLfP5+HaybWaBIYmf/OXYQW1jAWeLv8m4m
 EJtFQFVi7bTlYL28AlYS72dvZobYJi8x89J3doi4oMTJmU+g5shLNG+dDXarhMA2dokDM7cw
 QTS4SGz/twnqVGGJV8e3sEPYUhKf3+1lg7DrJY5f+cQK0dzCKPF46SugSzmAHHuJ95csQExm
 AU2J9bv0IcoVJXb+nssIsZdP4t3XHlaIal6JjjYhiBJlic13D0NNl5R4uugvI4TtIXF/031W
 EFtIIFbi0ZSNTBMY5Wch+WYWkm9mISxewMi8ilEstaA4Nz212LDACB6pyfm5mxjBKU/LbAfj
 pLcf9A4xMnEwHmKU4GBWEuGNuFCTKMSbklhZlVqUH19UmpNafIjRFBi+E5mlRJPzgUk3ryTe
 0MTSwMTMyMTC2NLYTEmc97NcYaKQQHpiSWp2ampBahFMHxMHp1QDk/aRzw+Se+Q8Zt/48lTx
 zBdjUVWWZ6ZbfwteOtn25Msa54IpwZHKjHzeW/R+Xj+ZyvP0q/edd7L/Indefyq9TvlEnEtU
 gL7Bx6zJ2xQj5MQuf/nmUd3AlHnj7uaE+mhfm426frMbome7PpliN5Ole8v63U79V7/r/w7K
 NOSQKV6osXPv3vKvge++7OiTnKontcvv2r31/5WNmdLimb/rcd0wXenMKb1yovynbH/N7vnP
 ax9MOavy/XLYp8h8m15ek99Sf081rmUNlvbmqZyyRsbqiNvuiIt/67KaZ/E8CrSewc3+ZluI
 +n2O1xNvFyxVuqrBcPDtEvHqkCkqyxvS5IMV9243iz2ho9N+Qud9vhJLcUaioRZzUXEiANOX
 tEICBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDLMWRmVeSWpSXmKPExsWy7bCSnK5lXX2iQccaFYvTU88yWUzvOMhm
 8WT9LGaLS4vcLS7vmsPmwOqxaVUnm8fuBZ+ZPPq2rGL0+LxJLoAlissmJTUnsyy1SN8ugSvj
 Un9NQQN/xc7Ot8wNjHe4uxg5OSQETCSOHO9m6WLk4hAS2M0ocXfSPuYuRg6ghKTEvPXlEKaw
 xOHDxRAlbxklTl8+zQTSyyagI/Fh1kpGEFtEwFHi1+tFrCA2s0CJxOZNL9hBbGEBZ4m/y7vB
 6lkEVCXWTlvOBmLzClhJvJ+9mRniBnmJmZe+s0PEBSVOznzCAjFHXqJ562zmCYx8s5CkZiFJ
 LWBkWsUomVpQnJueW2xYYJiXWq5XnJhbXJqXrpecn7uJERyAWpo7GLev+qB3iJGJg/EQowQH
 s5IIb8SFmkQh3pTEyqrUovz4otKc1OJDjNIcLErivBe6TsYLCaQnlqRmp6YWpBbBZJk4OKUa
 mE4kHL1w8mmXobOTiyu71OZdZmu4l2wt+MY7Q1Xk/vt1eZvmV3EJvzjpqH8zbEps0rT6Mzlv
 hCqu5Or9VY25MufPtfog945MDf4yDuO+zoiTTZqfLs3fNDX1ruTSVgmp1o8cy/V8jV4bsGqp
 MjeH3Vn4yunP3pOmfRcXXWV9tfmOUXKDVo4Ka+503wUquwN7DtodiuD+0WcyPWNmp6Xyukqh
 YxtalVXm3lBJ8jTc8qrlwJw9s/6fNAuT3/iyvFuGT7Hd77L0Sw5Bb6Pd7OuPhac5rfRLaZr8
 xS4vT/xy4V2PK5kddxuDXhwtUXx5af7y3FsNbCHqAlcFVy5+qdx52dJA8Ne3F3053+ffWGfl
 psRSnJFoqMVcVJwIABcobaKvAgAA
X-CMS-MailID: 20211101054217epcas1p3c695f37ab925f47156bd45e3adb5ed94
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211101054217epcas1p3c695f37ab925f47156bd45e3adb5ed94
References: <CGME20211101054217epcas1p3c695f37ab925f47156bd45e3adb5ed94@epcas1p3.samsung.com>
X-Headers-End: 1mhQDE-00AOuw-Tu
Subject: [f2fs-dev] [PATCH] F2FS: invalidate META_MAPPING before IPU/DIO
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Encrypted pages during GC are read and cached in META_MAPPING.
However, due to cached pages in META_MAPPING, there is an issue where
newly written pages are lost by IPU or DIO writes.

Thread A                              Thread B
- f2fs_gc(): blk 0x10 -> 0x20 (a)
                                      - IPU or DIO write on blk 0x20 (b)
- f2fs_gc(): blk 0x20 -> 0x30 (c)

(a) page for blk 0x20 is cached in META_MAPPING and page for blk 0x10
    is invalidated from META_MAPPING.
(b) write new data to blk 0x200 using IPU or DIO, but outdated data
    still remains in META_MAPPING.
(c) f2fs_gc() try to move blk from 0x20 to 0x30 using cached page in
    META_MAPPING. In conclusion, the newly written data in (b) is lost.

To address this issue, invalidating pages in META_MAPPING before IPU or
DIO write.

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
index 526423fe84ce..f57c55190f9e 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3652,6 +3652,9 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 		goto drop_bio;
 	}
 
+	invalidate_mapping_pages(META_MAPPING(fio->sbi),
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
