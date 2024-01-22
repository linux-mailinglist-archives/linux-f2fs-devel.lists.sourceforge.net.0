Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E98836757
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jan 2024 16:13:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rRvzZ-0002Mk-Jy;
	Mon, 22 Jan 2024 15:13:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1rRvzX-0002Me-PC
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jan 2024 15:13:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UjDk2/Hp3CwE09RtgftPpJV4JbVxNthsQGUNFex9UVU=; b=T3o2h7MQUNaIVcHvXlqyoCpx6d
 WaiSpEMjkfyqQIR34O8v4V/nTYzdT3pagmfWzRlLLJ/RsWHqDn/piQkig6PL4FjfX1RRy/gs6ZXE8
 2C2h8Gf63668WyyMAW1G2voguO6gnb7ZmMTXIdxeQQ0+0RTeLyrzk3y6NvdsObrkaAvo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UjDk2/Hp3CwE09RtgftPpJV4JbVxNthsQGUNFex9UVU=; b=AVwkKOEmqQrFqDVgJgJaTDUUW7
 zPowDaGJUROkk3rg6SsT2TT5/PR2AK4pdWZiM1oDer68boaSGdBjp7dvEvxItUzpilpmjz8UiDp6f
 OmxwKVo2PTzS8u3jlDcM1x9mZDgGl0kBAKw8n6ia7vG+cn29KZAn4tZyaACjN1IYvW98=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rRvzT-000425-GW for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jan 2024 15:13:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E151AB80E89;
 Mon, 22 Jan 2024 15:13:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F01C433C7;
 Mon, 22 Jan 2024 15:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936404;
 bh=Hrod67hh4LkwO/pTdv/A52E6Qb1RnNmgHSwfUZ/J2JQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qj/oHkqfGMRTQaNTqUj74hc3ml7xSgyR8qSfF3HAsgWqMoX325lOdazj8j26xFR4K
 X3x5tD6VYUBGc/MAH/vBQ4N5pWzFC51Tsa2/PlfHZfzyVITEoN+ZIIReP63AAs8qFd
 SzZF2PiBYxdsuQML7NWzAWQg3c64YPuRIKtAsRbnO/gBBvFs/6KEvLHmDen+1draPB
 FrElM8NjaZck0igOLIQ8Cz9jMoEvsGnHhq3x1ITTd6Ed3Tb71WMbI8f68UONIT75du
 e9RQEyTsB320x4ZYC9ZXheCINl7fjTyzJ+vLr1p7vSEBn6mNAaj45zjsIj7L14Aqsj
 c33+PiO+GH2+Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 22 Jan 2024 10:12:05 -0500
Message-ID: <20240122151302.995456-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122151302.995456-1-sashal@kernel.org>
References: <20240122151302.995456-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.147
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Jaegeuk Kim <jaegeuk@kernel.org> [ Upstream commit
 9dad4d964291295ef48243d4e03972b85138bc9f
 ] 1. do roll forward recovery 2. update current segments pointers 3. fix
 the entire zones' write pointers 4. do checkpoint 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
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
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rRvzT-000425-GW
Subject: [f2fs-dev] [PATCH AUTOSEL 5.15 08/35] f2fs: fix write pointers on
 zoned device after roll forward
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
 Daeho Jeong <daehojeong@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim <jaegeuk@kernel.org>

[ Upstream commit 9dad4d964291295ef48243d4e03972b85138bc9f ]

1. do roll forward recovery
2. update current segments pointers
3. fix the entire zones' write pointers
4. do checkpoint

Reviewed-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/recovery.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index da0801aa4118..f07ae58d266d 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -871,6 +871,8 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	if (!err && fix_curseg_write_pointer && !f2fs_readonly(sbi->sb) &&
 			f2fs_sb_has_blkzoned(sbi)) {
 		err = f2fs_fix_curseg_write_pointer(sbi);
+		if (!err)
+			err = f2fs_check_write_pointer(sbi);
 		ret = err;
 	}
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
