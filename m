Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B1E6DC20
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jul 2019 06:14:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hoKHi-0003I3-Sf; Fri, 19 Jul 2019 04:14:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1hoKHh-0003Hv-Qp
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jul 2019 04:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kDJ8Wr705VHYUqFN9bMBGWpd8AXuqGjyRqpA7ce2Xco=; b=gh+wcNz1u+Am3uBo5qt8ecJlUU
 3/6ssD1Z0mkoh0mmSiYSOCNpIIQnnkEO3RIqaREQLiCcqNdiVal0IO3+UY/2+tEpiAU2YCq35Bw4B
 tDxo3Kl8QjjN02I8DiyLexI3t1Ta917aovKqvhkX5SO1EZndtez4wEAahaezdWSsSAVA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kDJ8Wr705VHYUqFN9bMBGWpd8AXuqGjyRqpA7ce2Xco=; b=YVHa2RQtoFSddrm5HF7kUe+yeh
 VKH/c/fgB6n5C+Q0Fx38Wfm8kmKqXhtEhAMg1Ma22KgP8CJUNkH9yliP4ZahB6W+Zi4YecXVpKSdo
 A2YN9blentrXz9e/upiosLtRgGtbFt1cxZwOJShDdAdNztrvYBq3/dGwaKGils0q6pVg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hoKHg-007m2Z-L0
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jul 2019 04:14:17 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A6E621873;
 Fri, 19 Jul 2019 04:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563509651;
 bh=1CvoN+h5knBQsTuZMssi6vI9Bfs1CIK2ruyTPUJUTpM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FA9VR+UCLt72oIp0AS9dWPQaRQA65XbHIWi0BTQDMK1A9pU05RKq/mATVnPFH/5TP
 Ggxfv7TqBPasykDYwV2iABAyF91ScCZQVD3/eLSKu8DP3gD7FS4aAA1kDYuDCSXKg6
 0pYsEuqXHbzzD+/JudHhJ3tqE5Zx7dgJzTtul1vE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 19 Jul 2019 00:12:57 -0400
Message-Id: <20190719041304.18849-38-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719041304.18849-1-sashal@kernel.org>
References: <20190719041304.18849-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hoKHg-007m2Z-L0
Subject: [f2fs-dev] [PATCH AUTOSEL 4.9 38/45] f2fs: avoid out-of-range
 memory access
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
 Ocean Chen <oceanchen@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Ocean Chen <oceanchen@google.com>

[ Upstream commit 56f3ce675103e3fb9e631cfb4131fc768bc23e9a ]

blkoff_off might over 512 due to fs corrupt or security
vulnerability. That should be checked before being using.

Use ENTRIES_IN_SUM to protect invalid value in cur_data_blkoff.

Signed-off-by: Ocean Chen <oceanchen@google.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/segment.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 2fb99a081de8..c983f7d28f03 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1709,6 +1709,11 @@ static int read_compacted_summaries(struct f2fs_sb_info *sbi)
 		seg_i = CURSEG_I(sbi, i);
 		segno = le32_to_cpu(ckpt->cur_data_segno[i]);
 		blk_off = le16_to_cpu(ckpt->cur_data_blkoff[i]);
+		if (blk_off > ENTRIES_IN_SUM) {
+			f2fs_bug_on(sbi, 1);
+			f2fs_put_page(page, 1);
+			return -EFAULT;
+		}
 		seg_i->next_segno = segno;
 		reset_curseg(sbi, i, 0);
 		seg_i->alloc_type = ckpt->alloc_type[i];
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
