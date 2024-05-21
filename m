Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A89EE8CA7FD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 May 2024 08:23:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s9IuQ-0004vB-HM;
	Tue, 21 May 2024 06:23:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s9IuO-0004uv-Vm
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 May 2024 06:23:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r4SUQ9ehFXZpKcSTHqiP0V3vLOt+OwM3jqjgGkQvWVU=; b=Acc/kaGBYKzJ0rMXna0qU+4ptb
 XkVRZ613+yCvVYiFA7uRJFxGYEcsO4jGiCw/cnoDyprJ0ku0F6Pbwm/oDQG1a1UfX2QCWBd4DgLgl
 pwmaFoWUxVGETIEI/BQdbdwcp2wYUUrKV0A0rcYqMfFFywv0lswdfuhPNUv7bSb1sGxg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r4SUQ9ehFXZpKcSTHqiP0V3vLOt+OwM3jqjgGkQvWVU=; b=TtIVn9VxovFfzoJFqzgOlmuVc3
 voGoHr9SZIx9w9XXqL9xJTmTCzUXqrg1XuzD/Ww4Qa01apybMZ6bbnfQhk3wLbqTrCAEFHcEhPP8G
 yLlpDAgAE1ael8aqW+/TF26KKCbhtZmeji6kpZW5SizKw39T3KveUBFdbv9rGRDspY6Y=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s9IuP-0004jK-9U for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 May 2024 06:23:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2967561F9F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 May 2024 06:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0FFC32782;
 Tue, 21 May 2024 06:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716272605;
 bh=z2zWkZoAbBUOoRu9L0FDN+Y3ekt5ZHAk9uTFd+2UwXU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lrV12VBQSRy9OjwkVc63XQXS0bxwX4JLnUtwb6jy/PGHhcZMG6TOww20NBtrsHR1D
 o2e+exiAAT9ALlQK8+S6KRCfVI+k2smDOCk+f1QiE/7MSyg1tTEzz3R2tb752UudDx
 oDI7On0GnQAz5d0dJsaI3HMUDfFPL1MRyRzErLHP3LvMLu8qzwBZj++z4X45vTvIFE
 03QHRIg+9DhFWeu5g/JPmmYpOoaEgEbaDPUTSTELPTGJuLiNFhRVVn57fhZX//Va4w
 hrYfqlRjtvXAJcHJ7Fao0/pTdmk9o6e7cbqc5VkHoRNJ7pFihbFm8AVtwnSZ1DonQx
 AGr0Mg6PltR/A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 21 May 2024 14:23:18 +0800
Message-Id: <20240521062318.976239-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240521062318.976239-1-chao@kernel.org>
References: <20240521062318.976239-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  inode can be fuzzed, so it can has F2FS_INLINE_DATA flag and
 valid i_blocks/i_nid value, this patch supports to do extra sanity check
 to detect such corrupted state. Signed-off-by: Chao Yu <chao@kernel.org> ---
 fs/f2fs/f2fs.h | 2 +- fs/f2fs/inline.c | 20 +++++++++++++++++++-
 fs/f2fs/inode.c
 | 2 +- 3 files changed, 21 insertions(+), 3 deletions(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s9IuP-0004jK-9U
Subject: [f2fs-dev] [PATCH 2/2] f2fs: fix to do sanity check on blocks for
 inline_data inode
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

inode can be fuzzed, so it can has F2FS_INLINE_DATA flag and valid
i_blocks/i_nid value, this patch supports to do extra sanity check
to detect such corrupted state.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h   |  2 +-
 fs/f2fs/inline.c | 20 +++++++++++++++++++-
 fs/f2fs/inode.c  |  2 +-
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1974b6aff397..f463961b497c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4149,7 +4149,7 @@ extern struct kmem_cache *f2fs_inode_entry_slab;
  * inline.c
  */
 bool f2fs_may_inline_data(struct inode *inode);
-bool f2fs_sanity_check_inline_data(struct inode *inode);
+bool f2fs_sanity_check_inline_data(struct inode *inode, struct page *ipage);
 bool f2fs_may_inline_dentry(struct inode *inode);
 void f2fs_do_read_inline_data(struct folio *folio, struct page *ipage);
 void f2fs_truncate_inline_inode(struct inode *inode,
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 7638d0d7b7ee..0203c3baabb6 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -33,11 +33,29 @@ bool f2fs_may_inline_data(struct inode *inode)
 	return !f2fs_post_read_required(inode);
 }
 
-bool f2fs_sanity_check_inline_data(struct inode *inode)
+static bool inode_has_blocks(struct inode *inode, struct page *ipage)
+{
+	struct f2fs_inode *ri = F2FS_INODE(ipage);
+	int i;
+
+	if (F2FS_HAS_BLOCKS(inode))
+		return true;
+
+	for (i = 0; i < DEF_NIDS_PER_INODE; i++) {
+		if (ri->i_nid[i])
+			return true;
+	}
+	return false;
+}
+
+bool f2fs_sanity_check_inline_data(struct inode *inode, struct page *ipage)
 {
 	if (!f2fs_has_inline_data(inode))
 		return false;
 
+	if (inode_has_blocks(inode, ipage))
+		return false;
+
 	if (!support_inline_data(inode))
 		return true;
 
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 791c06e159fd..4b39aebd3c70 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -344,7 +344,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		}
 	}
 
-	if (f2fs_sanity_check_inline_data(inode)) {
+	if (f2fs_sanity_check_inline_data(inode, node_page)) {
 		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
 			  __func__, inode->i_ino, inode->i_mode);
 		return false;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
