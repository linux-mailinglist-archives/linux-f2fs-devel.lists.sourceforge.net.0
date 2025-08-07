Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A06DB1D163
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Aug 2025 06:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQ1q6XwjTYVz64KzMUjdfGFgQ/sYTwTt3SrK6UAwjio=; b=ETKDCMR/Q79+gCKEBo9IbsemLm
	sXUcSBhZLIvCsuv17tdtxUrWMdPcFHdfNZD6u5SyMw8DtcPEzOTX/Fsb6LY98B9wUq3bX+zXr8ie+
	ccbg6bCOXOdJczsnaTXPAeI42lC8fygNU5+dNBelLr9rxGdnwObNds8sjOl1oiNiUeJE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujro8-0003pd-BW;
	Thu, 07 Aug 2025 04:00:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ujro6-0003pX-VQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 04:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=slq3DOm5PtxmEC3X2b2/W0m92N1A6GE10qB5ER276nY=; b=mkrrBwsb/7aRUadAVbnto5Hdxq
 7nttG/otSFeitVo56qVpFnX5H3bBSMVTCd5w2zO9dzfFEn6ubRbPySXmSlj/bbHiKrj2BK5hHPEBa
 hInao+/BWwF8xNoAhtLAQd0S5GRYlLmJ1GgleS9QXy33Nso7VFGBR2reWSrmiosC62s4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=slq3DOm5PtxmEC3X2b2/W0m92N1A6GE10qB5ER276nY=; b=CMDFmJx+U0tkv/9S31iXYFBWpp
 Kr3Z02GEIc3Q3Xhx+QseqI0b27QpZxciBARRefuURVqxbFPmSBPA/fq2l9UzUhaWHf5GJjSd/36hO
 eSpNWXxD0hLidbDot9gYMXVDv/9+GYdc9m4NFcNDM1qSM29NCse5VX+thRIqHzI01DTY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujro6-0000hF-HW for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 04:00:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E4362613F0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  7 Aug 2025 04:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77EDBC4CEF1;
 Thu,  7 Aug 2025 04:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754539240;
 bh=J69EE3KRuZ7GD4kBtdS/XSaP++KQecRr00/rp4QbhdM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JhKxs/ogHsMXCaLwxwq/fKwMRCI2jUa1C4T8hygj9/mrX0FCC3KElpXajM2cbgNgh
 H3hN+BFqHa/+IzddU93Yq1PH8TI4ZnEETIbBu0eIngoIH3SYaDWZTAalcrReiSL8PF
 XO54RD1aT2XzoCLOJ/Fo6G9AwPieTSgEyRBe48YToyh2bFutbmM3bmWfjCc+zPCmRg
 704ilncmRUOwhOOqdKQrilJbBqzzloltqvRKTFRZunrOvIjt9mv6neqDk3/LwAXoBX
 x9VIgT+T1GombC+pI4x9fC0bU1iO6MlHOYMyTYIubE7l4dBBqYpWSxZohrrZbR3ovQ
 sZdZBYCtkQVow==
To: jaegeuk@kernel.org
Date: Thu,  7 Aug 2025 12:00:26 +0800
Message-ID: <20250807040026.3834543-2-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250807040026.3834543-1-chao@kernel.org>
References: <20250807040026.3834543-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Changes as below: - print more logs for f2fs_{enable,
 disable}_checkpoint()
 - account and dump time stats for f2fs_enable_checkpoint() Signed-off-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/super.c | 16 ++++++++++++++++ 1 file
 changed, 16 insertions(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ujro6-0000hF-HW
Subject: [f2fs-dev] [PATCH 2/2] f2fs: dump more information for f2fs_{enable,
 disable}_checkpoint()
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

Changes as below:
- print more logs for f2fs_{enable,disable}_checkpoint()
- account and dump time stats for f2fs_enable_checkpoint()

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 411265c75698..67788177c75b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2618,15 +2618,24 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 restore_flag:
 	sbi->gc_mode = gc_mode;
 	sbi->sb->s_flags = s_flags;	/* Restore SB_RDONLY status */
+	f2fs_info(sbi, "f2fs_disable_checkpoint() finish, err:%d", err);
 	return err;
 }
 
 static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 {
 	unsigned int nr_pages = get_pages(sbi, F2FS_DIRTY_DATA) / 16;
+	long long start, writeback, end;
+
+	f2fs_info(sbi, "f2fs_enable_checkpoint() starts, meta: %lld, node: %lld, data: %lld",
+					get_pages(sbi, F2FS_DIRTY_META),
+					get_pages(sbi, F2FS_DIRTY_NODES),
+					get_pages(sbi, F2FS_DIRTY_DATA));
 
 	f2fs_update_time(sbi, ENABLE_TIME);
 
+	start = ktime_get();
+
 	/* we should flush all the data to keep data consistency */
 	while (get_pages(sbi, F2FS_DIRTY_DATA)) {
 		writeback_inodes_sb_nr(sbi->sb, nr_pages, WB_REASON_SYNC);
@@ -2635,6 +2644,7 @@ static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 		if (f2fs_time_over(sbi, ENABLE_TIME))
 			break;
 	}
+	writeback = ktime_get();
 
 	sync_inodes_sb(sbi->sb);
 
@@ -2653,6 +2663,12 @@ static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 
 	/* Let's ensure there's no pending checkpoint anymore */
 	f2fs_flush_ckpt_thread(sbi);
+
+	end = ktime_get();
+
+	f2fs_info(sbi, "f2fs_enable_checkpoint() finishes, writeback:%llu, sync:%llu",
+					ktime_ms_delta(writeback, start),
+					ktime_ms_delta(end, writeback));
 }
 
 static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
