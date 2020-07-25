Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE0D22D36B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Jul 2020 02:59:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jz8Xb-0004G4-DF; Sat, 25 Jul 2020 00:59:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack.qiu@huawei.com>) id 1jz8XY-0004Fk-Vz
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 Jul 2020 00:59:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g9Ec5QUzFwUamZJ8ez0ZEgXG+AsL02BrT+ng9PF3rHs=; b=GqAepIlYZf01p1jRVUZP26mAJm
 3xGfvuXocnXlW+SACiBiBB88VPLz1rdvdKpoO240Zrz8jvlA3qKeMQWh8FIfp79gV9sqmzsJ+fW8p
 PcyXJbJ4zcRsNhEgdG7bo3ZXfcuJDaTu+baguqs5T6HOdNVaCwf1aD01n6PnXUYUwAzc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=g9Ec5QUzFwUamZJ8ez0ZEgXG+AsL02BrT+ng9PF3rHs=; b=G
 pbPMPbt8yrjVHMIscylG5R4G67tad9MufxG2g0P75jkA7wqyV7s/kXOwcnhhI7QXgiHF3rASxIPZX
 2IuIZxdSUwx/N2eWVZjp5h2r1tz81ZWn7ZjnH9aSBK1RxkHwp7PUelqrlnokS8kiTkgvPS0kGHva3
 CoA/1KyF6BtZJOKk=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jz8XW-00GSvj-Pf
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 Jul 2020 00:59:52 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 159E9F154F4366ED453B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 25 Jul 2020 08:59:35 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Sat, 25 Jul 2020
 08:59:29 +0800
From: Jack Qiu <jack.qiu@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Sat, 25 Jul 2020 09:49:52 +0800
Message-ID: <20200725014952.19036-1-jack.qiu@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jz8XW-00GSvj-Pf
Subject: [f2fs-dev] [PATCH] f2fs: use kfree() to free sbi->gc_thread
 allocated by f2fs_kmalloc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use kfree() instead of kvfree() to free sbi->gc_thread allocated
by f2fs_kmalloc(). Because the memory is allocated with kmalloc
inside f2fs_kmalloc().

Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
---
 fs/f2fs/gc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 5b95d5a146eb..696ceeedc76d 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -147,7 +147,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 			"f2fs_gc-%u:%u", MAJOR(dev), MINOR(dev));
 	if (IS_ERR(gc_th->f2fs_gc_task)) {
 		err = PTR_ERR(gc_th->f2fs_gc_task);
-		kvfree(gc_th);
+		kfree(gc_th);
 		sbi->gc_thread = NULL;
 	}
 out:
@@ -160,7 +160,7 @@ void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi)
 	if (!gc_th)
 		return;
 	kthread_stop(gc_th->f2fs_gc_task);
-	kvfree(gc_th);
+	kfree(gc_th);
 	sbi->gc_thread = NULL;
 }

--
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
