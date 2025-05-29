Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C292AC7D61
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 May 2025 13:49:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+wY+obXDxtWXg2U/aYUqSWovC+HRSmLx5Gtri++5/w=; b=MeOejkKGzDkWMSrq98Wk9XRGSB
	f+hjqCiOUHfEflE5Q4Z+Nq80dmEgH9fD79zNZSHMSlyDT4NWqiVLZepaGO17xsDhRaTJXio53pIT0
	Kpa0pwArKvg9cKj0uNFToTAWLXfZgV1vzc+rt/N+uQ8esxJOhk4gydBAeLL+cZEbEqfU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKblR-0001KX-I8;
	Thu, 29 May 2025 11:49:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1uKblQ-0001KO-8e
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y+nkfIOt+3+fBahE/FTnqxhgbR0oamTFyjGP5NPPufo=; b=bVlTVaNXIG2l70go8NMlLFdMgo
 5BjfTe+3LkBh+mkmJ6sSWD4VkHPSq5sOETeQIiTBDKn2Hvy6fj5HGUsnLoLi82B6PVWfo2rQXW8J+
 aEabc9QWpZBQi3SYCJ6vRCbhnpBgFT1PeYdSFyn/ZxH9mlNxmV0UbnpB53boE4FQzhko=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y+nkfIOt+3+fBahE/FTnqxhgbR0oamTFyjGP5NPPufo=; b=C7XPOxSxIwUVghA/d/mBU4RH2w
 bto3Ba5qZcWN9By1fbVzjOjd8ayOD1PG0QBw6GzErMD+qUpoI631hSTdQbt/4DXG+hby5hhOqsvLU
 Pn+SSLSMkmsSzoWUJJLvrBqGLA+ZWxpsRMBvM95fnNZcfYPKR5f+xYBoVZ0u7rI9/X6w=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uKblP-0000uu-8E for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:49:36 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20250529113338epoutp02627d015a10aaeb91459e84227effd84c~D-DzbZ88q2407724077epoutp02F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 May 2025 11:33:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20250529113338epoutp02627d015a10aaeb91459e84227effd84c~D-DzbZ88q2407724077epoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1748518418;
 bh=y+nkfIOt+3+fBahE/FTnqxhgbR0oamTFyjGP5NPPufo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ts6YCJmjPWjasO0VospUwjxr823S5DCJ0B/nK1nXpt8i+nYK1U+qsXOEVM8hd67Um
 QXLl5bxMflnDcLN74eUL4Y08XqYwiHBv4b06ElIqDdCid297crZaqYHpnyzzyqIY2y
 JrasquQ9L2o2lS0EhaqXd6xZI9j62DzNfez58xys=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
 20250529113337epcas5p3f024c11a53bffeb67f7425b656519dc7~D-DyuRv7L3109531095epcas5p3L;
 Thu, 29 May 2025 11:33:37 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.174]) by
 epsnrtp03.localdomain (Postfix) with ESMTP id 4b7PQ808lcz3hhT7; Thu, 29 May
 2025 11:33:36 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20250529113232epcas5p4e6f3b2f03d3a5f8fcaace3ddd03298d0~D-C11dWKS0832408324epcas5p4m;
 Thu, 29 May 2025 11:32:32 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250529113232epsmtrp2605620ed3bb7cb2547eb5f0a4dc89991~D-C10gkfG3187631876epsmtrp2N;
 Thu, 29 May 2025 11:32:32 +0000 (GMT)
X-AuditID: b6c32a52-41dfa70000004c16-e4-683845d00f0d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 95.82.19478.0D548386; Thu, 29 May 2025 20:32:32 +0900 (KST)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250529113228epsmtip2fac518f078939caf5955dd6c606fa5b7~D-Cx_RSE_2424224242epsmtip2v;
 Thu, 29 May 2025 11:32:28 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, p.raghav@samsung.com,
 da.gomez@samsung.com
Date: Thu, 29 May 2025 16:44:55 +0530
Message-Id: <20250529111504.89912-5-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529111504.89912-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRmVeSWpSXmKPExsWy7bCSvO4FV4sMg56b4hbb1u1mt5izfg2b
 xYV1qxktWnf+Z7FomvCX2WL13X42i9eHPzFanJ56lsliyyV7i/eXtzFZrL65htFiy7F7jBaX
 n/BZ7J7+j9Xi5oGdTBYrVx9lspg9vZnJ4sn6WcwWW798ZbW4tMjdYs/ekywW99b8Z7W4cOA0
 q8WNCU8ZLZ7t3shs8XlpC7vFwVMd7Baf5gINOf/3OKvF7x9z2BzkPE4tkvDYOesuu8fmFVoe
 l8+Wemxa1cnmsenTJHaPEzN+s3i82DyT0WP3gs9MHrtvNrB5nLtY4fF+31U2j74tqxg9ps6u
 9ziz4Ai7x4ppF5kChKK4bFJSczLLUov07RK4Mvrf7mIp2M5dMeXuCfYGxuucXYycHBICJhI7
 zzezdTFycQgJbGeUaHq1jAkiISOx++5OVghbWGLlv+fsEEUfGSUeNWwFSnBwsAnoSvxoCgWJ
 iwjcZJY4d/YMWAOzwD9Gid2vdEBsYQE/iW8t51hAbBYBVYkn19ewg9i8ArYSWx9+YYdYIC8x
 89J3MJtTwE5i0ZKvjCC2EFDN0ptrWSDqBSVOznzCAjFfXqJ562zmCYwCs5CkZiFJLWBkWsUo
 mlpQnJuem1xgqFecmFtcmpeul5yfu4kRnBS0gnYwLlv/V+8QIxMH4yFGCQ5mJRHeJnuzDCHe
 lMTKqtSi/Pii0pzU4kOM0hwsSuK8yjmdKUIC6YklqdmpqQWpRTBZJg5OqQYmxpfaGhdVIziz
 TKao3eiztPVfdav36KOd9b6V83kzPh6OWi784W2iYkLX9XnCVw1YLUNqPrXU7nRhnx5s43/u
 w/s9d2vP+srpP2qW8N//K1Zn9dVFTE0cQo5+qZWOV6rqHJdJyzc2BCacVJ7ynf/4/4BTv9bf
 Xi91+HvHpZ7b0rU6bjtnrWm+5fB0t+q+Od31M+T7tQIl9uzaX7hKVs3DXXtB1gb+t02xoVNK
 669F8dWEHT5oeuRToNYFL8XJAmsESlNDik8cbtJhX/z1RaVsxrv8pXZnuo8/0f82J85j89Lw
 aXMFUu/dL+59co9fRfCcfOs1p1xm+bU8bxfqVaW+X5i/s1OvfBnf7MPfzv5XYinOSDTUYi4q
 TgQA1ASJpnkDAAA=
X-CMS-MailID: 20250529113232epcas5p4e6f3b2f03d3a5f8fcaace3ddd03298d0
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529113232epcas5p4e6f3b2f03d3a5f8fcaace3ddd03298d0
References: <20250529111504.89912-1-kundan.kumar@samsung.com>
 <CGME20250529113232epcas5p4e6f3b2f03d3a5f8fcaace3ddd03298d0@epcas5p4.samsung.com>
X-Headers-End: 1uKblP-0000uu-8E
Subject: [f2fs-dev] [PATCH 04/13] writeback: affine inode to a writeback ctx
 within a bdi
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

Affine inode to a writeback context. This helps in minimizing the
filesytem fragmentation due to inode being processed by different
threads.

Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 fs/fs-writeback.c           | 3 ++-
 include/linux/backing-dev.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 0959fff46235..9529e16c9b66 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -265,7 +265,8 @@ void __inode_attach_wb(struct inode *inode, struct folio *folio)
 {
 	struct backing_dev_info *bdi = inode_to_bdi(inode);
 	struct bdi_writeback *wb = NULL;
-	struct bdi_writeback_ctx *bdi_writeback_ctx = bdi->wb_ctx_arr[0];
+	struct bdi_writeback_ctx *bdi_writeback_ctx =
+						fetch_bdi_writeback_ctx(inode);
 
 	if (inode_cgwb_enabled(inode)) {
 		struct cgroup_subsys_state *memcg_css;
diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
index fbccb483e59c..30a812fbd488 100644
--- a/include/linux/backing-dev.h
+++ b/include/linux/backing-dev.h
@@ -157,7 +157,7 @@ fetch_bdi_writeback_ctx(struct inode *inode)
 {
 	struct backing_dev_info *bdi = inode_to_bdi(inode);
 
-	return bdi->wb_ctx_arr[0];
+	return bdi->wb_ctx_arr[inode->i_ino % bdi->nr_wb_ctx];
 }
 
 #ifdef CONFIG_CGROUP_WRITEBACK
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
