Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CB3D1108A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 09:03:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jihTMuTtqRZKr0g8RGobx31ZUuXZil93j0ch389jpOY=; b=aL8JfuGI6y+3Vm8zOh0z69by2X
	ZQ1wFDA9ZcLlEHXnGdP7Ww5rEgsu2iTZoiuSGq6aOTvkD5aQSxb26cWF5HbLb1+20tert5dfkgCvy
	SfgKE6EipMK/DqMqggEf76sqYAcaM1fXApopQrMte1jHaP5bXhaFf4zWJ33p+ROxwPgA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfCtX-0004Kw-Qj;
	Mon, 12 Jan 2026 08:03:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vfCtV-0004Kc-2O
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 08:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OLN/bSb3jaS58Awcgcjqazqt3N2G1QVYKzcwuiTodQ8=; b=l74yHbcP6RUdNrA8viSlVtObLp
 XbaPmmKCdULLWEJztqEQytEmXfFkngpOohAVyjAoVoa0xcTYYlLYjqRvxQWg7GKNmBbfvL38x3qyl
 eAk86JHYVIJqZKaa1Ulexjjk14G8+IsMrgJjOvQ1EfOL+gIHh5RvcQzPd3crgR/6tFjE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OLN/bSb3jaS58Awcgcjqazqt3N2G1QVYKzcwuiTodQ8=; b=Y
 D1h4DKHaWrSjiWD/6sujvsseMBO+Id2JZ6+msv5rtqzEaNMZcLg69x9W/EG6QpMBJfi5Oc7sN1K1o
 n7hPZrdBJG+Z+/YnSAodzwCdEhwHw4utiAbaILg7KG3VzrY09Zj+CfEJ+S6wvOM5r1Phs2p3uKO/1
 9HudQ9tZRG1pkowA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfCtV-00041K-By for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 08:03:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BB41B6020E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Jan 2026 08:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E06C19423;
 Mon, 12 Jan 2026 08:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768204995;
 bh=btnJhDi7Y97Tem7m+oEy0y6GOKJPKQIxGoTpGV5/VlY=;
 h=From:To:Cc:Subject:Date:From;
 b=TIizG4/+9LJgmsS/E1R61edXKLmbsSllBnKv6JarDdu6GPf8RYwxZ88xCOoaEYE6G
 eWrEe6biOXenfDLwtuAYNsFqnqITWIsNrXpmrDJFMws8t120/fUPqJaatRwL0EMa2f
 qHdC90DCOc8vJDPScZZl33tmjZ0pOXS096aIH1cwF94AcYLqV+hKhDgnC3Mx8+xx+S
 Jn/LbD528IE7mYnu8OeOCUYa4XmQQ28OIKdJHSYt/45rglnTqr8UUpV3gCgkQWIOEJ
 1feShjcIyRZ3IWaN0u9IrzKEIgVaKjYS82QCIpAFGNbJclgw+aqsfZdTaiGwK7ZTEP
 8YC0o52DSwTuw==
To: jaegeuk@kernel.org
Date: Mon, 12 Jan 2026 15:49:15 +0800
Message-Id: <20260112074917.40107-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Add node footer sanity check during node folio's writeback, 
 if sanity check fails, let's shutdown filesystem to avoid looping to redirty
 and writeback in .writepages. Signed-off-by: Chao Yu <chao@kernel.org> ---
 v5: - split original [patch 1/2] to two, in this patch,
 just use sanity_check_node_footer()
 to do sanity check during writeback. fs/f2fs/node.c | 6 +++++- [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfCtV-00041K-By
Subject: [f2fs-dev] [PATCH v5 1/3] f2fs: fix to do sanity check on node
 footer in __write_node_folio()
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

Add node footer sanity check during node folio's writeback, if sanity
check fails, let's shutdown filesystem to avoid looping to redirty
and writeback in .writepages.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v5:
- split original [patch 1/2] to two, in this patch, just use
sanity_check_node_footer() to do sanity check during writeback.
 fs/f2fs/node.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 99e425e8c00a..bd4681a8a646 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1763,7 +1763,11 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
 
 	/* get old block addr of this node page */
 	nid = nid_of_node(folio);
-	f2fs_bug_on(sbi, folio->index != nid);
+
+	if (sanity_check_node_footer(sbi, folio, nid, NODE_TYPE_REGULAR)) {
+		f2fs_handle_critical_error(sbi, STOP_CP_REASON_CORRUPTED_NID);
+		goto redirty_out;
+	}
 
 	if (f2fs_get_node_info(sbi, nid, &ni, !do_balance))
 		goto redirty_out;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
