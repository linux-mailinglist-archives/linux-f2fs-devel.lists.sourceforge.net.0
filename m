Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 320701EBC89
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jun 2020 15:08:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jg6eD-0005Zc-0v; Tue, 02 Jun 2020 13:08:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jg6eB-0005ZE-3K
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Jun 2020 13:08:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5Vd/bdUNGvly/grt98Jx4x27H8iSAXBdUqjZmOyOWf0=; b=GSe+kL16p1IkovGw/MOB4TrMis
 2z1dh4VGKXt3MrnvoK2mzRHltEHtL84HDwMao+H9nAY+uzrBIvl3kb33zJuc7uDnohvZml5SHouos
 kUIIWXv1kYplyuD070Sr8kOS4XD2vOG5yPB8eRjeMpcN3XtcLRcNftu2BDMM54q/+8nw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5Vd/bdUNGvly/grt98Jx4x27H8iSAXBdUqjZmOyOWf0=; b=RiaruFpQFgGcbTPpOMgqqv11do
 vnGjNL+TZpCkkYcLgr32X88CV1Zj75AruUmarSigrEPBvyck7gcvVWdagT5JRIVdlrmxgLFgnaCmj
 HLSNnElyllTmEe9oAwNAVA7JhQ9V2V20g3MwI1JOB2ujoID2f6z9IV72ArFMDkfDe7xA=;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jg6e4-002eFG-Dr
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Jun 2020 13:08:03 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591103276; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=5Vd/bdUNGvly/grt98Jx4x27H8iSAXBdUqjZmOyOWf0=;
 b=lqLTQbdKgbNouG5tSpid3OaVouD5PuogzN5kXrQTUBcQrpR3ROKZPTbzldK8mWuTcetrQeGa
 Q0EiUyQzEliqxGtkJJLTN5mKqX7CO91FkUBhrEX61UYQgt38+2PEh3FG1NNkJzkKZh1NVfni
 86Jxl1nmKXDqPi/NxVQokNFMNzk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5ed64918e276c808de117cdc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Jun 2020 12:42:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 99320C43387; Tue,  2 Jun 2020 12:42:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=ham autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 62AFCC433C6;
 Tue,  2 Jun 2020 12:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 62AFCC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  2 Jun 2020 18:11:47 +0530
Message-Id: <1591101707-18802-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [69.72.43.7 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [69.72.43.7 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jg6e4-002eFG-Dr
Subject: [f2fs-dev] [PATCH v2] f2fs: fix retry logic in
 f2fs_write_cache_pages()
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

In case a compressed file is getting overwritten, the current retry
logic doesn't include the current page to be retried now as it sets
the new start index as 0 and new end index as writeback_index - 1.
This causes the corresponding cluster to be uncompressed and written
as normal pages without compression. Fix this by allowing writeback to
be retried for the current page as well (in case of compressed page
getting retried due to index mismatch with cluster index). So that
this cluster can be written compressed in case of overwrite.

Also, align f2fs_write_cache_pages() according to the change -
<64081362e8ff>("mm/page-writeback.c: fix range_cyclic writeback vs
writepages deadlock").

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
v2: 
- Align the code to <64081362e8ff>("mm/page-writeback.c: fix range_cyclic
  writeback vs writepages deadlock") and adjust the retry logic also as per
  Chao's suggestion.

 fs/f2fs/data.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 4af5fcd..31af29f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2825,7 +2825,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	pgoff_t index;
 	pgoff_t end;		/* Inclusive */
 	pgoff_t done_index;
-	int cycled;
 	int range_whole = 0;
 	xa_mark_t tag;
 	int nwritten = 0;
@@ -2843,17 +2842,12 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	if (wbc->range_cyclic) {
 		writeback_index = mapping->writeback_index; /* prev offset */
 		index = writeback_index;
-		if (index == 0)
-			cycled = 1;
-		else
-			cycled = 0;
 		end = -1;
 	} else {
 		index = wbc->range_start >> PAGE_SHIFT;
 		end = wbc->range_end >> PAGE_SHIFT;
 		if (wbc->range_start == 0 && wbc->range_end == LLONG_MAX)
 			range_whole = 1;
-		cycled = 1; /* ignore range_cyclic tests */
 	}
 	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
 		tag = PAGECACHE_TAG_TOWRITE;
@@ -3021,12 +3015,13 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 		}
 	}
 #endif
-	if ((!cycled && !done) || retry) {
-		cycled = 1;
+	if (retry) {
 		index = 0;
-		end = writeback_index - 1;
+		end = -1;
 		goto retry;
 	}
+	if (wbc->range_cyclic && !done)
+		done_index = 0;
 	if (wbc->range_cyclic || (range_whole && wbc->nr_to_write > 0))
 		mapping->writeback_index = done_index;
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
