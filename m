Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C64C336E63
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Mar 2021 10:00:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lKHAj-0004Wt-UR; Thu, 11 Mar 2021 08:59:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1lKHAj-0004Wl-1L
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Mar 2021 08:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jpoQuUcHs5i9VLRk71qu3ijoBzDv7GXlwEbrC3WwVlM=; b=P4hsAnM1khAolclTaHGwBAbTgA
 vMp7qAersQhLVXGc6oUktTc65MW3EFURsAbMgjK+Jy/qtrpC/S1SrLUS1QX1pgl7fCU9Fnhb8VmCs
 M6wMMI8IdDiyqfDfsxvBLUy2FMnBTKnJ0mIiQ2P7G+hNfLyTJmfdifQmok8ARepdhiqE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jpoQuUcHs5i9VLRk71qu3ijoBzDv7GXlwEbrC3WwVlM=; b=YZg0bBYjTou8oljR1txPv3V2L/
 tzmbRc8cqVlj22MPa/G0EX1GRe/K3m/dMdFMo2K1wY0togGSaw62x8qaKhsKH/W9t8dHWReeAiS/5
 OgP6i0XvRx0/lPp5NGcWsdqiiLgx3/D4yBChNGNHkrYYdlbKE4nFaWfll5mKLnXHIe38=;
Received: from z11.mailgun.us ([104.130.96.11])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lKHAQ-0006rg-VN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Mar 2021 08:59:54 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615453178; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=jpoQuUcHs5i9VLRk71qu3ijoBzDv7GXlwEbrC3WwVlM=;
 b=elQ8ztMHxOjToJ5xyyspDxMjtVB4GdrV28ONtlNXuJuXVX6Mnu3qaf5zHksa03yPs/8IbwBJ
 POgCDYdDGGd9y+33V6G0RnxTwv3ANLe1a70MaSau8K0OAkv0kxBbKglDe4ejNaYVuKylXLNJ
 DCrl/1OKhkD0ocnjT62kiGXlrTw=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6049dbf1e90f410d888c93e4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Mar 2021 08:59:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A2FF2C433C6; Thu, 11 Mar 2021 08:59:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7CCFAC433CA;
 Thu, 11 Mar 2021 08:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7CCFAC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 11 Mar 2021 14:29:08 +0530
Message-Id: <1615453148-30443-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lKHAQ-0006rg-VN
Subject: [f2fs-dev] [PATCH v2] f2fs: allow to change discard policy based on
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
v2:
- by mistake the last else condition was modified, fix it now. 

 fs/f2fs/node.c    | 5 +++++
 fs/f2fs/node.h    | 1 +
 fs/f2fs/segment.c | 3 ++-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 3a24423..03d99f9 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -44,6 +44,7 @@ int f2fs_check_nid_range(struct f2fs_sb_info *sbi, nid_t nid)
 bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 {
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
 	struct sysinfo val;
 	unsigned long avail_ram;
 	unsigned long mem_size = 0;
@@ -90,6 +91,10 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 		/* it allows 20% / total_ram for inmemory pages */
 		mem_size = get_pages(sbi, F2FS_INMEM_PAGES);
 		res = mem_size < (val.totalram / 5);
+	} else if (type == DISCARD_CACHE) {
+		mem_size = (atomic_read(&dcc->discard_cmd_cnt) *
+				sizeof(struct discard_cmd)) >> PAGE_SHIFT;
+		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100));
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
index deca74c..13b3d728 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1773,7 +1773,8 @@ static int issue_discard_thread(void *data)
 			continue;
 		}
 
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
