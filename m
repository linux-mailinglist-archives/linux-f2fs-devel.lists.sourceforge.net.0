Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB3E83099
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Aug 2019 13:26:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1huxbK-0001PR-G5; Tue, 06 Aug 2019 11:25:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1huxbH-0001PE-U2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 11:25:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wCXmdHWo0ms9Zpwjjoo2mw5S/5nZJUjrliH9Y+HlTzI=; b=b60YVlwpRg13KarswEuqFrj4UY
 glj2dCBnZUcAsAvWcd6AiOpqOOWn8pKmWzKUDWQov1qzEKlf1swiRAwQhrnSS/LABRnNQnxHhgFbE
 0nY96tgpZJqNmWiEBQeKVX5i7Ijr3TxgDFVttiaiRkEdOzoyWcoCEvf8SGnsfe8t5ex4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wCXmdHWo0ms9Zpwjjoo2mw5S/5nZJUjrliH9Y+HlTzI=; b=fhMU2l93YYimNVm+5BIQXahtyS
 Vr4tz2C2hxUPmSthXcPIb2AabWLlm8NfOyxorJGwDNBHIXSg0gQrlZZ9z5wKqoP4dndrlp0dqZ1Dh
 XE5657XiNBchNzUJ14U+aPNOCxebTIRdTRTuujThinAaGx19jCSsQdpT1fBc2rckDMS4=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1huxbE-00CDIj-R4
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 11:25:55 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 4F3DA6053B; Tue,  6 Aug 2019 11:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1565090746;
 bh=VZyDa5xwZ3D5C5Lz2pDRthJNOUDBPslSb+tqQto/oEY=;
 h=From:To:Cc:Subject:Date:From;
 b=i9CocGo4xSmqpSfcHurgJee3GRDFWlV4LXFkXa4/MVY6EVTmVy3U1d+R3lOa39ggu
 yECQcoetuG0IhmOsRX5EG4shDtf2Gf9dXd6R3R7iaftVraI3P1T/EifwQ65r9UQhbj
 PhFjuMIKjLxk6xg1+7O89OvzWTIbOiDCInG2jdlU=
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CDC326050D;
 Tue,  6 Aug 2019 11:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1565090745;
 bh=VZyDa5xwZ3D5C5Lz2pDRthJNOUDBPslSb+tqQto/oEY=;
 h=From:To:Cc:Subject:Date:From;
 b=YZs1dOW4g/bDQTyeDU53v1yjf+3Jt1AXmgOWTHnMDs7NQzobFpdn/tW9JRqaFV8vp
 5dOx08ffxeR3jTa9DvmfHCWsHRPXIEhiF6BhGj0Sfr6c7yFgezYBpS5/2X+A0ZHDjj
 RpvZQdgaBRnji1ixO05bgdS1PyLNk6OQjuQjyAeE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CDC326050D
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  6 Aug 2019 16:49:56 +0530
Message-Id: <1565090396-7263-1-git-send-email-stummala@codeaurora.org>
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
X-Headers-End: 1huxbE-00CDIj-R4
Subject: [f2fs-dev] [PATCH v2] f2fs: Fix indefinite loop in f2fs_gc()
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

Policy - Foreground GC, LFS and greedy GC mode.

Under this policy, f2fs_gc() loops forever to GC as it doesn't have
enough free segements to proceed and thus it keeps calling gc_more
for the same victim segment.  This can happen if the selected victim
segment could not be GC'd due to failed blkaddr validity check i.e.
is_alive() returns false for the blocks set in current validity map.

Fix this by keeping track of such invalid segments and skip those
segments for selection in get_victim_by_default() to avoid endless
GC loop under such error scenarios.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
v2: fix as per Chao's suggestion to handle this error case

 fs/f2fs/gc.c      | 15 ++++++++++++++-
 fs/f2fs/segment.c |  5 +++++
 fs/f2fs/segment.h |  3 +++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 8974672..321a78a 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -382,6 +382,14 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 			nsearched++;
 		}
 
+		/*
+		 * skip selecting the invalid segno (that is failed due to block
+		 * validity check failed during GC) to avoid endless GC loop in
+		 * such cases.
+		 */
+		if (test_bit(segno, sm->invalid_segmap))
+			goto next;
+
 		secno = GET_SEC_FROM_SEG(sbi, segno);
 
 		if (sec_usage_check(sbi, secno))
@@ -975,6 +983,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	int off;
 	int phase = 0;
 	int submitted = 0;
+	struct sit_info *sit_i = SIT_I(sbi);
 
 	start_addr = START_BLOCK(sbi, segno);
 
@@ -1008,8 +1017,12 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		}
 
 		/* Get an inode by ino with checking validity */
-		if (!is_alive(sbi, entry, &dni, start_addr + off, &nofs))
+		if (!is_alive(sbi, entry, &dni, start_addr + off, &nofs)) {
+			if (!test_and_set_bit(segno, sit_i->invalid_segmap))
+				f2fs_err(sbi, "invalid blkaddr %u in seg %u is found\n",
+						start_addr + off, segno);
 			continue;
+		}
 
 		if (phase == 2) {
 			f2fs_ra_node_page(sbi, dni.ino);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a661ac3..d45a1d3 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4017,6 +4017,10 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 		return -ENOMEM;
 #endif
 
+	sit_i->invalid_segmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
+	if (!sit_i->invalid_segmap)
+		return -ENOMEM;
+
 	/* init SIT information */
 	sit_i->s_ops = &default_salloc_ops;
 
@@ -4518,6 +4522,7 @@ static void destroy_sit_info(struct f2fs_sb_info *sbi)
 #ifdef CONFIG_F2FS_CHECK_FS
 	kvfree(sit_i->sit_bitmap_mir);
 #endif
+	kvfree(sit_i->invalid_segmap);
 	kvfree(sit_i);
 }
 
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index b746028..bc5dbe8 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -246,6 +246,9 @@ struct sit_info {
 	unsigned long long min_mtime;		/* min. modification time */
 	unsigned long long max_mtime;		/* max. modification time */
 
+	/* list of segments to be ignored by GC in case of errors */
+	unsigned long *invalid_segmap;
+
 	unsigned int last_victim[MAX_GC_POLICY]; /* last victim segment # */
 };
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
