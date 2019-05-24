Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 429FB29439
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 May 2019 11:09:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hU6CB-0001Yp-Qs; Fri, 24 May 2019 09:08:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1hU6CA-0001Yh-9l
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 09:08:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JMwunaZ5WGstTqn/whCGlcS9bRM72ZiZsf6zdoNlWAQ=; b=hFadCgp1iBFNFHdk/Oocjw0owh
 i3ogWgCj/i/YimUAJXn1esRIJA/ou8fDIQslhwDvW1yqlHJv3701/RMn9Fu0qLhiS4UxQ2l10s0uR
 J7SBeINzTu+dLdxWVEvulMTRz8NVs8TBTNgxshmav5Cw+VoqVCn++qOeX7NzZqk7z1TE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JMwunaZ5WGstTqn/whCGlcS9bRM72ZiZsf6zdoNlWAQ=; b=MyFhBaHQnmqj+k9J5TovCtjsSz
 9ef1BD4rEEc6lvPhZpwb+4iwWiROUwLhP6Ad0oKm/KLwXd+oXzc9R/R6SlOAARuBFyr170eO0g/cO
 jcYsBGHVMzaQ/atfXAQk+qkz+No7/NpE2yghZYEBbpVFKwIBwZVHS1WLZRPOd09hcQKs=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hU6C7-005wRH-Hs
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 09:08:58 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 09546609CD; Fri, 24 May 2019 09:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558688930;
 bh=igHrawF1Hx5/t3YXD5o3/vFat11DDmRNhqFNnJql4as=;
 h=From:To:Cc:Subject:Date:From;
 b=TDj+ZOzLhIx/2GheIqpqr6PLkTiXqQWMosQ4HcLKTdqN5RHoGMePe1aO3kSZC1Usl
 Vz+47bnGp/2fO1EZEo202KG6aSKfWzbRD79JTxWaYhr20vYjj7MZ9I7ySL3v5YJQmm
 T9eWK2/drzicWlMkE7Cbpy8auRCKihANkk/2EwqY=
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C5B1605FC;
 Fri, 24 May 2019 09:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558688929;
 bh=igHrawF1Hx5/t3YXD5o3/vFat11DDmRNhqFNnJql4as=;
 h=From:To:Cc:Subject:Date:From;
 b=OVeYHX0PwxRU44++vsWaFR/tQi5BR+PuNbFD5LR5ixE768ee8bwrNuZdGA7xkl6g1
 ueZhFvgTMasVknQsmmkdF3KPYfdO4PQotq7JGNO8wzuGfuiuWbY/dOOC1PwP9UZC/Z
 mfYtmKKuLrNnIOefVTkVFMhtcmqs8y7Ho2YJmIjo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3C5B1605FC
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 24 May 2019 14:38:39 +0530
Message-Id: <1558688919-561-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hU6C7-005wRH-Hs
Subject: [f2fs-dev] [PATCH] f2fs: fix f2fs_show_options to show nodiscard
 mount option
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

Fix f2fs_show_options to show nodiscard mount option.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
 fs/f2fs/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 2c9d4f7..353feda 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1410,6 +1410,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 		seq_puts(seq, ",disable_roll_forward");
 	if (test_opt(sbi, DISCARD))
 		seq_puts(seq, ",discard");
+	else
+		seq_puts(seq, ",nodiscard");
 	if (test_opt(sbi, NOHEAP))
 		seq_puts(seq, ",no_heap");
 	else
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
