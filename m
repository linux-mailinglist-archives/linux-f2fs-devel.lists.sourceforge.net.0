Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C857B1D06D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Aug 2025 03:49:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4lIZNh5DlsGazeVuVCoX4p2kJo9D4T9PUI2byTjkQEc=; b=VnNUR2TYk88NdGTwh0prtGeZqg
	VY/31mbCND6m9n07kWbBWfH1iX9CTDbfPLOMGh7qadkdgX0+slEQVYVYBJO0yRdB0XPCEFFkjyP7R
	68pc6jff87tPiTbeMAJWitqFdUw/6u9JdImJOb8XT8KVozG1e/BTyosJxhaRs5FfhiZA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujpkb-00042a-H9;
	Thu, 07 Aug 2025 01:49:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ujpka-00042T-7Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 01:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O3vClsNkzFb5Phs2+gg9x/GGIlRep9a/PQ6Rm4TXFg4=; b=VHZC1hYI/2E9CHAHEJcPAXIj4q
 znvfMLhb15FOlEQhjXRfWo/dUc3adnFq2tr55UzTTDM+x74t1s/QgmfKHQ3ed8wK/BKlGUXIrv3Qu
 2TQ93UxEUoThFkaDWq148z2xRl6XOQboUsN41B98DOWIx1c1MDBkRYiy16ACD0ZCKFu8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=O3vClsNkzFb5Phs2+gg9x/GGIlRep9a/PQ6Rm4TXFg4=; b=K
 PqAjxe861f58rYyhOhencM9a+4XxQBPAS5MJcWdfJ2tsa+kYiQdfesK2pImjdd+1xlsof6a8E4FEd
 tX2xwti1jBlMmrPZu2ntwF4rLrqyGPjLm2PSvtk6XgQXYs0cBAF2VUZqpYUEnNJx0Dta/DC+FKjQf
 VGvoxuZCcPXn7ksI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujpkZ-0006Z1-TN for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 01:49:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 997CF45C51
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  7 Aug 2025 01:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64CDAC4CEEB;
 Thu,  7 Aug 2025 01:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754531334;
 bh=NwGyzV0uPsVPS98dCHheGmGxPIh3v1lpFVzgj9NHjQ8=;
 h=From:To:Cc:Subject:Date:From;
 b=pwG8Fu7t+iYodC1k+T7Mxon11m2dralbZeg5KG5rJC0mDdnhhpBFFUs01nkvkNEQQ
 oTKMHT9P121wlRScZ/4mudXUWrDU3hDQIjFUzxrzeNGSETz1Qx29M32asSHLUfgTTz
 FM1dpN7w+jMo0fZ1CI0rMDTpVIdVtLW3Ma0k0QLeYcvSbSStjzSxZQozgRfqdAuvbk
 9t3+AGpD2a9z0xgBvFH/Ruys6lKUwBCymhDo52gSOnNID1Nbzywi9W+vJZZAW908LZ
 Vrcgj7dVWMxrDIyS+EcKYzKmJpQczqSZ8wxOV9GFKaB+jesjO7Yj/cL0ViEwCvEUEd
 NT7XtWXh/TTyg==
To: jaegeuk@kernel.org
Date: Thu,  7 Aug 2025 09:48:35 +0800
Message-ID: <20250807014836.3780988-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: mount -t f2fs -o checkpoint=disable:10% /dev/vdb /mnt/f2fs/
 mount -t f2fs -o remount,checkpoint=enable /dev/vdb /mnt/f2fs/ kernel log:
 F2FS-fs (vdb): Adjust unusable cap for checkpoint=disable = 204440 / 10% 
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
X-Headers-End: 1ujpkZ-0006Z1-TN
Subject: [f2fs-dev] [PATCH] f2fs: fix to clear unusable_cap for
 checkpoint=enable
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

mount -t f2fs -o checkpoint=disable:10% /dev/vdb /mnt/f2fs/
mount -t f2fs -o remount,checkpoint=enable /dev/vdb /mnt/f2fs/

kernel log:
F2FS-fs (vdb): Adjust unusable cap for checkpoint=disable = 204440 / 10%

If we has assigned checkpoint=enable mount option, unusable_cap{,_perc}
parameters of checkpoint=disable should be reset, then calculation and
log print could be avoid in adjust_unusable_cap_perc().

Fixes: 1ae18f71cb52 ("f2fs: fix checkpoint=disable:%u%%")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f37004780ce0..c1f45df9efec 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1014,6 +1014,10 @@ static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 			ctx_set_opt(ctx, F2FS_MOUNT_DISABLE_CHECKPOINT);
 			break;
 		case Opt_checkpoint_enable:
+			F2FS_CTX_INFO(ctx).unusable_cap_perc = 0;
+			ctx->spec_mask |= F2FS_SPEC_checkpoint_disable_cap_perc;
+			F2FS_CTX_INFO(ctx).unusable_cap = 0;
+			ctx->spec_mask |= F2FS_SPEC_checkpoint_disable_cap;
 			ctx_clear_opt(ctx, F2FS_MOUNT_DISABLE_CHECKPOINT);
 			break;
 		default:
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
