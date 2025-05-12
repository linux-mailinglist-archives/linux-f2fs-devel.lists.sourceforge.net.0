Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75429AB3652
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 May 2025 13:55:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pDBOwhrPBU0XvjL9QR4a87UMJrv2EUacZeXxhC0pY1k=; b=eYnVF6c4KYVNczhOWF9IT978n+
	y9RgKIdzlZOuw1Y8RWBKLrPG5K17Fs2BTpI4xCiOdK0GfoEVGSjgKCbYrr9vrOQJpLB+W1fqsUiyH
	BM8VAcRMGTE/EsyFKj61rqmJKWLURibIYnsGjenOateHrv/fj/twoPzMWoTgnGnsK03s=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uERkO-0002ar-F5;
	Mon, 12 May 2025 11:55:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uERkK-0002a7-3e
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 11:55:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1Umf9L14mFPAKftzwFVEggXR3k4u2IPnCVvz0TsRvEQ=; b=KWH+D4Mm8rKRAnRrQVoHNHLwz9
 lAHwGsGUEJC15SXUJhEafDHdEGwFZaY5Y3eN/cz4mtZkNoKBxQttFfz29odw9BxJ19+wEXuGEWVgn
 ApSwFkRg8uOMRiKMdRO6Qcp4LEgvExlAUKvtQ4K2pGgCh4qbq188rqkHppkVhd/wVTXw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1Umf9L14mFPAKftzwFVEggXR3k4u2IPnCVvz0TsRvEQ=; b=D
 Si6Y8EmW4Z6hJO8gyqwhoFuetrCz6MhoaQ9B5lcTkXeF4MjYh2MTgj3HF8JT3jyLNPSGwKyJH28LB
 sRHyphLYmB4s6sX012kaRG4HHRhZTBbVkAfvxxbgBSYlNmQl8YI3FfJQyKgFezIkvZWOZK5+vI8Xo
 31EyGlZoqVZrNb98=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uERkJ-0007oF-L4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 11:55:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3B26B49E73
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 May 2025 11:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26715C4CEE7;
 Mon, 12 May 2025 11:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747050889;
 bh=imZd+snmvTi/00ygIwFHn0Eml64SD/qajsidfFNZM4k=;
 h=From:To:Cc:Subject:Date:From;
 b=Db7OJiMscqVE2RR4NfabqtH95E6D6LEX+dBY3IFVJ4oBCFK1cti3wqTJ7EM1/FZZu
 s/CJmgm1Z1yeN7Jc35YPD6b8IAjy84yy5WxNa1Zrh2w9Zu2rG9237ZtnZsaCBDKpaU
 CU4Pjh24PkuyNTZ0w0jbAAEIw+ms5SZY+gS93mtYeTJG056cTg5qTrPlWXytnQMia7
 nSR13UKupoR3f50L0+e1kP8AVa/SvNAwmJHI5q95QNxHx1ZclJxTGOKBUews5tcJX5
 ge4x8w1jBtbzn+GK1k/zXMeFh3ev5ddq2/g12plwD10wCaiz1McTdlm2kOSHjInk8P
 hMMaZ8x4PoJVQ==
To: jaegeuk@kernel.org
Date: Mon, 12 May 2025 19:54:41 +0800
Message-ID: <20250512115442.2640895-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
MIME-Version: 1.0
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add f2fs_bug_on() to check whether memory preallocation will
 fail or not after radix_tree_preload(GFP_NOFS | __GFP_NOFAIL). Signed-off-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/checkpoint.c | 4 +++- fs/f2fs/node.c
 | 7 +++++-- 2 files changed, 8 insertions(+), 3 deletions(-) 
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uERkJ-0007oF-L4
Subject: [f2fs-dev] [PATCH 1/2] f2fs: add f2fs_bug_on() to detect potential
 bug
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add f2fs_bug_on() to check whether memory preallocation will fail or
not after radix_tree_preload(GFP_NOFS | __GFP_NOFAIL).

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c | 4 +++-
 fs/f2fs/node.c       | 7 +++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index e7907858eb70..3f223bade520 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -504,6 +504,7 @@ static void __add_ino_entry(struct f2fs_sb_info *sbi, nid_t ino,
 {
 	struct inode_management *im = &sbi->im[type];
 	struct ino_entry *e = NULL, *new = NULL;
+	int ret;
 
 	if (type == FLUSH_INO) {
 		rcu_read_lock();
@@ -516,7 +517,8 @@ static void __add_ino_entry(struct f2fs_sb_info *sbi, nid_t ino,
 		new = f2fs_kmem_cache_alloc(ino_entry_slab,
 						GFP_NOFS, true, NULL);
 
-	radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
+	ret = radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
+	f2fs_bug_on(sbi, ret);
 
 	spin_lock(&im->ino_lock);
 	e = radix_tree_lookup(&im->ino_root, ino);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 3f6b8037d25f..88d3032236cb 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2309,7 +2309,7 @@ static bool add_free_nid(struct f2fs_sb_info *sbi,
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
 	struct free_nid *i, *e;
 	struct nat_entry *ne;
-	int err = -EINVAL;
+	int err;
 	bool ret = false;
 
 	/* 0 nid should not be used */
@@ -2323,7 +2323,10 @@ static bool add_free_nid(struct f2fs_sb_info *sbi,
 	i->nid = nid;
 	i->state = FREE_NID;
 
-	radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
+	err = radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
+	f2fs_bug_on(sbi, err);
+
+	err = -EINVAL;
 
 	spin_lock(&nm_i->nid_list_lock);
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
