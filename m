Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E80E7AB53D3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 May 2025 13:26:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VdVB5lHCI7iX4TZQtQ+5ByuXgQer4Oj3kVoQBqs0vyg=; b=BSk7TzRV7p/F+Bq0pRdQuXZNms
	BqjdFXnKs9pYY3fGh1frG/WywEumfsBPcH3ieOZhcnmP7txi1B9dDwjoqtVb40eKGPxjAZFfDGlCX
	RMCTxO4QBKnAuG/ynpWeQ14cgNmxbnZusSVN6zCoJJa06PjFRhQk5c4iid/r1OgkLj9s=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEnlq-0006Mm-9L;
	Tue, 13 May 2025 11:26:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uEnlp-0006MW-9B
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 11:26:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WwsTx0AxE/WGB7+cH0cOEDKZ7KIzxd7m2y2u8UM/6SY=; b=Z7Co//AfBoMuW+dpyZ0vNuKX6b
 AMh8pKcKVpVWy95mID2J+KYgGTcqC3yzKnBcRhYgll3bqmzpeMT5YJskWfzh+i68P7ycsf9ajiQAj
 qW3aPTlep1hWOeOuqkbeztqOauh/3KOd91Dvw5Io4VYj3j9YiSL/QOFtrE9pM7/dLeHU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WwsTx0AxE/WGB7+cH0cOEDKZ7KIzxd7m2y2u8UM/6SY=; b=D
 3CzCPv0eh8KGMdKJxGoeU3mkglM3HDdKKxNgMfW60snN3aMrx6k9FmwVBKG9Go9x8GBpq7itUvxBv
 kYh7P9KkYlFcbs5uT1mU3nSWbQ7YgFjYn9AXxNSIVRsBflurjgShcuS8C/tPgzO3xu6Hv8NgXR/zB
 N7vdrB+Uqa8GiD5A=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEnlo-0002SV-Gf for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 11:26:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CA14E62A15
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 May 2025 11:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B1BC4CEE4;
 Tue, 13 May 2025 11:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747135549;
 bh=0J3AmpgxrgdihS47fcOtQKkWG6kAzIX6hHAOFnABgjs=;
 h=From:To:Cc:Subject:Date:From;
 b=nv7AnWOn3KDpGOErXfMiQXqw3XPiFemukNgTp2oJ6mQW0N00GCsqickpFLsm1tRQC
 kGKxp9w0NOIH7QV3js5sNOkkzZ+YUVr0KNq0kN/Kul3D9O9AICYm/pp/WqkzwGfs5x
 om+cjrv+s1+QdgWTiCeb2/xWoEJIg/dTEPivNKwMMjKnkiITGURGCrjNDIMImtyW3o
 qUIsnCXryaASPU+VNHgTL7PTzwB9v343TXM7BWhDbTUStZogqGfWId8tr7XzrFpBCj
 CrjJPDqVh15FlPjX9ekDDthbibf/sjkkcua1kKwHqFkLjQAU8nEJg0Vi4KN6iPT3AO
 tQ6TyWTkfa02w==
To: jaegeuk@kernel.org
Date: Tue, 13 May 2025 19:25:38 +0800
Message-ID: <20250513112538.2999915-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
MIME-Version: 1.0
X-Spam-Score: -1.7 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This fixes an analogus bug that was fixed in modern
 filesystems:
 a) xfs in commit 4b8d867ca6e2 ("xfs: don't over-report free space or inodes
 in statvfs") b) ext4 in commit f87d3af74193 ("ext4: don't o [...] 
 Content analysis details:   (-1.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uEnlo-0002SV-Gf
Subject: [f2fs-dev] [PATCH] f2fs: don't over-report free space or inodes in
 statvfs
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
Cc: stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This fixes an analogus bug that was fixed in modern filesystems:
a) xfs in commit 4b8d867ca6e2 ("xfs: don't over-report free space or
inodes in statvfs")
b) ext4 in commit f87d3af74193 ("ext4: don't over-report free space
or inodes in statvfs")
where statfs can report misleading / incorrect information where
project quota is enabled, and the free space is less than the
remaining quota.

This commit will resolve a test failure in generic/762 which tests
for this bug.

generic/762       - output mismatch (see /share/git/fstests/results//generic/762.out.bad)
    --- tests/generic/762.out   2025-04-15 10:21:53.371067071 +0800
    +++ /share/git/fstests/results//generic/762.out.bad 2025-05-13 16:13:37.000000000 +0800
    @@ -6,8 +6,10 @@
     root blocks2 is in range
     dir blocks2 is in range
     root bavail2 is in range
    -dir bavail2 is in range
    +dir bavail2 has value of 1539066
    +dir bavail2 is NOT in range 304734.87 .. 310891.13
     root blocks3 is in range
    ...
    (Run 'diff -u /share/git/fstests/tests/generic/762.out /share/git/fstests/results//generic/762.out.bad'  to see the entire diff)

HINT: You _MAY_ be missing kernel fix:
      XXXXXXXXXXXXXX xfs: don't over-report free space or inodes in statvfs

Cc: stable@kernel.org
Fixes: ddc34e328d06 ("f2fs: introduce f2fs_statfs_project")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 32f2abac19cf..da64760af74b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2069,26 +2069,32 @@ static int f2fs_statfs_project(struct super_block *sb,
 
 	limit = min_not_zero(dquot->dq_dqb.dqb_bsoftlimit,
 					dquot->dq_dqb.dqb_bhardlimit);
-	if (limit)
-		limit >>= sb->s_blocksize_bits;
+	limit >>= sb->s_blocksize_bits;
+
+	if (limit) {
+		uint64_t remaining = 0;
 
-	if (limit && buf->f_blocks > limit) {
 		curblock = (dquot->dq_dqb.dqb_curspace +
 			    dquot->dq_dqb.dqb_rsvspace) >> sb->s_blocksize_bits;
-		buf->f_blocks = limit;
-		buf->f_bfree = buf->f_bavail =
-			(buf->f_blocks > curblock) ?
-			 (buf->f_blocks - curblock) : 0;
+		if (limit > curblock)
+			remaining = limit - curblock;
+
+		buf->f_blocks = min(buf->f_blocks, limit);
+		buf->f_bfree = min(buf->f_bfree, remaining);
+		buf->f_bavail = min(buf->f_bavail, remaining);
 	}
 
 	limit = min_not_zero(dquot->dq_dqb.dqb_isoftlimit,
 					dquot->dq_dqb.dqb_ihardlimit);
 
-	if (limit && buf->f_files > limit) {
-		buf->f_files = limit;
-		buf->f_ffree =
-			(buf->f_files > dquot->dq_dqb.dqb_curinodes) ?
-			 (buf->f_files - dquot->dq_dqb.dqb_curinodes) : 0;
+	if (limit) {
+		uint64_t remaining = 0;
+
+		if (limit > dquot->dq_dqb.dqb_curinodes)
+			remaining = limit - dquot->dq_dqb.dqb_curinodes;
+
+		buf->f_files = min(buf->f_files, limit);
+		buf->f_ffree = min(buf->f_ffree, remaining);
 	}
 
 	spin_unlock(&dquot->dq_dqb_lock);
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
