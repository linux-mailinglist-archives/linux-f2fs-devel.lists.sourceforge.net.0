Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1471D866AF7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Feb 2024 08:36:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1reVWm-0002xZ-3J;
	Mon, 26 Feb 2024 07:35:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1reVWk-0002xP-AF
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 07:35:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nEPJ26NFMrTmL49thufpcKhb2K7Qjw5iU5l47qd9Nlw=; b=Cqv6taY9jljpo5y9S6UO1afXrm
 oK73FFCIAXddwWqMfltBPBdKoVcm93rpag6C635JtjO6wzoF1rzaaemg9PbEC5MNWmLa/loHtnGGc
 4YN6UxBGOjLXpit6LgMSFMRMbvQy70PgwDTNL8p1K5qVM77vgcYre06u/wcsZeZG1CJ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nEPJ26NFMrTmL49thufpcKhb2K7Qjw5iU5l47qd9Nlw=; b=PDYkOBgD+4Y/mJaoirHfMSTWvs
 izR1rdltxdRrCbTZ9qeHfiSiqbweVM/wBFZdHeHZoupH0oq2+1pdCYqD+PE2jV46lGswWYaNwl6EJ
 TL88OUNXq81TDYZmybDZxz6ds9wSnoeCKmKustpxJPtGWEZnrsTdnhCoskbadf5ugLnA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1reVWj-0002xq-Oh for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 07:35:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4E3AD60FA5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Feb 2024 07:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C106C433B2;
 Mon, 26 Feb 2024 07:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708932947;
 bh=DM7lCeAQkkrdeMDm7IxgfNbaFgZdno2MS54NUJmA8dw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I3ajVGpgQc6l7+OU17u75YYhHNroOTJz8hHJTRRGAnv31ib+bQX+ozAzTBiBlyody
 2trvL2ADY8ta0KNNzk6otf5eBw74LSiUdxJURZJgqTmT8SckTYPAwS1AO+ykCMImQy
 2L74/p3AcflUs0sYfV6OVwSsN6l78h659dpZsrI6uciQzUVioiuGLSxXRuG9+99DJX
 Zt6L4BprJAHNjZJx+BjVzuOtUIlubCWPyXKRfmZUSfOqZdTfirUQuZ32PMcuuEnUvC
 /3OV5svysGVXzPXYeF5YwxKHZpa8twJqYPGmkPfShE9aHNaDRDwEjs8RrDAmAutWnC
 nZRx0aWJ7IAqA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 26 Feb 2024 15:35:39 +0800
Message-Id: <20240226073539.2509926-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240226073539.2509926-1-chao@kernel.org>
References: <20240226073539.2509926-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  [ 9299.893835] F2FS-fs (vdd): Allow to mount readonly mode
 only mount: /mnt/f2fs: WARNING: source write-protected, mounted read-only.
 root@qemu:/ ps -ef|grep f2fs root 94 2 0 03:46 ? 00:00:00 [kworker [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1reVWj-0002xq-Oh
Subject: [f2fs-dev] [PATCH 2/2] f2fs: ro: don't start discard thread for
 readonly image
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

[ 9299.893835] F2FS-fs (vdd): Allow to mount readonly mode only
mount: /mnt/f2fs: WARNING: source write-protected, mounted read-only.
root@qemu:/ ps -ef|grep f2fs
root          94       2  0 03:46 ?        00:00:00 [kworker/u17:0-f2fs_post_read_wq]
root        6282       2  0 06:21 ?        00:00:00 [f2fs_discard-253:48]

There will be no deletion in readonly image, let's skip starting
discard thread to save system resources.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b486fe4485f9..cc27c5440188 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2253,6 +2253,12 @@ int f2fs_start_discard_thread(struct f2fs_sb_info *sbi)
 	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
 	int err = 0;
 
+	if (f2fs_sb_has_readonly(sbi)) {
+		f2fs_info(sbi,
+			"Skip to start discard thread for readonly image");
+		return 0;
+	}
+
 	if (!f2fs_realtime_discard_enable(sbi))
 		return 0;
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
