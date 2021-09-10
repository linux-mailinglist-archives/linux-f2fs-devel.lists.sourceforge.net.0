Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 988A54060EA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Sep 2021 02:22:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mOUJA-0001eu-Ux; Fri, 10 Sep 2021 00:22:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1mOUIz-0001eX-31
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Sep 2021 00:22:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tJcj4gc0EU1kSne09MyMD0+pHs+mDV7EqRRH9MCoXD8=; b=kaYw8OF9g+LFTC9tziR95nNP5b
 bXQ0nOnWyIseKiSLcjBqaAjCRG2DIjTmgmoi/vs/k6D0TN8Y00rj2xVMfSIysiR2pJHo0LIduTyZl
 EiYFCx/x5TDeulfKqdGoK0iHwBno7XK/UJfwc+R3jpGoUz3CjzI/2wTzc2RZDtwt4vD8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tJcj4gc0EU1kSne09MyMD0+pHs+mDV7EqRRH9MCoXD8=; b=i3mdthQunL3OPIjvBYRbL5YoGT
 HmVgEqf+W1doyrHJ0k4yX8GMlVAXaz1A1EI48hrz34cJ8s/VnhA+m/wMzYy8M95Y0XZ9gKhMHZhX0
 zY+kn3dQfvaZYC8+bhaax2/HlIFWnyYqhHYqb755mbxuSG6Qlh4rVosEMD598KmmN9ik=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mOUIs-005SAB-Gj
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Sep 2021 00:22:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5568D6058D;
 Fri, 10 Sep 2021 00:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233317;
 bh=rhqq6V+MojK31vuhxkYnM09Uc1gc31+hQcpB2u9iXCk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U3s6N4DVKR+pwbmxMhDcOPFzJDbZ4GM6LpbqVYVoHopZ3qhTcfM3x0xvvQXIHa/Wl
 DkW35XE8Fa07biQMGx1pJOZMO79ToaTYxbGLa/KTMDd4BN7DFUN9QdPxoxDyknz1TO
 5/RRccpkFTsBaxn4J7+jP7RegqvdQJ9z4UM6YGm3oVoZgkZkPUtsilsRfNqtU4C38r
 qVBrqdnQhq+V+bUgPQPMr8YqT3RfnmZ7YfT6PixBHQQnvaGdxVoEAz24Ywfd4sSjxw
 tTZyQDmKHkICZZTNfDrynLiXElggDEM0i/9+ZMKYotArq0Oo3cLDRaFazEF5JSPyJ7
 X8P1IN79Cfc4Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  9 Sep 2021 20:21:15 -0400
Message-Id: <20210910002143.175731-10-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910002143.175731-1-sashal@kernel.org>
References: <20210910002143.175731-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Laibin Qiu <qiulaibin@huawei.com> [ Upstream commit
 dc675a97129c4d9d5af55a3d7f23d7e092b8e032 ] F2FS have dirty page count control
 for batched sequential write in writepages, and get the value of min_seq_blocks
 by blocks_per_seg * segs_per_sec(segs_per_sec defaults to 1). But in some
 scenes we s [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mOUIs-005SAB-Gj
Subject: [f2fs-dev] [PATCH AUTOSEL 5.4 10/37] f2fs: fix min_seq_blocks can
 not make sense in some scenes.
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

From: Laibin Qiu <qiulaibin@huawei.com>

[ Upstream commit dc675a97129c4d9d5af55a3d7f23d7e092b8e032 ]

F2FS have dirty page count control for batched sequential
write in writepages, and get the value of min_seq_blocks by
blocks_per_seg * segs_per_sec(segs_per_sec defaults to 1).
But in some scenes we set a lager section size, Min_seq_blocks
will become too large to achieve the expected effect(eg. 4thread
sequential write, the number of merge requests will be reduced).

Signed-off-by: Laibin Qiu <qiulaibin@huawei.com>
Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 5ba677f85533..d34fdedf7e86 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4403,7 +4403,7 @@ int f2fs_build_segment_manager(struct f2fs_sb_info *sbi)
 		sm_info->ipu_policy = 1 << F2FS_IPU_FSYNC;
 	sm_info->min_ipu_util = DEF_MIN_IPU_UTIL;
 	sm_info->min_fsync_blocks = DEF_MIN_FSYNC_BLOCKS;
-	sm_info->min_seq_blocks = sbi->blocks_per_seg * sbi->segs_per_sec;
+	sm_info->min_seq_blocks = sbi->blocks_per_seg;
 	sm_info->min_hot_blocks = DEF_MIN_HOT_BLOCKS;
 	sm_info->min_ssr_sections = reserved_sections(sbi);
 
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
