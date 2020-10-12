Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7019C28AC09
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Oct 2020 04:29:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kRnaP-0004Qs-2t; Mon, 12 Oct 2020 02:29:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kRnaM-0004QX-TZ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Oct 2020 02:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AFFmNNwvG9shYyBfqmn2my8F0XK+woYMOasKDuPzwNs=; b=aoAcuF/Jo3vnREDHvN7ckxyBbO
 IBdMHKEE4o8sDNH97ZAGWO/0lUzLce8HnV16HUNFiwRWZ1xMUdXSvRfts5nyMhCNXqWNmQAOLYwyr
 usdmf/m9nH6jz8q7TCyhheF4kGYk4NwiIh4AZ7e4k6h/ZC4yOwvfyo+rSpJFVlctgKIQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AFFmNNwvG9shYyBfqmn2my8F0XK+woYMOasKDuPzwNs=; b=T
 3Ehpb+BQRyhFswUf6w0V9QuXKIhR8UTgeRuc6p8fvXlhugB7E1N5uhdxwdp3vUK3UDYJzfkoBkImL
 s9vIUeqLMM3awXt8bXq2zJefC7FaJYngmOyQJuWN+FdEPchvoN9iezy6fPmU/Ngh08QNAM3ML73eG
 Xn4T10TPawirRA4Q=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kRnaB-00BVoX-Sx
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Oct 2020 02:29:14 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 74CF3E6D2CE783295847;
 Mon, 12 Oct 2020 10:28:53 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Mon, 12 Oct 2020 10:28:42 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 12 Oct 2020 10:28:14 +0800
Message-ID: <20201012022814.73684-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kRnaB-00BVoX-Sx
Subject: [f2fs-dev] [PATCH] f2fs: don't issue flush in
 f2fs_flush_device_cache() for nobarrier case
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

This patch changes f2fs_flush_device_cache() to skip issuing flush for
nobarrier case.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/segment.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 13ecd2c2c361..f14499632b45 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -759,6 +759,9 @@ int f2fs_flush_device_cache(struct f2fs_sb_info *sbi)
 	if (!f2fs_is_multi_device(sbi))
 		return 0;
 
+	if (test_opt(sbi, NOBARRIER))
+		return 0;
+
 	for (i = 1; i < sbi->s_ndevs; i++) {
 		if (!f2fs_test_bit(i, (char *)&sbi->dirty_device))
 			continue;
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
