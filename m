Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2245FDDC5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Oct 2022 17:56:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oj0Zo-00039m-33;
	Thu, 13 Oct 2022 15:56:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oj0Zm-00039a-GH
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Oct 2022 15:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CZ2Gdyp0QFb4P6ZB90hP59gfkhsGjsGM8QJk9LFKIB4=; b=mNt2R2Dw1fdXjXg2uTmzIR3M+B
 ww43HUe+RYQt3BNENru/kUmBU8+9+WHKqdiUFHPn6u3umzb6GyX8WXrKRPiTUS9ksWYivLrNc21TZ
 0jU0bfmZsg3xPIuCHEfb86pp8rZQEwJBozgZrrG5jNyY1QIFwRdDcKk0bUgFSpCtcqkQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CZ2Gdyp0QFb4P6ZB90hP59gfkhsGjsGM8QJk9LFKIB4=; b=Z
 yRo/4iFh9f2FjdLw0zntN5jkqKdVZd6LV+Tc22bTCT1l4CxbzfHoe+8pIB+4GwHo5RcfDakoilSYG
 3u2Ot176rK+DQls5lvzm9aQYQcxhjihs0yaDnFPVYREjDuqoZicD3qX3zRnlU1G4sRgoOQVY9K7/j
 T4WDM/LVQpPDnjEc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oj0Zg-002M63-PQ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Oct 2022 15:56:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B710DB81F2F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 13 Oct 2022 15:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F364C433B5;
 Thu, 13 Oct 2022 15:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665676596;
 bh=GWAsMCzrsIUK4JqlUZTcZflB2YUEVAu+pDYdJDx8/Tw=;
 h=From:To:Cc:Subject:Date:From;
 b=nsVW+GFj8U/jt+iF+40/ZOlxP4jVxowrnSiIFCF/n8o+pRVcTJE296rppf5ti3Zbg
 mA+Goa8VSohxc4Cilcu5J1XyQVJE+c5IKLMoFL/7l/HNTUnhJ3zUL6vt3mpKu+kd6Y
 HsoPf3ttdMBM1gmjYllxUaw6fyQIC/F9XL5lp4ZQPwYaEtCtBtNsTjuUlw1vIkmxvu
 9aZLKVwedcAPj7EAUwWaaNavarac6Hx/iQIxqigVsa7hfm2nsF0mCkUis48+HUiltN
 73yAoFt+RZi3beqyArg9bTzeJ1Y1GJAMF/NQttBW5Gkw1GX/HP5K51mEK4icCD1q3r
 uysUaXPS0G4fw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 13 Oct 2022 23:56:28 +0800
Message-Id: <20221013155628.434671-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Otherwise,
 latter f2fs_stop_discard_thread() may access invalid
 dcc->f2fs_issue_discard. Signed-off-by: Chao Yu <chao@kernel.org> ---
 fs/f2fs/segment.c
 | 4 +++- 1 file changed, 3 insertions(+), 1 deletion(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oj0Zg-002M63-PQ
Subject: [f2fs-dev] [PATCH] f2fs: fix to invalidate dcc->f2fs_issue_discard
 in error path
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

Otherwise, latter f2fs_stop_discard_thread() may access invalid
dcc->f2fs_issue_discard.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 460048f3c850..cf5f534aa887 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2026,8 +2026,10 @@ int f2fs_start_discard_thread(struct f2fs_sb_info *sbi)
 
 	dcc->f2fs_issue_discard = kthread_run(issue_discard_thread, sbi,
 				"f2fs_discard-%u:%u", MAJOR(dev), MINOR(dev));
-	if (IS_ERR(dcc->f2fs_issue_discard))
+	if (IS_ERR(dcc->f2fs_issue_discard)) {
 		err = PTR_ERR(dcc->f2fs_issue_discard);
+		dcc->f2fs_issue_discard = NULL;
+	}
 
 	return err;
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
