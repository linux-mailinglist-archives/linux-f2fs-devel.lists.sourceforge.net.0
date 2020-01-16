Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 614E813E4F0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Jan 2020 18:11:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1is8gN-0003Hb-4z; Thu, 16 Jan 2020 17:11:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1is8gJ-0003HP-0m
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jan 2020 17:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iyYL2Mv1uMGnYJNtFU6pJqIBtdXfAlwieZjkuLn2wmA=; b=NJ3GeGR5/taTysTKiFFH8RwOpu
 IvA3NYJeLa8NalgLaO4TiGfXa/VpDa8q5Us1WRS/q+VRV/frO116j4PxlgZFE9q2l/At/XCPknDTD
 X7IeAgqwItzfrugT6e9uiiRwp+6AYibwfJ8bZxdcbZ2cqzQYY1giUvvb3k3OfZyBog1c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iyYL2Mv1uMGnYJNtFU6pJqIBtdXfAlwieZjkuLn2wmA=; b=LID2Ec+2xo3WlVP0U+HpENh0UN
 Ifs8hhl5iEH8fOEjasU1ecluANOKHzXMG5yUKmIpMNJRit2qL1uZdt4H/TZF0NMwahI4fecj9BTiO
 ihgMYnNk6pynD5ngdL6YHLkGvmhc0HZyrCbJ2zuNWgrisR/R5f/Vu6loAPONNGjWfTaM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1is8gI-009YLw-0W
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jan 2020 17:11:42 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C20A224684;
 Thu, 16 Jan 2020 17:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194696;
 bh=NFOghJbHZHRuK3J9I5B8sv+qIgsl9qZfGJ1OMUcIJgI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qibb/8vZC3PHhdTXoTUpwL8763VxX7mx9o44L28Tov/57oBrlAFZ10q3QwLxgF5gN
 o0rokLaJyqvUrfA4PYO4wtVwXwZ+X3OG7mLlQEvW1a6j/NMwze3SbVwqRJvRpz0bWu
 oABm5XWSaLEfCit6Xg1MV8jhOZBrX0n/ch4Y9Kmo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 16 Jan 2020 12:02:55 -0500
Message-Id: <20200116170509.12787-274-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
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
X-Headers-End: 1is8gI-009YLw-0W
Subject: [f2fs-dev] [PATCH AUTOSEL 4.19 537/671] f2fs: fix error path of
 f2fs_convert_inline_page()
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

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit e8c82c11c93d586d03d80305959527bcac383555 ]

In error path of f2fs_convert_inline_page(), we missed to truncate newly
reserved block in .i_addrs[0] once we failed in get_node_info(), fix it.

Fixes: 7735730d39d7 ("f2fs: fix to propagate error from __get_meta_page()")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/inline.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 6bbb5f6801e2..3fe0dd531390 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -133,6 +133,7 @@ int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
 
 	err = f2fs_get_node_info(fio.sbi, dn->nid, &ni);
 	if (err) {
+		f2fs_truncate_data_blocks_range(dn, 1);
 		f2fs_put_dnode(dn);
 		return err;
 	}
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
