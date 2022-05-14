Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDF7526FA7
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 May 2022 10:01:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npmia-0004sP-GO; Sat, 14 May 2022 08:01:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1npmiK-0004rt-5B
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 May 2022 08:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DliLv8kMAj9mSnwl+XrN6hN9RdujkBtrOQa1ZY4KCKM=; b=VJwUN+1lMU3W3t2ggGrE/jZNwj
 om8P5BaomdNAwO76Z3XgeEXN0ZjbOvVQ8HZ2BJO2ILXw7CNvgyedq1csCP99awM/FgcY/pPJjYFYq
 tv2Dqa19wEqlSFxS0IaE6DyS0KKdz+Dh2Lsfk27A6F1LzEzqGzGbRcrWIfOgtR94Fs28=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DliLv8kMAj9mSnwl+XrN6hN9RdujkBtrOQa1ZY4KCKM=; b=M
 6aVl3P7G/gbY4ggTjAMQ/1PmQk+7+9ptkqNKthqsJApC+yD5wTTF6bYC5GTZwYWj73JqcS4rrzY1B
 PcHuOQpv4LY+wk6AILirbj3ztVQGwnkq1OsjBljsLk4Kz2eEXll1CfULCCqfKnWULxIQCEEPaLP+T
 yN6zcQ9GKswrspyM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npmiJ-0003gH-0R
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 May 2022 08:01:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 694B360B41;
 Sat, 14 May 2022 08:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964F8C340EE;
 Sat, 14 May 2022 08:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652515271;
 bh=YhvEOsX3XXWBxDsdjMMPb9LQ+FGAbn6utxGTDet/7z8=;
 h=From:To:Cc:Subject:Date:From;
 b=g4gfvHHzrI/XEI/TVVaDfwKxbP4jxPVifnLbo9ieqQThuEaTZDPhPL02TiRCGR9NI
 51ulFZP3GA0fOAfWLGB64DaiOaJocrSReLT9rkM43X9s+pBq6aomqnX5N2FFtMx+2j
 91coYV9xIrRHU0SOj24ddsw4xsmsoGvctyAIB/eLxwg2xsoTUXuHzv17Ev0GohmVWG
 jbHnOf/pI+l/fQJwRj3XFlTh2bdlV8T9PXubDg8dq/0BrdIoBPW7zVxOG0N6+inViN
 0KcMer1j04QVIYI7sGsH7W+0mkMV+BRT6EUmoa/R1g6tk4iip8MGBRc9ecd3fsBtBH
 YVlxLQqvxHHxw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sat, 14 May 2022 16:01:02 +0800
Message-Id: <20220514080102.2246-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As Yanming reported in bugzilla:
 https://bugzilla.kernel.org/show_bug.cgi?id=215895
 I have encountered a bug in F2FS file system in kernel v5.17. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1npmiJ-0003gH-0R
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to do sanity check for inline inode
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Ming Yan <yanming@tju.edu.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As Yanming reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=215895

I have encountered a bug in F2FS file system in kernel v5.17.

The kernel message is shown below:

kernel BUG at fs/inode.c:611!
Call Trace:
 evict+0x282/0x4e0
 __dentry_kill+0x2b2/0x4d0
 dput+0x2dd/0x720
 do_renameat2+0x596/0x970
 __x64_sys_rename+0x78/0x90
 do_syscall_64+0x3b/0x90

The root cause is: fuzzed inode has both inline_data flag and encrypted
flag, so after it was deleted by rename(), during f2fs_evict_inode(),
it will cause inline data conversion due to flags confilction, then
page cache will be polluted and trigger panic in clear_inode().

This patch tries to fix the issue by do more sanity checks for inline
data inode in sanity_check_inode().

Cc: stable@vger.kernel.org
Reported-by: Ming Yan <yanming@tju.edu.cn>
Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
v2:
- fix to check inode type in f2fs_post_read_required()
 fs/f2fs/f2fs.h  | 8 ++++++++
 fs/f2fs/inode.c | 3 +--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 492af5b96de1..0dc2461ef02c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4126,6 +4126,14 @@ static inline void f2fs_set_encrypted_inode(struct inode *inode)
  */
 static inline bool f2fs_post_read_required(struct inode *inode)
 {
+	/*
+	 * used by sanity_check_inode(), when disk layout fields has not
+	 * been synchronized to inmem fields.
+	 */
+	if (S_ISREG(inode->i_mode) && (file_is_encrypt(inode) ||
+		F2FS_I(inode)->i_flags & F2FS_COMPR_FL ||
+		file_is_verity(inode)))
+		return true;
 	return f2fs_encrypted_file(inode) || fsverity_active(inode) ||
 		f2fs_compressed_file(inode);
 }
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 2fce8fa0dac8..5e494c98e3c2 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -276,8 +276,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		}
 	}
 
-	if (f2fs_has_inline_data(inode) &&
-			(!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))) {
+	if (f2fs_has_inline_data(inode) && !f2fs_may_inline_data(inode)) {
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
 			  __func__, inode->i_ino, inode->i_mode);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
