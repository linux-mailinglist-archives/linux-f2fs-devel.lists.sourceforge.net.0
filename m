Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B38A82C315
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 May 2019 11:24:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hVYL4-0000VQ-Hn; Tue, 28 May 2019 09:24:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hVYL3-0000VC-EQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 May 2019 09:24:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cp3W6LHMZ+QhQjSpTzNYICAKjBMmbNca4R1+mMrGkDs=; b=R5lYEOvvbeue7DQovyDb5GIbBB
 IrPCGZPWATVQrHYVLWA6br9D9eUFYBAf4JntZnPnNUqcwUfQZeWpQGfK1LxBXW6zcM6iUakFJgzFe
 xFbZhaEFKAdgo+zanByCRSwIzM4WcL6a9fj7WEnFkUG+J37LKPbhqmOFzBC9G/qw7WD0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Cp3W6LHMZ+QhQjSpTzNYICAKjBMmbNca4R1+mMrGkDs=; b=j
 lS0N2k9kMaKxJsBaL7EaSeqrHvafFWyrDDBC7wuihYUY7+glvmaasXVpz5EBunyteKfAirtThmEef
 Enn1KpMcwfaO4g9Dcda1y1QfHOOEr3bAt+aWj6u/Hlhu/SRjHSsPxv5e1CNqtrrbkvdC7JgaSa9/A
 bOq7JNoyTsJtYgiY=;
Received: from szxga01-in.huawei.com ([45.249.212.187] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hVYL1-000FQt-AF
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 May 2019 09:24:09 +0000
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id 4E579AB9A14B33D88FD5;
 Tue, 28 May 2019 17:24:00 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 28 May 2019 17:23:59 +0800
Received: from szvp000201624.huawei.com (10.120.216.130) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 28 May 2019 17:23:59 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 28 May 2019 17:23:33 +0800
Message-ID: <20190528092333.42663-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggeme712-chm.china.huawei.com (10.1.199.108) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hVYL1-000FQt-AF
Subject: [f2fs-dev] [PATCH] f2fs: fix sparse warning
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

make C=2 CHECKFLAGS="-D__CHECK_ENDIAN__"

CHECK   dir.c
dir.c:842:50: warning: cast from restricted __le32
CHECK   node.c
node.c:2759:40: warning: restricted __le32 degrades to integer

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/dir.c  | 4 ++--
 fs/f2fs/node.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 59bc46017855..64cb61c42b95 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -828,8 +828,8 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
 			int save_len = fstr->len;
 
 			err = fscrypt_fname_disk_to_usr(d->inode,
-						(u32)de->hash_code, 0,
-						&de_name, fstr);
+						(u32)le32_to_cpu(de->hash_code),
+						0, &de_name, fstr);
 			if (err)
 				goto out;
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 18a038a2a9fa..865f1525df32 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2725,7 +2725,7 @@ static void __update_nat_bits(struct f2fs_sb_info *sbi, nid_t start_nid,
 		i = 1;
 	}
 	for (; i < NAT_ENTRY_PER_BLOCK; i++) {
-		if (nat_blk->entries[i].block_addr != NULL_ADDR)
+		if (le32_to_cpu(nat_blk->entries[i].block_addr) != NULL_ADDR)
 			valid++;
 	}
 	if (valid == 0) {
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
