Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A60673526DE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Apr 2021 09:13:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lSDzy-0003zK-Op; Fri, 02 Apr 2021 07:13:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yuchao0@huawei.com>) id 1lSDzx-0003z9-9M
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Apr 2021 07:13:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4bTbeffMMGkwWpdDsIfbhqJ2nR1AeY0kiQobvMmw0OQ=; b=AvQFKgKcMrVLfdvsQgvOYjjZDp
 VAP4q9MGwiO9kMGi35ogzUBnuwTM13DE6fAsz8sNp2w3XzdX/8ANysfyXEpq4anjskaztZMJOUdyB
 X2pHAhqkiog7T54ovusShoTzEjkqhVnq+JKep3aJ6Djn6TjAcC52/AMyDkIAx1knK5XU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4bTbeffMMGkwWpdDsIfbhqJ2nR1AeY0kiQobvMmw0OQ=; b=M
 KMZ9N/K3Yub32PvvJQhEFNAGp+b2fkzC/NpkkOWZ7qXmn9IMnA8PwNMBFsh+jKOW2iXRTtPSGOOWj
 2flFuoz616DhgysKlfyDaoGJpW80Z7N3oHyJq7tmucODTMjcByONd3A3LEliFf7rVQJo22Ss31Vna
 U+4RXWXDtRgHfYc0=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lSDzl-005pZN-9n
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Apr 2021 07:13:41 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FBWRG53jNzNsD8;
 Fri,  2 Apr 2021 15:10:34 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Fri, 2 Apr 2021 15:13:05 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 2 Apr 2021 15:12:43 +0800
Message-ID: <20210402071243.101214-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lSDzl-005pZN-9n
Subject: [f2fs-dev] [PATCH] resize.f2fs: fix wrong sit/nat bitmap during
 rebuild_checkpoint()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As beroal <me@beroal.in.ua> reported: f2fs image can be corrupted
after below testcase:

1. truncate -s $((256*1024*1024)) img
2. mkfs.f2fs -f img
3. mount -t f2fs -o loop img /mnt
4. xfs_io -f /mnt/file -c "pwrite 0 2M" -c "fsync"
5. umount /mnt
6. resize.f2fs -s -t 262144 img
7. fsck.f2fs img

The root cause is we forgot to copy original sit/nat bitmap to
new checkpoint during rebuild_checkpoint(), fix it.

Reported-by: beroal <me@beroal.in.ua>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/resize.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fsck/resize.c b/fsck/resize.c
index 46b1cfb218cf..b3920560974b 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -526,6 +526,11 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
 
 	memcpy(new_cp, cp, (unsigned char *)cp->sit_nat_version_bitmap -
 						(unsigned char *)cp);
+	if (c.safe_resize)
+		memcpy((void *)new_cp + CP_BITMAP_OFFSET,
+			(void *)cp + CP_BITMAP_OFFSET,
+			F2FS_BLKSIZE - CP_BITMAP_OFFSET);
+
 	new_cp->checkpoint_ver = cpu_to_le64(cp_ver + 1);
 
 	crc = f2fs_checkpoint_chksum(new_cp);
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
