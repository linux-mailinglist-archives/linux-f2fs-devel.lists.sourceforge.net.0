Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A8660059
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Jul 2019 07:02:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hjGMj-00014o-NH; Fri, 05 Jul 2019 05:02:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1hjGMi-00014d-Fk
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jul 2019 05:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3KmWBST1f09p3KEzwgAxe7rJx52d8om1PtTUhBwG3OY=; b=HOcItU8Gehl+AmaF9IODQBzxrp
 1IzzQ0JBhS8SUZhCGErnn9TfEX26rpBqhwBRTELvpkzMcl5kFTXakO0W42OC+gISE3eQgqhPqTmPc
 1KP9TKHUUs4JfbUVmWWmUtytxl7sl2HT2LAA6x+VUkTrlOO11Epe6dMWfRXYbFT0kNds=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3KmWBST1f09p3KEzwgAxe7rJx52d8om1PtTUhBwG3OY=; b=d/ARU/6/lXiKpS0GA9RE902UOa
 UbpgfRBoHMX2LKjNTlR3tE9pNmri05fuBL7FhYn+m0O6O4bY2t0PJTVZlteYffTHn383XcdJ/JYJj
 fTWdcBvHKGQy13dfiIG9pkmSvRFtOYKeM/GW2ggI1dSctoOC2G6op/QeGdJ2aNMCwIJ4=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hjGMn-008ZX3-8U
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jul 2019 05:02:43 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id AED1E602BC; Fri,  5 Jul 2019 05:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1562302951;
 bh=NQZOn3LDO7e5iZsYVcYIWWK5HSvIH4XTugN6GmU6N+4=;
 h=From:To:Cc:Subject:Date:From;
 b=Ur2GbXAXAcDsBbdwa/qCh4WByKChqbBockEClLrVSIbhgNqp5iVwLT0r5V5DdNGj1
 xpEGX2esr/urYCJsiqSayPrKKErI6FX3MrpcKnbhmU1prq+exL39SJnPzpE2iI0RAU
 KJASbyBd2puVt8SaEyG+Da9xoRYx6J31IHcw2uXY=
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7536460ACA;
 Fri,  5 Jul 2019 05:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1562302950;
 bh=NQZOn3LDO7e5iZsYVcYIWWK5HSvIH4XTugN6GmU6N+4=;
 h=From:To:Cc:Subject:Date:From;
 b=HZ2UJ60r3BhKmGelgV9J3jPEag4UpNoiibBV4QkZUW7Byf14fiYW2pyt0Q3U6BqFm
 oR9+LU+hgD2iBRXpwjAvkPMJD5wo06fET1aKN3y5L8IQLSCGpnIqiS4aUhsrDUSdeg
 ba20Mo0rJ+CG8pJIqxTKsxV9QYj41oE+kGJl+bic=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7536460ACA
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  5 Jul 2019 10:31:03 +0530
Message-Id: <1562302863-14418-1-git-send-email-stummala@codeaurora.org>
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
X-Headers-End: 1hjGMn-008ZX3-8U
Subject: [f2fs-dev] [PATCH] fsck: Fix data loss issue observed during SPO
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

With the commit <979b25727800> ("fsck.f2fs: check validity of nat journal"),
there is a serious data loss issue observed during sudden power off tests.

The reason is due to incorrect update of journal->n_nats in that patch.
When fsck encounters a nat journal entry with invalid blkaddr/nid, it
updates journal->n_nats with the index of such first entry and then continues
the for loop which scans all nats in journal in f2fs_init_nid_bitmap().
But that loop doesn't continue and doesn't update nm_i->nid_bitmap as well,
as it fails the for loop condition i < nats_in_cursum(journal).

There could be several other valid entries in the journal after this
invalid entry. Due to this invalid journal->n_nats, build_nat_area_bitmap()
could not be build properly for valid nat journal entries. It further results
into these fsck asserts/errors and causes data loss due to incorrect fsck fix.

[ASSERT] (sanity_check_nid: 372)  --> nid[0xfb01] ino is 0\x0a
[FIX] (__chk_dentries:1438)  --> Unlink [0xfb01] - _JeNcl242yB3Apz2MW,VOh6WmjsVht1W len[0x1c], type[0x1]\x0a
[ASSERT] (sanity_check_nid: 372)  --> nid[0xfa2d] ino is 0\x0a
[FIX] (__chk_dentries:1438)  --> Unlink [0xfa2d] - _++vN7axccjjGNI,TQEVmcOemY1EAAAA len[0x14], type[0x1]\x0a
...
NID[0xba5] is unreachable\x0a
NID[0xfa9] is unreachable\x0a
...
[FIX] (nullify_nat_entry:2089)  --> Remove nid [0xba5] in NAT\x0a
[FIX] (nullify_nat_entry:2089)  --> Remove nid [0xfa9] in NAT\x0a
...

Fixes: 979b25727800 ("fsck.f2fs: check validity of nat journal")
Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
 fsck/mount.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 60e0e4a..1b93f49 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1160,7 +1160,6 @@ static int f2fs_init_nid_bitmap(struct f2fs_sb_info *sbi)
 		addr = le32_to_cpu(nat_in_journal(journal, i).block_addr);
 		if (!IS_VALID_BLK_ADDR(sbi, addr)) {
 			MSG(0, "\tError: f2fs_init_nid_bitmap: addr(%u) is invalid!!!\n", addr);
-			journal->n_nats = cpu_to_le16(i);
 			c.fix_on = 1;
 			continue;
 		}
@@ -1168,7 +1167,6 @@ static int f2fs_init_nid_bitmap(struct f2fs_sb_info *sbi)
 		nid = le32_to_cpu(nid_in_journal(journal, i));
 		if (!IS_VALID_NID(sbi, nid)) {
 			MSG(0, "\tError: f2fs_init_nid_bitmap: nid(%u) is invalid!!!\n", nid);
-			journal->n_nats = cpu_to_le16(i);
 			c.fix_on = 1;
 			continue;
 		}
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
