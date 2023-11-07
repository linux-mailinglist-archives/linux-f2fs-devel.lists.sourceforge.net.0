Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2655B7E4CE7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Nov 2023 00:24:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r0VQZ-0008Aq-Cb;
	Tue, 07 Nov 2023 23:24:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1r0VQW-0008Ah-Mc
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Nov 2023 23:24:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZV/tB2zxIEL5+Vxo1eENcom6ehf07BJwLxX0nMRpncQ=; b=djbSjHXYPFPjqV/MzylE+bzg5M
 jx9E7bs/2YZjgeM7Nnq2XNkm7BnCrURZsJHUuaFUISi/ntf2EHAqcCFMuCSugjcmLQNlvfDW8c29R
 nR3SLBKbQ57H8uquThD/rhBNAQgIatvJ0gbeXfeOLejavpwMlDy3oE4hPY72hq5yBcUQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZV/tB2zxIEL5+Vxo1eENcom6ehf07BJwLxX0nMRpncQ=; b=DOMzaw3WyDhpDNFq9s+10PfeJr
 h/K6BOE4HZLtyAHxcoZMldHgUAo56TDQunmYzG8moZVcXdNA2NqVbRWL3wTlFMCx+YQIVfE1+KUEL
 1XSSgQqhcPnqKx2BEdGWmTR4MJJwwJlwd96Ra/tBDF1FtpgP/T2Py6ttA5cYkHXW840U=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r0VQW-0006Bm-8W for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Nov 2023 23:24:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9C689CE0FE8;
 Tue,  7 Nov 2023 23:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122CAC433C7;
 Tue,  7 Nov 2023 23:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699399440;
 bh=VbLINJBBcOe3ggBEOLfEm+vNop3D93xrWfVtIKzVYpQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lhp3MS8jivY+T3Ny2chkTlalY/ttzmGf85L/j1JMikaMQEj2rx8gM/a6tpK80NS+B
 wAP+9kFTfNqblHwrW/PFb5Cn+J7CtUst+bYvFbRSzclD8AO0S4KkuiPtBHXmtE5NM3
 Q1MwJnHk7zw85h0RFg8HYzX7XXARdO5XEx6UaV5we+S+t+/WiqzzlgZi74ZlRaZT02
 elSzlc7tQRk3OmLNQx+6gf0h1i2nFnT9TzJffHXfQt3v+se5MqaV6MUvVkv5RYLwr0
 x9q6fU+eUNM1CPhLIrEFg++KkwW7I8DYtKbDi7oSRLZdI77V8avHWViwmvlL0B+4J/
 6fQvE4uccIYtw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue,  7 Nov 2023 18:23:08 -0500
Message-ID: <20231107232330.3776001-13-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107232330.3776001-1-sashal@kernel.org>
References: <20231107232330.3776001-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Zhiguo Niu <zhiguo.niu@unisoc.com> [ Upstream commit
 a5e80e18f268ea7c7a36bc4159de0deb3b5a2171 ] If NAT is corrupted,
 let scan_nat_page()
 return EFSCORRUPTED, so that, caller can set SBI_NEED_FSCK flag into checkpoint
 for later repair by fsck. 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r0VQW-0006Bm-8W
Subject: [f2fs-dev] [PATCH AUTOSEL 6.5 13/18] f2fs: fix error path of
 __f2fs_build_free_nids
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
 Zhiguo Niu <zhiguo.niu@unisoc.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Zhiguo Niu <zhiguo.niu@unisoc.com>

[ Upstream commit a5e80e18f268ea7c7a36bc4159de0deb3b5a2171 ]

If NAT is corrupted, let scan_nat_page() return EFSCORRUPTED, so that,
caller can set SBI_NEED_FSCK flag into checkpoint for later repair by
fsck.

Also, this patch introduces a new fscorrupted error flag, and in above
scenario, it will persist the error flag into superblock synchronously
to avoid it has no luck to trigger a checkpoint to record SBI_NEED_FSCK

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/node.c          | 11 +++++++++--
 include/linux/f2fs_fs.h |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index ee2e1dd64f256..248764badcde8 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2389,7 +2389,7 @@ static int scan_nat_page(struct f2fs_sb_info *sbi,
 		blk_addr = le32_to_cpu(nat_blk->entries[i].block_addr);
 
 		if (blk_addr == NEW_ADDR)
-			return -EINVAL;
+			return -EFSCORRUPTED;
 
 		if (blk_addr == NULL_ADDR) {
 			add_free_nid(sbi, start_nid, true, true);
@@ -2504,7 +2504,14 @@ static int __f2fs_build_free_nids(struct f2fs_sb_info *sbi,
 
 			if (ret) {
 				f2fs_up_read(&nm_i->nat_tree_lock);
-				f2fs_err(sbi, "NAT is corrupt, run fsck to fix it");
+
+				if (ret == -EFSCORRUPTED) {
+					f2fs_err(sbi, "NAT is corrupt, run fsck to fix it");
+					set_sbi_flag(sbi, SBI_NEED_FSCK);
+					f2fs_handle_error(sbi,
+						ERROR_INCONSISTENT_NAT);
+				}
+
 				return ret;
 			}
 		}
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index a82a4bb6ce68b..cf1adceb02697 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -104,6 +104,7 @@ enum f2fs_error {
 	ERROR_CORRUPTED_VERITY_XATTR,
 	ERROR_CORRUPTED_XATTR,
 	ERROR_INVALID_NODE_REFERENCE,
+	ERROR_INCONSISTENT_NAT,
 	ERROR_MAX,
 };
 
-- 
2.42.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
