Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FD94E1C34
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 20 Mar 2022 16:11:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nVxDd-0006um-Qy; Sun, 20 Mar 2022 15:11:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nVxDc-0006uf-UG
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 20 Mar 2022 15:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZJexcim5fo4/c3UB0m00xqOWv3RvwU3FCRl/1SWBaQ0=; b=mWjPRAf0jgXZYW5qG/OA09kagD
 7XxxJUspZ/dNSL0eFvZn73fgatMDIcQrITge8inI7CmrAxPHC/hjyXGpCAGmpfob6/1Is/fldDe46
 Y3qxsvycaS2XVKsMPKAh0HM1Kg1420Hd7RsjB3nK+5fpgyzq/8W+/TnBOUW4gXdH7GBQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZJexcim5fo4/c3UB0m00xqOWv3RvwU3FCRl/1SWBaQ0=; b=f
 VdT7YW4QYrRL7buIVIZj6r0X6WU6/1JzFJv2G3NRP3DZeiIZnCI9BvHjVqnaIEX1yfaLcmk8VwlXt
 REIfxeZr7qxb8mHmXnuOY53vzGf1AWpfBs1zHd0OwmT41yBzgqznRLn62X/0MavdotcZu1HzEdGWf
 oP4kpGRVXz+0zQH4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nVxDa-0001Lb-VX
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 20 Mar 2022 15:11:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AD2C961138;
 Sun, 20 Mar 2022 15:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A91C340E9;
 Sun, 20 Mar 2022 15:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647789091;
 bh=KcbLfc7Bfaq3o3LXcOKhrozhNyeQvxBcvnMZGTOFfUc=;
 h=From:To:Cc:Subject:Date:From;
 b=qhR8TDsw5hzRsmRm8oVmTPW0zTbvnCYH3ep65I1MWsQAJS953rD/MVDlzqZV0ydU+
 e8Tcag8aD0SritfgoUBlO25rddxxOSqcPiICz4YBIso0zuLoUDRG6l5P/9T0CpFlqG
 l8/zFDCxt7U7buFjctRnhP2a2yZu9FYWMErpcYWfYx1JchBI2ipwAcrXxq6YPXyGyO
 noHVyprHWmVoHek3vZm113l0qNqZ3hXUcPPxEDB05d2fJ0wIrxLp1GX3eutLOzPCV7
 oRnl2UmohPlCYt5A/gp8VYod0fupn9WgPcDoeBxfr/sShczdpqw838HwIaXPXQv5Ie
 lwvW24OiknAvg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 20 Mar 2022 23:11:17 +0800
Message-Id: <20220320151119.837552-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -6.1 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In order to skip migrating section which contains data of
 pinned file in advance. Signed-off-by: Chao Yu <chao.yu@oppo.com> ---
 fs/f2fs/gc.c | 7 +++++++ 1 file changed,
 7 insertions(+) diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
 index ea5b93b689cd..e83c07144d8f 100644 --- a/fs/f2fs/gc.c +++ b/fs/f2fs/gc.c
 @@ -1480,6 +1480,13 @@ static int gc_data_segment(struct f2fs_sb_info *sbi,
 struc [...] 
 Content analysis details:   (-6.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nVxDa-0001Lb-VX
Subject: [f2fs-dev] [PATCH 1/3] f2fs: check pinfile in gc_data_segment() in
 advance
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

In order to skip migrating section which contains data of pinned
file in advance.

Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
 fs/f2fs/gc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index ea5b93b689cd..e83c07144d8f 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1480,6 +1480,13 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 					special_file(inode->i_mode))
 				continue;
 
+			if (is_inode_flag_set(inode, FI_PIN_FILE) &&
+							gc_type == FG_GC) {
+				f2fs_pin_file_control(inode, true);
+				iput(inode);
+				return submitted;
+			}
+
 			if (!f2fs_down_write_trylock(
 				&F2FS_I(inode)->i_gc_rwsem[WRITE])) {
 				iput(inode);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
