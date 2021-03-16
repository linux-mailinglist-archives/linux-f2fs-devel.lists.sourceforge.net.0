Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD22F33D0D2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Mar 2021 10:30:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lM61V-0004zG-Iu; Tue, 16 Mar 2021 09:29:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1lM61T-0004z5-Gn
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Mar 2021 09:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ftwAj6sHvIl5iIQxKMM6PfEUGX3zyTGox5r/B6KlCbs=; b=a/O68COHWzsirjJUwI0y9S5ruG
 ms9ZYGVxHjvWMvknKEptXfI1eBSF3UifQNoHN51I3yBrh6imPUMlEpIZrPHSplNcXuanJFnqJsazK
 MPhbGUTRvLVRIU+6CaZuvemH+quuo0i8B9hWnjK3Vuuo05lKeETprsh9mFDyL+RKIkAg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ftwAj6sHvIl5iIQxKMM6PfEUGX3zyTGox5r/B6KlCbs=; b=PNJq6YQOG7xK92qDHnUtfs15nu
 eVhtJ3KRRlqJZ+tgXKmgF9hSMGDeMBaz5RNJdvP1mbGc4H8Sy9BYAtOvXb5kzAjtvrO0SC+PSMchE
 wuMLTSrTXviN6qL/RPbIoutMTU22AExNwr+QUw0R3SmX3PpT1y2Uf2QjaS4dWWFRL8sw=;
Received: from m42-2.mailgun.net ([69.72.42.2])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lM61I-005aEa-Da
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Mar 2021 09:29:55 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615886986; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ftwAj6sHvIl5iIQxKMM6PfEUGX3zyTGox5r/B6KlCbs=;
 b=ilVPUyIOly6M9u/vu59sxB7ogrdiVIpL0FYBmVnoZvG/osRFe1PKHK+KpiNLp+X9k/FGS2KI
 Q6XHQpKZ9MeiAXqnflFCssswrZN11q37pRnIT/QXfp2M9CViTr2mJhxRnLc31Hk0M+7WIkld
 2FVlR58v/FtQLZF4L8qcQiPxrOg=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60507a7a5d70193f888326b3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Mar 2021 09:29:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5F43CC4346A; Tue, 16 Mar 2021 09:29:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B9079C43462;
 Tue, 16 Mar 2021 09:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B9079C43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 16 Mar 2021 14:59:18 +0530
Message-Id: <1615886958-717-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [69.72.42.2 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [69.72.42.2 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lM61I-005aEa-Da
Subject: [f2fs-dev] [PATCH v3] f2fs: allow to change discard policy based on
 cached discard cmds
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

With the default DPOLICY_BG discard thread is ioaware, which prevents
the discard thread from issuing the discard commands. On low RAM setups,
it is observed that these discard commands in the cache are consuming
high memory. This patch aims to relax the memory pressure on the system
due to f2fs pending discard cmds by changing the policy to DPOLICY_FORCE
based on the nm_i->ram_thresh configured.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
v3:
Fix sporadic null pointer dereference issue when accessing NM_I(sbi)
in f2fs_available_free_memory(). It is because this function can be
called by discard thread before f2fs_build_node_manager() in
f2fs_fill_super().

 fs/f2fs/node.c    | 8 ++++++++
 fs/f2fs/node.h    | 1 +
 fs/f2fs/segment.c | 3 ++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 3a24423..256c39b 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -44,11 +44,15 @@ int f2fs_check_nid_range(struct f2fs_sb_info *sbi, nid_t nid)
 bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 {
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
 	struct sysinfo val;
 	unsigned long avail_ram;
 	unsigned long mem_size = 0;
 	bool res = false;
 
+	if (!nm_i)
+		return true;
+
 	si_meminfo(&val);
 
 	/* only uses low memory */
@@ -90,6 +94,10 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 		/* it allows 20% / total_ram for inmemory pages */
 		mem_size = get_pages(sbi, F2FS_INMEM_PAGES);
 		res = mem_size < (val.totalram / 5);
+	} else if (type == DISCARD_CACHE) {
+		mem_size = (atomic_read(&dcc->discard_cmd_cnt) *
+				sizeof(struct discard_cmd)) >> PAGE_SHIFT;
+		res = mem_size < (avail_ram * nm_i->ram_thresh / 100);
 	} else {
 		if (!sbi->sb->s_bdi->wb.dirty_exceeded)
 			return true;
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index f84541b..7a45c0f 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -147,6 +147,7 @@ enum mem_type {
 	INO_ENTRIES,	/* indicates inode entries */
 	EXTENT_CACHE,	/* indicates extent cache */
 	INMEM_PAGES,	/* indicates inmemory pages */
+	DISCARD_CACHE,	/* indicates memory of cached discard cmds */
 	BASE_CHECK,	/* check kernel status */
 };
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index f214b69..d7076796 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1775,7 +1775,8 @@ static int issue_discard_thread(void *data)
 		if (!atomic_read(&dcc->discard_cmd_cnt))
 			continue;
 
-		if (sbi->gc_mode == GC_URGENT_HIGH)
+		if (sbi->gc_mode == GC_URGENT_HIGH ||
+			!f2fs_available_free_memory(sbi, DISCARD_CACHE))
 			__init_discard_policy(sbi, &dpolicy, DPOLICY_FORCE, 1);
 
 		sb_start_intwrite(sbi->sb);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
