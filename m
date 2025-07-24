Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A264B1029D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Jul 2025 10:02:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXosQO4oOBLjzQzp2FxeAe9Vemtk06HMYWZEPU57khE=; b=h6c3v8orKdcqpiNdN7QlOsAQ2b
	qxQGy5cIz/lAlECHQf1WkfyI+gEmSW5q7GRedEO4C3bnpBVrhVnL2/x/LRcCFCt8H8eyIN3fkgyze
	HyOJcU7lBrEmWdU4Al25Qq5aT91nXOeq1IBbbaK9ev8ewZXDVLJccq6NYOsNh5bhBEjM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uequ6-0007NC-49;
	Thu, 24 Jul 2025 08:02:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uequ3-0007ME-K0
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 08:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JubbSoFt++ykNKTSVVjzkvnDEisaKyudxAfem3UILiE=; b=d6s8Q3Oj1yBosmhpkqpsixL/YH
 BLx8Hu/5Zk7YTocuXmnwpj9nzvBCvZLoH99TJX3rsgl8gn7cOUMh6vTnW6aythtxFrHZHHaeSRYeQ
 qpGWnWA+O6cK5cZFTBxU+t/GMt0yNxsTmasoNIq3o2j/B64K07wk7di87oLcwOaaGuzE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JubbSoFt++ykNKTSVVjzkvnDEisaKyudxAfem3UILiE=; b=LHI0OZrIMIAAGR55WJW3ptn9K5
 8d9dR/B8UIiokFrD6TJrZgB5spHdPF24miaqgc5w9pfMHqxAmVki8ihXwPFHpSe+Km/5eMbs1LRLk
 Op9NLIJfyLdFjLAwnuXjpmsdTjZvPB1TCGzGJm4NcsUwYwQmgrAns0Ycqckc73AMCUR0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uequ3-0007mj-8m for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 08:02:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DC3735C5CF9;
 Thu, 24 Jul 2025 08:02:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE40C4CEED;
 Thu, 24 Jul 2025 08:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753344125;
 bh=iaDPD72sMb6TfeJSJmsKI22EMCqu+G8KRwPlGUikTWI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YkHIZ1eY4lbR3/jhDmJ/9jvU1h4ob1ZYQYPdqR8zf+LWo8yfjJy6S3JrPPDOZo4BU
 T6mrgZOLcTYWMkOb6zxwiVO5qI3tMU1951c185UUGpKMYFTyWyZly1878WAaqDEQ84
 3TzdxaPumCVSxXvIJoL3QwbsfBAGT5kjJzBr3WG0kJxwycKCtATJfDQv/1KGDtH6Jg
 L3dfO2sT8nwkvPYTOHa2xlVjJHifBGuYQ5oLuEOmMo8p4B6Tle2AanEvgeQgQqP9Ox
 y1/pO8YKjoKYKsQ/e5+lQNdaIIPyf1Os0chqre+ICXb4b72Ujht5jLO/qi/Z69A2lJ
 ULsC6bHwcoa5w==
To: jaegeuk@kernel.org
Date: Thu, 24 Jul 2025 16:01:43 +0800
Message-ID: <20250724080144.3689181-2-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250724080144.3689181-1-chao@kernel.org>
References: <20250724080144.3689181-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In lfs mode, dirty data needs OPU,
 we'd better calculate lower_p
 and upper_p w/ them during has_not_enough_free_secs(),
 otherwise we may encounter
 out-of-space issue due to we missed to reclaim enough [...] 
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
X-Headers-End: 1uequ3-0007mj-8m
Subject: [f2fs-dev] [PATCH 2/3] f2fs: fix to calculate dirty data during
 has_not_enough_free_secs()
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In lfs mode, dirty data needs OPU, we'd better calculate lower_p and
upper_p w/ them during has_not_enough_free_secs(), otherwise we may
encounter out-of-space issue due to we missed to reclaim enough
free section w/ foreground gc.

Fixes: 36abef4e796d ("f2fs: introduce mode=lfs mount option")
Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 2123645cf175..5e2ee5c686b1 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -668,8 +668,7 @@ static inline void __get_secs_required(struct f2fs_sb_info *sbi,
 	unsigned int dent_blocks = total_dent_blocks % CAP_BLKS_PER_SEC(sbi);
 	unsigned int data_blocks = 0;
 
-	if (f2fs_lfs_mode(sbi) &&
-		unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
+	if (f2fs_lfs_mode(sbi)) {
 		total_data_blocks = get_pages(sbi, F2FS_DIRTY_DATA);
 		data_secs = total_data_blocks / CAP_BLKS_PER_SEC(sbi);
 		data_blocks = total_data_blocks % CAP_BLKS_PER_SEC(sbi);
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
