Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D50A9BC75
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Apr 2025 03:39:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u8823-0001If-1Q;
	Fri, 25 Apr 2025 01:39:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u8821-0001IY-OW
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Apr 2025 01:39:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DoEsmTSoKFpW7cDQMHnismJe15nmbYhcjtZmrvGOm8A=; b=d+kpZG8UocvBCyJyzGejEaI78z
 RqbC0c2FSZaAEt4owYLhLGOiMn+wemkrwoHitMagqobkR4y8bJFEfC1NjdUHlWq2Jn6E6fg7YEPqf
 vBNl0KzlUdF12ijlVHNdMhxttBFctjlOt1gwW/zMQQ095Ck5+spsX8xa0XJX1AAWk+UI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DoEsmTSoKFpW7cDQMHnismJe15nmbYhcjtZmrvGOm8A=; b=Y
 cccQpwZMLMg6Lmn5nn+CnLnXefKzx44DSXyQgf2JzZPj3wsuQoN80M9DvqSa70LLTN2vfVil6YbqD
 sLyeTnTj1M8muz3xTrilUqX4GAg5wxPMdWSzALnw1vDUzKzYddZ1tOob+pD/oC8IGsR65D1Lgxmyh
 ANRtB1dH3DPFM7Zs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u881m-0007EO-0Y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Apr 2025 01:39:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 74A945C5A0B;
 Fri, 25 Apr 2025 01:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FD9C4CEEC;
 Fri, 25 Apr 2025 01:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745545128;
 bh=fk/Q/N5thVyhYaF5xYMToptVfwJMHdFezghoe+/znlo=;
 h=From:To:Cc:Subject:Date:From;
 b=erp7HPILhS/B6kPYAoH8+GvVAHlGlrvuxTKbbivb/48oCVfNqHmDp0lds81fSodzc
 732iZv8d1KipjmIBUBz0XL0rsx5Cg9zhoFjzsT59zsOYeIO4VXYTAyHQyLmG+cK7K7
 2X01yGCEdT9cFVi3BA84zPuH2PBPgaZxkZ/anL89ZuFJ23GKpZXY+VADGjgpVyfZOk
 peaUUxPPc0VUoOY7bvvQ0MHkmHzkzZ3iBp0eKNYKYla4wPyaP56Lt20t0Bn9gAsEml
 vjOdK0o1MOxclrzYGZFJZijn40E7GTnzD1CWtGp7j307ZXzRNVSIOWF0r8Zd+OjflU
 C7npyynxKfBmA==
To: jaegeuk@kernel.org
Date: Fri, 25 Apr 2025 09:38:39 +0800
Message-ID: <20250425013839.1006411-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
MIME-Version: 1.0
X-Spam-Score: -6.0 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In order to avoid failing to tune linear_lookup if auto or
 preen mode is on. Cc: Daniel Lee <chullee@google.com> Signed-off-by: Chao
 Yu <chao@kernel.org> --- fsck/fsck.c | 17 ++++++++--------- fsck/main.c |
 2 -- fsck/mount.c | 2 ++ 3 files changed, 10 insertions(+), 11 deletio [...]
 Content analysis details:   (-6.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u881m-0007EO-0Y
Subject: [f2fs-dev] [PATCH] fsck.f2fs: tune linear_lookup in f2fs_do_mount()
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
 fsck/fsck.c  | 17 ++++++++---------
 fsck/main.c  |  2 --
 fsck/mount.c |  2 ++
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 2cff33f..9575dff 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -9,6 +9,7 @@
  * published by the Free Software Foundation.
  */
 #include "fsck.h"
+#include "f2fs_fs.h"
 #include "xattr.h"
 #include "quotaio.h"
 #include <time.h>
@@ -2369,26 +2370,24 @@ void fsck_update_sb_flags(struct f2fs_sb_info *sbi)
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	u16 flags = get_sb(s_encoding_flags);
 
-	if (c.nolinear_lookup == LINEAR_LOOKUP_DISABLE) {
+	if (c.nolinear_lookup == LINEAR_LOOKUP_DEFAULT) {
+		INFO_MSG("Casefold: linear_lookup [%s]\n",
+			get_sb(s_encoding_flags) & F2FS_ENC_NO_COMPAT_FALLBACK_FL ?
+			"disable" : "enable");
+	} else if (c.nolinear_lookup == LINEAR_LOOKUP_DISABLE) {
 		if (!(flags & F2FS_ENC_NO_COMPAT_FALLBACK_FL)) {
 			flags |= F2FS_ENC_NO_COMPAT_FALLBACK_FL;
 			set_sb(s_encoding_flags, flags);
-			c.fix_on = 1;
-			c.invalid_sb |= SB_ENCODE_FLAG;
 			INFO_MSG("Casefold: disable linear lookup\n");
+			update_superblock(sbi->raw_super, SB_MASK_ALL);
 		}
 	} else if (c.nolinear_lookup == LINEAR_LOOKUP_ENABLE) {
 		if (flags & F2FS_ENC_NO_COMPAT_FALLBACK_FL) {
 			flags &= ~F2FS_ENC_NO_COMPAT_FALLBACK_FL;
 			set_sb(s_encoding_flags, flags);
-			c.fix_on = 1;
-			c.invalid_sb |= SB_ENCODE_FLAG;
 			INFO_MSG("Casefold: enable linear lookup\n");
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
index 08b2687..73d32ec 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -4145,6 +4145,8 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
 			*ver_ts_ptr = cpu_to_le32(cur_time);
 			update_superblock(sbi->raw_super, SB_MASK_ALL);
 		}
+
+		fsck_update_sb_flags(sbi);
 #endif
 	}
 out:
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
