Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 314AEACDCC8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jun 2025 13:38:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o+IfHPN6xN6CzQ9iGaLNGCbXasTxef8Ywq0kIXoTUfI=; b=G7af/DDdrifxfqgOFGhvObI+hq
	xnXCw4ukrxtuFUj3FdFvEY7vp1IEPt/JIqsgvokk3KL/V4tjQT5LlYhGLKwmZ6QQFLj+WOW6l0yfc
	ttOGjTw45f0tck2Yi5/SJ1mWv1cbq4+AjWBNqz9xLZ2FUVXQKldARncAtgc/BqFvNg0A=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMmS2-0004S8-Ht;
	Wed, 04 Jun 2025 11:38:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1uMmRz-0004Rw-1w
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jun 2025 11:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Me7EmrPXymdI7oJTShCJRrxQbIpMesRl5+YAGPehCLk=; b=moFZbsaZfSUWyzl3M0EnzXROUI
 Tey3yKAWyKEZ9JhtbdpiVt6YVe8caA/xusq6N5EkWIHQSei+Yw7E1w2gUGa7dvmrDvrTfmHCPNiee
 2U+gh74GS8B6i8I+gFVeJTO6fjsOCaXxBsvHG8CC/oBSF63Tr1HCiUvRV/vTHsVt2rUQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Me7EmrPXymdI7oJTShCJRrxQbIpMesRl5+YAGPehCLk=; b=E
 8KtgVr0LQggZolir0+Lh8Y82wxLzR8CWXYcSq2Mww/TmT7JKGtdrYfrYOLjM8MALXd+pTiVHkVhDT
 Yl9uBebIyV8eqr5gWT9N2YAKK4jWMMybG0D784fyVEzvO+Yn4j6YJRbUFlUyVHxUd4bqLabPvDg6Q
 7Ik3pWT1DTKgmFOs=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uMmRx-0007U5-PQ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jun 2025 11:38:30 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 554BbvWC063964;
 Wed, 4 Jun 2025 19:37:57 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4bC59374gHz2NZDyW;
 Wed,  4 Jun 2025 19:35:03 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Wed, 4 Jun 2025 19:37:55 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 4 Jun 2025 19:37:39 +0800
Message-ID: <1749037059-4243-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 554BbvWC063964
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The decompress_io_ctx may be released asynchronously after
 I/O completion. If this file is deleted immediately after read, and the kworker
 of processing post_read_wq has not been executed yet due to h [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1uMmRx-0007U5-PQ
Subject: [f2fs-dev] [PATCH v2] f2fs: compress: fix UAF of f2fs_inode_info in
 f2fs_free_dic
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
From: Zhiguo Niu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zhiguo Niu <zhiguo.niu@unisoc.com>
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 baocong.liu@unisoc.com, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The decompress_io_ctx may be released asynchronously after
I/O completion. If this file is deleted immediately after read,
and the kworker of processing post_read_wq has not been executed yet
due to high workloads, It is possible that the inode(f2fs_inode_info)
is evicted and freed before it is used f2fs_free_dic.

    The UAF case as below:
    Thread A                                      Thread B
    - f2fs_decompress_end_io
     - f2fs_put_dic
      - queue_work
        add free_dic work to post_read_wq
                                                   - do_unlink
                                                    - iput
                                                     - evict
                                                      - call_rcu
    This file is deleted after read.

    Thread C                                 kworker to process post_read_wq
    - rcu_do_batch
     - f2fs_free_inode
      - kmem_cache_free
     inode is freed by rcu
                                             - process_scheduled_works
                                              - f2fs_late_free_dic
                                               - f2fs_free_dic
                                                - f2fs_release_decomp_mem
                                      read (dic->inode)->i_compress_algorithm

This patch use __iget before f2fs_free_dic and iput after free the dic.

Cc: Daeho Jeong <daehojeong@google.com>
Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in softirq")
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
---
v2: use __iget/iput function
---
 fs/f2fs/compress.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index b3c1df9..3f0c18d 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1687,7 +1687,7 @@ static void f2fs_release_decomp_mem(struct decompress_io_ctx *dic,
 }
 
 static void f2fs_free_dic(struct decompress_io_ctx *dic,
-		bool bypass_destroy_callback);
+		bool bypass_destroy_callback, bool late_free);
 
 struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 {
@@ -1743,12 +1743,12 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 	return dic;
 
 out_free:
-	f2fs_free_dic(dic, true);
+	f2fs_free_dic(dic, true, false);
 	return ERR_PTR(ret);
 }
 
 static void f2fs_free_dic(struct decompress_io_ctx *dic,
-		bool bypass_destroy_callback)
+		bool bypass_destroy_callback, bool late_free)
 {
 	int i;
 
@@ -1775,6 +1775,8 @@ static void f2fs_free_dic(struct decompress_io_ctx *dic,
 	}
 
 	page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
+	if (late_free)
+		iput(dic->inode);
 	kmem_cache_free(dic_entry_slab, dic);
 }
 
@@ -1783,16 +1785,20 @@ static void f2fs_late_free_dic(struct work_struct *work)
 	struct decompress_io_ctx *dic =
 		container_of(work, struct decompress_io_ctx, free_work);
 
-	f2fs_free_dic(dic, false);
+	f2fs_free_dic(dic, false, true);
 }
 
 static void f2fs_put_dic(struct decompress_io_ctx *dic, bool in_task)
 {
 	if (refcount_dec_and_test(&dic->refcnt)) {
 		if (in_task) {
-			f2fs_free_dic(dic, false);
+			f2fs_free_dic(dic, false, false);
 		} else {
 			INIT_WORK(&dic->free_work, f2fs_late_free_dic);
+			/* to avoid inode is evicted simultaneously */
+			spin_lock(&dic->inode->i_lock);
+			__iget(dic->inode);
+			spin_unlock(&dic->inode->i_lock);
 			queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
 					&dic->free_work);
 		}
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
