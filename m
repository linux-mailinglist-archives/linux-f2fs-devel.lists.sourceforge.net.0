Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE65BD940A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Oct 2025 14:11:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNKQsz9i6kpt0u1AoSdE3pFTX2tVHpqeAhdS1omI3LA=; b=N+0crBPy1SRvKOQoOBqYlUKX4y
	6JISMdp8QmFsWvD7fwuxE2LutCup3HTr4UsOoXlDxQ5Zfmba0yuFFx2ku+CitlIAeJgE8lpjJ0aiD
	fZgYQAEsjLtvgTjbWF+pJxw+ReRXwm5BUAswB/4vCrrJYLMG9DHod6ni4mUJLBaHHANc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8ds2-0000jA-Bo;
	Tue, 14 Oct 2025 12:11:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1v8drl-0000iR-6A
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dioO0YDP7mzhZqCWconGW6ike9OX4ckBo46ONrqcrR4=; b=Cs8NaXx4KgTp4VABRSvhYCQdZn
 zQ+7hVJqWdYt4K+VMejd9KhoZRHk0sPLJ/DqJISMXpHxGjBjaiDOQk3wl7rKffbQ3m9Td/RSrCoPt
 Eu4SPURwhK3j+V/hr4u6ajmQPPqWRlKmWOL3CLPuKe9DlOUgp0JhUdb+/bw9wi5ZZ9nI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dioO0YDP7mzhZqCWconGW6ike9OX4ckBo46ONrqcrR4=; b=BhnRNfFih8Bu8NisEpzbXZ/dTp
 MXijRE53j+BOhPwHRG9jshqIiglvDEE+Jsndidh0qwwFzBPC37ZQnHCq6ZoBoW7Pfz1p4bHaoHGwD
 QLe2Gc9BVjv1Sc9dRcAZvL4eztJJ+7FfHE2j476K9PKlcK6xEmli7g4y3/MWARXGspf4=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8drk-0001Mi-96 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:10:57 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20251014121044epoutp015d205f89636ae4a03c7b1882deb5eb29~uWll5FU2W1134011340epoutp01L
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Oct 2025 12:10:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20251014121044epoutp015d205f89636ae4a03c7b1882deb5eb29~uWll5FU2W1134011340epoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1760443844;
 bh=dioO0YDP7mzhZqCWconGW6ike9OX4ckBo46ONrqcrR4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B0TNqDFoyqdsRahkcmFej3wpmKZnuHdX78pZTjij1NDXzZRcoesm5o+KDGOZcvjnw
 1PpV/Vt3iRjOFLDSMJUARarfYJK/q/4FDpMIWV1kDbLWEfBMzrQgdIu9IfuoWgo8Io
 YXUfAsH8n69hTOFMEGQu19qQlRYtQqe4NpgWbk1k=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
 20251014121044epcas5p2f380d81531fc3d4fad2cbcf760ac1c1f~uWllTAZGM1888018880epcas5p2q;
 Tue, 14 Oct 2025 12:10:44 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.87]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4cmCjH05ybz2SSKY; Tue, 14 Oct
 2025 12:10:43 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20251014121042epcas5p16a955879f8aaca4d0a4fd50bc5344f55~uWljkHFol1447514475epcas5p1o;
 Tue, 14 Oct 2025 12:10:42 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251014121037epsmtip1cb43407e8777ba7eb89d4bf5e248dc43~uWle9F8wv1239712397epsmtip1O;
 Tue, 14 Oct 2025 12:10:37 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, wangyufei@vivo.com
Date: Tue, 14 Oct 2025 17:38:35 +0530
Message-Id: <20251014120845.2361-7-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251014120845.2361-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-CMS-MailID: 20251014121042epcas5p16a955879f8aaca4d0a4fd50bc5344f55
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251014121042epcas5p16a955879f8aaca4d0a4fd50bc5344f55
References: <20251014120845.2361-1-kundan.kumar@samsung.com>
 <CGME20251014121042epcas5p16a955879f8aaca4d0a4fd50bc5344f55@epcas5p1.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Modify flusher and dirtytime logic to iterate through all
 the writeback contexts. Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
 Signed-off-by: Anuj Gupta <anuj20.g@samsung.com> --- fs/fs-writeback.c |
 16 ++++++++++------ 1 file changed, 10 insertions(+), 6 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v8drk-0001Mi-96
Subject: [f2fs-dev] [PATCH v2 06/16] writeback: invoke all writeback
 contexts for flusher and dirtytime writeback
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

Modify flusher and dirtytime logic to iterate through all the writeback
contexts.

Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 fs/fs-writeback.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 93f8ea340247..432f392c8256 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -2389,12 +2389,14 @@ static void __wakeup_flusher_threads_bdi(struct backing_dev_info *bdi,
 					 enum wb_reason reason)
 {
 	struct bdi_writeback *wb;
+	struct bdi_writeback_ctx *bdi_wb_ctx;
 
 	if (!bdi_has_dirty_io(bdi))
 		return;
 
-	list_for_each_entry_rcu(wb, &bdi->wb_ctx[0]->wb_list, bdi_node)
-		wb_start_writeback(wb, reason);
+	for_each_bdi_wb_ctx(bdi, bdi_wb_ctx)
+		list_for_each_entry_rcu(wb, &bdi_wb_ctx->wb_list, bdi_node)
+			wb_start_writeback(wb, reason);
 }
 
 void wakeup_flusher_threads_bdi(struct backing_dev_info *bdi,
@@ -2444,15 +2446,17 @@ static DECLARE_DELAYED_WORK(dirtytime_work, wakeup_dirtytime_writeback);
 static void wakeup_dirtytime_writeback(struct work_struct *w)
 {
 	struct backing_dev_info *bdi;
+	struct bdi_writeback_ctx *bdi_wb_ctx;
 
 	rcu_read_lock();
 	list_for_each_entry_rcu(bdi, &bdi_list, bdi_list) {
 		struct bdi_writeback *wb;
 
-		list_for_each_entry_rcu(wb, &bdi->wb_ctx[0]->wb_list,
-					bdi_node)
-			if (!list_empty(&wb->b_dirty_time))
-				wb_wakeup(wb);
+		for_each_bdi_wb_ctx(bdi, bdi_wb_ctx)
+			list_for_each_entry_rcu(wb, &bdi_wb_ctx->wb_list,
+						bdi_node)
+				if (!list_empty(&wb->b_dirty_time))
+					wb_wakeup(wb);
 	}
 	rcu_read_unlock();
 	schedule_delayed_work(&dirtytime_work, dirtytime_expire_interval * HZ);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
