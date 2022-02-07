Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6632A4ABB11
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Feb 2022 12:35:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nH2J3-0006ut-7l; Mon, 07 Feb 2022 11:35:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nH2J1-0006um-QT
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Feb 2022 11:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VCMVddgfnFjAI3fVs9nnLvPTw5u9lEQwktsD2iP1sMA=; b=Rr+4V/h7th+ZLzsbvQhsfKfs3t
 KdzBNOe6N18Rghprf24TN+s8RJ+w6WVQmohPrU4qU2N+5fYRSARnPRjmteBEG9nLyR1WhLzUJljp0
 UMCi4xxhso8nLmyv03CkFqaic+o632w779F0M3ab+1ZpMbK+KqJM6AO4qMx1WUsdW31U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VCMVddgfnFjAI3fVs9nnLvPTw5u9lEQwktsD2iP1sMA=; b=Z
 DIpr0Uws7g0tUUguNzcytibkA4RaNAVprRw0N7UbCAVu3MhihGD9DobZT9CaSobe+pO9HW5h3TA/r
 l0zQgP5D3Cjbd+p4YDb6LSIRb5BYY6vvGnncE3L43NMxqkmH/17OhRjjo0AV/olc6dgeMeu0ixhAJ
 Qpn2Ok6pgKY2iOC4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nH2Iy-00083U-4W
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Feb 2022 11:35:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B6C7F60B5B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Feb 2022 11:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CDECC340EB;
 Mon,  7 Feb 2022 11:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644233725;
 bh=jZLAyDkcm7SOKN14XylKxKlWQccrek46mpzsx9OCDhs=;
 h=From:To:Cc:Subject:Date:From;
 b=ID1EqxfW2EdGuXZwBb7DswAU119M2mTz7pU57nNmDQNoklNsoAUwY0eyUH2r67RSo
 rUiKD+oOqU5aukGsrw8dWFh5SqKljzyjQxJFMyV+3LIaw3cPt0XUbrXK5EeVVVYaS3
 QEGkz8BI1f1muPXovMlzD5m1TLAQEcopQQrC5uC+y877TLNPMWrKsUgKRGKr78iUfv
 ADfTiV/K38j2uYXOFwYlx4NMP8YxcH9GLlPqIpq2Z0WcRYV1oA8zQJHRueceDfxfmG
 5Bil1PHyNZLF5GoTJuLCF7fHX4SeBKzX6piKcm9AZO8Xn4LTGZJqNr0dEwjQxQ8og5
 diP1cPiCVo0BQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon,  7 Feb 2022 19:35:16 +0800
Message-Id: <20220207113516.9489-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  During checkpoint, we have committed preflush command via
 f2fs_flush_device_cache() to persist all metadata pages except last #2 CP
 pack page, so we don't need to commit another preflush command in co [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nH2Iy-00083U-4W
Subject: [f2fs-dev] [PATCH] f2fs: avoid unneeded preflush during checkpoint()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

During checkpoint, we have committed preflush command via f2fs_flush_device_cache()
to persist all metadata pages except last #2 CP pack page, so we don't need to
commit another preflush command in commit_checkpoint(), remove it to avoid unneeded
write cache overhead.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 8c417864c66a..15ac18bbbc8e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -598,7 +598,7 @@ static void __f2fs_submit_merged_write(struct f2fs_sb_info *sbi,
 		io->fio.op = REQ_OP_WRITE;
 		io->fio.op_flags = REQ_META | REQ_PRIO | REQ_SYNC;
 		if (!test_opt(sbi, NOBARRIER))
-			io->fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
+			io->fio.op_flags |= REQ_FUA;
 	}
 	__submit_merged_bio(io);
 	up_write(&io->io_rwsem);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
