Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3D1AC7D69
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 May 2025 13:50:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6IAP6YVI0GQzNH1+7mvKwdF+Ydvu7QzT2Q3cpS7XsE=; b=fD8ilG8DbH0ycSxNMSdEdf09/I
	dIfrhaL2p94vQY9joSZq/unV4DtWH0YLzYbTERhP5EJrVdZ4i3Mzl71eSwURue65zp6FZXy0sFBIQ
	90b0fImiqQqENjBc2rtlT9mDvdz9axAOW4K9M4rJj01MMCR5z8zN2ZKX7vJ8WmOEVMIM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKbls-0002sg-Oh;
	Thu, 29 May 2025 11:50:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1uKblp-0002qs-5W
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J0bOkMsxx+My3P3fA0s0LpJACRCKsJ2melVHzlSN380=; b=h0UmUcamjJbyRSDym/pIv60XgV
 uvALSsbtJEXhW3lTomy0JTjJ4bzWiKQE82Ao5pjpYcFZreMGd7j05tPKCx0JJFzsviU1LNZpes3ao
 iYyas5bWQBk6Su5ftubcgXbZOqglgTLPt2GcbfDdNoHuOwScXPlsTS1HYUmZC7hZtHvE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J0bOkMsxx+My3P3fA0s0LpJACRCKsJ2melVHzlSN380=; b=lvrIsTrtUgZFV8WMADKaTI8B++
 Ct8gOTkZPbS1hUN7ni0MRlM1ZeTe3Uxj+0PJbyRmVsjcoGjfYxWNauqDuaINw99lnBud+uUrE3OOz
 QOchMWGDLkHiekogkAFUL2wizjUvI044Qi2fB0Oif9Tgpgjv25tLOqEk6D2MHroVyb7I=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uKblo-0000z1-5N for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:50:01 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250529113413epoutp03f5e8e6721445aaeeccbca7c8c598b6be~D-ETzyGEl0848708487epoutp03a
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 May 2025 11:34:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250529113413epoutp03f5e8e6721445aaeeccbca7c8c598b6be~D-ETzyGEl0848708487epoutp03a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1748518453;
 bh=J0bOkMsxx+My3P3fA0s0LpJACRCKsJ2melVHzlSN380=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CEYFtCRmoON3oqtAmtTl89xrnD9rjjbk4fAzQYVJoQTs/U6and5rG63wZlY5YUcho
 yL1Jh8YvOR/yPzxKsQ5HGjkzdjTq95KjH2SnbuadHPPxo/FZtFnzoaHrx9/GTqR94q
 5qB51aXv4b13IUDct4L5NjkfggYZjwe4m3dZLXU4=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
 20250529113412epcas5p11973dd81c97a15f05e9778c52c0c7e24~D-ETHsjcv0283302833epcas5p1r;
 Thu, 29 May 2025 11:34:12 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.179]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4b7PQq3CRXz2SSKX; Thu, 29 May
 2025 11:34:11 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20250529113302epcas5p3bdae265288af32172fb7380a727383eb~D-DRa_6-80440004400epcas5p3l;
 Thu, 29 May 2025 11:33:02 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250529113302epsmtrp2d54317629504c1808562ac7d68203cf8~D-DRZcoft3187631876epsmtrp2F;
 Thu, 29 May 2025 11:33:02 +0000 (GMT)
X-AuditID: b6c32a52-41dfa70000004c16-4b-683845ed4ad1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 15.92.19478.DE548386; Thu, 29 May 2025 20:33:02 +0900 (KST)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250529113258epsmtip2aafd700ab400e6f72cbda5b4e089c4e5~D-DNkrXA42194921949epsmtip25;
 Thu, 29 May 2025 11:32:57 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, p.raghav@samsung.com,
 da.gomez@samsung.com
Date: Thu, 29 May 2025 16:45:02 +0530
Message-Id: <20250529111504.89912-12-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529111504.89912-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0xTZxjHfc85PedQqR5rlddLZKk2cQ2gBCFvvMAWs3lC/DCJojEaqXKk
 SFtrK4jGC4I4bTZlIkIvam3kWqAbIsLOplhAQQQphMQmw4kpohBRi4iKhVFwid9++d+eLw+N
 i/uIhXSy5iCn0yhUUlJI1DRIg0OHfkDKlYZWDNVU8hSyOMpJ1FFpByi7boJAmTk+HNl7zpNo
 sMELUGteG4aqO2PQ664aDNnd5QBV33sCUJdnFuLzxwXIXV+HoVJ7E4bM+VkY8jhMOLr5bkSA
 Om0b0F9/txDoSfmEAHXUtwrQ45w+gJ7zf+BouPAUhe4+OEMh7+XJkUe++wI09sFCfreEfWCD
 bJ2ph2JvlMjZrrZUtqrsLMlWeS9QbHPBGMG+uGEELG8dxljenUGy7a509vXtbpI9V10G2Dzz
 CfahtZFiSy65sJ/E24VrEzlVchqnWxGdIFQOnD5Nan+fmV6cc53KAHcDDICmIbMKDpbiBiCk
 xcwtAJ/+00QZQMCkvhjyPXWCaZ4LS8f7qenQWwB9lb2Yv0wyofBD5ha/LmHcOGxvezhVwJlx
 APmBED/PZeKhsdCL+ZlgZLC/0Yn7WcREw3+tV74cCIbGztGpwwGTuu36CPCzmFkHC90VxHR+
 Dmwxeojp/WCYddOM5wDG9JVl+sqyAqwMzOO0enWSeo82PEyvUOtTNUlhe/arq8DUJ8jjakGR
 wxfmBBgNnADSuFQiyoyJUopFiYrDRzjd/l26VBWnd4JFNCENEi1VnU0UM0mKg1wKx2k53f8u
 RgcszMBArNvxMSIbi1jTEX5Sc8AuPT57V9b6qMgfecS7lgV/WqKK6zPez42VmmTDZrusoKQx
 ZfHqtKqS+ttBO4/Bb0cKjl6TO+Il1O6inubUdb0zNlrmC/ClmmHLe11Y/ordotwY3aHfwmsj
 94ZGJPvine2bfo5S9i8IrC4e+jOwJc7bIJ4Zos09H2jIMw8130qM/cb3edC1lTLFeBKosbaE
 bVvT8G2vuhvB8n1vgsyS9M5nlmjb+EZJ5EC2ZvT7T+5YReaE0Nzw2Zqy+ZfR9erypl5xyIFi
 d3LXHZk8QXtuzEPYUJHrzFXry9rcnb+a87qDLIeeb7koe1Ozo2LgpKtC1Ssl9EpFuBzX6RX/
 AbKoNU94AwAA
X-CMS-MailID: 20250529113302epcas5p3bdae265288af32172fb7380a727383eb
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529113302epcas5p3bdae265288af32172fb7380a727383eb
References: <20250529111504.89912-1-kundan.kumar@samsung.com>
 <CGME20250529113302epcas5p3bdae265288af32172fb7380a727383eb@epcas5p3.samsung.com>
X-Headers-End: 1uKblo-0000z1-5N
Subject: [f2fs-dev] [PATCH 11/13] gfs2: add support in gfs2 to handle
 multiple writeback contexts
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

Add support to handle multiple writeback contexts and check for
dirty_exceeded across all the writeback contexts

Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 fs/gfs2/super.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index dfc83bd3def3..d4fdab4a4201 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -450,6 +450,7 @@ static int gfs2_write_inode(struct inode *inode, struct writeback_control *wbc)
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
 	struct address_space *metamapping = gfs2_glock2aspace(ip->i_gl);
 	struct backing_dev_info *bdi = inode_to_bdi(metamapping->host);
+	struct bdi_writeback_ctx *bdi_wb_ctx;
 	int ret = 0;
 	bool flush_all = (wbc->sync_mode == WB_SYNC_ALL || gfs2_is_jdata(ip));
 
@@ -457,10 +458,12 @@ static int gfs2_write_inode(struct inode *inode, struct writeback_control *wbc)
 		gfs2_log_flush(GFS2_SB(inode), ip->i_gl,
 			       GFS2_LOG_HEAD_FLUSH_NORMAL |
 			       GFS2_LFC_WRITE_INODE);
-	if (bdi->wb_ctx_arr[0]->wb.dirty_exceeded)
-		gfs2_ail1_flush(sdp, wbc);
-	else
-		filemap_fdatawrite(metamapping);
+
+	for_each_bdi_wb_ctx(bdi, bdi_wb_ctx)
+		if (bdi_wb_ctx->wb.dirty_exceeded)
+			gfs2_ail1_flush(sdp, wbc);
+		else
+			filemap_fdatawrite(metamapping);
 	if (flush_all)
 		ret = filemap_fdatawait(metamapping);
 	if (ret)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
