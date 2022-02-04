Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 859374A92BC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Feb 2022 04:21:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nFpAF-0000Yq-4V; Fri, 04 Feb 2022 03:21:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nFpAE-0000Yj-9N
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Feb 2022 03:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lLpycnYxh/7n0ruXyvf1lawR1KNxjFQB+JjUCDLJIfk=; b=FwBwS5ar1ehrUtTQoFhq+4vipu
 uWsZBEuT9ZUVpaanf8dLSWmRynGfYCvYYXISbALFLtQAbOgKNLY3sxzNdspuS+oVcLWpuv35zDURn
 njvl76Q/Lb8EQoEhCsPBHcHUcCtx1xcVWtcdn4exxb0IcxIrp1K2OC4Qj9fJEYCXb2ho=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lLpycnYxh/7n0ruXyvf1lawR1KNxjFQB+JjUCDLJIfk=; b=F
 dl9LDEu5WxIS78/FA53hMqWEJVdkJq1Ox2JErXAKEUG+b8fQ7fzYMz646rO2V/PtJ2WlQ7VzeWdGy
 QfKLRixHfwhXoBAB87EAfDZULwSM+qeEVbDPr76jR0Uq9z4hSwfIPx63EDWCNEcE2dJmwhsA3Sbzy
 sKbguWqj0PvP+/m0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nFpAB-00GDIc-6Q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Feb 2022 03:21:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BD91761AD2;
 Fri,  4 Feb 2022 03:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE639C340E8;
 Fri,  4 Feb 2022 03:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643944881;
 bh=YSy+6ZH0WVfzwdmOiqKVVldecAPykJSaMLEQU6gfzTI=;
 h=From:To:Cc:Subject:Date:From;
 b=WSBc/ACdZhUSpNF2CEeZwHRZRcxLpirVZ6rt1zbfxtdU7DK6+TrGhceD2D9K7qd2z
 i7spPLc7X3Y1Netr6qZr9B2ZdTBU4ICDym4R600zyfCCfeB5CTYX5it7Y46Pg9a9os
 9twjG0AxeIr+QjZ5qORwSno6u8QeDYdZfyiywdvCC0qSEofGXSUlCSluwPPG27w5WJ
 vww65i+oQYLogba3sJfXkeptQ+hbtrlJIaUr3BniwaBmwk2BEwaodVmV5/SHWmyWE1
 eChdu7vU+CWjaKwrj/O3s4k8RV5H3rRdAdvN3/0NHhYwk0QBg8wNwyebEAUPLUD3YQ
 LI2Dp0ETSUfhA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri,  4 Feb 2022 11:21:14 +0800
Message-Id: <20220204032114.43720-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As Pavel Machek reported in below link [1]: After commit
 77900c45ee5c
 ("f2fs: fix to do sanity check in is_alive()"), node page should be unlock
 via calling f2fs_put_page() in the error path of is_alive(), otherwise, f2fs
 may hang when it tries [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nFpAB-00GDIc-6Q
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to unlock page correctly in error
 path of is_alive()
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
Cc: Pavel Machek <pavel@denx.de>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As Pavel Machek reported in below link [1]:

After commit 77900c45ee5c ("f2fs: fix to do sanity check in is_alive()"),
node page should be unlock via calling f2fs_put_page() in the error path
of is_alive(), otherwise, f2fs may hang when it tries to lock the node
page, fix it.

[1] https://lore.kernel.org/stable/20220124203637.GA19321@duo.ucw.cz/

Fixes: 77900c45ee5c ("f2fs: fix to do sanity check in is_alive()")
Cc: <stable@vger.kernel.org>
Reported-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- Cc stable-kernel mailing list.
 fs/f2fs/gc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 0a6b0a8ae97e..2d53ef121e76 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1038,8 +1038,10 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 	}
 
-	if (f2fs_check_nid_range(sbi, dni->ino))
+	if (f2fs_check_nid_range(sbi, dni->ino)) {
+		f2fs_put_page(node_page, 1);
 		return false;
+	}
 
 	*nofs = ofs_of_node(node_page);
 	source_blkaddr = data_blkaddr(NULL, node_page, ofs_in_node);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
