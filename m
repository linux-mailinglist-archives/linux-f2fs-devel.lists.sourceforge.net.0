Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 172E6204A7E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jun 2020 09:08:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jnd2P-0007AK-0a; Tue, 23 Jun 2020 07:08:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <zhangqilong3@huawei.com>) id 1jnd2N-0007AC-Ee
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Jun 2020 07:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uKLsUR0R7P6FqdQKRrf9vPTzlAf/0J+kVbt9qr6u5GA=; b=hjRcLkLZezwXIQABPazv5cM6PK
 GpUwjXrORFHG/WLQBP1Ytn2W1Jy8Tm6nk1sd4bZz+KHLi7kZycgQF9R4EqYn9RIzdR9oQoRCZVxze
 b4o4hUKnltQaRqSiQ08iEipD22e4oKbGeAXyqnH4AuDcMV74Ikuz0kd7yDWwsYAwDVvo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uKLsUR0R7P6FqdQKRrf9vPTzlAf/0J+kVbt9qr6u5GA=; b=N
 QQAKy53v1FFTGkdgruom7jj4KAZH6jnrxiPSlio8z3DOv9Sn+Nf+FUVfybhgfyzk53s+wPn3KPaD9
 9k92QefCV3q/0eD5rB6sOVp1Xc2JRxg0fPSm6F+KVcopjSillBYVoe0N2AjvcvWVn5wyeOF+xuZ7i
 fKPcwTI7JAE6dWh4=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jnd2J-00FhCg-AP
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Jun 2020 07:08:07 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E7D642AD93EBF7E9D49C;
 Tue, 23 Jun 2020 15:07:52 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Tue, 23 Jun 2020
 15:07:46 +0800
From: z00520423 <zhangqilong3@huawei.com>
To: <yuchao0@huawei.com>, <jaegeuk@kernel.org>
Date: Tue, 23 Jun 2020 15:14:45 +0800
Message-ID: <20200623071446.44106-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jnd2J-00FhCg-AP
Subject: [f2fs-dev] [PATCH -next] f2fs: add f2fs_gc exception handle in
 f2fs_ioc_gc_range
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
Cc: zhangqilong3@huawei.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Qilong Zhang <zhangqilong3@huawei.com>

When f2fs_ioc_gc_range performs multiple segments gc ops, the return
value of f2fs_ioc_gc_range is determined by the last segment gc ops.
If its ops failed, the f2fs_ioc_gc_range will be considered to be failed
despite some of previous segments gc ops succeeded. Therefore, so we
fix: only all of segments gc ops are finished will return success.

Signed-off-by: Qilong Zhang <zhangqilong3@huawei.com>
---
 fs/f2fs/file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 3268f8dd59bb..b81fcf9b123d 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2527,6 +2527,10 @@ static int f2fs_ioc_gc_range(struct file *filp, unsigned long arg)
 	}
 
 	ret = f2fs_gc(sbi, range.sync, true, GET_SEGNO(sbi, range.start));
+	if (ret) {
+		ret = -EAGAIN;
+		goto out;
+	}
 	range.start += BLKS_PER_SEC(sbi);
 	if (range.start <= end)
 		goto do_more;
-- 
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
