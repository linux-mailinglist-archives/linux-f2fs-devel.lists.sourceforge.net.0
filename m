Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78344AC7D5F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 May 2025 13:49:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmsmAtWdb7dCbie5ZKoU7a9N8xcz/E2LTyb35xD4ADA=; b=UNoRgnM2viemvAM3VrTkdcybHL
	FrhTOwUsy6NlZwFCPbozB2dfifLnPixA4b6hiM6q5fHLAmnwZOHRcpxMCs/9rs/T6e3jNJm+RLqMB
	i3N2qbLAWWXTC5o5qMNkifBAZSlRaegiyFF8hcbU8njMqSzXjiweIECzUtehb0j7wUhA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKblK-0001K0-7C;
	Thu, 29 May 2025 11:49:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1uKblH-0001Jt-UW
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:49:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gxeKWeWu/ySnXS2r9kcCICk1CnqlIWodIB1MsF0xVi8=; b=NPp1Qgdyepufm2sMfkvvYliYjM
 L7Bk5gVP2x6sZrkhAfdASJaqjZvauRKSy28LJ3GV5jrQvkY9V5SuBeYp5tjrSS6X5VNw5+opQpDcK
 433OtAkhDEi79H/yBZ/9e2QyfcfFwO78kn2WndMz7gZggJVk9anqkcB3i9EP3R5/VrHw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gxeKWeWu/ySnXS2r9kcCICk1CnqlIWodIB1MsF0xVi8=; b=BnCiWeqgYDCy2q5ngx6/OhMI6Y
 4d97Am4cdwdvlzQQNBp1xqsjtkCpbz2jXRrbq9P7uRnfx542yHYyiMYI0G72Er7olYXlIErAqc2dy
 zqoE8wuyC6XvbXrdi6pEpUvBUlGK3LJU2nq+GTtZWi0asjSoNGLQbcVvjOe/o3OJKx84=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uKblH-0000tM-HF for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:49:27 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20250529113401epoutp0260abb957a29d62e0c2359613cf886395~D-EIq4XfT2408624086epoutp02K
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 May 2025 11:34:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20250529113401epoutp0260abb957a29d62e0c2359613cf886395~D-EIq4XfT2408624086epoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1748518441;
 bh=gxeKWeWu/ySnXS2r9kcCICk1CnqlIWodIB1MsF0xVi8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LdAMmPTf7G967tZgBxoVcxP6UjI1IhyvI0wuuwABkl0ZGdU7y571LYC82/qUU0oNa
 jDJfeLsrlsQYbMvK0L+QCOmKQACmepewzUawNV3T48aUujY00TcQ4M29hMPu0JwmMR
 +eh5JZp+YHGPYTkdaqTtyLGmA7xoP2WHuD4bAmWw=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
 20250529113359epcas5p39d7be00f8a656169b79d0370175eb687~D-EHRkHiq0522305223epcas5p3y;
 Thu, 29 May 2025 11:33:59 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.183]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4b7PQZ5GZdz6B9m4; Thu, 29 May
 2025 11:33:58 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20250529113240epcas5p295dcf9a016cc28e5c3e88d698808f645~D-C9tkRkG0469904699epcas5p2M;
 Thu, 29 May 2025 11:32:40 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250529113240epsmtrp1c4d25ba0721f6abf94540d54df86d1fb~D-C9sQSMO2113121131epsmtrp1N;
 Thu, 29 May 2025 11:32:40 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-3d-683845d8bfdf
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 12.E0.08766.8D548386; Thu, 29 May 2025 20:32:40 +0900 (KST)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250529113236epsmtip2de2be54bb55648b69293e1f774bef02e~D-C527gT_2208622086epsmtip2t;
 Thu, 29 May 2025 11:32:36 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, p.raghav@samsung.com,
 da.gomez@samsung.com
Date: Thu, 29 May 2025 16:44:57 +0530
Message-Id: <20250529111504.89912-7-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529111504.89912-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJIsWRmVeSWpSXmKPExsWy7bCSvO4NV4sMg4bjxhbb1u1mt5izfg2b
 xYV1qxktWnf+Z7FomvCX2WL13X42i9eHPzFanJ56lsliyyV7i/eXtzFZrL65htFiy7F7jBaX
 n/BZ7J7+j9Xi5oGdTBYrVx9lspg9vZnJ4sn6WcwWW798ZbW4tMjdYs/ekywW99b8Z7W4cOA0
 q8WNCU8ZLZ7t3shs8XlpC7vFwVMd7Baf5gINOf/3OKvF7x9z2BzkPE4tkvDYOesuu8fmFVoe
 l8+Wemxa1cnmsenTJHaPEzN+s3i82DyT0WP3gs9MHrtvNrB5nLtY4fF+31U2j74tqxg9ps6u
 9ziz4Ai7x4ppF5kChKK4bFJSczLLUov07RK4Mrb0nWMt+M9b8b6tg6mB8Rl3FyMnh4SAicSC
 KeeZuxi5OIQEdjNK3Ov5ywKRkJHYfXcnK4QtLLHy33N2iKKPjBJrX10E6uDgYBPQlfjRFAoS
 FxG4ySxx7uwZsAZmgX+MErtf6YDYwgLJEv0f3rCD2CwCqhKTd91nAunlFbCV+NwVADFfXmLm
 pe9gJZwCdhKLlnxlBLGFgEqW3lwLdg+vgKDEyZlPWCDGy0s0b53NPIFRYBaS1CwkqQWMTKsY
 JVMLinPTc4sNCwzzUsv1ihNzi0vz0vWS83M3MYJTg5bmDsbtqz7oHWJk4mA8xCjBwawkwttk
 b5YhxJuSWFmVWpQfX1Sak1p8iFGag0VJnFf8RW+KkEB6YklqdmpqQWoRTJaJg1OqgelYwAlV
 ptQDmneKbn13DF4kmn9x6a2DRhMjp04smNV0LzDrpmojZ6NcyuzgnKKXdYIXxeXtslz7tXq6
 tlx1dH+4vKw2svE9x92TLc2WJ6UuMjXJbt8gLJLS6zXH1qlvjXTHnBtvRC6vjFWIsUr1+B3J
 pDGt5ZuuiNss2VQjR/6X3XcPLWWQkyqsDnjGfOzTpGO5wSHGvgfXPK8xlfp99Pshm4LSE8u3
 CZs7sH5PZ9A9fPDXZddJ0pOLc7YtPjM1JOCulenDmbmdH3j2Sa7SUs3+rN48depC/jn3vx4N
 rbsl8W/Ko3+C57eyWC4Xfl4/2eu71+aw88tEZdLbc3rCXt14wH4t3W2r7QkLpX0VNUosxRmJ
 hlrMRcWJAMl6RFl8AwAA
X-CMS-MailID: 20250529113240epcas5p295dcf9a016cc28e5c3e88d698808f645
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529113240epcas5p295dcf9a016cc28e5c3e88d698808f645
References: <20250529111504.89912-1-kundan.kumar@samsung.com>
 <CGME20250529113240epcas5p295dcf9a016cc28e5c3e88d698808f645@epcas5p2.samsung.com>
X-Headers-End: 1uKblH-0000tM-HF
Subject: [f2fs-dev] [PATCH 06/13] writeback: invoke all writeback contexts
 for flusher and dirtytime writeback
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

Modify flusher and dirtytime logic to iterate through all the writeback
contexts.

Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 fs/fs-writeback.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 72b73c3353fe..9b0940a6fe78 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -2389,12 +2389,14 @@ static void __wakeup_flusher_threads_bdi(struct backing_dev_info *bdi,
 					 enum wb_reason reason)
 {
 	struct bdi_writeback *wb;
+	struct bdi_writeback_ctx *bdi_wb_ctx;
 
 	if (!bdi_has_dirty_io(bdi))
 		return;
 
-	list_for_each_entry_rcu(wb, &bdi->wb_ctx_arr[0]->wb_list, bdi_node)
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
 
-		list_for_each_entry_rcu(wb, &bdi->wb_ctx_arr[0]->wb_list,
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
