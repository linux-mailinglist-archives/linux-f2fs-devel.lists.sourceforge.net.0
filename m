Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 344B61FDB53
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 03:12:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlj6O-0001xk-Sv; Thu, 18 Jun 2020 01:12:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1jlj6K-0001xZ-KF
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 01:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mXmH/1MGghBI/eg597mVlZNbGg1+477BIpSFSmaVlzU=; b=YpbpnlCHhkS01lQwlD8kP89qS5
 zQtbci8a/HeyeH2N7cjDpSN5EXzLlfMIfha+GUvsBo/jsSZwbfl+tpHsw739VxIwzrlMuDJJcxGOQ
 ZbosL3RSLFvqRVhj3IDp1vO97j+5+XB7DA4S/3ZB4Yp/Cvt3XCxwDV5BFxmrylOE2kCE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mXmH/1MGghBI/eg597mVlZNbGg1+477BIpSFSmaVlzU=; b=dIjtFHs6uFL97vGBINigyQ39Ew
 47u+Lwy6am4L5X0GxeQJVSaRUe9Xm881781PTiWfppWd3efMoj7kezefi7ovfJjNSYhWkNwdNIimF
 PtYQDi6dpCfzutwTWe73d/p+XQ87piFZDDFX48l/hh9TTFLcFbHClgsoEJDsnnEEGdxo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jlj6J-0071Tl-GO
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 01:12:20 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5ED61214DB;
 Thu, 18 Jun 2020 01:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442734;
 bh=lPWevka9QnhGex3BOVrY8374uXhUL2P30uuTNmrKqfA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=y0Uo7i9IJG/Iy8tyfI0xLnpOifkpjgq1r6voEe41Qu2Q8Z5QGwSW3c1baRveiRhGf
 q9Dls4qVaGp975hP9ug6hTjyzpDFcGXgGxrNxZMKSsijCXWet9NFcM7Ko91ur0chQn
 FDIoIag/poageRlTpPIM9dcWnIKlFEdhH6+YoNPU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 17 Jun 2020 21:04:46 -0400
Message-Id: <20200618010805.600873-189-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
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
X-Headers-End: 1jlj6J-0071Tl-GO
Subject: [f2fs-dev] [PATCH AUTOSEL 5.7 189/388] f2fs: fix potential
 use-after-free issue
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

[ Upstream commit f3494345ce9999624b36109252a4bf5f00e51a46 ]

In error path of f2fs_read_multi_pages(), it should let last referrer
release decompress io context memory, otherwise, other referrer will
cause use-after-free issue.

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/data.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index cdf2f626bea7..10491ae1cb85 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2130,16 +2130,16 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 					page->index, for_write);
 			if (IS_ERR(bio)) {
 				ret = PTR_ERR(bio);
-				bio = NULL;
 				dic->failed = true;
 				if (refcount_sub_and_test(dic->nr_cpages - i,
-							&dic->ref))
+							&dic->ref)) {
 					f2fs_decompress_end_io(dic->rpages,
 							cc->cluster_size, true,
 							false);
-				f2fs_free_dic(dic);
+					f2fs_free_dic(dic);
+				}
 				f2fs_put_dnode(&dn);
-				*bio_ret = bio;
+				*bio_ret = NULL;
 				return ret;
 			}
 		}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
