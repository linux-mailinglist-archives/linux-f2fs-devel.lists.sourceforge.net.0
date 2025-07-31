Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EE2B16BD8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Jul 2025 08:04:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZoSOsgkgUTu8C0Qn8vwGIsE1di+bTyr/OmnXjRdR+E0=; b=ilFNAdFeEPg3py5Eg4HLLJFzJI
	lui2jwTlTfdoGcckNA7wN08ggn6aMlZhSXiCZpo5hEbKuQttnWPC2PwI61tB8e4FaX6CDMsEhjht7
	apocNpIXDYuUDwPENd8XJCaikl27M4m3cSNVmf9VYtGvCDCAlmkXr9IKfvBrkTX4pVaI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uhMOR-0002Bd-4N;
	Thu, 31 Jul 2025 06:03:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uhMOP-0002BU-7F
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Jul 2025 06:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pGH8PRPHxXv+rcZL+p/00bQT2q4dI7HNk8ZGgTmMFTQ=; b=g5yRGyYEh+gCJf87m9Nm/G9iyr
 wwCM174oyw1VeeHsUfOUlgF1i8Udiq7TV+QL4KldLVlGPnr8PfEtwbUKiTSbg0ADi663GPMwz57De
 jlI1NdBemTUC0eNQw6ZvbeQabCmvlET750a/rnZDLVHBWta8BQTPJxt5UNfladgxLo38=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pGH8PRPHxXv+rcZL+p/00bQT2q4dI7HNk8ZGgTmMFTQ=; b=Q
 IjW9x7WmPKKgTsHOiVbfEGoIVC0KW3L4mZGfWPL36rhwp7mxaiUytOO8izb7wV3XCF8+Wyg3ZnCKS
 bIJ9P3E9xFy9WHh5YNZyao90M8eFMcNw9YKre7201t7FMMNS6SOyZn2I1Vu1F/qHd0jxrs04kEMxO
 9sNji7YYjxMGegP4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uhMOO-00014O-Rd for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Jul 2025 06:03:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 34E99601F0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 31 Jul 2025 06:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF150C4CEEF;
 Thu, 31 Jul 2025 06:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753941826;
 bh=Va3gFAjQvLD9uc8s9zeI+fE2DCJGgTUkQCU2sAHwohg=;
 h=From:To:Cc:Subject:Date:From;
 b=F9PLlmilllgBhtSfqfRDBCPieGlGB63NGg2QruiWsdJatYYAisl8JOCgn16RAyVbt
 b5bPNrt0L+DOyCoCgOMA+fPhQvrAAOi1xJpfiD5X3f89cpm0Q1+zMpPDPRlAKkRg0h
 Hgbya6Ab9sHN4OVWpELBQpNDdCiOPGTbg5gdSEyGLDGxg3rXQ0G0maLnYFFDL4vcmD
 xsSMDq2tt66NhcvcJy9lShbjNVdqnvm57wA6UAE77FbBd4uoP5BSmJarwgfYvMhRIU
 BPL+J0h/GCvfw2N+yDw3CpN20+0f/uK0ui4tfie697kMaFSaD/VzcSHFxG/UWaw1bc
 OoeDuEaaGhP0g==
To: jaegeuk@kernel.org
Date: Thu, 31 Jul 2025 14:03:38 +0800
Message-ID: <20250731060338.1136086-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If reserve_root mount option is not assigned,
 __allow_reserved_blocks()
 will return false, it's not correct, fix it. Fixes: 7e65be49ed94 ("f2fs:
 add reserved blocks for root user") Signed-off-by: Chao Yu <chao@kernel.org>
 --- fs/f2fs/f2fs.h | 4 +--- 1 file changed, 1 insertion(+), 3 deletions(-)
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
X-Headers-End: 1uhMOO-00014O-Rd
Subject: [f2fs-dev] [PATCH] f2fs: fix condition in __allow_reserved_blocks()
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

If reserve_root mount option is not assigned, __allow_reserved_blocks()
will return false, it's not correct, fix it.

Fixes: 7e65be49ed94 ("f2fs: add reserved blocks for root user")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 691af2a6c159..c40ff0c6796e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2396,8 +2396,6 @@ static inline bool __allow_reserved_blocks(struct f2fs_sb_info *sbi,
 {
 	if (!inode)
 		return true;
-	if (!test_opt(sbi, RESERVE_ROOT))
-		return false;
 	if (IS_NOQUOTA(inode))
 		return true;
 	if (uid_eq(F2FS_OPTION(sbi).s_resuid, current_fsuid()))
@@ -2418,7 +2416,7 @@ static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
 	avail_user_block_count = sbi->user_block_count -
 					sbi->current_reserved_blocks;
 
-	if (!__allow_reserved_blocks(sbi, inode, cap))
+	if (test_opt(sbi, RESERVE_ROOT) && !__allow_reserved_blocks(sbi, inode, cap))
 		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
 
 	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
