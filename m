Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1085FA799
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Oct 2022 00:16:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oi146-0000uu-JJ;
	Mon, 10 Oct 2022 22:16:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oi144-0000ue-Pa
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Oct 2022 22:16:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gQV77Chf/GSWmXChjOyoIVnxLoGosSsgPxzG08E9QsA=; b=iIoTqp9PmHVC7C3qJyzkOAKaL/
 0Bb47c8niNxlM4Wz7gS19/Vo0tcF9MPOQ/vaegXdfKqD/bN8rOTcWXBT4fRhL61v+0StPWcAdd+tL
 u9Nq1p4kgld2wi8ruzGI8kRADKVgtlNhE56KYVL+SJ8aqwc0o/qUyWVWd98L0i5BgPwg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gQV77Chf/GSWmXChjOyoIVnxLoGosSsgPxzG08E9QsA=; b=XrIJG0yN3KYv4TpFhgMtX040q0
 vb5/o3vRcHUHBV9vtRClLIN6kDCOJcZa67Zy+318530jlk5H7PZsTuBDNL44VnPRDSTCFJycB45td
 IOBWC/8Keuvv6Mx6aEB0UHh6DhDJHLGrKxE3f4mO9R9LXy9Rog9R2yL44f8wIKEtFG8o=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oi141-001Qqn-8m for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Oct 2022 22:16:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD6B46103F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Oct 2022 22:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A087CC433D7;
 Mon, 10 Oct 2022 22:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665440151;
 bh=3OUQNeAkTCtSqjS0L0nGoMjyvy6D/AtHaHO/WsORh3g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eVCdyiaSnNjiAslzah+9n3Zasb4mZ4aNrOmJ+Tq7HIFSeTICpD0Z4SgZ5J0OI7q9n
 XffuKVvAYeDjLv8Or8a7YGyThZsNL9FDDzvOHZhu11ZTsMrNkqdqzmTqYFnd2wZD7u
 nvm3wRpeyMQIZhoKunXM44JkYFCyEID/wHqSM3HHUR0jY6+1taJIvGu8CrqawCLOpk
 h0394DV7sbJZOvW1NbCMr657TXGSMuycYF00PYCS15zhQRgpG3GmhgFbGO7KRRpxbR
 ik4LaHFdkai+5NOuTvReKpvutKqdo27XXODj7FLDrfFG5dH/xASLYnYOTP6mpQ12jn
 a3niVJSibh3LQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 10 Oct 2022 15:15:48 -0700
Message-Id: <20221010221548.2728860-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221010221548.2728860-1-jaegeuk@kernel.org>
References: <20221010221548.2728860-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: It'd be good to generate zone-aware sequential writes to both
 of HA and HM zoned devices. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
 --- fsck/mount.c | 2 +- mkfs/f2fs_format.c | 2 +- mkfs/f2fs_format_main.c
 | 2 +- 3 files changed, 3 insertions(+), 3 deletions(-) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oi141-001Qqn-8m
Subject: [f2fs-dev] [PATCH 3/3] f2fs-tools: set host-aware zoned device
 similar to host-managed one
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

It'd be good to generate zone-aware sequential writes to both of HA and HM
zoned devices.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/mount.c            | 2 +-
 mkfs/f2fs_format.c      | 2 +-
 mkfs/f2fs_format_main.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index cd8a07538150..25b7f3b29899 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -987,7 +987,7 @@ int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
 	}
 
 	/* Check zoned block device feature */
-	if (c.devices[0].zoned_model == F2FS_ZONED_HM &&
+	if (c.devices[0].zoned_model != F2FS_ZONED_NONE &&
 			!(sb->feature & cpu_to_le32(F2FS_FEATURE_BLKZONED))) {
 		MSG(0, "\tMissing zoned block device feature\n");
 		return -1;
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 5daf1a17c77d..c314d1c330a8 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -454,7 +454,7 @@ static int f2fs_prepare_super_block(void)
 		 * not overlap to metadata area.
 		 */
 		for (i = 1; i < c.ndevs; i++) {
-			if (c.devices[i].zoned_model == F2FS_ZONED_HM &&
+			if (c.devices[i].zoned_model != F2FS_ZONED_NONE &&
 				c.devices[i].start_blkaddr < get_sb(main_blkaddr)) {
 				MSG(0, "\tError: Conventional device %s is too small,"
 					" (%"PRIu64" MiB needed).\n", c.devices[0].path,
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index d2c2605ae6a5..f50971c4591c 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -480,7 +480,7 @@ int main(int argc, char *argv[])
 	 * Some options are mandatory for host-managed
 	 * zoned block devices.
 	 */
-	if (c.zoned_model == F2FS_ZONED_HM && !c.zoned_mode) {
+	if (c.zoned_model != F2FS_ZONED_NONE && !c.zoned_mode) {
 		MSG(0, "\tError: zoned block device feature is required\n");
 		goto err_format;
 	}
-- 
2.38.0.rc1.362.ged0d419d3c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
