Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C139A9E09F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 27 Apr 2025 09:54:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u8wpy-0002Ny-K5;
	Sun, 27 Apr 2025 07:54:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u8wpw-0002Np-A7
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Apr 2025 07:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M5FKYaPoDcHEJCmykp3aaxiLtuDo/OOYUSd7dZvBTn8=; b=ahaQiQT7Hv0E3uD/F2R3rKLYjv
 97hcndABueh56T7RMyx+Q7Uj4+/6HH7ngJHN8ewT/3KlYs/hY7k/r7nMV9qrrIATR++f28rHu7gBt
 UkJ/UpkVCEBIFcSFtDWpqZAZWCpnWeDd6B6PrYCF9gMa7vq1QcQaAKY8dfOEiLe6dBew=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=M5FKYaPoDcHEJCmykp3aaxiLtuDo/OOYUSd7dZvBTn8=; b=H
 lf6oALUB+DKZFQ0MyXzb7ylpoTY6Vub1qSAo4C64ayWjvcz9kslvvBKTHUr+1yLigKc/31EVjYIYp
 AbLxPxfLVZZ88DZ6U10YaY5SAug6tWRIzPanM1YxyIOpbloegwguCGWrJ7xdHs06jO8PtMxUsmDb4
 NmTOouByqkAzHcHY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u8wpf-0005EV-Tz for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Apr 2025 07:54:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A92E061157;
 Sun, 27 Apr 2025 07:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60ECDC4CEE3;
 Sun, 27 Apr 2025 07:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745740416;
 bh=J1ukenglBpCBHf0HOTwSg64pwe2qYeP1dRnQdhdMkfA=;
 h=From:To:Cc:Subject:Date:From;
 b=kU9DM4d7Y+27lhOY6XjGGg5wypeCE3KYTeF0lOdfQmFTwaiyIJnY2RR0sViWSX5rr
 cx7F16XPBUUVvw0y3bj0iff8d6FwUTydpq2NzS2WbzGZBOkzbJu9dlskJTaJss4j68
 9KBZdX0KhFAHh0J2ywUDKmUT03ryRunqaMgio3yqceVC5ued/xsmtBL8O4+Zj2NU1t
 P02JC3EfPT4PkjaObgfmI4n+qGxBOHrpZGAKAiQ6bshqEhshn7ih5PVVL/HHu5jLNg
 QPR6B0PnCVN/QFcR+eftFDXISaBVwTG8f5CMLOR+T0l45jyA7Gg1aEfUq9PHejo8VN
 oaxQ9feyDIjeA==
To: jaegeuk@kernel.org
Date: Sun, 27 Apr 2025 15:53:29 +0800
Message-ID: <20250427075329.1749269-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In order to avoid failing to tune linear_lookup if auto or
 preen mode is on. Cc: Daniel Lee <chullee@google.com> Signed-off-by: Chao
 Yu <chao@kernel.org> --- v3: - do not update linear_lookup config if Casefold
 feature is off - adjust logs fsck/fsck.c | 30 ++++++++++++++++++++ [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u8wpf-0005EV-Tz
Subject: [f2fs-dev] [PATCH v3] fsck.f2fs: tune linear_lookup in
 f2fs_do_mount()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In order to avoid failing to tune linear_lookup if auto or
preen mode is on.

Cc: Daniel Lee <chullee@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- do not update linear_lookup config if Casefold feature is off
- adjust logs
 fsck/fsck.c  | 30 ++++++++++++++++++++----------
 fsck/main.c  |  2 --
 fsck/mount.c |  2 ++
 3 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 2cff33f..f863d01 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2369,26 +2369,36 @@ void fsck_update_sb_flags(struct f2fs_sb_info *sbi)
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	u16 flags = get_sb(s_encoding_flags);
 
+	if (c.nolinear_lookup == LINEAR_LOOKUP_DEFAULT) {
+		INFO_MSG("Casefold: linear_lookup [%s]",
+			get_sb(s_encoding_flags) & F2FS_ENC_NO_COMPAT_FALLBACK_FL ?
+			"disable" : "enable");
+		return;
+	}
+
+	INFO_MSG("linear_lookup option: %s",
+			c.nolinear_lookup == LINEAR_LOOKUP_DISABLE ?
+			"disable" : "enable");
+
+	if (!(get_sb(feature) & F2FS_FEATURE_CASEFOLD)) {
+		INFO_MSG("Not support Casefold feature");
+		return;
+	}
+
 	if (c.nolinear_lookup == LINEAR_LOOKUP_DISABLE) {
 		if (!(flags & F2FS_ENC_NO_COMPAT_FALLBACK_FL)) {
 			flags |= F2FS_ENC_NO_COMPAT_FALLBACK_FL;
 			set_sb(s_encoding_flags, flags);
-			c.fix_on = 1;
-			c.invalid_sb |= SB_ENCODE_FLAG;
-			INFO_MSG("Casefold: disable linear lookup\n");
+			INFO_MSG("Casefold: disable linear lookup");
+			update_superblock(sbi->raw_super, SB_MASK_ALL);
 		}
 	} else if (c.nolinear_lookup == LINEAR_LOOKUP_ENABLE) {
 		if (flags & F2FS_ENC_NO_COMPAT_FALLBACK_FL) {
 			flags &= ~F2FS_ENC_NO_COMPAT_FALLBACK_FL;
 			set_sb(s_encoding_flags, flags);
-			c.fix_on = 1;
-			c.invalid_sb |= SB_ENCODE_FLAG;
-			INFO_MSG("Casefold: enable linear lookup\n");
+			INFO_MSG("Casefold: enable linear lookup");
+			update_superblock(sbi->raw_super, SB_MASK_ALL);
 		}
-	} else {
-		INFO_MSG("Casefold: linear_lookup [%s]\n",
-			get_sb(s_encoding_flags) & F2FS_ENC_NO_COMPAT_FALLBACK_FL ?
-			"disable" : "enable");
 	}
 }
 
diff --git a/fsck/main.c b/fsck/main.c
index cb51673..2d968a8 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -1004,8 +1004,6 @@ static int do_fsck(struct f2fs_sb_info *sbi)
 			F2FS_FT_DIR, TYPE_INODE, &blk_cnt, &cbc, &child);
 	fsck_chk_quota_files(sbi);
 
-	fsck_update_sb_flags(sbi);
-
 	ret = fsck_verify(sbi);
 	fsck_free(sbi);
 
diff --git a/fsck/mount.c b/fsck/mount.c
index 08b2687..a7f16e7 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -4117,6 +4117,8 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
 			update_superblock(sbi->raw_super, SB_MASK_ALL);
 		}
 #else
+		fsck_update_sb_flags(sbi);
+
 		if (!c.no_kernel_check) {
 			u32 prev_time, cur_time, time_diff;
 			__le32 *ver_ts_ptr = (__le32 *)(sbi->raw_super->version
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
