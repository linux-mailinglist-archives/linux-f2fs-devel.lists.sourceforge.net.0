Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1920884ACD2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Feb 2024 04:25:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rXC5V-0006t9-GE;
	Tue, 06 Feb 2024 03:25:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rXC5V-0006t2-02
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Feb 2024 03:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gk55SXanSrl3dNr9vVQ5VcisBg4T7+mHAzw2xiMXg7s=; b=XEXbjcnqqOEUkaM/CcVawMDQ2m
 Fi658ynOFqVIUNtIB64NwQusrjY2yBIpICZA8uHc8q8wsHqQ9vqsxaimnvhYmntROOtxkf+pY4DLe
 qFK2wN7+fOaKyP6kGlsoIpgsbtz4REitqD0T/Bc8863/Aw/ihgnKdHti2WqC1DMvG9+8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Gk55SXanSrl3dNr9vVQ5VcisBg4T7+mHAzw2xiMXg7s=; b=k
 MI4L71Kq556YDwL2DeTFhkyVHpub5lgnRuQeEr7dEY6OY+szjyt8qB2xHc0xynKOYCyi//JnzZ7fw
 O5LsTB2j8xjawyCPpEY5bFS1uGGn+k/pqzdSdPRkpois42p6OnIAs67f+vYN5GBTlrNrI6hGpcj6k
 UezrGTINdHdWTpos=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rXC5P-0005Fw-S2 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Feb 2024 03:25:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1D1A960F7C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Feb 2024 03:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A3B1C433C7;
 Tue,  6 Feb 2024 03:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707189922;
 bh=uWUoGxk1soKi48WeLbyMNDv0+uwWzfBe0kdt6djUZXk=;
 h=From:To:Cc:Subject:Date:From;
 b=Acy3YkNDuxj0k6ZMio91/8HBDLFbZMAD77t8Vpoye+CQ4GnJrqzKOxmFrvIQXXKo+
 b6TDErA8CiwanzVyrVxTqYftQ6tpTjb3xi690zFFU2r884vKRdihQEiv94iNP2Nzyc
 Mw53ZHehZoEGncbAsIXn4WiIzSX+2ZtoK161ZDgAiy8WsjrZ2HgUgJnkdhwwoHIcpW
 y6HlkQsxvEDbn7iZe2hjMRxrbCSp8DtUnaRr61m1C1WNzW/4MuOLPTfIM42thFgHDl
 OesCfYKU+YnXJZQ8jtnfWmxNnlhXTJy9h3BxgAflQMNgDpZ003vHSUDzr3Mxs8n0zx
 t4KBvflZ1v2SA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue,  6 Feb 2024 11:25:13 +0800
Message-Id: <20240206032513.2495025-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: generic/730 2s ... - output mismatch (see
 /media/fstests/results//generic/730.out.bad)
 --- tests/generic/730.out 2023-08-07 01:39:51.055568499 +0000 +++
 /media/fstests/results//generic/730.out.bad 202 [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rXC5P-0005Fw-S2
Subject: [f2fs-dev] [PATCH] f2fs: fix to return EIO when reading after
 device removal
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

generic/730 2s ... - output mismatch (see /media/fstests/results//generic/730.out.bad)
    --- tests/generic/730.out	2023-08-07 01:39:51.055568499 +0000
    +++ /media/fstests/results//generic/730.out.bad	2024-02-06 02:26:43.000000000 +0000
    @@ -1,2 +1 @@
     QA output created by 730
    -cat: -: Input/output error
    ...
    (Run 'diff -u /media/fstests/tests/generic/730.out /media/fstests/results//generic/730.out.bad'  to see the entire diff)
Ran: generic/730
Failures: generic/730
Failed 1 of 1 tests

This patch adds a check condition in f2fs_file_read_iter() to
detect cp_error status after device removal, and retrurn -EIO
for such case.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 45b7e3610b0f..9e4386d4144c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4462,6 +4462,9 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	const loff_t pos = iocb->ki_pos;
 	ssize_t ret;
 
+	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
+		return -EIO;
+
 	if (!f2fs_is_compress_backend_ready(inode))
 		return -EOPNOTSUPP;
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
