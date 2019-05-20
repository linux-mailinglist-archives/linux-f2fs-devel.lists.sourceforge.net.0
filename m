Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E8D229DB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 May 2019 04:09:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSXkP-0000kj-G4; Mon, 20 May 2019 02:09:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hSXkN-0000kT-S0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 02:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hjFMPa/WUq2hfo9tveV6pTF5xANzKEWYP93nJvniI8w=; b=f5cgQMsCY4VpeAp0IXS8DQgYJS
 kVjlSMMtcFrSHtJ6Bv7J9MZxIQJPqpjF4MJxaUGtKrpqAy0wHBS7cXEfPMF2XUBfxG8NdqttPwDSy
 MKe66TF8RN+EQRgnCbPwuMuJzMyv8KAekceJgeh2o/bTfik/sIDbCslepNt8cvYDjb9s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hjFMPa/WUq2hfo9tveV6pTF5xANzKEWYP93nJvniI8w=; b=G
 7ByPOof6/4XRjebXK++PV6TfB/2MQq7Vv9EeLEJh4JHpdr65877o7ifk65DAfNaMlfrHYyGeh9XC8
 a0HXsmWUR/RpWxTpAJDJluI/7pGuCdFuVgKoInsE4Knj/uG+KM+ApO11JIfnfTYkXcHUo+Xo9GJB7
 03F4AgWbct16ttDE=;
Received: from szxga08-in.huawei.com ([45.249.212.255] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSXkL-00FiRR-N5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 02:09:51 +0000
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id D2DB9F943F1E560E3177;
 Mon, 20 May 2019 10:09:42 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 20 May 2019 10:09:42 +0800
Received: from szvp000201624.huawei.com (10.120.216.130) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 20 May 2019 10:09:41 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 20 May 2019 10:09:22 +0800
Message-ID: <20190520020922.62124-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggeme708-chm.china.huawei.com (10.1.199.104) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hSXkL-00FiRR-N5
Subject: [f2fs-dev] [PATCH] f2fs: fix to check layout on last valid
 checkpoint park
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As Ju Hyung reported:

"
I was semi-forced today to use the new kernel and test f2fs.

My Ubuntu initramfs got a bit wonky and I had to boot into live CD and
fix some stuffs. The live CD was using 4.15 kernel, and just mounting
the f2fs partition there corrupted f2fs and my 4.19(with 5.1-rc1-4.19
f2fs-stable merged) refused to mount with "SIT is corrupted node"
message.

I used the latest f2fs-tools sent by Chao including "fsck.f2fs: fix to
repair cp_loads blocks at correct position"

It spit out 140M worth of output, but at least I didn't have to run it
twice. Everything returned "Ok" in the 2nd run.
The new log is at
http://arter97.com/f2fs/final

After fixing the image, I used my 4.19 kernel with 5.2-rc1-4.19
f2fs-stable merged and it mounted.

But, I got this:
[    1.047791] F2FS-fs (nvme0n1p3): layout of large_nat_bitmap is
deprecated, run fsck to repair, chksum_offset: 4092
[    1.081307] F2FS-fs (nvme0n1p3): Found nat_bits in checkpoint
[    1.161520] F2FS-fs (nvme0n1p3): recover fsync data on readonly fs
[    1.162418] F2FS-fs (nvme0n1p3): Mounted with checkpoint version = 761c7e00

But after doing a reboot, the message is gone:
[    1.098423] F2FS-fs (nvme0n1p3): Found nat_bits in checkpoint
[    1.177771] F2FS-fs (nvme0n1p3): recover fsync data on readonly fs
[    1.178365] F2FS-fs (nvme0n1p3): Mounted with checkpoint version = 761c7eda

I'm not exactly sure why the kernel detected that I'm still using the
old layout on the first boot. Maybe fsck didn't fix it properly, or
the check from the kernel is improper.
"

Although we have rebuild the old deprecated checkpoint with new layout
during repair, we only repair last checkpoint park, the other old one is
remained.

Once the image was mounted, we will 1) sanity check layout and 2) decide
which checkpoint park to use according to cp_ver. So that we will print
reported message unnecessarily at step 1), to avoid it, we simply move
layout check into f2fs_sanity_check_ckpt() after step 2).

Reported-by: Park Ju Hyung <qkrwngud825@gmail.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---

Hi Jaegeuk,

Ju Hyung suggested that we can show more detailed info about f2fs-tools
version to user, I think it's helpful, could you consider to change the
log as below?

			f2fs_msg(sbi->sb, KERN_WARNING, 
				"using deprecated layout of large_nat_bitmap, " 
				"please run fsck v1.13.0 or higher to repair, " 
				"chksum_offset: %u", chksum_offset); 

 fs/f2fs/checkpoint.c | 11 -----------
 fs/f2fs/super.c      |  9 +++++++++
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 22c2cac646f4..739b03c9677b 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -832,17 +832,6 @@ static int get_checkpoint_version(struct f2fs_sb_info *sbi, block_t cp_addr,
 		return -EINVAL;
 	}
 
-	if (__is_set_ckpt_flags(*cp_block, CP_LARGE_NAT_BITMAP_FLAG)) {
-		if (crc_offset != CP_MIN_CHKSUM_OFFSET) {
-			f2fs_put_page(*cp_page, 1);
-			f2fs_msg(sbi->sb, KERN_WARNING,
-				"layout of large_nat_bitmap is deprecated, "
-				"run fsck to repair, chksum_offset: %zu",
-				crc_offset);
-			return -EINVAL;
-		}
-	}
-
 	crc = f2fs_checkpoint_chksum(sbi, *cp_block);
 	if (crc != cur_cp_crc(*cp_block)) {
 		f2fs_put_page(*cp_page, 1);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f26f0ec78b3d..3c71b9a71932 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2727,6 +2727,15 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 		return 1;
 	}
 
+	if (__is_set_ckpt_flags(ckpt, CP_LARGE_NAT_BITMAP_FLAG) &&
+		le32_to_cpu(ckpt->checksum_offset) != CP_MIN_CHKSUM_OFFSET) {
+		f2fs_msg(sbi->sb, KERN_WARNING,
+			"layout of large_nat_bitmap is deprecated, "
+			"run fsck to repair, chksum_offset: %u",
+			le32_to_cpu(ckpt->checksum_offset));
+		return 1;
+	}
+
 	if (unlikely(f2fs_cp_error(sbi))) {
 		f2fs_msg(sbi->sb, KERN_ERR, "A bug case: need to run fsck");
 		return 1;
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
