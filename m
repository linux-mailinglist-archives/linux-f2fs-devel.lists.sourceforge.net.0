Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8191A9C76
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 13:35:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOgKd-00037b-Sg; Wed, 15 Apr 2020 11:35:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1jOgKa-00037O-Ra
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:35:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UAzVMcuT3GQfm+kQDJ1+/wbjtMOA6IAy1VolI5KMRl8=; b=B2gXqnAoKR7hEoSlEQjXYyBJ3z
 4mFl1xGcJGgkdsvabo/aT7tTpdFzqKuQBY5+X2aM4pQLfKVAuGdVRcDTRFBT4rArnB0ZMuWAaVZxb
 Mh1iAU786Dxcfmx1dBfLWhEag8lnirAwV8N5YtSjVBkEQLgN8q781krx9K7Ee+ZbqdXk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UAzVMcuT3GQfm+kQDJ1+/wbjtMOA6IAy1VolI5KMRl8=; b=Ze+bcye4JGkFvRDp9JMY+BTaMA
 1aaw3L+G1CxGNYIY1CepZA2GrFE3DjiV+7e5X2LAiNW+7m8Cv5QSHCltX5apQd2NKi1lzUoISw5hh
 Wv4+o9+FnU+TiLAqUw5jZnF2vovn3yg1hJnq+JdJr0QyLB1ltQ8S1jjXXcpt3whQ1PKw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOgKX-002XSs-9H
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:35:47 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 06D84214AF;
 Wed, 15 Apr 2020 11:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586950538;
 bh=z2JrKhRoKKS+q6sD+25g7H8YHyXTUOaWkucZGm0Hnhg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ARV1J8j9WhAIFeB+TZVMJz0tozcxA0hewsYEVEfPk+J3m7JQ/mpz1CX2QhhKn1555
 ySh4beyq0w0XOoMLLBHwoDTkuqlUT5YydEftn22CvjH4c13eccj0RFN9hrc9WKPHS8
 yY5wKS38ToXzgQzW3M+QG70SBKOqDa2WoXb6Ji8M=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 15 Apr 2020 07:33:21 -0400
Message-Id: <20200415113445.11881-46-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415113445.11881-1-sashal@kernel.org>
References: <20200415113445.11881-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jOgKX-002XSs-9H
Subject: [f2fs-dev] [PATCH AUTOSEL 5.6 046/129] f2fs: Add a new CP flag to
 help fsck fix resize SPO issues
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

From: Sahitya Tummala <stummala@codeaurora.org>

[ Upstream commit c84ef3c5e65ccf99a7a91a4d731ebb5d6331a178 ]

Add and set a new CP flag CP_RESIZEFS_FLAG during
online resize FS to help fsck fix the metadata mismatch
that may happen due to SPO during resize, where SB
got updated but CP data couldn't be written yet.

fsck errors -
Info: CKPT version = 6ed7bccb
        Wrong user_block_count(2233856)
[f2fs_do_mount:3365] Checkpoint is polluted

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/checkpoint.c    | 8 ++++++--
 include/linux/f2fs_fs.h | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 9c88fb3d255a2..79aaf06004f65 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1301,10 +1301,14 @@ static void update_ckpt_flags(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	else
 		__clear_ckpt_flags(ckpt, CP_ORPHAN_PRESENT_FLAG);
 
-	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK) ||
-		is_sbi_flag_set(sbi, SBI_IS_RESIZEFS))
+	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK))
 		__set_ckpt_flags(ckpt, CP_FSCK_FLAG);
 
+	if (is_sbi_flag_set(sbi, SBI_IS_RESIZEFS))
+		__set_ckpt_flags(ckpt, CP_RESIZEFS_FLAG);
+	else
+		__clear_ckpt_flags(ckpt, CP_RESIZEFS_FLAG);
+
 	if (is_sbi_flag_set(sbi, SBI_CP_DISABLED))
 		__set_ckpt_flags(ckpt, CP_DISABLED_FLAG);
 	else
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index ac3f4888b3dfa..3c383ddd92ddd 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -125,6 +125,7 @@ struct f2fs_super_block {
 /*
  * For checkpoint
  */
+#define CP_RESIZEFS_FLAG		0x00004000
 #define CP_DISABLED_QUICK_FLAG		0x00002000
 #define CP_DISABLED_FLAG		0x00001000
 #define CP_QUOTA_NEED_FSCK_FLAG		0x00000800
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
