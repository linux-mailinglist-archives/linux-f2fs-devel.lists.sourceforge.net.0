Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC457685FD
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 30 Jul 2023 16:26:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qQ7N4-0002mJ-Vo;
	Sun, 30 Jul 2023 14:26:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qQ7N4-0002mA-5M
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 30 Jul 2023 14:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YbMBmeWMEOJmsklkaGJnWiQaOCUvKxP8nHbvTZhok64=; b=elvT78cfojTbngHG8pIQCjQvbh
 F+XYTjxyqpgzbl7IZh1vHQAq/qgij6AjCSN8aUWYOKSycgcJxG+HR6QsXOLCVn6hWg+F2p18g7vr6
 2xQwWomJnWM2oFymvrmD63DJDJIJ07PpCb6GPoLua2pKwKyLqPA3A0ksdJam6P82+Mv0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YbMBmeWMEOJmsklkaGJnWiQaOCUvKxP8nHbvTZhok64=; b=i
 tcHupLUt83Fsx8N5350sWXTKe5JumkoQaNlBOpc4uxCm1IZ9HbBGf1IuegPYyJtWU2AsGyuVUhwlp
 xpoNDg/mNS6jPaOnChf66LQnLFth2BgM729R0QTASrWD4PVzTkCvoZ8oSOg4a+C8Fac8V90rz0Sir
 Y2zKc4d/kwJI1B68=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qQ7My-0004Ze-QC for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 30 Jul 2023 14:26:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 38F8D60BA3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 30 Jul 2023 14:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66557C433C8;
 Sun, 30 Jul 2023 14:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690727158;
 bh=d8GF2nj75dcAK/W9xm27IQOlnskgBpm9dOo8ZbtueO0=;
 h=From:To:Cc:Subject:Date:From;
 b=r9uankZ7WV2NH7kxQVR4E7GJxfRrmfeRRSEqY/T7MMQISryAIPzyvqDkEa2xmTo4J
 ikfUr1rRYoSiu5NxCTcB/TRvOPB9i+m4A0hlZ226R4O7WWkzseocgfREbAGn+sj8UL
 yMW3+YJv2BfVCROnAZZ9HYJ8GS1v4Db3VKEN7xunZBJ0ekWRgqX+/YW4VdhyZzl+PM
 A0jx57OnYvlrBMHubevOAIUOfKRDBu8OqKyLr056BOsw5ECuHdU1kfRp0a+UbUfyUs
 TGrE07RgEul+Bc3Y8IldPVdY/imRuPEtyKmu7DbnQfjXEGltpByd+Fid+67Se+X1m5
 S4o6UGtMR43Wg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 30 Jul 2023 22:25:51 +0800
Message-Id: <20230730142552.3918623-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The description of max_small_discards is out-of-update in
 below two aspects, fix it. - it is disabled by default - small discards will
 be issued during checkpoint Signed-off-by: Chao Yu <chao@kernel.org> ---
 Documentation/ABI/testing/sysfs-fs-f2fs | 6 +++--- 1 file changed,
 3 insertions(+), 3 deletions(-) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qQ7My-0004Ze-QC
Subject: [f2fs-dev] [PATCH 1/2] f2fs: doc: fix description of
 max_small_discards
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

The description of max_small_discards is out-of-update in below two
aspects, fix it.
- it is disabled by default
- small discards will be issued during checkpoint

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index ad3d76d37c8b..36c3cb547901 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -102,9 +102,9 @@ What:		/sys/fs/f2fs/<disk>/max_small_discards
 Date:		November 2013
 Contact:	"Jaegeuk Kim" <jaegeuk.kim@samsung.com>
 Description:	Controls the issue rate of discard commands that consist of small
-		blocks less than 2MB. The candidates to be discarded are cached until
-		checkpoint is triggered, and issued during the checkpoint.
-		By default, it is disabled with 0.
+		blocks less than 2MB. The candidates to be discarded are cached during
+		checkpoint, and issued by issue_discard thread after checkpoint.
+		It is enabled by default.
 
 What:		/sys/fs/f2fs/<disk>/max_ordered_discard
 Date:		October 2022
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
