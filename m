Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A4D72ED31
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jun 2023 22:40:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q9Ao7-0000FB-Kw;
	Tue, 13 Jun 2023 20:40:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q9Ao6-0000F5-V3
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 20:40:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HYEPHnKJZJwBllOOaE+wWwPcndapSn+SEdVnQ29R52I=; b=AuXfqGUJELKiQQyeLNm3yQocOh
 zEX0rf7zKQv9AyD3pzVHo2+5wb27WF9rXmzcwP6qF+YNqMw2OhHIzXGw+p/apzZYqE6ytogByGSJa
 tPmKQlp5PxVHr86iWq8AlaI+MgE3rrXcp7H45lbxOJ6xfyuVJGKw4qD8csipinfOnqLg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HYEPHnKJZJwBllOOaE+wWwPcndapSn+SEdVnQ29R52I=; b=X
 JARBLLybYt7q78q//X/jBBNUV/WhgQ82PX343Mdy7QHHaOlv3fGWrGC37sWRzSQLWP7mhIl84EqCV
 X0VQjQeUq+g7K0ioc+NPUgY8a9pWBSuaNEnmbo3D2lP2FP/LOUfgjNgwi6BRN85gnR3DNw4YbNsyJ
 CPqebeB7uVYh9OB0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q9Ao3-0029rY-1Q for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 20:40:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3BAD4615A7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Jun 2023 20:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910F0C433C0;
 Tue, 13 Jun 2023 20:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686688789;
 bh=sLZ+P360Imf7bwyICslM2xpcRXFrq+wunkzXqiYuC6c=;
 h=From:To:Cc:Subject:Date:From;
 b=nZ9YV6tj3Y7La98xNEpw85oJMLL0gU6jsgf/cp7ApkpVAIGvgK6noVqsGG3xyy9Gu
 qcoPD2tHLvUPYABIyRfS7fHlQU9EEILPo0vYwdBWx2sCCWEkQIZjcMJNFeO9eqj2sP
 73Qo3VEL0dr2ed1HPLZUgIVLNeAkLCRKj6dvVtchxtkHTNfnyn/IcY4u0gsI8qel8k
 mS5CKjoi8WAUQYkx8m7mDD1zIOMl6B8vDuaCeRRLrF38IBPr/da4aC7HQuA16C5rtS
 CkWfC0E0PkN0djNLLccF3WAUuZXccRiDUJ05GJ4hhRaHyhA3miYfEQE1/sg5rX/Vsi
 smDV0j5ZU5Vxw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 13 Jun 2023 13:39:47 -0700
Message-ID: <20230613203947.2745943-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If there're huge # of small discards,
 this will increase checkpoint
 latency insanely. Let's issue small discards only by trim. Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/segment.c | 5 ++--- 1 file
 changed, 2 insertions(+), 3 deletions(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q9Ao3-0029rY-1Q
Subject: [f2fs-dev] [PATCH] f2fs: do not issue small discard commands during
 checkpoint
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If there're huge # of small discards, this will increase checkpoint latency
insanely. Let's issue small discards only by trim.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/segment.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 0c0c033c4bdd..ef46bb085385 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2178,7 +2178,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 	}
 	mutex_unlock(&dirty_i->seglist_lock);
 
-	if (!f2fs_block_unit_discard(sbi))
+	if (!f2fs_block_unit_discard(sbi) || !force)
 		goto wakeup;
 
 	/* send small discards */
@@ -2192,8 +2192,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 					sbi->blocks_per_seg, cur_pos);
 			len = next_pos - cur_pos;
 
-			if (f2fs_sb_has_blkzoned(sbi) ||
-			    (force && len < cpc->trim_minlen))
+			if (f2fs_sb_has_blkzoned(sbi) || len < cpc->trim_minlen)
 				goto skip;
 
 			f2fs_issue_discard(sbi, entry->start_blkaddr + cur_pos,
-- 
2.41.0.162.gfafddb0af9-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
