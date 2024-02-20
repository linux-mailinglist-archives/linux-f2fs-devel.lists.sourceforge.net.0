Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A203885B134
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Feb 2024 04:15:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcGbU-0001SO-Ud;
	Tue, 20 Feb 2024 03:15:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rcGbT-0001SI-Cp
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 03:15:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=06PphD0oXgjFxwdPvufxNI79cxiLrUpOhjS1/ncqxwQ=; b=h1Bks5v2wZdfT2jiWzV1jDmlBk
 rCEQiql8exUmg1jP+fknwcT38jQS54vkc3idO+N6OnS9s2VrYV/BWsaK1xdH61FRkD/MBZ+zHbkmk
 k8MdDkEBulEdFdqeP5EV2iP6E//7OjQBsGNgy9Gj387N/awxtR+N2ZlRYeU9mCx+ulRo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=06PphD0oXgjFxwdPvufxNI79cxiLrUpOhjS1/ncqxwQ=; b=Z
 RTpYATp4q9kHnhz3L3zN9V2l3hZOQBWYpOlS6O3OVqvtVkMnDSfqMJicfuQ47uXeMwHZ47iC3lueB
 GzxVeLQNAxgAho7ICZcafpTjpKMrLBtAGABpltjlcWNa4d0rc4oDsnN3hcnc9sv3B1Nye/iSnv06y
 sN0wJHi4CORMoFIw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcGbS-0005n5-90 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 03:15:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 33AD560ACB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Feb 2024 03:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE5CAC433F1;
 Tue, 20 Feb 2024 03:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708398925;
 bh=wcGy26e5hKuwjbVHIKAwO6Zpao1Gq1LGw3qoshIq2tI=;
 h=From:To:Cc:Subject:Date:From;
 b=eLRUaBYXEuPPYJHEymbnuz8iJrOunSt540tSXCPYysJL+xjSYLrR0LWA/6m4suEd5
 1pJtd/3Crt9VAzdwOEHQwzDRYrAg4g5dEW+swJGkk9QEN4kdpEWmOGFXl+lqQfm83S
 e+cifTigiAvVx0nRhXfmIGuPWxMrNy+gaSba/ZduSqUST3sbk3pV90DyQpnsqBQr41
 UauM7dqweIOjs6PbfYsOwkeQmkCn7H7Jtn8WcVOEpBtI5qn1fEueNS0dZ0fTH8kUzV
 j5+aqdFx41g3erZRQTmcn++HW7hRjjiDxqTxKjljwHFmmW6KGh1jap7M9sGQS1tOqz
 yiHCk0SujT2nQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 20 Feb 2024 11:15:15 +0800
Message-Id: <20240220031515.4039498-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: There are very similar codes in inc_valid_block_count() and
 inc_valid_node_count() which is used for available user block count
 calculation.
 This patch introduces a new helper get_available_block_count() to include
 those common codes, and used it to clean up codes. 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcGbS-0005n5-90
Subject: [f2fs-dev] [PATCH v2] f2fs: introduce get_available_block_count()
 for cleanup
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

There are very similar codes in inc_valid_block_count() and
inc_valid_node_count() which is used for available user block
count calculation.

This patch introduces a new helper get_available_block_count()
to include those common codes, and used it to clean up codes.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- rebase to last dev-test branch
 fs/f2fs/f2fs.h | 49 +++++++++++++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 2b6c8de8737e..a1640be7dcbe 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2278,6 +2278,27 @@ static inline bool __allow_reserved_blocks(struct f2fs_sb_info *sbi,
 	return false;
 }
 
+static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
+						struct inode *inode, bool cap)
+{
+	block_t avail_user_block_count;
+
+	avail_user_block_count = sbi->user_block_count -
+					sbi->current_reserved_blocks;
+
+	if (!__allow_reserved_blocks(sbi, inode, cap))
+		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
+
+	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
+		if (avail_user_block_count > sbi->unusable_block_count)
+			avail_user_block_count -= sbi->unusable_block_count;
+		else
+			avail_user_block_count = 0;
+	}
+
+	return avail_user_block_count;
+}
+
 static inline void f2fs_i_blocks_write(struct inode *, block_t, bool, bool);
 static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 				 struct inode *inode, blkcnt_t *count, bool partial)
@@ -2303,18 +2324,8 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 
 	spin_lock(&sbi->stat_lock);
 	sbi->total_valid_block_count += (block_t)(*count);
-	avail_user_block_count = sbi->user_block_count -
-					sbi->current_reserved_blocks;
+	avail_user_block_count = get_available_block_count(sbi, inode, true);
 
-	if (!__allow_reserved_blocks(sbi, inode, true))
-		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
-
-	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
-		if (avail_user_block_count > sbi->unusable_block_count)
-			avail_user_block_count -= sbi->unusable_block_count;
-		else
-			avail_user_block_count = 0;
-	}
 	if (unlikely(sbi->total_valid_block_count > avail_user_block_count)) {
 		if (!partial) {
 			spin_unlock(&sbi->stat_lock);
@@ -2610,7 +2621,8 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
 					struct inode *inode, bool is_inode)
 {
 	block_t	valid_block_count;
-	unsigned int valid_node_count, user_block_count;
+	unsigned int valid_node_count;
+	unsigned int avail_user_block_count;
 	int err;
 
 	if (is_inode) {
@@ -2630,17 +2642,10 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
 
 	spin_lock(&sbi->stat_lock);
 
-	valid_block_count = sbi->total_valid_block_count +
-					sbi->current_reserved_blocks + 1;
-
-	if (!__allow_reserved_blocks(sbi, inode, false))
-		valid_block_count += F2FS_OPTION(sbi).root_reserved_blocks;
-
-	user_block_count = sbi->user_block_count;
-	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
-		user_block_count -= sbi->unusable_block_count;
+	valid_block_count = sbi->total_valid_block_count + 1;
+	avail_user_block_count = get_available_block_count(sbi, inode, false);
 
-	if (unlikely(valid_block_count > user_block_count)) {
+	if (unlikely(valid_block_count > avail_user_block_count)) {
 		spin_unlock(&sbi->stat_lock);
 		goto enospc;
 	}
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
