Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C558044EEAD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Nov 2021 22:32:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mleA6-0006Kg-Jk; Fri, 12 Nov 2021 21:32:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1mleA5-0006Ka-I0
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Nov 2021 21:32:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7bYQarVRKy5eL45qiskZyCgtIIcWrGULW7wSUHVggXI=; b=MYwDTLo/DU4cBOkQmJEQVeHjs/
 qtX89w+bkcFinFcGQYA130bU5ve66CPv6uPz/BqiiJaV+vtGRs4tpupXJUcC0J3aqVWg0sZWE52tV
 R1MSAAWhoTLKrtnXriD61XrRx2A7rvtW25uwsiht5n7IA0ZBO0WnDuBE8QNBleRMdcMI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7bYQarVRKy5eL45qiskZyCgtIIcWrGULW7wSUHVggXI=; b=M
 GZJWLRxpzmxFzooDwQeJ349Ub56ZD1pRRAIzpPjOWXP9mJPd1V5D2WLhi2uYVROEyXya+gcHqgKac
 ZWFb6SVkyQQgPBdB7I4Zd9pBirIlR2gfx49gluFSx/4CK48HkrrngRm+r+gpSKM7H/zAjmFeWnCHd
 ddECVsLL3Kv3lQ5U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mleA5-0001N6-11
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Nov 2021 21:32:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8223360EFD;
 Fri, 12 Nov 2021 21:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636752755;
 bh=tT2rrkB4j3yoXxgi1WqPEOPL25m2M20otAFbBpBTVXw=;
 h=From:To:Cc:Subject:Date:From;
 b=shsw6PslE7j1QBmC1LlfrJGPEWV4roKPAYaNLia0TwHytAz9AWd+WF0plDSuMSkXW
 +urym2VQi281NxrO/RyyKhhJtUGACEem45jiJgKDC/Okxzds20oLm04YPSymwUEhAQ
 LfJOIN95FJ4b1Pwh8T0y6R4R4sxj1CzSCXtDc1Pqh2FljlAPk2hTR2/uvwbQknhj7K
 v58zQFvZrIJcPDaCmjn/zR0JVXC+vMp3loUhI+IiqZvwa0xVBsr4ufiGG06oK0goO1
 t/5rkU8AGrE6RQLt6xxmVqWweePDdedV9xVWwJo8DN+wUZiXlXqj1jaCwsPxymcaRN
 GIZ3xgKVLB8+A==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 12 Nov 2021 13:32:31 -0800
Message-Id: <20211112213231.2483419-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.34.0.rc1.387.gb447b232ab-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This case is not a bug,
 so we should fix seamlessly. Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fsck/fsck.c | 10 +++------- 1 file
 changed, 
 3 insertions(+), 7 deletions(-) diff --git a/fsck/fsck.c b/fsck/fsck.c index
 0619519f9b42..ecd87af0ff7f 100644 --- a/fsck/fsck.c +++ b/fsck/fsck.c @@
 -1131,14 +1131,10 @@ skip_blkcnt_fix: 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mleA5-0001N6-11
Subject: [f2fs-dev] [PATCH] fsck.f2fs: do not assert if i_size is missing
 i_blocks in symlink
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

This case is not a bug, so we should fix seamlessly.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/fsck.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 0619519f9b42..ecd87af0ff7f 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1131,14 +1131,10 @@ skip_blkcnt_fix:
 
 	if (ftype == F2FS_FT_SYMLINK && i_size == 0 &&
 			i_blocks == (i_xattr_nid ? 3 : 2)) {
-		ASSERT_MSG("ino: 0x%x i_blocks: %lu with zero i_size\n",
-						nid, (unsigned long)i_blocks);
-		if (c.fix_on) {
-			node_blk->i.i_size = cpu_to_le64(F2FS_BLKSIZE);
-			need_fix = 1;
-			FIX_MSG("Symlink: recover 0x%x with i_size=%lu",
+		node_blk->i.i_size = cpu_to_le64(F2FS_BLKSIZE);
+		need_fix = 1;
+		FIX_MSG("Symlink: recover 0x%x with i_size=%lu",
 					nid, (unsigned long)F2FS_BLKSIZE);
-		}
 	}
 
 	if (ftype == F2FS_FT_ORPHAN && i_links) {
-- 
2.34.0.rc1.387.gb447b232ab-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
