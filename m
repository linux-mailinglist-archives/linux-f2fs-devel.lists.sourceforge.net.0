Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E88F462B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 12:40:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iT2dI-00060C-I0; Fri, 08 Nov 2019 11:40:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1iT2dG-0005zy-II
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 11:40:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/ZwBZ/VnhHHUBGAw+4mo5/wmsQVjfjHYtcCWSJaTFSw=; b=WPnJJ1FdZkksWzUbem94kAvVPk
 eMUg0dxHPwFxUbliLG9HGpRnrOPrbhajJPKOPI41OwoDqpObuRpnSBt/EK1MLwm8/D9IexXXns+M0
 7UpmC8IduoFB3tLQ+Dcq6JBSWWzuOtp2clLKgxguDCRQ/8a4j9RFkzPVWuAGpM23CuKE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/ZwBZ/VnhHHUBGAw+4mo5/wmsQVjfjHYtcCWSJaTFSw=; b=Mc5IrEFFZOVUYNXVrGrl+CBrDd
 SQ0Ij75fh9Q2GhgwpSkmFOgYrnS74mC32yGOaAoSbQoLgrQThKu43N3hPAL+P6XZGt+Hy7RCoOs6O
 WVmNL+VD/dcz+0U9X62q+9VjwpjQUDPu6LcY8a4EB3jLJc4FZIRYPvfn/QZPQ1uwJi7o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iT2dF-004v07-GX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 11:40:50 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C0F521D7F;
 Fri,  8 Nov 2019 11:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573213243;
 bh=jG2aSz2Pb4y1MKAx7DVTE3iYnfIdbnCZP2NYAc2w5SQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gcosBiwtD2tA6XPjC0baVgWhns7RtEYnLfdQsNTMDDefcJPF/UdMFCtFOYM2YYK/W
 NiGRP+v7zU5tbUlkIYNn8G2JBXaZK5teQOme+2wB/6WsU7wc/3IIi3sdYApjH7MTGD
 6pq5ue41XcufQgObtaiancvHO6GZ+HCnHFZkI2Tg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri,  8 Nov 2019 06:36:19 -0500
Message-Id: <20191108113752.12502-112-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191108113752.12502-1-sashal@kernel.org>
References: <20191108113752.12502-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iT2dF-004v07-GX
Subject: [f2fs-dev] [PATCH AUTOSEL 4.19 112/205] f2fs: submit bio after
 shutdown
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim <jaegeuk@kernel.org>

[ Upstream commit 5ce805869cbed93267ed26552ff76e30f05c91f7 ]

Sometimes, some merged IOs could get a chance to be submitted, resulting in
system hang in shutdown test. This issues IOs all the time after shutdown.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/data.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c61beaedf0789..b4a634da1372b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -543,6 +543,8 @@ skip:
 	if (fio->in_list)
 		goto next;
 out:
+	if (is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN))
+		__submit_merged_bio(io);
 	up_write(&io->io_rwsem);
 }
 
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
