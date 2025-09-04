Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E0BB4452B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Sep 2025 20:16:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d/azuRwklvsNl3QmhlgwemX+D6MkaeMXB6W/RfljXCg=; b=m4QRU1Nn5T01XpWAylqIIp55IB
	9doM6lLA1apnSQ7/+yCjzSS/KKa4ZcxpTI7KKF8rBvjznIHj3H6Q+Og0WbcCXncWaLEAUab9IAqLk
	iKoTfUY7fJTkjyKuu8rW/hrBxPVqxxlMvdBZ9gp0na8tpqHEKo/d3dxMyFjbxPWrmF6M=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uuEVw-0002lK-OC;
	Thu, 04 Sep 2025 18:16:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uuEVu-0002lC-PT
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Sep 2025 18:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AM104adXWVysSIwVTNy8BM4qRpBxhId7/jsIiExpOIM=; b=VKnRf2jyshlTp4FzjtoiDvsD8V
 UhT9Zsir5LHbWKruk46iJ1AgXHoGAav53RP91E57o17XQ3nLNcMjDqV9I+wBxjKUlnAnj8lY+QbfF
 oE5NoIBzbGlATRYG0uVbQZ7dB0FilK02KVB4ICIAikEUizlKFLKla/qzNRvtUk8k8khk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AM104adXWVysSIwVTNy8BM4qRpBxhId7/jsIiExpOIM=; b=k
 HE2kM5S059OlvZFrL0CU2QfjN0mCuScPEc1oiK9L6Qt57c+7GAQEkacUGGKIlQRzLherbQga6xZ/f
 INGx1Lv2MxPnb3EG+rm0hjMTin0BeAlhj604cHbHhtjcS5ysPhBFSlq1OszTwCU7tnkfYNw5zf6n/
 +YAp97MzzyOdyhN8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uuEVu-0006Pi-EC for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Sep 2025 18:16:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BE11B60247
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  4 Sep 2025 18:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64209C4CEF0;
 Thu,  4 Sep 2025 18:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757009804;
 bh=QKt4HUZt3Xzmmkzkk5AcnkXfi7gRQ+D2WMregxN1t+I=;
 h=From:To:Cc:Subject:Date:From;
 b=lvrz0CiIPp64pem1tmSx3BDWIMCftEu3EiJ1VdFvDjVDNFO8LNF1sX5mKQ1iLc9Ea
 cb7ytPVt7DVNFpLSEnA3ifpChNEvE9t/ABGE60diJQAH/X4LeP9/lK2xRe0JE+aTkg
 +UPz1M+kkjcS7b6emWZHDNJ+PZE8c7Nox3xeKrgWCJBbFZSa4Gtu8mw7u5t1ZbLiSw
 qDYs50hPMEH/yBbjbjZXzxLOtF1vRV07TBl689o+hw5pYjFPG6wEgntIcxcSFYA9sY
 vEcjJFmveC8H2vP5ytXdsO9vG7un7P8/nxhOUvH/skQOzvI5457Q+GmAyOr7HRg318
 rXDbSAZv946UA==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  4 Sep 2025 18:16:42 +0000
Message-ID: <20250904181642.3879283-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: FUA writes can be merged to the existing write IOs.
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/data.c | 4 +++- 1 file changed,
 3 insertions(+), 1 deletion(-) diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
 index 7961e0ddfca3..30cb2f230690 100644 --- a/fs/f2fs/data.c +++
 b/fs/f2fs/data.c
 @@ -733,9 +733,11 @@ static bool page_is_mergeable(struct f2fs_sb_info *s
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uuEVu-0006Pi-EC
Subject: [f2fs-dev] [PATCH] f2fs: merge FUA command with the existing writes
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

FUA writes can be merged to the existing write IOs.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 7961e0ddfca3..30cb2f230690 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -733,9 +733,11 @@ static bool page_is_mergeable(struct f2fs_sb_info *sbi, struct bio *bio,
 static bool io_type_is_mergeable(struct f2fs_bio_info *io,
 						struct f2fs_io_info *fio)
 {
+	blk_opf_t mask = ~(REQ_PREFLUSH | REQ_FUA);
+
 	if (io->fio.op != fio->op)
 		return false;
-	return io->fio.op_flags == fio->op_flags;
+	return (io->fio.op_flags & mask) == (fio->op_flags & mask);
 }
 
 static bool io_is_mergeable(struct f2fs_sb_info *sbi, struct bio *bio,
-- 
2.51.0.355.g5224444f11-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
