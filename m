Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E34E7CA6B8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Oct 2023 13:28:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qsLm0-00018H-MP;
	Mon, 16 Oct 2023 11:28:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1qsLly-00018B-MU
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Oct 2023 11:28:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lr6tYd/cdlc6A/j5Z06hla8YsgmiQ8kHtm5dtZ5WbsA=; b=mRUj3qNE4DduAbribF691zOEUl
 obH7QU13SGOvMBK2ss7/HFoaH/L1gCV32b/rtPON08zH/JPR2/CR0wMKHhjhj6yvSJ6mfYhdoq60O
 Bs8wl7td13ciN3ipLdJN7E9nnPR9KgyS85nzLJbT5tN5EUBuBhOErRni2OGPIWs7rAy4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Lr6tYd/cdlc6A/j5Z06hla8YsgmiQ8kHtm5dtZ5WbsA=; b=V
 ++SD22W05rDfj4KsBjEgBHbrgUWitr+gkqlWq1FF27RVWphyd2Hu4BX43Xiam421UHzRZzrusNTUi
 48rtst/05sV1+a7oTpkoE61aeNcLHDYlY6MW+fzQZCKzDjS1mPCFotu9UfEc9znz4K4dRAgWawDYF
 0/srJYQVL0Hcx+pI=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qsLlt-00GOZn-NF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Oct 2023 11:28:33 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 39GBRuqv055664;
 Mon, 16 Oct 2023 19:27:56 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx01.spreadtrum.com [10.0.64.7])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4S8F9Z5g4bz2KQZJ4;
 Mon, 16 Oct 2023 19:23:46 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX01.spreadtrum.com (10.0.64.7) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 16 Oct 2023 19:27:54 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 16 Oct 2023 19:27:31 +0800
Message-ID: <1697455651-11124-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX01.spreadtrum.com (10.0.64.7)
X-MAIL: SHSQR01.spreadtrum.com 39GBRuqv055664
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If NAT is corrupted, let scan_nat_page() return EFSCORRUPTED,
 so that, caller can set SBI_NEED_FSCK flag into checkpoint for later repair
 by fsck. Also, this patch introduces a new fscorrupted error flag, and in
 above scenario, it will persist the error flag into superblock synchronously
 to avoid it has no luck to trigger a checkpoint to record [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1qsLlt-00GOZn-NF
Subject: [f2fs-dev] [PATCH V2] f2fs: fix error path of __f2fs_build_free_nids
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
Cc: zhiguo.niu@unisoc.com, niuzhiguo84@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If NAT is corrupted, let scan_nat_page() return EFSCORRUPTED, so that,
caller can set SBI_NEED_FSCK flag into checkpoint for later repair by
fsck.

Also, this patch introduces a new fscorrupted error flag, and in above
scenario, it will persist the error flag into superblock synchronously
to avoid it has no luck to trigger a checkpoint to record SBI_NEED_FSCK

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
changes of v2: Improve the patch according to Chao's suggestions.
---
---
 fs/f2fs/node.c          | 11 +++++++++--
 include/linux/f2fs_fs.h |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index ee2e1dd..248764b 100644
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
index a82a4bb..cf1adce 100644
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
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
