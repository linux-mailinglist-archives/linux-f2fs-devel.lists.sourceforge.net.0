Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7CEB46B7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Sep 2019 07:06:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iA5gi-00039C-PZ; Tue, 17 Sep 2019 05:06:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1iA5gh-00038y-F0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Sep 2019 05:06:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1b+v902xF3F2S3WsG77WLRDJqyG4QblvhPp1C01qEFo=; b=J5N/JgX49MtZyftKXwGhb46VMn
 2OPdYJ2Qhq3Z1bJmOaj9SZzx4Ungb47CYii4pCMXA+QQ146dEM5/Koem82r2ZOHh7nOExPnU4J5ct
 MntAoPjrGIZt5aeDzhmGonn8IpueqLoJ3u3Yjokni+71v2BvFqr7uj/8rDb821bdFLA8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1b+v902xF3F2S3WsG77WLRDJqyG4QblvhPp1C01qEFo=; b=bg3CP2ZZuBaQ0KvmZzMv/SU1NH
 ID7NXGlL7Mf28iX1+hk3idDONt+y9uFKkJ6OxAQ6QzqyLtJ7C61dUefzFpzZPgxzXcKZQDdvYGzbG
 IU2gxvXEzHOPawa5pHQ0jBq+InRKQ0EMgIqwvQ1ckeO5enSmn9cyHF7ti+6CrqVcojO8=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1iA5ge-007u2M-0h
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Sep 2019 05:06:03 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 2ABBC6133A; Tue, 17 Sep 2019 04:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1568695793;
 bh=9DAhlffFQLmyiQ/NBcdB+CPjXZvxyNPw99SVt6x2WNI=;
 h=From:To:Cc:Subject:Date:From;
 b=QhM2JojkQfrWeNPMh1yBFMab870y0RI92asD564PBlf5BXDy91uU3A5HlT04w7spr
 OD43qEvbA3KHi7nCTY14juqsjxqAEipjGCzVla9tS+meWujUkynjvOjN5J/RCe6sW0
 0Vh65Gd/Rg+QLfARCCcpJljtz60msbyMHJGOjdU8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: stummala@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8AD46607C3;
 Tue, 17 Sep 2019 04:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1568695792;
 bh=9DAhlffFQLmyiQ/NBcdB+CPjXZvxyNPw99SVt6x2WNI=;
 h=From:To:Cc:Subject:Date:From;
 b=hSgSYEJzeXsrKDUNDKTmqyprObM9NX0u+TRioBXgAlgSauRz+qWM67cc3HWUpq+q/
 nP1yc38DAsIlmltF4GoHU+FizSaSZS8prTDeMrsqMUCuvQ85CeaVXHtK6s8V8/vSjM
 kxs6owP5qD/oNwm8dWCd1QX4E+e/WOS4NK48n4UE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8AD46607C3
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 17 Sep 2019 10:19:23 +0530
Message-Id: <1568695763-29343-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iA5ge-007u2M-0h
Subject: [f2fs-dev] [PATCH] f2fs: add a condition to detect overflow in
 f2fs_ioc_gc_range()
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
Cc: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

end = range.start + range.len;

If the range.start/range.len is a very large value, then end can overflow
in this operation. It results into a crash in get_valid_blocks() when
accessing the invalid range.start segno.

This issue is reported in ioctl fuzz testing.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
 fs/f2fs/file.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5474aaa..c2b4767 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2123,9 +2123,8 @@ static int f2fs_ioc_gc_range(struct file *filp, unsigned long arg)
 		return -EROFS;
 
 	end = range.start + range.len;
-	if (range.start < MAIN_BLKADDR(sbi) || end >= MAX_BLKADDR(sbi)) {
+	if (end < range.start || range.start < MAIN_BLKADDR(sbi) || end >= MAX_BLKADDR(sbi))
 		return -EINVAL;
-	}
 
 	ret = mnt_want_write_file(filp);
 	if (ret)
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
