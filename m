Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B935549DE6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Jun 2019 12:00:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdAuf-0004Jl-0n; Tue, 18 Jun 2019 10:00:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hdAud-0004Jd-7X
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Jun 2019 10:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rrQA5eoD1n9H8PQqaTRiB4csxru6BBm3EPFB9N1kRuA=; b=Vc/45ic2fljqpd83NRR/aS7Zs/
 2KlGPWihddjlXiI5mSKAkiCW2M5L+PFA+NX6etop3PWaP8QbmRY6RyDZSjOnetM4jYQsChTaXA+qX
 AXeJ4LG5w4PYoUvPpO8yabgsUQggJxm3Gi4l5J+863Qtia2DTm04hFkmzi7rPXsmOcow=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rrQA5eoD1n9H8PQqaTRiB4csxru6BBm3EPFB9N1kRuA=; b=i
 47l7KyjbbHMGt3RZdVFgHaaRZ5j8OafPX8UywtypPrvE2rhxCPFtm5xkWXZ4Cz7b0iT5l7HwVPR4d
 nRJdk2UrNoe+KAGHWbIXUsKErpmFQ1LC2YWPEHf0GggQfwSw7CPksDtXN36OusxX/5g5fHU0fQQ5n
 VzmjPp67NdzDznJw=;
Received: from szxga01-in.huawei.com ([45.249.212.187] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hdAuX-00370R-C0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Jun 2019 10:00:20 +0000
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id 1C444D8414A0C1BDBF82;
 Tue, 18 Jun 2019 18:00:09 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 18 Jun 2019 18:00:08 +0800
Received: from szvp000201624.huawei.com (10.120.216.130) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 18 Jun 2019 18:00:08 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Tue, 18 Jun 2019 17:59:03 +0800
Message-ID: <20190618095903.20201-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggeme717-chm.china.huawei.com (10.1.199.113) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hdAuX-00370R-C0
Subject: [f2fs-dev] [PATCH] f2fs: print kernel message if filesystem is
 inconsistent
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
Cc: jaegeuk@kernel.org, pavel@ucw.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As Pavel reported, once we detect filesystem inconsistency in
f2fs_inplace_write_data(), it will be better to print kernel message as
we did in other places.

Reported-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/segment.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 492e9e70dfc7..d32e38025e26 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3247,6 +3247,8 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 
 	if (!IS_DATASEG(get_seg_entry(sbi, segno)->type)) {
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_warn(sbi->sb, "%s: incorrect segment(%u) type, run fsck to fix.",
+			  __func__, segno);
 		return -EFAULT;
 	}
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
