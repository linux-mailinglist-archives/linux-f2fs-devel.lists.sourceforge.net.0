Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 714FF8403C9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jan 2024 12:28:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUPoC-0001ok-6U;
	Mon, 29 Jan 2024 11:28:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rUPoA-0001od-M5
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 11:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fh5OzlMbfiE5vdb/EO4Ei2S0zKYcBbzdy+KecbYhNXE=; b=BvmRrBSXDWlsHqf0dGZyGdKtTL
 yy9I7Yev0sbESBbeZbwWLNmBxb2OBvHRU52HlYpAid805mP15VVv0SeDGsiVb26vfjIyOBiY9U04z
 tlDGsFH60G7V257oOO2Shl5uSyNyfHs3a8e0n2OyhiYR66MJ34EJHW8BH8t7TvnpDbXg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Fh5OzlMbfiE5vdb/EO4Ei2S0zKYcBbzdy+KecbYhNXE=; b=O
 /h1OUud2HgOWPa6z9ppufqQOJus7H4g7UGVQ4kcBUTMbxYXrPfFAv1DjLFvtfaQvOHe8bsuvyj7t7
 adfMzXW6RDemivN6fDlbsruI/eNlNENYSm0W/DPpruw3jh0iZoYIlJApPtk2n7CLk8Jm8H6MR0WJQ
 w2xqBRCbzuXIPnB0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUPo6-0001WW-9t for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 11:28:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6E1D7CE1188;
 Mon, 29 Jan 2024 11:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A2CC433C7;
 Mon, 29 Jan 2024 11:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706527672;
 bh=K+SoEOU6xu54KZgacf/5Gi6Jlpq+URdws/owLbfDtyk=;
 h=From:To:Cc:Subject:Date:From;
 b=N8fAALCAOzGymJZPOGyuPKdywZ0KLY/CSMt6p06Q9Bbrmk6oDIyrzEcXpTGJmhuGj
 tED0fFlgYtd4ws09ioEWHM47oJoVKdEcfpZD/LrWzbp/TvPjhkC7ZgAcMhVLr2RVLY
 j28kR4dgZIV6pQbimFWM4cR6mDMHioxsf+p1GLheWLyKUreMLC8z/8wtPhwiJxgvkZ
 ExRyyIxF5zXCh4d21vlAYesFzpRCKrqTruKTIOZPfi1ow7bZMAwsD3K2waD3w9qCA0
 frhZFsB96kX5eFFl6mN0k9i0Ja/+N8NH0VEMmkvn92HqpPcWXALHye47KkfN9AZysD
 HYsl+FD2PsJrQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 29 Jan 2024 19:27:40 +0800
Message-Id: <20240129112740.1908649-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: It needs to check last zone_pending_bio and wait IO
 completion
 before traverse next fio in io->io_list, otherwise, bio in next zone may
 be submitted before all IO completion in current zone. Fixes: e067dc3c6b9c
 ("f2fs: maintain six open zones for zoned devices") Cc: Daeho Jeong
 <daehojeong@google.com>
 Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/data.c | 3 +-- 1 file
 changed, 1 in [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rUPo6-0001WW-9t
Subject: [f2fs-dev] [PATCH] f2fs: zone: fix to wait completion of last bio
 in zone correctly
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It needs to check last zone_pending_bio and wait IO completion before
traverse next fio in io->io_list, otherwise, bio in next zone may be
submitted before all IO completion in current zone.

Fixes: e067dc3c6b9c ("f2fs: maintain six open zones for zoned devices")
Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f45ecb810ae6..8cdbc5ae44db 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1006,7 +1006,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	f2fs_bug_on(sbi, is_read_io(fio->op));
 
 	f2fs_down_write(&io->io_rwsem);
-
+next:
 #ifdef CONFIG_BLK_DEV_ZONED
 	if (f2fs_sb_has_blkzoned(sbi) && btype < META && io->zone_pending_bio) {
 		wait_for_completion_io(&io->zone_wait);
@@ -1016,7 +1016,6 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	}
 #endif
 
-next:
 	if (fio->in_list) {
 		spin_lock(&io->io_lock);
 		if (list_empty(&io->io_list)) {
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
