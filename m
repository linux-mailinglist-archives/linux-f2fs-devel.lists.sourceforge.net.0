Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0175D4060DC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Sep 2021 02:20:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mOUHl-0001bX-Lq; Fri, 10 Sep 2021 00:20:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1mOUHj-0001bQ-G3
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Sep 2021 00:20:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jSXYyR+WBSoFJB57uTpdSBiq0FTT0XdRj5dvPWzxrjk=; b=KoOBHUB+62m3QccIZ1JISx7Rwg
 aefTjQpxcWacFzJOh7gwZPm4dBUkic6UIx012Ol4UanmUPlwzeYo0I5Ug5US/bd1655FHSms26J58
 uPsneoxRnIH/H0hfPXg4tNQobEXAN3hIwX3903xTqFTpLoExSOZDneknW5fdwYsYXXT4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jSXYyR+WBSoFJB57uTpdSBiq0FTT0XdRj5dvPWzxrjk=; b=dJmGF4OlIohYpl8mvvNeKFQj/Z
 ry/AfRRpNcZnxOCTU+2pF8s1rOkyei+cgn8JfqDxSEgZZn9JLCXRAe+mqWsehmr+r/GxJwpHjMkud
 OwJUnzEcLJQvq64/+reY6uth6IIcA03CYXXoazHtqxnMh4hl5KlzFmny3XknjSD1Fex0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mOUHj-0004bG-0C
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Sep 2021 00:20:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDAC5611AF;
 Fri, 10 Sep 2021 00:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233245;
 bh=MnGVpVdK97dQEsvJqPe76SatuOM9qfsxF4TwlOnen3U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R8gfg9tR5YqMmT1E5z7mVzxbyAKUDZVoaLY0QmRZB56jO1kBp3S+mEhyxOfeGB8K4
 /SS/b/HTnGSFq9YP4D/DyVRfFYL4a+u3864qYbCAp3S9NoU8AXBiQPlZI4tMSdd5Fg
 JRt5nNs7KJfP4adA9N2uL85D3zuJN14IKZdwwYuiLUnMFoacVzvUoO9iknP3aCL9OZ
 nz/TykG2aauGrQiPT7IvbZTxlW66wxUlDrYlNzqs6qjl2j2bSDKRVBo1I5mstlGGWN
 WBP85ooeZmWbz7nzFD6jYRWzra2a4bSM9SOk3TvDJ4IKpg8+Cm4GOBiYmvftTDwofN
 frTQRlH8vyHFw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  9 Sep 2021 20:19:47 -0400
Message-Id: <20210910002028.175174-12-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910002028.175174-1-sashal@kernel.org>
References: <20210910002028.175174-1-sashal@kernel.org>
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
X-Headers-End: 1mOUHj-0004bG-0C
Subject: [f2fs-dev] [PATCH AUTOSEL 5.10 12/53] f2fs: fix min_seq_blocks can
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
index d04b449978aa..730f028e8f49 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -5109,7 +5109,7 @@ int f2fs_build_segment_manager(struct f2fs_sb_info *sbi)
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
