Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D79EBA858D6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Apr 2025 12:06:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u3BGz-0006ov-7i;
	Fri, 11 Apr 2025 10:06:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u3BGs-0006oQ-Ef
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 10:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kInv09kSlSyyj6yBJYdWjF7Toh4134IVhUqG04JBXMQ=; b=QcDtlPvI2a1ywd8OefTzPbdbMR
 gcdvesdPi8kOHd7V/CPAwM2zRbwSN8OYDF1j0QvQ8yk/cvuQlvCv8ezNVFt+wjc5G3IlCwg1Ob2iH
 rYCwO+6UkiPHKJu/GIPAiFQSdTWurFHCnVlhcEQ/i/4EFbQcdei7thqOw2z/AWmPiYu8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kInv09kSlSyyj6yBJYdWjF7Toh4134IVhUqG04JBXMQ=; b=G
 sCoxQ9Y3PYOcL4Vv0OSxWsi6Hnuqs0BkXvtrPW3iZDnOTy4/nNTJ/UDCzY4nSYhb3mCIM6C/NLKu4
 1VyGhrJGFA/cOpR6WFNVxFU7tiz3uG18FGCgWIgMX5lRRj0JcGfx2uNjOTJ1FRGolm2J1iq9y+82t
 9XC9wyQfjxR7A6Ac=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u3BGd-0001Z5-Dd for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 10:06:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F0AFC4A0B2;
 Fri, 11 Apr 2025 10:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EADFCC4CEE2;
 Fri, 11 Apr 2025 10:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744365936;
 bh=5mTgP5Xh6DMI1v8kjvTRbN6DrYhvUSQ4veM77rzMF5g=;
 h=From:To:Cc:Subject:Date:From;
 b=db2oA3FIlVcTdeTMTvokamO4+7azfbYt2C/CTCnGQ+9raZ/fYvjf3yedb8W16iFTn
 DI7rZYgTJuKAcNgGxTJRhwMQhtaPVMT5DP8kw2CNrcsU1jL0qEFARo5l1G1PxOdvEL
 4vBNo1mszA/XnvdyWdCuReIVTnCSqQS+twWZLjhpGoyyCBSHHDgIe/qOMsnwXpsBMH
 LPqx6dCiZAbcYWgwmVJlYYIvVyFPwTAC2TjQDBAPJzrCj84pg4fDNZzIRco/voM8ks
 HyZbGK7Eg9jWx4/2CSadhi7GUJC8Eh56MCi8P8kKrCqq0lDyyy0t2wS7xXDDu6wC71
 fUyiIW8RdC41w==
To: jaegeuk@kernel.org
Date: Fri, 11 Apr 2025 18:05:25 +0800
Message-Id: <20250411100526.7939-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This reverts commit daa0f8b9e9b1eea6c85e5c169b809254d9d7074e.
 As Juhyung reported in [1]: Here's what I did: 1. Remounted to
 checkpoint=disable
 2. Create a dm-snapshot of the current root device 3. Mount snapshot to replay
 the log 4. Unmount 5. Resize sector 487248896 to 486539264 // ./res [...]
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u3BGd-0001Z5-Dd
Subject: [f2fs-dev] [PATCH v2 1/2] Revert "resize.f2fs: add option for
 large_nat_bitmap feature"
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This reverts commit daa0f8b9e9b1eea6c85e5c169b809254d9d7074e.

As Juhyung reported in [1]:

Here's what I did:
1. Remounted to checkpoint=disable
2. Create a dm-snapshot of the current root device
3. Mount snapshot to replay the log
4. Unmount
5. Resize sector 487248896 to 486539264
// ./resize.f2fs -d 3 -s -i /dev/mapper/snap -t 486539264

Latest f2fs-tools was used:
33c5b9539af2 f2fs_io: add fragread command to evaluate fragmented
buffer for reads

This reproduced the mount and fsck failure.

Mount log:
[442431.020594] F2FS-fs (dm-2): invalid crc_offset: 0
[442431.130055] F2FS-fs (dm-2): SIT is corrupted node# 13615201 vs 13616290
[442431.139684] F2FS-fs (dm-2): Failed to initialize F2FS segment manager (-117)

I checked below testcases:

truncate -s $((512*1024*1024*1024)) img
mkfs.f2fs -f img $((256*1024*1024))

Description		Test command					FSCK output
a) shrink w/ -s		resize.f2fs -s -i img -t $((128*1024*1024))	Fine
b) expand w/ -s		resize.f2fs -s -i img -t $((1024*1024*1024))	Corrupted
c) shrink w/o -s	resize.f2fs -i img -t $((128*1024*1024))	No run
d) expand w/o -s	resize.f2fs -i img -t $((1024*1024*1024))	Fine

Output from b):
[ASSERT] (check_block_count:2299)  --> Wrong SIT valid blocks: segno=0x29400, 0 vs. 13

The root cause is: safe mode (-s option) is conflict w/ large nat bitmap feature
(-i option), since once we enable large nat bitmap, layout of checkpoint will be
changed [2], we must relocate nat/sit_bitmap to the end of new location of
cp_checksum, however in safe mode, we won't change metadata of checkpoint, so we
need to keep nat/sit_bitmap as it is, which includes checksum data in its old
location.

Let's revert -i support for resize.f2fs first, and then reenable it after
fix and well tested.

Thanks a lot for the help from Juhyung, including providing reproducer and
hints.

[1] https://lore.kernel.org/linux-f2fs-devel/CAD14+f3D6iPOBxEgkZxxTsXCfwRKb9ph68JtUk3H9cn8ovLt9w@mail.gmail.com/
[2] https://lore.kernel.org/linux-f2fs-devel/20190514093340.40217-2-yuchao0@huawei.com/

Fixes: daa0f8b ("resize.f2fs: add option for large_nat_bitmap feature")
Reported-by: Ju Hyung Park <qkrwngud825@gmail.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- remove entry in manual page
 fsck/main.c       | 6 +-----
 fsck/resize.c     | 3 ---
 man/resize.f2fs.8 | 6 ------
 3 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index 524dbb1..af40613 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -141,7 +141,6 @@ void resize_usage()
 	MSG(0, "[options]:\n");
 	MSG(0, "  -d debug level [default:0]\n");
 	MSG(0, "  -H support write hint\n");
-	MSG(0, "  -i extended node bitmap, node ratio is 20%% by default\n");
 	MSG(0, "  -o overprovision percentage [default:auto]\n");
 	MSG(0, "  -s safe resize (Does not resize metadata)\n");
 	MSG(0, "  -t target sectors [default: device size]\n");
@@ -602,7 +601,7 @@ void f2fs_parse_options(int argc, char *argv[])
 #endif
 	} else if (!strcmp("resize.f2fs", prog)) {
 #ifdef WITH_RESIZE
-		const char *option_string = "d:fHst:io:V";
+		const char *option_string = "d:fHst:o:V";
 
 		c.func = RESIZE;
 		while ((option = getopt(argc, argv, option_string)) != EOF) {
@@ -637,9 +636,6 @@ void f2fs_parse_options(int argc, char *argv[])
 					ret = sscanf(optarg, "%"PRIx64"",
 							&c.target_sectors);
 				break;
-			case 'i':
-				c.large_nat_bitmap = 1;
-				break;
 			case 'o':
 				c.new_overprovision = atof(optarg);
 				break;
diff --git a/fsck/resize.c b/fsck/resize.c
index 9b3b071..2681b9f 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -531,9 +531,6 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
 
 	/* update nat_bits flag */
 	flags = update_nat_bits_flags(new_sb, cp, get_cp(ckpt_flags));
-	if (c.large_nat_bitmap)
-		flags |= CP_LARGE_NAT_BITMAP_FLAG;
-
 	if (flags & CP_COMPACT_SUM_FLAG)
 		flags &= ~CP_COMPACT_SUM_FLAG;
 	if (flags & CP_LARGE_NAT_BITMAP_FLAG)
diff --git a/man/resize.f2fs.8 b/man/resize.f2fs.8
index d41ad79..02ff245 100644
--- a/man/resize.f2fs.8
+++ b/man/resize.f2fs.8
@@ -21,9 +21,6 @@ resize.f2fs \- resize filesystem size
 .B \-H
 ]
 [
-.B \-i
-]
-[
 .B \-s
 ]
 [
@@ -59,9 +56,6 @@ best number will be assigned automatically according to the partition size.
 .BI \-H
 Specify support write hint.
 .TP
-.BI \-i
-Enable extended node bitmap.
-.TP
 .BI \-s
 Enable safe resize.
 .TP
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
