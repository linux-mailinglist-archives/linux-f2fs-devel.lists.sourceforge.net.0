Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9143B750CD1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jul 2023 17:41:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qJbyD-0005tp-Gq;
	Wed, 12 Jul 2023 15:41:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qJbyC-0005tj-9Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jul 2023 15:41:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=00uQbwkoHRt6iQegbRuZMhN08EeRN1HjETpfi4YcloE=; b=h4mdMTSt3fpljMpGc9IxZw4ok1
 CFrsql9vdLl40JIP5Tf/7LcdmQFlddfTZwkL4n2kprGO9pPX1NUvqMcr8rM+w7NSCESnrC+cURimA
 Ywm0T3GqHoToEVBC+OMrm0L/joTl7SvFVhDElSfihNWcDnsnXL0r31c4fFMmgF6wJNb0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=00uQbwkoHRt6iQegbRuZMhN08EeRN1HjETpfi4YcloE=; b=J
 V4FUsh6ZBXbONRZ/HXJCL1aizFeax1E9aVrNGs+kpUtPHTDHHEdOgxr6zANZHVdT9J499v85n26h2
 hiRe7HPYgW6jiSzFO9aL6wpWPCROEcDnJwRLzja4tScd1Fq7qeaUBSclDpDToypL/8W6Sgjf7JZK9
 bPhIrzNpaxXjjU4k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qJbyD-0000F1-P3 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jul 2023 15:41:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 45F5361828
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Jul 2023 15:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C36C4339A;
 Wed, 12 Jul 2023 15:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689176489;
 bh=Xf1YVlI90CJqAdsOsxQGXcHlvrhCYt8qgAbDG+pjOYs=;
 h=From:To:Cc:Subject:Date:From;
 b=PWF2xIox3SLWy/gq16R1dt1BjG8PC61nFiFuntST9YrDAVpa3uA5GLfHksU/xLqKK
 3UYzR+rQW2Rxw8xzLZHWJnRZ5NVQfc+FxaNkJev+1Eepl8ss0Je1pRlfJJmRS6fYj/
 m5Dtl+Kq+9qqfv/V8FmalHDC8/b8IaaZq1ln2yfi0SaNYG1xBzmz99WmgGVZnExJEk
 eNEyov8Rh00aSXw0ZnQpXlDrCMa5Niwf4HMylgjDDc3AlWinYuDbj91j7XmtQM5cep
 wwOlaKsVjjJkTFR5imVt0Ywgn3QqZd3+OsRxdLXiUSvtpUTjXfXM03S/uj6ZIQKG9Y
 BQTsY0zhg9nhg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 12 Jul 2023 08:41:27 -0700
Message-ID: <20230712154127.1332750-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In indirect or double indirect node blocks, we should use
 parent inode information to check the offset. This fixes the below complaint
 with a reproducer. $ mount -t f2fs -o discard,compress_extension=* /dev/$DEV
 $TESTDIR $ f2fs_io write 1 3944 4 zero buffered $TESTDIR/a $ umount /dev/$DEV
 $ fsck.f2fs /dev/$DEV Info: MKFS version "Linux version 6.5.0-rc [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qJbyD-0000F1-P3
Subject: [f2fs-dev] [PATCH] f2fs: should use inode when updating file offset
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

In indirect or double indirect node blocks, we should use parent inode
information to check the offset.

This fixes the below complaint with a reproducer.

$ mount -t f2fs -o discard,compress_extension=* /dev/$DEV $TESTDIR
$ f2fs_io write 1 3944 4 zero buffered $TESTDIR/a
$ umount /dev/$DEV
$ fsck.f2fs /dev/$DEV
Info: MKFS version
  "Linux version 6.5.0-rc1-custom (root@file) (gcc (Ubuntu 11.2.0-7ubuntu2) 11.2.0, GNU ld (GNU Binutils for Ubuntu) 2.37) #19 SMP PREEMPT_DYNAMIC Mon Jul 10 19:18:40 UTC 2023"
Info: FSCK version
  from "Linux version 6.5.0-rc1-custom (root@file) (gcc (Ubuntu 11.2.0-7ubuntu2) 11.2.0, GNU ld (GNU Binutils for Ubuntu) 2.37) #19 SMP PREEMPT_DYNAMIC Mon Jul 10 19:18:40 UTC 2023"
    to "Linux version 6.5.0-rc1-custom (root@file) (gcc (Ubuntu 11.2.0-7ubuntu2) 11.2.0, GNU ld (GNU Binutils for Ubuntu) 2.37) #19 SMP PREEMPT_DYNAMIC Mon Jul 10 19:18:40 UTC 2023"
Info: superblock features = 3088 :  extra_attr quota casefold compression
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: Segments per section = 1
Info: Sections per zone = 1
Info: total FS sectors = 134217728 (65536 MB)
Info: CKPT version = 284f1e2f
Info: Checked valid nat_bits in checkpoint
Info: checkpoint state = c5 :  nat_bits crc compacted_summary unmount
[ASSERT] (fsck_chk_inode_blk:1189)  --> ino: 0x6 has i_blocks: 00000007, but has 6 blocks

[FSCK] Max image size: 378 MB, Free space: 65158 MB
[FSCK] Unreachable nat entries                        [Ok..] [0x0]
[FSCK] SIT valid block bitmap checking                [Ok..]
[FSCK] Hard link checking for regular file            [Ok..] [0x0]
[FSCK] valid_block_count matching with CP             [Fail] [0xf, 0xe]
[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x6]
[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x6]
[FSCK] valid_inode_count matched with CP              [Ok..] [0x4]
[FSCK] free segment_count matched with CP             [Ok..] [0x7f3f]
[FSCK] next block offset is free                      [Ok..]
[FSCK] fixing SIT types
[FSCK] other corrupted bugs                           [Fail]
Do you want to fix this partition? [Y/N]

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/fsck.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 051510fb06b2..78ffdb651595 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1430,7 +1430,7 @@ int fsck_chk_idnode_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 				FIX_MSG("Set indirect node 0x%x -> 0", i);
 			}
 skip:
-			child->pgofs += ADDRS_PER_BLOCK(&node_blk->i);
+			child->pgofs += ADDRS_PER_BLOCK(inode);
 		}
 	}
 
@@ -1472,8 +1472,7 @@ int fsck_chk_didnode_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 				FIX_MSG("Set double indirect node 0x%x -> 0", i);
 			}
 skip:
-			child->pgofs += ADDRS_PER_BLOCK(&node_blk->i) *
-							NIDS_PER_BLOCK;
+			child->pgofs += ADDRS_PER_BLOCK(inode) * NIDS_PER_BLOCK;
 		}
 	}
 
-- 
2.41.0.255.g8b1d071c50-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
