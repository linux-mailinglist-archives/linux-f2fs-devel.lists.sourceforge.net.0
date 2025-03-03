Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A99F1A4B67B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Mar 2025 04:26:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1towRL-0003X8-Ot;
	Mon, 03 Mar 2025 03:26:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1towRK-0003X2-Pg
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 03:25:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ika4eURtYe5YDXMX5TCB+mo5iuZKV8o1LvmVYhptBpg=; b=Xcq0/KKpGytbBIPqW5N/R8BnIb
 oNsHigUrL/UnRVibRtgPMLmbVHCHjaJR47GwHdhrFLM43HItJLcnRG4k5eFRRszKxQfeEb2fv6eez
 YzyYEBTEzAZytFaKIsXml+o1d1H28Lr53YMuZjSr8t6olRqmsGSjK1JXrsfI57yd3SJw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ika4eURtYe5YDXMX5TCB+mo5iuZKV8o1LvmVYhptBpg=; b=l
 huPP3ipnceiPR3bb5MwXxBqx07hiFevILJ+FrIUZ88y9vlgVKt2F7lY2nB9NWE9jR/L40g6MfGP4L
 O4CtSiUARcJq6gKVizQ4LLFRdvYsHMkxFMxtU1qPQKA/kvr8XeIHWHp+2wbO3kqswXilCHLUIlSYY
 EasH0SPa8Tfy3I+E=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1towRL-0005er-0j for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 03:25:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CEC275C5427
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  3 Mar 2025 03:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 281E5C4CED6;
 Mon,  3 Mar 2025 03:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740972348;
 bh=7fBJ+9SkI851aRpJLiCAVAcdqfXjwH5g0lFDk3gGWVs=;
 h=From:To:Cc:Subject:Date:From;
 b=OM4rpPP4GFlRA/XDbjnPWZe1YXGy5r5ZL6IbUFzaPpMMzsh2NrLb39V2Wb24gdl4A
 tits4FnyopTerfSpURwHWpTH5/heyR3erk/9cxz2Lo6L8Y5mCDQZj47AptfyyuP4bj
 DjiXPTO6KeQP59rvPJdPVf6LQq82DrlvzSN4Db4YOutDi+0e91P9uD4c0KVKRG+fDY
 eycw+nwpLdhJhbeU3pVz9ByHzl1xbXquzib91HVfx5SEqn+Mlf4TGqPlGbWjaXxuN5
 xZBCalowRpKnRUQygOELr2EYj1txyLFPKIreiyi94g1T4V5VG15oI8MJ0tbfVZwNbv
 IKVayumeCjylg==
To: jaegeuk@kernel.org
Date: Mon,  3 Mar 2025 11:25:00 +0800
Message-ID: <20250303032500.1310215-1-chao@kernel.org>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs_recover_quota_begin() and f2fs_recover_quota_end()
 should be called in pair,
 there is some cases we may skip calling f2fs_recover_quota_end(), 
 fix it. Fixes: e1bb7d3d9cbf ("f2fs: fix to recover quota data correctly")
 Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/super.c | 2 +- 1 file
 changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1towRL-0005er-0j
Subject: [f2fs-dev] [PATCH] f2fs: fix to call f2fs_recover_quota_end()
 correctly
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

f2fs_recover_quota_begin() and f2fs_recover_quota_end() should be called
in pair, there is some cases we may skip calling f2fs_recover_quota_end(),
fix it.

Fixes: e1bb7d3d9cbf ("f2fs: fix to recover quota data correctly")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 7a8fcc1e278c..3c875dc07266 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4805,10 +4805,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		}
 	}
 
+reset_checkpoint:
 #ifdef CONFIG_QUOTA
 	f2fs_recover_quota_end(sbi, quota_enabled);
 #endif
-reset_checkpoint:
 	/*
 	 * If the f2fs is not readonly and fsync data recovery succeeds,
 	 * write pointer consistency of cursegs and other zones are already
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
