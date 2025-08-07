Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A017B1D162
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Aug 2025 06:00:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lj52Zy2OSLBqmC/w+cqdEr/sea2+VFJFlftK59C8qNo=; b=Qw7/CRxEq3fegT81myvI37V74N
	VUulqTyhHgAexBlkCouPqnKLEpSQ69huTILMYvAArn1y113tzGTqwWf6XRxwG2/91rSc97Ne5w4Af
	N7sXQnP7KxcLrNAbNvTxEeG9gUfo+Jj7nfPyMTvILwihMQs+jIg9rtwBafcZcqW9AVos=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujro6-0007vn-BL;
	Thu, 07 Aug 2025 04:00:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ujro5-0007vf-2s
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 04:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fK/sXj7CmTVJ+5OPJnVt06u5Iz0wRR8sO55voLPWHUE=; b=cY0yq/m6sadnnt6GWYXKlXk3RK
 EGPviRiAqaU6OU4AgYvm2E9FoUbNZyoSqYkjZYYSTnoPshCWINm7TYtlM+iXptLniYWP3rJxip7ve
 NhVqRO09n8veXGsqNTxFIpUno4r+t9mMfVN/XD0hjIGEcRGioQ8e6YTljBjyIBFM0nyM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fK/sXj7CmTVJ+5OPJnVt06u5Iz0wRR8sO55voLPWHUE=; b=F
 9LZcpgcDgzCF9bYBjLC4tg6pOKY9w9x5lJ1melFB3fCegTwy3dPWE+WGgHhXRBYph85CJOJ2mekMq
 WIg6i+FsNRhxylFC3xxV8Yc8BRs/UbYJ9kNl06zHBum0lQSSS7T7w0Mx/Tv1JOSJi7lEdaWBuUnuT
 U77CFFQSa1D6f0oY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujro4-0000h9-N3 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 04:00:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 546025C5C86
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  7 Aug 2025 04:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE722C4CEEB;
 Thu,  7 Aug 2025 04:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754539239;
 bh=kBwCJJlDyKVKUDaMrt/cerX2ZHziG6F/f3hxF2St+1c=;
 h=From:To:Cc:Subject:Date:From;
 b=l40uR5VHvjl0QJ0mcyoepwYCOUS1PQJeuPBmTapo4/kKENrOGFpUO/dR5gQdosvP0
 2apjnAR//pEulEI4yg2FomDR/cNvEzJtBxOlFU9qVd8Jxu9z5taACiAybI6fRc67xn
 IYxtp19mCamrLFsHqDQSCp1avMfyn6QXiGFLYT5VyYvScCCzk8rL96/Y+tg3Kqtw54
 0GemrBh4hayOo5/nrpmw8/OqIRgteztm3c9klfnUeG3ckL+yA3CMAj7Gb6K7GtU8bM
 UhgTptW8yJOOw3t84GMryMgbDDgEPyC9einFH1gn0BxJ5GcVPESYTYVHYk8pUXB5mP
 VBOB931cELULA==
To: jaegeuk@kernel.org
Date: Thu,  7 Aug 2025 12:00:25 +0800
Message-ID: <20250807040026.3834543-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  During f2fs_enable_checkpoint() in remount(), if we flush
 a large amount of dirty pages into slow device, it may take long time which
 will block write IO, let's add a timeout machanism during dirty pa [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ujro4-0000h9-N3
Subject: [f2fs-dev] [PATCH 1/2] f2fs: add timeout in f2fs_enable_checkpoint()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

During f2fs_enable_checkpoint() in remount(), if we flush a large
amount of dirty pages into slow device, it may take long time which
will block write IO, let's add a timeout machanism during dirty
pages flush to avoid long time block in f2fs_enable_checkpoint().

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h  |  2 ++
 fs/f2fs/super.c | 21 +++++++++++++++------
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 464dcbf5c32e..df4466e652cf 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -275,6 +275,7 @@ enum {
 #define DEF_CP_INTERVAL			60	/* 60 secs */
 #define DEF_IDLE_INTERVAL		5	/* 5 secs */
 #define DEF_DISABLE_INTERVAL		5	/* 5 secs */
+#define DEF_ENABLE_INTERVAL		16	/* 16 secs */
 #define DEF_DISABLE_QUICK_INTERVAL	1	/* 1 secs */
 #define DEF_UMOUNT_DISCARD_TIMEOUT	5	/* 5 secs */
 
@@ -1406,6 +1407,7 @@ enum {
 	DISCARD_TIME,
 	GC_TIME,
 	DISABLE_TIME,
+	ENABLE_TIME,
 	UMOUNT_DISCARD_TIMEOUT,
 	MAX_TIME,
 };
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index c1f45df9efec..411265c75698 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2623,16 +2623,24 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 
 static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 {
-	int retry = DEFAULT_RETRY_IO_COUNT;
+	unsigned int nr_pages = get_pages(sbi, F2FS_DIRTY_DATA) / 16;
+
+	f2fs_update_time(sbi, ENABLE_TIME);
 
 	/* we should flush all the data to keep data consistency */
-	do {
-		sync_inodes_sb(sbi->sb);
+	while (get_pages(sbi, F2FS_DIRTY_DATA)) {
+		writeback_inodes_sb_nr(sbi->sb, nr_pages, WB_REASON_SYNC);
 		f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
-	} while (get_pages(sbi, F2FS_DIRTY_DATA) && retry--);
 
-	if (unlikely(retry < 0))
-		f2fs_warn(sbi, "checkpoint=enable has some unwritten data.");
+		if (f2fs_time_over(sbi, ENABLE_TIME))
+			break;
+	}
+
+	sync_inodes_sb(sbi->sb);
+
+	if (unlikely(get_pages(sbi, F2FS_DIRTY_DATA)))
+		f2fs_warn(sbi, "checkpoint=enable has some unwritten data: %lld",
+					get_pages(sbi, F2FS_DIRTY_DATA));
 
 	f2fs_down_write(&sbi->gc_lock);
 	f2fs_dirty_to_prefree(sbi);
@@ -4229,6 +4237,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->interval_time[DISCARD_TIME] = DEF_IDLE_INTERVAL;
 	sbi->interval_time[GC_TIME] = DEF_IDLE_INTERVAL;
 	sbi->interval_time[DISABLE_TIME] = DEF_DISABLE_INTERVAL;
+	sbi->interval_time[ENABLE_TIME] = DEF_ENABLE_INTERVAL;
 	sbi->interval_time[UMOUNT_DISCARD_TIMEOUT] =
 				DEF_UMOUNT_DISCARD_TIMEOUT;
 	clear_sbi_flag(sbi, SBI_NEED_FSCK);
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
