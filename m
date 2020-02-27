Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D0C17152B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Feb 2020 11:40:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j7GaV-00038E-3y; Thu, 27 Feb 2020 10:40:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1j7GaT-000381-LG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Feb 2020 10:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=18e/D4/+MM+g0dJtKJ/+1YUnc9WxGhoPmwqIBBQ28ds=; b=dfxI7ay7YbricgOh1C7fH20sVs
 h96mv6odTffFDbyqckgns8GjMMI/3ZHY5mNPbIwYWcqKlo71qKQVFkNKPIz8OfA+5NKZfsMvPuOtk
 Mp4uHNhmufZSJdmaKD7tj8KaEitC+nt4IsDhCT6aIvnrzTEAW59iQr3hSe4hNbxr3+WI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=18e/D4/+MM+g0dJtKJ/+1YUnc9WxGhoPmwqIBBQ28ds=; b=N3a8VvgZ0Q45ZEWGqGnzauI/kx
 k23PKYKTeUIQTeKtIlAF8nX6+eymrPXKlpCfzmjXIRRzeyXo8H/nzEEEw8q2EgurTuBFalHHrSpPv
 kaJvhaoxgG/0QkdkuUO4kuqBv/Y5yQP1nB/96himpxVzm0XDaBTiJ+VcifVBW/l+X6CY=;
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1j7GaO-00B41D-Uh
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Feb 2020 10:40:13 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1582800010; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=18e/D4/+MM+g0dJtKJ/+1YUnc9WxGhoPmwqIBBQ28ds=;
 b=Pt+9zVG0F9DN4mykIR4KAwa7wnR1fWOMlgHGGSVRPKiiKyvgOhAyTatGIixssvzhjDzoVFNR
 EFRGrLzTK8Hw2QGQXPTlD+im5lVXeWxA/7uL1G84BP/0J+M8wy3uDZMj+UPp2Bz8e+5P/V0a
 5LlE2pPiPVTH1AQqLrYcb4uZXWs=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e579c7c.7f0ec4a8d618-smtp-out-n02;
 Thu, 27 Feb 2020 10:39:56 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DEB44C433A2; Thu, 27 Feb 2020 10:39:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E41B0C4479D;
 Thu, 27 Feb 2020 10:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E41B0C4479D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 27 Feb 2020 16:09:38 +0530
Message-Id: <1582799978-22277-2-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1582799978-22277-1-git-send-email-stummala@codeaurora.org>
References: <1582799978-22277-1-git-send-email-stummala@codeaurora.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [104.130.122.26 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1j7GaO-00B41D-Uh
Subject: [f2fs-dev] [PATCH 2/2] f2fs: Add a new CP flag to help fsck fix
 resize SPO issues
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

Add and set a new CP flag CP_RESIZEFS_FLAG during
online resize FS to help fsck fix the metadata mismatch
that may happen due to SPO during resize, where SB
got updated but CP data couldn't be written yet.

fsck errors -
Info: CKPT version = 6ed7bccb
        Wrong user_block_count(2233856)
[f2fs_do_mount:3365] Checkpoint is polluted

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
 fs/f2fs/checkpoint.c    | 8 ++++++--
 include/linux/f2fs_fs.h | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index fdd7f3d..0bd4cdb 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1301,10 +1301,14 @@ static void update_ckpt_flags(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	else
 		__clear_ckpt_flags(ckpt, CP_ORPHAN_PRESENT_FLAG);
 
-	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK) ||
-		is_sbi_flag_set(sbi, SBI_IS_RESIZEFS))
+	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK))
 		__set_ckpt_flags(ckpt, CP_FSCK_FLAG);
 
+	if (is_sbi_flag_set(sbi, SBI_IS_RESIZEFS))
+		__set_ckpt_flags(ckpt, CP_RESIZEFS_FLAG);
+	else
+		__clear_ckpt_flags(ckpt, CP_RESIZEFS_FLAG);
+
 	if (is_sbi_flag_set(sbi, SBI_CP_DISABLED))
 		__set_ckpt_flags(ckpt, CP_DISABLED_FLAG);
 	else
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index ac3f488..3c383dd 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -125,6 +125,7 @@ struct f2fs_super_block {
 /*
  * For checkpoint
  */
+#define CP_RESIZEFS_FLAG		0x00004000
 #define CP_DISABLED_QUICK_FLAG		0x00002000
 #define CP_DISABLED_FLAG		0x00001000
 #define CP_QUOTA_NEED_FSCK_FLAG		0x00000800
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
