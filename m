Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1236B6F7433
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 May 2023 21:49:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1puex4-0004Lw-U3;
	Thu, 04 May 2023 19:49:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1puex2-0004Lq-Ek
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 19:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tcy/qXWSC1vDfejE9R7apzLDSlpZUEojTPWa8xC2QaE=; b=TzyTZdkxvcgvz76zqzEVRT8IJs
 ajLqyN64NDaOM/LFWcli6W5IRZMFh4bXd3EAI4VmdvDFZlPjkWp+oZsgwvmTfo5Tzwp/KtPMKkRxx
 6xF2VyoBA2DmuFn2X5u4VHsAbQ7bhkmBfbB7AuMnwOhg4RfeLXonjdQIDRc1Gid7Dwio=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tcy/qXWSC1vDfejE9R7apzLDSlpZUEojTPWa8xC2QaE=; b=RgejuwtgW1W+XdWdF9MExXmiZj
 9No6Z5ZOZnLSyxau+A0WdgNobtp1B9UYvn8JyB0jUT80UFcR9bC17aRGYeh331HR+x7gHcLfgc5bb
 ZXar1UMje/1DFeybORiOOKwPp2tSegFtzTqbSaAocOrXldbuQ87sSxnivnF2OrPsvSnY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1puewz-000743-Il for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 19:49:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 35BD1637D0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  4 May 2023 19:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE46C433D2;
 Thu,  4 May 2023 19:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683229747;
 bh=OuXny8h3wWm+E+07cbHnBF2Oyg4Ur3FAH04kdyUDNoQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BrFXzn8zwA5WjzNGrJS95lBn4zzUrnIEMbQTqIV46KkZB+2wSq0zV0FQvL8zzBZTD
 wYL62OHzCtX12L7Ob5S/BFqxtLhcG717bvvraIS52q3A51oxOTvBDNbB73gW3DqGQA
 aw2s1Uvhb8F6eE7WJzePIHpD3wDvGkZnXimAlKysSQ3pVrtc12UdMK+o0c1xFJ1TEJ
 94hVEmrJs8kRmum2GSKPEQexwvgZEDV4exa0qOF1pTBP6FMiip5KKeYuEmbjut8Rcj
 DACDJpMx2ercAEw6o+xpeJn5N4OakLBBVFMr4c81dF2mI7eqNJG9EnDd+OI0FqUXt6
 1/RZ1WUi0dOQg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  4 May 2023 15:48:11 -0400
Message-Id: <20230504194824.3808028-18-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194824.3808028-1-sashal@kernel.org>
References: <20230504194824.3808028-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 d78dfefcde9d311284434560d69c0478c55a657e
 ] With below case, it can mount multi-device image w/ rw option, however
 one of secondary device is set as ro, later update will cause panic, so let's
 introduce f2fs_dev_is_readonly(), and check multi-d [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puewz-000743-Il
Subject: [f2fs-dev] [PATCH AUTOSEL 5.15 18/30] f2fs: fix to check readonly
 condition correctly
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao@kernel.org>

[ Upstream commit d78dfefcde9d311284434560d69c0478c55a657e ]

With below case, it can mount multi-device image w/ rw option, however
one of secondary device is set as ro, later update will cause panic, so
let's introduce f2fs_dev_is_readonly(), and check multi-devices rw status
in f2fs_remount() w/ it in order to avoid such inconsistent mount status.

mkfs.f2fs -c /dev/zram1 /dev/zram0 -f
blockdev --setro /dev/zram1
mount -t f2fs dev/zram0 /mnt/f2fs
mount: /mnt/f2fs: WARNING: source write-protected, mounted read-only.
mount -t f2fs -o remount,rw mnt/f2fs
dd if=/dev/zero  of=/mnt/f2fs/file bs=1M count=8192

kernel BUG at fs/f2fs/inline.c:258!
RIP: 0010:f2fs_write_inline_data+0x23e/0x2d0 [f2fs]
Call Trace:
  f2fs_write_single_data_page+0x26b/0x9f0 [f2fs]
  f2fs_write_cache_pages+0x389/0xa60 [f2fs]
  __f2fs_write_data_pages+0x26b/0x2d0 [f2fs]
  f2fs_write_data_pages+0x2e/0x40 [f2fs]
  do_writepages+0xd3/0x1b0
  __writeback_single_inode+0x5b/0x420
  writeback_sb_inodes+0x236/0x5a0
  __writeback_inodes_wb+0x56/0xf0
  wb_writeback+0x2a3/0x490
  wb_do_writeback+0x2b2/0x330
  wb_workfn+0x6a/0x260
  process_one_work+0x270/0x5e0
  worker_thread+0x52/0x3e0
  kthread+0xf4/0x120
  ret_from_fork+0x29/0x50

Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/f2fs.h  | 5 +++++
 fs/f2fs/super.c | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 80e4f9afe86f7..1b450dcad1980 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4284,6 +4284,11 @@ static inline bool f2fs_hw_is_readonly(struct f2fs_sb_info *sbi)
 	return false;
 }
 
+static inline bool f2fs_dev_is_readonly(struct f2fs_sb_info *sbi)
+{
+	return f2fs_sb_has_readonly(sbi) || f2fs_hw_is_readonly(sbi);
+}
+
 static inline bool f2fs_lfs_mode(struct f2fs_sb_info *sbi)
 {
 	return F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ae72211e422e7..4628efbfea76f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2226,7 +2226,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	if (f2fs_readonly(sb) && (*flags & SB_RDONLY))
 		goto skip;
 
-	if (f2fs_sb_has_readonly(sbi) && !(*flags & SB_RDONLY)) {
+	if (f2fs_dev_is_readonly(sbi) && !(*flags & SB_RDONLY)) {
 		err = -EROFS;
 		goto restore_opts;
 	}
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
