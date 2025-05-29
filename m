Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F4DAC7D64
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 May 2025 13:50:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tpqNiWSSmYNJW3B+3Q+KkooMm3Xci7hyqAMsMbunYA=; b=P5ch7xO2I9jYv81iANCdxsr7ov
	p/oos1cBMwO0yPnX1VMjP+0t51rz/YvF0ZVz4K305b/+qwgpIXTHKVvu2JW5vSgFUe/9YPmcOQ0du
	5vfNWkxdHV2bmAXf9VIjm/IYe++TwQgmSJDuKHPSIpl+gyI4Zs0xCbR7aeyqqigjYYo0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKbln-0002a4-4J;
	Thu, 29 May 2025 11:49:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1uKblm-0002Zd-6g
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zn7Pts0ou2iSXgETzzKNoOTqw7EC8RrgMd0Xe7Ygfcc=; b=KNaxa7jjn3hibFDXml7FtmGVKM
 es5exyWaSULs4bm1EElSJbtft29cu/bJm7BIj8X1zY6XTbKH0LXrnWJU1sLN/ffXMYidyZtYG9jan
 8Vbsc5VoxXNHnoqbkGDhEVwbWSYDidp6GExR55t4ia5kRcMh0lZcZ3HLxcEip9f+8wtQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zn7Pts0ou2iSXgETzzKNoOTqw7EC8RrgMd0Xe7Ygfcc=; b=EkcUeumQXZOQKGrPxgn7MDr+pK
 LBu3XUEkydXFpqHy6nX4GLbFyd/Z5tBWcAzPjIyuefSAaSw5ExFTUW7b38LQP0cI2o0xBY4d+SXy6
 1wzLQ1SycqFi9kwiTQkS8zrfxCqipZ+ZX4O5mWuIZgBG69c1boXBTZgAsVi1EoHYf/TU=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uKbll-0000yY-6h for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:49:58 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20250529113411epoutp0415ce0544990c825be68ed2ec17350310~D-ERsQ_H72428524285epoutp04T
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 May 2025 11:34:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20250529113411epoutp0415ce0544990c825be68ed2ec17350310~D-ERsQ_H72428524285epoutp04T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1748518451;
 bh=Zn7Pts0ou2iSXgETzzKNoOTqw7EC8RrgMd0Xe7Ygfcc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SEPudA+0D06vWELpPkQrq4B1L0GjzwbndNP8ZZwSnFdwoRMksArUgD58PWrONwKsS
 oeGC5NqX4fa/YviaMkUplhyNbLsArEVm90XS94pVXVVwUeD+MwMp7ynSJWSBIPknDN
 olk9iXHyECZCls2dtYPyDeTQzeNCqph4f3XmZu6Q=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
 20250529113410epcas5p479a40e38a740560a53f1518e9dd71db1~D-ERVzu7h2801228012epcas5p4V;
 Thu, 29 May 2025 11:34:10 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.175]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4b7PQn3Gnrz6B9m5; Thu, 29 May
 2025 11:34:09 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20250529113257epcas5p4dbaf9c8e2dc362767c8553399632c1ea~D-DNfLdhB2501025010epcas5p4s;
 Thu, 29 May 2025 11:32:57 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250529113257epsmtrp107bda94680d50d120a7cbed6884bfd27~D-DNd_opW2108121081epsmtrp1U;
 Thu, 29 May 2025 11:32:57 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-5b-683845e9c6be
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 C6.E0.08766.9E548386; Thu, 29 May 2025 20:32:57 +0900 (KST)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250529113253epsmtip27ef7254c0e9880bcb299ee33499ee18e~D-DJpOhM12454924549epsmtip2N;
 Thu, 29 May 2025 11:32:53 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, p.raghav@samsung.com,
 da.gomez@samsung.com
Date: Thu, 29 May 2025 16:45:01 +0530
Message-Id: <20250529111504.89912-11-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529111504.89912-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0xTZxjHfc+djpqzYuYrLJLVmAWiKF7wZZsw4tiO+oVsMc4bWO0ZJba1
 aUHZliirohOBVQWFHpYAQoK0gLaA1iMIxVsFKhYvdIPiBZ3iDFogIxBBCy7x2y//3/95ni8P
 g8sGiVAmTZvO67UKtZySEI1t8vDFzxORaunI+FLUWCvSqKTOSqGuWgtA2Y4pAhlNb3Bk6fuD
 Qi/a/AC1F3ZiqN4Tj4a6GzFk8VoBqr/mA6h7YDYST02SyNviwNAZy1UMCacOYGigzoyjhpFR
 EnnKv0OXmlwE8lmnSNTV0k6iHtMTgJ6K53A0XHmQRq03f6eR/893S269uU6iibES6uv53M1y
 yDnMfTRnr4rkujszOFv1EYqz+Y/T3I2iCYJ7Zi8GnFg6jHGiN4vi3LczuaHmuxSXX18NuEJh
 P9dReoXmqk7expJkmyVfKXl12h5evyRuu0T1oL+A1OXOznTm+ukscDw4BwQxkF0B871PiBwg
 YWSsCGBXkQubEZ9Csc9BznAIPDP5Dz1Teg2gUCDgOYBhKHYxHDNuCORzWC8O3Z0d0wM4Owmg
 OLgowCFsEhSrrNM5wS6EdfdPEwGWsnHQ3jH2/kA4LPb8Rwc46F1eXjEKAixjV8NKb837/sfQ
 VTxAzOwPhwcaBNwEWPMHyvyBKgVYNZjH6wyaVI0hWhet5fdGGRQaQ4Y2NWrnbo0NTL9DZMQF
 cL76VZQTYAxwAsjg8jlSY3yMSiZVKn7+hdfvTtFnqHmDE4QxhHyudO6zPKWMTVWk87t4Xsfr
 /7cYExSahSVWfu7e6GIKN44cWtRk8S0kZ+XFLNhXM0XLk1TGBPDRvODHtjUlKQUgepTcN/Eg
 /Fvbhcz1P3S/cAzF9ks9VNn3yy4VxB698lkReFkb8/pwySf2oJ7iyU2kf1mr+Vh/TXbehL+v
 MtVdGLfTGnpU1lr2ReuS+//KrYpvWtRGRVtF7suz2xNWzV/+o3VLGXHN4xbY9dcHBYuTeO77
 K2yW+2JPc5ry15BHvcciHwqmlsR149v2DBt3rOltij3cHKLN3v9wnIxX9zaHba2Zalt9eZUR
 O6JzJYS2fxkfkfH0noPV8XcaJG7TWt9Q/k/BJx7XudM1h/7em79SeJWb/ChZ+Zt9l5wwqBTR
 kbjeoHgLOVHo+30DAAA=
X-CMS-MailID: 20250529113257epcas5p4dbaf9c8e2dc362767c8553399632c1ea
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529113257epcas5p4dbaf9c8e2dc362767c8553399632c1ea
References: <20250529111504.89912-1-kundan.kumar@samsung.com>
 <CGME20250529113257epcas5p4dbaf9c8e2dc362767c8553399632c1ea@epcas5p4.samsung.com>
X-Headers-End: 1uKbll-0000yY-6h
Subject: [f2fs-dev] [PATCH 10/13] fuse: add support for multiple writeback
 contexts in fuse
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
Cc: linux-nfs@vger.kernel.org, gost.dev@samsung.com,
 Anuj Gupta <anuj20.g@samsung.com>, linux-f2fs-devel@lists.sourceforge.net,
 gfs2@lists.linux.dev, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Kundan Kumar <kundan.kumar@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fetch writeback context to which an inode is affined. Use it to perform
writeback related operations.

Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 fs/fuse/file.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 7817219d1599..803359b02383 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1851,11 +1851,11 @@ static void fuse_writepage_free(struct fuse_writepage_args *wpa)
 
 static void fuse_writepage_finish_stat(struct inode *inode, struct folio *folio)
 {
-	struct backing_dev_info *bdi = inode_to_bdi(inode);
+	struct bdi_writeback_ctx *bdi_wb_ctx = fetch_bdi_writeback_ctx(inode);
 
-	dec_wb_stat(&bdi->wb_ctx_arr[0]->wb, WB_WRITEBACK);
+	dec_wb_stat(&bdi_wb_ctx->wb, WB_WRITEBACK);
 	node_stat_sub_folio(folio, NR_WRITEBACK_TEMP);
-	wb_writeout_inc(&bdi->wb_ctx_arr[0]->wb);
+	wb_writeout_inc(&bdi_wb_ctx->wb);
 }
 
 static void fuse_writepage_finish(struct fuse_writepage_args *wpa)
@@ -2134,6 +2134,7 @@ static void fuse_writepage_args_page_fill(struct fuse_writepage_args *wpa, struc
 					  struct folio *tmp_folio, uint32_t folio_index)
 {
 	struct inode *inode = folio->mapping->host;
+	struct bdi_writeback_ctx *bdi_wb_ctx = fetch_bdi_writeback_ctx(inode);
 	struct fuse_args_pages *ap = &wpa->ia.ap;
 
 	folio_copy(tmp_folio, folio);
@@ -2142,7 +2143,7 @@ static void fuse_writepage_args_page_fill(struct fuse_writepage_args *wpa, struc
 	ap->descs[folio_index].offset = 0;
 	ap->descs[folio_index].length = PAGE_SIZE;
 
-	inc_wb_stat(&inode_to_bdi(inode)->wb_ctx_arr[0]->wb, WB_WRITEBACK);
+	inc_wb_stat(&bdi_wb_ctx->wb, WB_WRITEBACK);
 	node_stat_add_folio(tmp_folio, NR_WRITEBACK_TEMP);
 }
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
