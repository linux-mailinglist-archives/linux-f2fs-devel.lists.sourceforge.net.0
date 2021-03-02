Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F3F3296F7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Mar 2021 09:36:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lH0Vb-0007W9-J0; Tue, 02 Mar 2021 08:36:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lH0VZ-0007W1-R3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 08:35:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jzMv3mfYCo8BKFuj23ApMkTHr7SWDpWYNUuPsMbN2UM=; b=cd4zGRjtNsm/bu7m+tuyVh/BRb
 sgG4H3wmxs6cKf+9rfQ6L7GXV/6I/hFaNajLpA2do+E4SF8wf0YXuVUpaOJ4h1+Z18vh1BBAfAq7e
 Zb/MubIQI8uzikHYsP16FIGnMMPr8+7rnVeJBbzepzEL1WvW84lIEADL1OPiLcV/x+nk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jzMv3mfYCo8BKFuj23ApMkTHr7SWDpWYNUuPsMbN2UM=; b=Q
 nf5lParHpr5oY5iJG3dq999j4wlniA10wa5KxixJq0nmDSTp/aPhyo6p6Z4sYmLMOOb9T3F768yZx
 mclCS0HSDv0UmxdqdODeTtCaUB/uQnjeNrFc1zyJoiCWjszhnG1L3KsEALKEgv/UPvN6LJWgdz57J
 iJxh7zKJ+KDhDihs=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lH0VU-0002uL-AE
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 08:35:57 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DqVls14Skz7s37;
 Tue,  2 Mar 2021 16:34:01 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Tue, 2 Mar 2021 16:35:35 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 2 Mar 2021 16:35:32 +0800
Message-ID: <20210302083532.11669-1-yuchao0@huawei.com>
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
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lH0VU-0002uL-AE
Subject: [f2fs-dev] [PATCH] f2fs: remove unused file_clear_encrypt()
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

- file_clear_encrypt() was never be used, remove it.
- In addition, relocating macros for cleanup.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/f2fs.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4fc343aa0a08..ddd54f5cf932 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -637,21 +637,26 @@ enum {
 #define FADVISE_MODIFIABLE_BITS	(FADVISE_COLD_BIT | FADVISE_HOT_BIT)
 
 #define file_is_cold(inode)	is_file(inode, FADVISE_COLD_BIT)
-#define file_wrong_pino(inode)	is_file(inode, FADVISE_LOST_PINO_BIT)
 #define file_set_cold(inode)	set_file(inode, FADVISE_COLD_BIT)
-#define file_lost_pino(inode)	set_file(inode, FADVISE_LOST_PINO_BIT)
 #define file_clear_cold(inode)	clear_file(inode, FADVISE_COLD_BIT)
+
+#define file_wrong_pino(inode)	is_file(inode, FADVISE_LOST_PINO_BIT)
+#define file_lost_pino(inode)	set_file(inode, FADVISE_LOST_PINO_BIT)
 #define file_got_pino(inode)	clear_file(inode, FADVISE_LOST_PINO_BIT)
+
 #define file_is_encrypt(inode)	is_file(inode, FADVISE_ENCRYPT_BIT)
 #define file_set_encrypt(inode)	set_file(inode, FADVISE_ENCRYPT_BIT)
-#define file_clear_encrypt(inode) clear_file(inode, FADVISE_ENCRYPT_BIT)
+
 #define file_enc_name(inode)	is_file(inode, FADVISE_ENC_NAME_BIT)
 #define file_set_enc_name(inode) set_file(inode, FADVISE_ENC_NAME_BIT)
+
 #define file_keep_isize(inode)	is_file(inode, FADVISE_KEEP_SIZE_BIT)
 #define file_set_keep_isize(inode) set_file(inode, FADVISE_KEEP_SIZE_BIT)
+
 #define file_is_hot(inode)	is_file(inode, FADVISE_HOT_BIT)
 #define file_set_hot(inode)	set_file(inode, FADVISE_HOT_BIT)
 #define file_clear_hot(inode)	clear_file(inode, FADVISE_HOT_BIT)
+
 #define file_is_verity(inode)	is_file(inode, FADVISE_VERITY_BIT)
 #define file_set_verity(inode)	set_file(inode, FADVISE_VERITY_BIT)
 
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
