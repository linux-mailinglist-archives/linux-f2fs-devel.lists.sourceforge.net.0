Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFDB85CBF9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Feb 2024 00:23:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcZS7-00089n-RW;
	Tue, 20 Feb 2024 23:23:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rcZS4-00089P-AI
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 23:23:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bw6TXE4X6gm7laWa6Ql8TTJbzqDkDWGSGsqct2muGr8=; b=M7SLOSZOnYDAdIICafc3BekbWq
 kghyCHKJzFFzPG4csQ7biKQq7XwsnkObFbJaGM8uuPzqmKlIXk/ecC1lgVvBJPs/UQEkUmdPaUCNR
 CrQ26ty7tYQ4ZtJc/Hgn3dCI/efmyRfCEMXqrWZjjDyQ6TuHt9l6dweFSkWm0YLs6Flc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bw6TXE4X6gm7laWa6Ql8TTJbzqDkDWGSGsqct2muGr8=; b=Ma2Iw0UwxY3KLeK4otlxmNrAEP
 CxC/BGrr9U0ZZ4j53K94byHBFUlLBlfgiLAz0Yx0AyqhUut+3toHwTvisLIHAwSPlR7aVXyfOrB0A
 XnBrS0CcLKw4Q5Zm37SKmWUOdPQquGjST7vLWkefAadmh89Lz6ojNN/tenlqR/5au9WI=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcZS1-0001OK-Ho for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 23:23:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 31108CE1B6D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Feb 2024 23:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E07C43394;
 Tue, 20 Feb 2024 23:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708471370;
 bh=0ms7KVh+AOl9a1lPdIN8NKPVq4XoHxB9aa6kRs4XqG4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PddiNl/YazsPYFCCCjB+VXg4HrEqsF7rDKgVkEQBMXqz3QOyKp7+JcTchUDPadrVJ
 sBPHoSAazM9M5b42J1PYokXzdRadn/GAY+o2pM5zQ2U6t28Ia+EXANZiED5Tc4IRGU
 SqazlN0wiIcQ03GmdNbMLCY8xG6xwH6rsmG07nEbAc6Re2iwFjaEQ3j82NdR3RPucs
 Bu01oyqgONjUN9qpLJa8iTidhvtlHaKNBKxWX1Qu1UufjtIP5qg6nY62bUeVPqsXUD
 LsUea/GcH2yUOs9FoSpsU8+qNp/F3SNhPe2i4GZK8F2UneJzyiVdU6wsL7y5cLIM3Y
 tuavq7QtWfgfQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 20 Feb 2024 15:22:46 -0800
Message-ID: <20240220232247.2856-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
In-Reply-To: <20240220232247.2856-1-jaegeuk@kernel.org>
References: <20240220232247.2856-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Don't get stuck in the f2fs_gc loop while disabling
 checkpoint. Instead,
 we have a time-based management. Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 --- fs/f2fs/super.c | 1 + 1 file changed, 1 insertion(+) 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcZS1-0001OK-Ho
Subject: [f2fs-dev] [PATCH 2/3] f2fs: prevent an f2fs_gc loop during
 disable_checkpoint
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Don't get stuck in the f2fs_gc loop while disabling checkpoint. Instead, we have
a time-based management.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ad80cd38f3a4..9de467a28fd3 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2190,6 +2190,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 			.init_gc_type = FG_GC,
 			.should_migrate_blocks = false,
 			.err_gc_skipped = true,
+			.no_bg_gc = true,
 			.nr_free_secs = 1 };
 
 		f2fs_down_write(&sbi->gc_lock);
-- 
2.44.0.rc0.258.g7320e95886-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
