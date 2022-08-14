Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 049A7592400
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Aug 2022 18:27:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oNGSf-00012U-Nj;
	Sun, 14 Aug 2022 16:27:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1oNGSb-000125-V3
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Aug 2022 16:27:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W4jZhG1xhgo4OcL2uaMwy+cGx+p91T/6DIHoxmljd5M=; b=GU9e9hGA5reRpLrqHuKvdoo5kU
 RmNkq3YjM7sIPhCadxYD5TgNVP8htXcI+i88+5Zt5PDwriLFQjpLWHRWEZyssBAHMnDJxVYlt/FjQ
 oL4kHOvw0kPE6hjrO5hF5qVxoXS5iIa1bnXUCw/CuQA+NXu00i4CQohSHMt1P7QQEmrc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W4jZhG1xhgo4OcL2uaMwy+cGx+p91T/6DIHoxmljd5M=; b=LXI8Ril1pHYW8zSxUKQRMIO3x0
 rX/4jSaRKpltoUr+SZ2wdvStYTFBX4mFv+kwEiP0tMDQJHKAECjw8+6+Kao6HDpqlZIpvPq+MoIAC
 kcOc1TqIPzRYw6iR742ILwMPBdrKfabnbZiXwPe9r6ub9Gu7MpU5tu+fwE9B3XwOg238=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oNGSb-0029Sv-5u for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Aug 2022 16:27:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E294FB80B87;
 Sun, 14 Aug 2022 16:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B76C433D6;
 Sun, 14 Aug 2022 16:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660494445;
 bh=iX9bfe+ORv3IQGMdd+YgIjHQjRAB9HYr5kNWTyjhKAA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C9XNgRJ6ppXj6ywh/fTT7u9/x/Ry6HubDxkEkRfTYV7X9JKXB0Qt03fBke/+w4qNs
 XHSFfakJj6LTENl1Jk2hsOcZRgm/cHOBhdwK4AbHMiFKi1zEnLAgXHmQ7zYqym+uCY
 wn7aTWjmQMFM17N0KFwMu4MTN8+J0+41IQS5ukDiieGeisLDo1qEqFd0PvxsO4BliQ
 6tQd85Y/hpSTC3UElg09XkrOCPlRpgPA3XHtUeQ/BfbOQAsfuiDgOEjwhoxszJ9Mag
 i29PLTnOJgZqLXahKNtT00OjUkBf+BeFjVWf+Jds1Yu5GmE5s20t6gjBPHtqVh9njK
 /6UrHNiIROyYQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sun, 14 Aug 2022 12:26:03 -0400
Message-Id: <20220814162610.2397644-23-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162610.2397644-1-sashal@kernel.org>
References: <20220814162610.2397644-1-sashal@kernel.org>
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
 Content preview: From: Chao Yu <chao.yu@oppo.com> [ Upstream commit
 09beadf289d6e300553e60d6e76f13c0427ecab3
 ] As Wenqing Liu <wenqingliu0120@gmail.com> reported in bugzilla: 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oNGSb-0029Sv-5u
Subject: [f2fs-dev] [PATCH AUTOSEL 5.15 23/28] f2fs: fix to do sanity check
 on segment type in build_sit_entries()
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
Cc: Sasha Levin <sashal@kernel.org>, Wenqing Liu <wenqingliu0120@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao.yu@oppo.com>

[ Upstream commit 09beadf289d6e300553e60d6e76f13c0427ecab3 ]

As Wenqing Liu <wenqingliu0120@gmail.com> reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=216285

RIP: 0010:memcpy_erms+0x6/0x10
 f2fs_update_meta_page+0x84/0x570 [f2fs]
 change_curseg.constprop.0+0x159/0xbd0 [f2fs]
 f2fs_do_replace_block+0x5c7/0x18a0 [f2fs]
 f2fs_replace_block+0xeb/0x180 [f2fs]
 recover_data+0x1abd/0x6f50 [f2fs]
 f2fs_recover_fsync_data+0x12ce/0x3250 [f2fs]
 f2fs_fill_super+0x4459/0x6190 [f2fs]
 mount_bdev+0x2cf/0x3b0
 legacy_get_tree+0xed/0x1d0
 vfs_get_tree+0x81/0x2b0
 path_mount+0x47e/0x19d0
 do_mount+0xce/0xf0
 __x64_sys_mount+0x12c/0x1a0
 do_syscall_64+0x38/0x90
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

The root cause is segment type is invalid, so in f2fs_do_replace_block(),
f2fs accesses f2fs_sm_info::curseg_array with out-of-range segment type,
result in accessing invalid curseg->sum_blk during memcpy in
f2fs_update_meta_page(). Fix this by adding sanity check on segment type
in build_sit_entries().

Reported-by: Wenqing Liu <wenqingliu0120@gmail.com>
Signed-off-by: Chao Yu <chao.yu@oppo.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/segment.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 841a978da083..e98c90bd8ef6 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4537,6 +4537,12 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 				return err;
 			seg_info_from_raw_sit(se, &sit);
 
+			if (se->type >= NR_PERSISTENT_LOG) {
+				f2fs_err(sbi, "Invalid segment type: %u, segno: %u",
+							se->type, start);
+				return -EFSCORRUPTED;
+			}
+
 			sit_valid_blocks[SE_PAGETYPE(se)] += se->valid_blocks;
 
 			if (f2fs_block_unit_discard(sbi)) {
@@ -4585,6 +4591,13 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 			break;
 		seg_info_from_raw_sit(se, &sit);
 
+		if (se->type >= NR_PERSISTENT_LOG) {
+			f2fs_err(sbi, "Invalid segment type: %u, segno: %u",
+							se->type, start);
+			err = -EFSCORRUPTED;
+			break;
+		}
+
 		sit_valid_blocks[SE_PAGETYPE(se)] += se->valid_blocks;
 
 		if (f2fs_block_unit_discard(sbi)) {
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
