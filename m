Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C678FE377
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jun 2024 11:53:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sF9nq-0007y4-Vd;
	Thu, 06 Jun 2024 09:53:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sF9np-0007xv-Um
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jun 2024 09:53:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kYLhpAMZR61cty6AvZweA/m3vDLXR4UUWCD1h1qb/EA=; b=iW90LQxiMTCqkpyrXKKpxuzkJR
 3LKEfcIAPNp7wrDcd+PD59FpxwyZCSh2AS3OPMFgdXWTD28rYHmKlQfYvxxaHhdaUM1olHWoXftF+
 dFOIIL7kikoM5AqiqPAGtGlmSPiR5PJykk/1HEl7Foa1gdku5fY7j+U1wxvQf0HtChTo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kYLhpAMZR61cty6AvZweA/m3vDLXR4UUWCD1h1qb/EA=; b=f
 TbCQ3vfUL1n2VBtvErvGCJLpQAKicxgwekruKVi7dfK6+rur2OulS3W1nYEsyw+5JKgei1FZ6RBt9
 phs3yKt+vSrd3Lady+7lG9LEvbMwiLGDTvbrLZP1SeN9IFps5aIIWSSKuriptEKEqKqRG6SKoTDQ1
 I3SGy7quQDBxSVYA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sF9np-0004Qm-GZ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jun 2024 09:53:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 67E5361A94;
 Thu,  6 Jun 2024 09:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCEDEC32782;
 Thu,  6 Jun 2024 09:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717667545;
 bh=vpCESMH7oAFny3mUZ0bjEmQ2oG/eItdcKHHoG8MCYVk=;
 h=From:To:Cc:Subject:Date:From;
 b=l27xivrEPzpxVDgprs68EK4yUasJGbA3yLIIjSfpYXxi4LKXBtuHRk3WlVi8bFqBl
 Fj1gX8Xt0d4KAY+1AYWagZ7etA/10ur6WFFgl6vdJiXexEemB1+im/tVI/QIrgzF3X
 f1G/cARZ64LKcMhxzm8o0LiSm2H2CPd5p5PDCMp1zhJHceulunVb6iNrOpuuS2HQQY
 G9LEs8KrwtxDcnWjuFxQ+OSkUTsv+Dsq2SIuLe8KqVaPL9Askqvx7yP//gUluOuOiV
 uCwEk1RMO0OlCve3ITcXAab+usskbJA5oTG4IDZvoyRUN9AB0KhrafemKm2h9gNFmJ
 ZK7RYlkSTtCsg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu,  6 Jun 2024 17:52:12 +0800
Message-Id: <20240606095213.4087668-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: After commit 261eeb9c1585 ("f2fs: introduce checkpoint_merge
 mount option"), checkpoint can be triggered in background thread, it missed
 to cover f2fs inner checkpoint operation w/ sb_{start,end}_intw [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sF9np-0004Qm-GZ
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix to add missing sb_{start,
 end}_intwrite() for ckpt thread
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

After commit 261eeb9c1585 ("f2fs: introduce checkpoint_merge mount
option"), checkpoint can be triggered in background thread, it missed
to cover f2fs inner checkpoint operation w/ sb_{start,end}_intwrite(),
fix it.

Fixes: 261eeb9c1585 ("f2fs: introduce checkpoint_merge mount option")
Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 55d444bec5c0..66eaad591b60 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1828,8 +1828,11 @@ static int issue_checkpoint_thread(void *data)
 	if (kthread_should_stop())
 		return 0;
 
-	if (!llist_empty(&cprc->issue_list))
+	if (!llist_empty(&cprc->issue_list)) {
+		sb_start_intwrite(sbi->sb);
 		__checkpoint_and_complete_reqs(sbi);
+		sb_end_intwrite(sbi->sb);
+	}
 
 	wait_event_interruptible(*q,
 		kthread_should_stop() || !llist_empty(&cprc->issue_list));
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
