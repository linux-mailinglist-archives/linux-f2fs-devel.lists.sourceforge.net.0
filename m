Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FD818F33D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 11:58:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGKnB-0004bX-UR; Mon, 23 Mar 2020 10:58:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jGKnA-0004bB-Aa
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 10:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BI8GZGIVijC6wZXT/kRVslia4wTem27ZsYrqjujnjXo=; b=NaWMPrILJKLpGLvBTB4pEF58tJ
 eCcxD5oQ6DxI6DkarODwLRk5nTaNPTWNn6jH6tQFJW5ckYeyX4czT41IzCfwbreMa3iGpSJl+5B4m
 QC3CJEpVkQSjSONYtpSsVwlMV3xlFQd4ymbV9IOzcNB2wvIwFgfkTaKTZc6FRnK3XHuw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BI8GZGIVijC6wZXT/kRVslia4wTem27ZsYrqjujnjXo=; b=PPL2eu6pVQVXvADUZcnSoIV3rt
 kVls5g/8j2yv+Uhndz4WkTAAne1Ljjwy+Y0oN5JKcHRdVU7uHmkOu4GpwAGhCQG53ndB4VzX8mvfv
 wuG4gpTTW3cRTk2IG5+foPGHwtK7vkCCHNsxs1gt84oV5JE6JJb+KvlDbGQUIpzT35ZE=;
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jGKn4-00DmKt-7h
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 10:58:48 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1584961122; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=BI8GZGIVijC6wZXT/kRVslia4wTem27ZsYrqjujnjXo=;
 b=qCB65Di34AiNpjhhM19RCn8yOz/2kHbug9jxfYVK8EQ1zJZanxYi6ZaH7CXSGx+HPrUIFZgL
 Rn3gw7wevvCHHNGJ8KcAeZUP4ThzUPXa5sTfyLks86y+tquW8L8KhbaoQVnnlTS3WLOgJ9Ri
 n8AP9ZjRKGyd9avvuCqyJxDZby8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e789659.7f97a78fcf10-smtp-out-n04;
 Mon, 23 Mar 2020 10:58:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6AE2CC433BA; Mon, 23 Mar 2020 10:58:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5E3E9C433D2;
 Mon, 23 Mar 2020 10:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5E3E9C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 23 Mar 2020 16:28:22 +0530
Message-Id: <1584961102-17735-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [104.130.122.26 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jGKn4-00DmKt-7h
Subject: [f2fs-dev] [PATCH v4] fsck.f2fs: allow fsck to fix issues with
 online resize due to SPO
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

Add support for new CP flag CP_RESIZEFS_FLAG set during online
resize FS. If SPO happens after SB is updated but CP isn't, then
allow fsck to fix it.

The fsck errors without this fix -
    Info: CKPT version = 6ed7bccb
            Wrong user_block_count(2233856)
    [f2fs_do_mount:3365] Checkpoint is polluted

The subsequent mount failure without this fix -
[   11.294650] F2FS-fs (sda8): Wrong user_block_count: 2233856
[   11.300272] F2FS-fs (sda8): Failed to get valid F2FS checkpoint

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
v4:
- add conditions to allow fix for -a or -p option as well

 fsck/mount.c      | 62 +++++++++++++++++++++++++++++++++++++++++--------------
 include/f2fs_fs.h |  1 +
 2 files changed, 47 insertions(+), 16 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index e4ba048..387957f 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -429,6 +429,8 @@ void print_cp_state(u32 flag)
 		MSG(0, "%s", " orphan_inodes");
 	if (flag & CP_DISABLED_FLAG)
 		MSG(0, "%s", " disabled");
+	if (flag & CP_RESIZEFS_FLAG)
+		MSG(0, "%s", " resizefs");
 	if (flag & CP_UMOUNT_FLAG)
 		MSG(0, "%s", " unmount");
 	else
@@ -1123,11 +1125,26 @@ fail_no_cp:
 	return -EINVAL;
 }
 
+static int f2fs_chk_fix_on_state(struct f2fs_super_block *sb, u32 flag)
+{
+	if (!c.fix_on && (c.auto_fix || c.preen_mode)) {
+		if (flag & CP_FSCK_FLAG ||
+			flag & CP_QUOTA_NEED_FSCK_FLAG ||
+			(exist_qf_ino(sb) && (flag & CP_ERROR_FLAG))) {
+			c.fix_on = 1;
+		} else if (!c.preen_mode) {
+			print_cp_state(flag);
+		}
+	}
+	return c.fix_on;
+}
+
 int sanity_check_ckpt(struct f2fs_sb_info *sbi)
 {
 	unsigned int total, fsmeta;
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
+	unsigned int flag = get_cp(ckpt_flags);
 	unsigned int ovp_segments, reserved_segments;
 	unsigned int main_segs, blocks_per_seg;
 	unsigned int sit_segs, nat_segs;
@@ -1164,8 +1181,31 @@ int sanity_check_ckpt(struct f2fs_sb_info *sbi)
 	log_blocks_per_seg = get_sb(log_blocks_per_seg);
 	if (!user_block_count || user_block_count >=
 			segment_count_main << log_blocks_per_seg) {
-		MSG(0, "\tWrong user_block_count(%u)\n", user_block_count);
-		return 1;
+		ASSERT_MSG("\tWrong user_block_count(%u)\n", user_block_count);
+		if (!f2fs_chk_fix_on_state(sb, flag))
+			return 1;
+
+		if (flag & (CP_FSCK_FLAG | CP_RESIZEFS_FLAG)) {
+			u32 valid_user_block_cnt;
+			u32 seg_cnt_main = get_sb(segment_count) -
+					(get_sb(segment_count_ckpt) +
+					 get_sb(segment_count_sit) +
+					 get_sb(segment_count_nat) +
+					 get_sb(segment_count_ssa));
+
+			/* validate segment_count_main in sb first */
+			if (seg_cnt_main != get_sb(segment_count_main)) {
+				MSG(0, "Inconsistent segment_cnt_main %u in sb\n",
+						segment_count_main << log_blocks_per_seg);
+				return 1;
+			}
+			valid_user_block_cnt = ((get_sb(segment_count_main) -
+						get_cp(overprov_segment_count)) * c.blks_per_seg);
+			MSG(0, "Info: Fix wrong user_block_count in CP: (%u) -> (%u)\n",
+					user_block_count, valid_user_block_cnt);
+			set_cp(user_block_count, valid_user_block_cnt);
+			c.bug_on = 1;
+		}
 	}
 
 	main_segs = get_sb(segment_count_main);
@@ -3361,6 +3401,8 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
 		return -1;
 	}
 
+	c.bug_on = 0;
+
 	if (sanity_check_ckpt(sbi)) {
 		ERR_MSG("Checkpoint is polluted\n");
 		return -1;
@@ -3380,8 +3422,6 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
 			c.fix_on = 1;
 	}
 
-	c.bug_on = 0;
-
 	if (tune_sb_features(sbi))
 		return -1;
 
@@ -3411,18 +3451,8 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
 		return -1;
 	}
 
-	if (!c.fix_on && (c.auto_fix || c.preen_mode)) {
-		u32 flag = get_cp(ckpt_flags);
-
-		if (flag & CP_FSCK_FLAG ||
-			flag & CP_QUOTA_NEED_FSCK_FLAG ||
-			(exist_qf_ino(sb) && (flag & CP_ERROR_FLAG))) {
-			c.fix_on = 1;
-		} else if (!c.preen_mode) {
-			print_cp_state(flag);
-			return 1;
-		}
-	}
+	if (!f2fs_chk_fix_on_state(sb, get_cp(ckpt_flags)))
+		return 1;
 
 	/* Check nat_bits */
 	if (c.func == FSCK && is_set_ckpt_flags(cp, CP_NAT_BITS_FLAG)) {
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index af31bc5..265f50c 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -678,6 +678,7 @@ struct f2fs_super_block {
 /*
  * For checkpoint
  */
+#define CP_RESIZEFS_FLAG                0x00004000
 #define CP_DISABLED_FLAG		0x00001000
 #define CP_QUOTA_NEED_FSCK_FLAG		0x00000800
 #define CP_LARGE_NAT_BITMAP_FLAG	0x00000400
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
