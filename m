Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3556DC298
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Apr 2023 04:17:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1plh6C-0004bd-Bl;
	Mon, 10 Apr 2023 02:17:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1plh6B-0004bX-4l
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 02:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oUviqHkcpQi/ZfA+LM31fYWwRmcp38AzNRJSF/iSKE8=; b=Vk2ChoWlcRbrqla5zIE68bFSBE
 kHGKaA6q5j+8n+Uenc4lmBjGRqbrlm2HR3uoM+WDWp6Zh8uF4z6Uk7jbHbZ6VFyScop72RquBiudr
 c9DlsF5VFex1Hmxr7S8N4e8XcwFzIIb2T10UUNwYsOZjvXhKSGbVrh27el92Pzfgc/xo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oUviqHkcpQi/ZfA+LM31fYWwRmcp38AzNRJSF/iSKE8=; b=i
 G9lQgzcV2mkz2N4ggrpLMAIx4tuLcoSt8NobUrdNNYKswgQQUTNDYRCQUK4cG69Qhx8iUOU31nArz
 H5opVNh3c7fEkEoghn553R+tWUBrXRh3Xs2iO/CppUCWsrxjgk9nakJk6LW1lyQzOGPUdoit/ISr4
 uw4SsarmvPhr9FYo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1plh69-0007JX-Og for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 02:17:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5820E60DBD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Apr 2023 02:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7766FC433D2;
 Mon, 10 Apr 2023 02:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681093051;
 bh=2J1XkKkeUOGnc00wXCTQ8yh9LSvEk8H4eWZ0v0WIO38=;
 h=From:To:Cc:Subject:Date:From;
 b=dKxDLmruzF7p7rYASeEOYAJwkp57NyvrSDGvFIbVS96HynpR01trGk/mQprdLO8k9
 svZZkUxxOswf31hYNWaRfmnlFmBBznNjPQwmHWBFT2IE31JaJFV8fcgyW1SWSxUklo
 qzXGfvN+j7aM2NdeCgEUfl2RVFsUgYTg+6+i8Mx9gB2wI4jfYAdzwL1c6eDtXgIVfv
 alAYi8NZ69FIJAQB2oiWx/2vtRhz+nU2bXOQ1JNz4x7DUWSftMgmFkSHC1uXcoD1HX
 FnN6gpOZk4qZDlVqCM95wAry7uQGQ+pV6z64jqgY6m3aDhULmO9/xPos2vMkpNkVwa
 jBxUO6RguklCg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 10 Apr 2023 10:17:22 +0800
Message-Id: <20230410021722.1836433-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs has supported multi-device feature, to check devices'
 rw status, it should use f2fs_hw_is_readonly() rather than bdev_read_only(),
 fix it. Meanwhile, it removes f2fs_hw_is_readonly() check condition in: -
 f2fs_write_checkpoint() - f2fs_convert_inline_inode() As it has checked
 f2fs_readonly()
 condition, and if f2fs' devices were readonly, [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1plh69-0007JX-Og
Subject: [f2fs-dev] [PATCH] f2fs: use f2fs_hw_is_readonly() instead of
 bdev_read_only()
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

f2fs has supported multi-device feature, to check devices' rw status,
it should use f2fs_hw_is_readonly() rather than bdev_read_only(), fix
it.

Meanwhile, it removes f2fs_hw_is_readonly() check condition in:
- f2fs_write_checkpoint()
- f2fs_convert_inline_inode()
As it has checked f2fs_readonly() condition, and if f2fs' devices
were readonly, f2fs_readonly() must be true.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c | 2 +-
 fs/f2fs/super.c      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 007fd965dd7e..478ee8aeac33 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -721,7 +721,7 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
 	if (!is_set_ckpt_flags(sbi, CP_ORPHAN_PRESENT_FLAG))
 		return 0;
 
-	if (bdev_read_only(sbi->sb->s_bdev)) {
+	if (f2fs_hw_is_readonly(sbi)) {
 		f2fs_info(sbi, "write access unavailable, skipping orphan cleanup");
 		return 0;
 	}
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1573bf123197..a1b570a5e50f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3358,7 +3358,7 @@ static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
 		raw_super->segment_count = cpu_to_le32((main_end_blkaddr -
 				segment0_blkaddr) >> log_blocks_per_seg);
 
-		if (f2fs_readonly(sb) || bdev_read_only(sb->s_bdev)) {
+		if (f2fs_readonly(sb) || f2fs_hw_is_readonly(sbi)) {
 			set_sbi_flag(sbi, SBI_NEED_SB_WRITE);
 			res = "internally";
 		} else {
@@ -3934,7 +3934,7 @@ int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
 	int err;
 
 	if ((recover && f2fs_readonly(sbi->sb)) ||
-				bdev_read_only(sbi->sb->s_bdev)) {
+				f2fs_hw_is_readonly(sbi)) {
 		set_sbi_flag(sbi, SBI_NEED_SB_WRITE);
 		return -EROFS;
 	}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
