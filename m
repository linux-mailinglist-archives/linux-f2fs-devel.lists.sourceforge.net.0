Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB07941233
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jul 2024 14:46:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sYmEr-0004H3-N6;
	Tue, 30 Jul 2024 12:46:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1sYmEp-0004Gk-BF
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jul 2024 12:46:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zjguSa1okKbK5x8DxE9LgHo62otu/E8kU6Sqpxfif6c=; b=mA0LcFXRNG17+evwWa+jCZl+8c
 n3CKW06ucuKaWb2lVdXadxqW3UvZo3CiXBN1jlRJTKo2pDwYiJlrZuDiIoFdwB7g0RqnJzlKaeqOL
 JCNCwx2YaoXZPPnGChDDZGKpEJBzzvohV9ZadHiSCIjGS5BAK1aDRVg5DBi0/ijtK7DE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zjguSa1okKbK5x8DxE9LgHo62otu/E8kU6Sqpxfif6c=; b=m+e61HU/Aw4uJ1OVT7tY7YJNVH
 IZGw0BJ9NemOfCHRZHzEReD19L14ip4dsDc4Gp4dBAzw2STIydEQigV4/ZhEMWTOduFy2SutiYb/Y
 MubjRKd4Yh+CBDkXGkKYCzTjjKlZtpP/HySA8HDLpQ4zYztC13osOgwqj9B30Oas5qSc=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sYmEp-0007C9-0k for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jul 2024 12:46:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4F105CE1027
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Jul 2024 12:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FDA1C4AF0A;
 Tue, 30 Jul 2024 12:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722343546;
 bh=XWTARRowdjY3QktMvuGHZcbd38eM+zdytJtjo9ooQ8M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TdEvJ5QC7sPG9FMjnjBzh+mLD+cX0hQ6NcdI52aSjFYx/AK6PWCX7j+pAYHhVg01m
 cLxenjsffxPK3vUxDjexgohSieWASO1DlmqwW9z7qRj3na20neIS2nSNE5RTEKNPco
 0Z7xCa++xx96zOUGz8C4XqxswvAw1Q1wfcm3rxbHkUvQ20glvs3jFli5ciMEcMjvBO
 9+Ni4dNaPOe2wUdfCQzKvZzDSDq5Zai6FWOfWCJ+oiFj30VM3JQTk97tmuvm1/JVmq
 FSp8ZwrmT4L8t/bVw5t7wFL/DYhAiqeOjQiZHsW2BIgouHR9Dl7eWCRfAGV2BalvE+
 QH5HK8h60lXkw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 30 Jul 2024 08:45:32 -0400
Message-ID: <20240730124542.3095044-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730124542.3095044-1-sashal@kernel.org>
References: <20240730124542.3095044-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.43
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 c240c87bcd44a1a2375fc8ef8c645d1f1fe76466 ] inode can be fuzzed,
 so it can has F2FS_INLINE_DATA flag and valid i_blocks/i_nid
 value, this patch supports to do extra sanity check to detect such corrupted
 state. Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sYmEp-0007C9-0k
Subject: [f2fs-dev] [PATCH AUTOSEL 6.6 2/7] f2fs: fix to do sanity check on
 blocks for inline_data inode
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

From: Chao Yu <chao@kernel.org>

[ Upstream commit c240c87bcd44a1a2375fc8ef8c645d1f1fe76466 ]

inode can be fuzzed, so it can has F2FS_INLINE_DATA flag and valid
i_blocks/i_nid value, this patch supports to do extra sanity check
to detect such corrupted state.

Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/f2fs.h   |  2 +-
 fs/f2fs/inline.c | 20 +++++++++++++++++++-
 fs/f2fs/inode.c  |  2 +-
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c7e717ab09000..1252d57228dc6 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4143,7 +4143,7 @@ extern struct kmem_cache *f2fs_inode_entry_slab;
  * inline.c
  */
 bool f2fs_may_inline_data(struct inode *inode);
-bool f2fs_sanity_check_inline_data(struct inode *inode);
+bool f2fs_sanity_check_inline_data(struct inode *inode, struct page *ipage);
 bool f2fs_may_inline_dentry(struct inode *inode);
 void f2fs_do_read_inline_data(struct page *page, struct page *ipage);
 void f2fs_truncate_inline_inode(struct inode *inode,
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 2fe25619ccb5f..529b88f0b8cc5 100644
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
index ab2eecd986ec5..abe2f5f043b0d 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -343,7 +343,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		}
 	}
 
-	if (f2fs_sanity_check_inline_data(inode)) {
+	if (f2fs_sanity_check_inline_data(inode, node_page)) {
 		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
 			  __func__, inode->i_ino, inode->i_mode);
 		return false;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
