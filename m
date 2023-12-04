Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEC6803C41
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Dec 2023 19:06:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rADKn-0006gI-AS;
	Mon, 04 Dec 2023 18:06:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rADKd-0006fz-Fi
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Dec 2023 18:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WaJlEH/++VC+v9tG2BsAu8oDPgJLhP2650jhnkShQuA=; b=KxsHsFu2Eh29mWiyC3WG+IH4CQ
 ZdNIer+LU0ePKBE6z+hb26fcRAGWZqmVmwyJU7Hm/qCImYRNoRviIVvN7zT7xqYjGEEzhGzxLAymT
 dRUu8elq0hJNR/wSJY0m3jtS3sut1PCIa5KkPAk4aMsWtjxVspMOJcWeakYlzALFq/Mc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WaJlEH/++VC+v9tG2BsAu8oDPgJLhP2650jhnkShQuA=; b=n
 CA3qDxXegg4p5ULQM0d86JCSBVKRge1vk1jx+WaggaiwoCgmwWQZL16hOImK7q5ZdvVEAIi61h++B
 rV98K+wLPMDN29Z1WcGAM5trByOT26TZVPk0bASkSznUk8nE2+qq2RAvJjeQcwzop1OGhiHXYqrW7
 RxK7a6XPofXyeeac=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rADKW-0003dL-5V for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Dec 2023 18:06:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BC5D061290
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Dec 2023 18:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57FEEC433C8;
 Mon,  4 Dec 2023 18:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701713153;
 bh=pVeKyh5obs5OlOFOMa4pf4drjJGtibYlNksDZqlh3m4=;
 h=From:To:Cc:Subject:Date:From;
 b=N8tsmCVKlEOqQNgCjSqCS958Dqwr3218/r+xfboxvCScpCyafFEha0a333w9n5OC6
 yoc0iXAr35MBAxgCbnnavdfelGEQzdsLXQoXZFa3s61ulghgJlqJbZunZsnEBNTu8N
 F5dCwFUM72yWpGDA17K0TlEbahyvhMWqWFc1VrpEtnkcSW4w2sBzyGoM89jiYyBUb/
 JqbI65ilENhSCwVLPZ5NKWxw0mtIX2/wbw0On5PGVFjqJel34bWRaNHauHyVpUAe8E
 QMpsbsLFE/lEfc7aFfsORgqBCHXI5A5tLIHY2V/vjMcBmLSKc1CbQ5kcFY49RYARNo
 lDqyhiHccb69g==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  4 Dec 2023 10:05:51 -0800
Message-ID: <20231204180551.927014-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Let's fix any inconsistency until checkpint being enabled
 back. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- fsck/mount.c | 1
 + 1 file changed, 1 insertion(+) diff --git a/fsck/mount.c b/fsck/mount.c
 index e957904494ef..30c62280b281 100644 --- a/fsck/mount.c +++ b/fsck/mount.c
 @@ -1435,6 +1435,7 @@ static int f2fs_should_proceed(struct f2fs_super_block
 *sb, [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rADKW-0003dL-5V
Subject: [f2fs-dev] [PATCH] fsck.f2fs: run full scan if checkpoint is
 disabled
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

Let's fix any inconsistency until checkpint being enabled back.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/mount.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index e957904494ef..30c62280b281 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1435,6 +1435,7 @@ static int f2fs_should_proceed(struct f2fs_super_block *sb, u32 flag)
 {
 	if (!c.fix_on && (c.auto_fix || c.preen_mode)) {
 		if (flag & CP_FSCK_FLAG ||
+			flag & CP_DISABLED_FLAG ||
 			flag & CP_QUOTA_NEED_FSCK_FLAG ||
 			c.abnormal_stop || c.fs_errors ||
 			(exist_qf_ino(sb) && (flag & CP_ERROR_FLAG))) {
-- 
2.43.0.rc2.451.g8631bc7472-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
