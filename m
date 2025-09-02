Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6F5B407EC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Sep 2025 16:53:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Am9OyM7x5Vm0UQOCA7XE3XQocZYcmHTzwzX0wUOhs/g=; b=L3yAaVMpH57HwxSiIcsYD49Di2
	4A8Cho8D5dbxpm7EnOhMOrT0wwGDeQBkXm0PmaMV+2lIyMGsE+tg8JK0+x2HlhHrbAzKPgjuY8/1f
	kEkwhEm+y3WS46n0G0x/NNI/aoHNw2WSSuBJJWSBT5ZyNFj0OM9kO+D/skWxbMTkQ0uk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1utSNl-0003sA-GQ;
	Tue, 02 Sep 2025 14:53:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1utSNd-0003s0-Vr
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Sep 2025 14:53:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6D7TzElzQIY4vpkDTx+KyNOjDTekM2Tj+yzjLKslF1k=; b=Zm5w4Wbs6R/+p7NYntJgQPospS
 yTyAhfvJAy1Zr4aPLcTyL4V0r+u+wQn4+6FWL5Y8MxzJ3uzHkgxuLxsstaxEiGOlKOjxK/5v8tve4
 D1vxMJZBlz5Cic3pdpWmU6lXVBOR4uzKPsoe1ywxAblEYiPfo4GXZwNVcQ+DIoF+v4Dk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6D7TzElzQIY4vpkDTx+KyNOjDTekM2Tj+yzjLKslF1k=; b=n
 P6FjFV/cPGYG78Q418sP2omnEpsQ+wGLG4rwu0+C8wD+MvzpvyjwbTLYA/mnen3ytbI2w4+LnAGJK
 cwBgIin/ckEWHQ1dQ03461LcwGFKj2UUi9JYwzJa5xhKgMsxlvEoUplAN4k0CbWOAzuiiMi4edkWI
 NMtcQn/RCQg6CQcg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1utSNd-00014k-Bz for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Sep 2025 14:53:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 586C86020A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Sep 2025 12:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD89C4CEF4;
 Tue,  2 Sep 2025 12:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756816050;
 bh=SkEzvjXJB8k1VwWANxpWR/5w4miCis0fDo9h2eYkSE0=;
 h=From:To:Cc:Subject:Date:From;
 b=L9j6pB2dBvXf42I8CMjdOnguCCxQYscb4rFJ+RdnyKthJKvdFLA8IfNaU3mj9K6f7
 nyiGcGd2PTxvSxD9Us67TO4RiP4MM8X0mDoTOlBmplBNkrqO5JLwCm53Y9Z9cQdNUp
 QHG78kDL3buILstxzjrOe02q9juh4ufETn9LLR9AkdWLgDJ2MMvmQ1/YiiYewMiw/E
 ZAeloMrHlEqi8i9dF4NjI6qzPUa3yx1jlrF2LNirB+f2FYbBbLLC4Y8feHavqRwgP2
 KmpMEPTPG7leAHhIt/A9bjcdgOVyFaZ+3kKF4KAQ9p0VuOz/1wg/z5nrHt3dq4ReOJ
 1PWXYN3YGzdOA==
To: jaegeuk@kernel.org
Date: Tue,  2 Sep 2025 20:27:19 +0800
Message-ID: <20250902122720.2750481-1-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In error path of __get_node_folio(),
 if the folio is not uptodate, 
 let's avoid unnecessary folio_clear_uptodate() for cleanup. Signed-off-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/node.c | 2 +- 1 file changed,
 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1utSNd-00014k-Bz
Subject: [f2fs-dev] [PATCH 1/2] f2fs: avoid unnecessary
 folio_clear_uptodate() for cleanup
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

In error path of __get_node_folio(), if the folio is not uptodate, let's
avoid unnecessary folio_clear_uptodate() for cleanup.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/node.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 4254db453b2d..482a362f2625 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1570,7 +1570,7 @@ static struct folio *__get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
 
 	if (unlikely(!folio_test_uptodate(folio))) {
 		err = -EIO;
-		goto out_err;
+		goto out_put_err;
 	}
 
 	if (!f2fs_inode_chksum_verify(sbi, folio)) {
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
