Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 675FC46995F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Dec 2021 15:44:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1muFEZ-0007i4-Kq; Mon, 06 Dec 2021 14:44:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1muFEY-0007ht-4o
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Dec 2021 14:44:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tik9/IqbGCAAxqUoPwWGtD5oSIRZbk2+n1YQ0SYYp4s=; b=DKSKN9Y/9nIcf7WDSrL+yqrZFY
 QfAtXLI85xKWf3ECBC42L5J4LXZM+2GfRRVUJaVUdGk9GPwYFiRQ8Y33ja/Rpw/D5HClbd2Gyaggu
 YfFUJrVjjvKTGWBgMwRASZgNb3Sg/ob8VKSk2DOJ05XFxL/N/XjhbufWx63P64jB/M30=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tik9/IqbGCAAxqUoPwWGtD5oSIRZbk2+n1YQ0SYYp4s=; b=QNX9kY2qLw29kZllDNI/H3pR95
 Z4RmPcowMvr05IxnWxWNiqWZ00sIuxRYQBg1MxkfDoN3XwbKzNL1KxtHpwyVM2eFW0U1hgFJTzpxA
 6FZccYS4vXM9zLJAyeTiflZF1ULyKRw9kUn8txAH/jStr1EjwHEWu25e4JwWnrtHnXqc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1muFEY-0000fP-MG
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Dec 2021 14:44:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 065BB612E7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Dec 2021 14:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F72C341C7;
 Mon,  6 Dec 2021 14:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638801881;
 bh=+wGjoWxtrdJzbDER7vNy2XoGsXgjIrVFYt/HaUrfQKY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hhTdYDSmLMO39Gk9mgAJAdhsGEzVXNyea1u1iSkFyZBCqmVHkbTtU+X3oFKi34UFX
 ueXDyXf7y2ggUAr/pNFLZbJsTk0SyeQA/6IwYfvaD48iCZltyv4lvcOrQoGUyXQZUc
 o4EQoCzIO5hx76W/OTtwIEyR7ZIepDip9Frak1sjL/9nMwzdxnvu2WnvQ8lQIvSa4a
 V+RMr6QNLGlnq33iSPxEcwxWEDZCyauJFPvxVy6oFOERQNQ48Nn8Mg873XACgepRFS
 fBSQaZ/c4BNo+V8OgWOS5vK0O8hazX8gIRhSK/IKsrvsFcee0Tm9HCabM39eXGANxa
 coJpXyYw+mMYw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon,  6 Dec 2021 22:44:20 +0800
Message-Id: <20211206144421.3735-2-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206144421.3735-1-chao@kernel.org>
References: <20211206144421.3735-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As report by Wenqing Liu in bugzilla:
 https://bugzilla.kernel.org/show_bug.cgi?id=215231
 If we enable CONFIG_F2FS_CHECK_FS config, and with fuzzed image attached
 in above link, we will encounter panic when executing below script: 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1muFEY-0000fP-MG
Subject: [f2fs-dev] [PATCH 2/3] f2fs: fix to avoid panic in is_alive() if
 metadata is inconsistent
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

As report by Wenqing Liu in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=215231

If we enable CONFIG_F2FS_CHECK_FS config, and with fuzzed image attached
in above link, we will encounter panic when executing below script:

1. mkdir mnt
2. mount -t f2fs tmp1.img mnt
3. touch tmp

F2FS-fs (loop11): mismatched blkaddr 5765 (source_blkaddr 1) in seg 3
kernel BUG at fs/f2fs/gc.c:1042!
 do_garbage_collect+0x90f/0xa80 [f2fs]
 f2fs_gc+0x294/0x12a0 [f2fs]
 f2fs_balance_fs+0x2c5/0x7d0 [f2fs]
 f2fs_create+0x239/0xd90 [f2fs]
 lookup_open+0x45e/0xa90
 open_last_lookups+0x203/0x670
 path_openat+0xae/0x490
 do_filp_open+0xbc/0x160
 do_sys_openat2+0x2f1/0x500
 do_sys_open+0x5e/0xa0
 __x64_sys_openat+0x28/0x40

Previously, f2fs tries to catch data inconcistency exception in between
SSA and SIT table during GC, however once the exception is caught, it will
call f2fs_bug_on to hang kernel, it's not needed, instead, let's set
SBI_NEED_FSCK flag and skip migrating current block.

Fixes: bbf9f7d90f21 ("f2fs: Fix indefinite loop in f2fs_gc()")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/gc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index e0bdc4361a9b..3e64b234df21 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1039,7 +1039,7 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 			if (!test_and_set_bit(segno, SIT_I(sbi)->invalid_segmap)) {
 				f2fs_err(sbi, "mismatched blkaddr %u (source_blkaddr %u) in seg %u",
 					 blkaddr, source_blkaddr, segno);
-				f2fs_bug_on(sbi, 1);
+				set_sbi_flag(sbi, SBI_NEED_FSCK);
 			}
 		}
 #endif
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
