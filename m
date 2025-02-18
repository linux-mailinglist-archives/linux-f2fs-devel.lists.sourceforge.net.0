Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E492EA3931F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWw-00026B-8z;
	Tue, 18 Feb 2025 05:52:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWq-00024E-8u
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cM12HuwtYvDW5RZv6niKy3FbHGL/VsXhMZwF7o58pWw=; b=fxFJWkazflFrCOted9xBr24UFS
 QVaIWiO3LdkdSkhBvlFzXObh6V7sWpPA8YkCBbt6ThcdyGCgdUl7rVTzuuRU3zKbg4cUmt2Onkxdn
 yZYv6rdQ8ncYOn81zchG8bD3RnOBD3f7ScloIPysnAdXCc+UNERTMuRl50bfHMG8fUIM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cM12HuwtYvDW5RZv6niKy3FbHGL/VsXhMZwF7o58pWw=; b=UeZbfWJ2DefyjmWxsVw8gB7fFr
 GH7aaQ6uGcyweLIBu8s/W96X6OIyz2e/YdKRCF44BXFYbMaa+daHWh/NXWdTtD61ItMkoOknXV/Cm
 pM8wlWRm/JYfIZaxN/LmAH7fJyqQxIGo/a2XPkNMsl+vW6o0LlU5/yux3nMKn6U9Mkys=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWo-0007cC-R2 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=cM12HuwtYvDW5RZv6niKy3FbHGL/VsXhMZwF7o58pWw=; b=GOymUiexKmbKfjBa+VOTayPnaZ
 DjxAAIJUF/FUf4CRNU/kaL2XC886bosYTB1fdFVid4eVQmB2nWhAhQgFqoKXbJJy0DQ34yAteTyAJ
 nKnNnWfZrKnN/ISAhv37QR3LkSNma4pKftrPHF96xJklIG387bboRogN142hE5HigjVtPFvKNiVVf
 6VVyApExrz38dGvGHSrWrjE6qkW1ncy45/7ZYIdMy4Vt+GKIKjvedFS9GkbaYlcn/ehxc4VqX89Ow
 wbn8J+Zk1RGHoh6iEsA7Ex9sqz95aVCqIvovldmWwyI7s36W48q+w5ibwFBLMxT1bcWvMdbQGnLIU
 NrElmvmQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWd-00000002TsZ-2F1Z; Tue, 18 Feb 2025 05:52:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:51:49 +0000
Message-ID: <20250218055203.591403-16-willy@infradead.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218055203.591403-1-willy@infradead.org>
References: <20250218055203.591403-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The compiler can make some optimisations if we tell it that
 a function call doesn't change this memory. Signed-off-by: Matthew Wilcox
 (Oracle) <willy@infradead.org> --- fs/f2fs/f2fs.h | 2 +- fs/f2fs/node.h |
 6 +++--- 2 files changed, 4 insertions(+), 4 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tkGWo-0007cC-R2
Subject: [f2fs-dev] [PATCH 15/27] f2fs: Mark some functions as taking a
 const page pointer
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
Cc: linux-fsdevel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The compiler can make some optimisations if we tell it that a function
call doesn't change this memory.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h | 2 +-
 fs/f2fs/node.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index cf664ca38905..a941a0750712 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2017,7 +2017,7 @@ static inline struct f2fs_checkpoint *F2FS_CKPT(struct f2fs_sb_info *sbi)
 	return (struct f2fs_checkpoint *)(sbi->ckpt);
 }
 
-static inline struct f2fs_node *F2FS_NODE(struct page *page)
+static inline struct f2fs_node *F2FS_NODE(const struct page *page)
 {
 	return (struct f2fs_node *)page_address(page);
 }
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 6aea13024ac1..281d53c95c9a 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -248,7 +248,7 @@ static inline nid_t nid_of_node(struct page *node_page)
 	return le32_to_cpu(rn->footer.nid);
 }
 
-static inline unsigned int ofs_of_node(struct page *node_page)
+static inline unsigned int ofs_of_node(const struct page *node_page)
 {
 	struct f2fs_node *rn = F2FS_NODE(node_page);
 	unsigned flag = le32_to_cpu(rn->footer.flag);
@@ -342,7 +342,7 @@ static inline bool is_recoverable_dnode(struct page *page)
  *                 `- indirect node ((6 + 2N) + (N - 1)(N + 1))
  *                       `- direct node
  */
-static inline bool IS_DNODE(struct page *node_page)
+static inline bool IS_DNODE(const struct page *node_page)
 {
 	unsigned int ofs = ofs_of_node(node_page);
 
@@ -389,7 +389,7 @@ static inline nid_t get_nid(struct page *p, int off, bool i)
  *  - Mark cold data pages in page cache
  */
 
-static inline int is_node(struct page *page, int type)
+static inline int is_node(const struct page *page, int type)
 {
 	struct f2fs_node *rn = F2FS_NODE(page);
 	return le32_to_cpu(rn->footer.flag) & BIT(type);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
