Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA35BD9427
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Oct 2025 14:11:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGEJkmx8r67A00EJN/Vv3aVW2ymeOkRXUTTNzoLPHSk=; b=S+cvn9A9YgxEityapKvpGZrzG2
	KI3zZjnXhkIUls1LyoBU8YLD0zGGo/GBYR9rDw6L4zKmb2TkHDl1H+Q1cQ+EVQRNQC8yepcFVwXeC
	qnyrnULVKpej7uMPBrp41eYyhEwkIJLdFjAzjKaRLPIzr6ANG7nBiWb0Tw9HaTApJgVM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8dsH-0000uF-54;
	Tue, 14 Oct 2025 12:11:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1v8dsF-0000u4-Is
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PXGKebblkuYyVq32XepqRXoghfCKJGEOOFxZca7FgOI=; b=YFscymMtYSxJ95VRh4w6BxWGzc
 ycdf9NMBAdvZfJm871AA9dfNiyAsp+7A7ckkUMs8r1zZbdNY1iaXvZMD2SL4f2LVXvXaya6p1SywN
 BUT3A+dFjnOxMxAckPL/pfedqgP9Ge/hZxpnqfQxr+5cFyLbPfLqXxIuu95BYHcflniM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PXGKebblkuYyVq32XepqRXoghfCKJGEOOFxZca7FgOI=; b=jSg9XMmfY17sG5W9+thHyKp+Ik
 B+UvTz2o5b//PMz3XvPwooAhERtOJZtc4Nlz38uTeC5Nl5Ig348LR6xNd6WmEkOrcON5h8k+PZnwz
 5C+iz+5fFJ9cs0O11bsxhjnLc8TWOSK/7VTPbEIKV1yIXbLVouCTRYMUryX6WGz2dFeI=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8dsE-0001P7-T1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:11:27 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20251014121115epoutp045106065d5cc7bb3136dfbab876c0ea48~uWmCWX-bS1210712107epoutp04T
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Oct 2025 12:11:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20251014121115epoutp045106065d5cc7bb3136dfbab876c0ea48~uWmCWX-bS1210712107epoutp04T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1760443875;
 bh=PXGKebblkuYyVq32XepqRXoghfCKJGEOOFxZca7FgOI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oVP9IXiobPJGIbz9EacCOAHSnCKNKbX9TBtPASsWhoBdgEe0oMU+HrFuS4ReblZ0t
 dEPavhOeWgnqnMySP5yAQUtMsDeYs3csraClpoX6hpVmfRZTuVEcXZtA58eKuRbyi3
 vQV6rZpeJRg/A/Ne5ajjbCCqphVMA7fnmh4zVRfc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
 20251014121114epcas5p4d0d2a74508fa8c2ff7694bfcf2f9da2b~uWmBwq60C1326113261epcas5p4X;
 Tue, 14 Oct 2025 12:11:14 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4cmCjs4c82z2SSKb; Tue, 14 Oct
 2025 12:11:13 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20251014121113epcas5p3522dd553825deccfb9a1c9c12f071e3a~uWmAVF5dU1718117181epcas5p3R;
 Tue, 14 Oct 2025 12:11:13 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251014121108epsmtip16a22dad80f2ca2c63d567898c2d48def~uWl78CnMv1256112561epsmtip1G;
 Tue, 14 Oct 2025 12:11:08 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, wangyufei@vivo.com
Date: Tue, 14 Oct 2025 17:38:40 +0530
Message-Id: <20251014120845.2361-12-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251014120845.2361-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-CMS-MailID: 20251014121113epcas5p3522dd553825deccfb9a1c9c12f071e3a
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251014121113epcas5p3522dd553825deccfb9a1c9c12f071e3a
References: <20251014120845.2361-1-kundan.kumar@samsung.com>
 <CGME20251014121113epcas5p3522dd553825deccfb9a1c9c12f071e3a@epcas5p3.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add support to handle multiple writeback contexts and check
 for dirty_exceeded across all the writeback contexts Signed-off-by: Kundan
 Kumar <kundan.kumar@samsung.com> Signed-off-by: Anuj Gupta
 <anuj20.g@samsung.com>
 --- fs/gfs2/super.c | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v8dsE-0001P7-T1
Subject: [f2fs-dev] [PATCH v2 11/16] gfs2: add support in gfs2 to handle
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
Cc: linux-nfs@vger.kernel.org, gost.dev@samsung.com, anuj20.g@samsung.com,
 vishak.g@samsung.com, linux-f2fs-devel@lists.sourceforge.net,
 gfs2@lists.linux.dev, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 kundan.kumar@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add support to handle multiple writeback contexts and check for
dirty_exceeded across all the writeback contexts

Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 fs/gfs2/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index bd11d5e6cf63..b1e00a64e5ec 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -447,7 +447,7 @@ static int gfs2_write_inode(struct inode *inode, struct writeback_control *wbc)
 		gfs2_log_flush(GFS2_SB(inode), ip->i_gl,
 			       GFS2_LOG_HEAD_FLUSH_NORMAL |
 			       GFS2_LFC_WRITE_INODE);
-	if (bdi->wb_ctx[0]->wb.dirty_exceeded)
+	if (bdi_wb_dirty_limit_exceeded(bdi))
 		gfs2_ail1_flush(sdp, wbc);
 	else
 		filemap_fdatawrite(metamapping);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
