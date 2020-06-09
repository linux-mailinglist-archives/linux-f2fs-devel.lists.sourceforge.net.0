Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 482CB1F31EA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Jun 2020 03:22:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jiSyO-0001jL-T2; Tue, 09 Jun 2020 01:22:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jiSyN-0001jE-Lq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Jun 2020 01:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/lKEeH82FAP2T4Gb2kCeBPUWnj7zsyVaKrTYusWU+6s=; b=fmnXWKQ5Tdbf/uFj/wW7cs4wRd
 XjAHJlUBgEtb1H3yVI8qBDnhLyeaotht4Zsfc6V0mxsGDiMhKRiH41uRe3fHU53vpJVHS7TE2hrP0
 U1qPMbFPc3xO+/qbY1oXxQPwmtLPHg1aQLU6VpeNThwHShufiFdH8r6MGLdRhhG0Yjok=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/lKEeH82FAP2T4Gb2kCeBPUWnj7zsyVaKrTYusWU+6s=; b=kb9V18KywJjtB7dOEvImJFMhBt
 cqUdia62+ojrOB1a4HOktYjmYlrhNPXeZdp2y7peawzBc/bCVqBiyVGhdRsp16KJqugCJHzJxXojB
 5PqHJHf+0epxX69QebIYsMj/Sqel6V0MI7MRRcvuwH3t2TBi9xcd4kX97Qdceh9daCZs=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jiSyK-00C9bE-VY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Jun 2020 01:22:39 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 04AFF35E5A7AEEBD6161;
 Tue,  9 Jun 2020 09:22:13 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 9 Jun 2020
 09:22:12 +0800
To: Denis Efremov <efremov@linux.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200605181533.73113-1-efremov@linux.com>
 <20200608154123.235198-1-efremov@linux.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <d5462b81-6b32-0810-026f-1c07e166cbc8@huawei.com>
Date: Tue, 9 Jun 2020 09:22:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200608154123.235198-1-efremov@linux.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jiSyK-00C9bE-VY
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: use kfree() instead of kvfree() to
 free superblock data
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

Hello Denis,

On 2020/6/8 23:41, Denis Efremov wrote:
> Use kfree() instead of kvfree() to free super in read_raw_super_block()
> because the memory is allocated with kzalloc() in the function.
> Use kfree() instead of kvfree() to free sbi in f2fs_fill_super() and
> f2fs_put_super() because the memory is allocated with kzalloc().
> 
> Fixes: 5222595d093e ("f2fs: use kvmalloc, if kmalloc is failed")
> Signed-off-by: Denis Efremov <efremov@linux.com>

I found two missing cases, so how about this?

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f3c151169542..f913a63e93f0 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1206,7 +1206,7 @@ static void f2fs_put_super(struct super_block *sb)
 	sb->s_fs_info = NULL;
 	if (sbi->s_chksum_driver)
 		crypto_free_shash(sbi->s_chksum_driver);
-	kvfree(sbi->raw_super);
+	kfree(sbi->raw_super);

 	destroy_device_list(sbi);
 	f2fs_destroy_xattr_caches(sbi);
@@ -1221,7 +1221,7 @@ static void f2fs_put_super(struct super_block *sb)
 #ifdef CONFIG_UNICODE
 	utf8_unload(sbi->s_encoding);
 #endif
-	kvfree(sbi);
+	kfree(sbi);
 }

 int f2fs_sync_fs(struct super_block *sb, int sync)
@@ -3101,7 +3101,7 @@ static int read_raw_super_block(struct f2fs_sb_info *sbi,

 	/* No valid superblock */
 	if (!*raw_super)
-		kvfree(super);
+		kfree(super);
 	else
 		err = 0;

@@ -3779,11 +3779,11 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 #endif
 	kvfree(options);
 free_sb_buf:
-	kvfree(raw_super);
+	kfree(raw_super);
 free_sbi:
 	if (sbi->s_chksum_driver)
 		crypto_free_shash(sbi->s_chksum_driver);
-	kvfree(sbi);
+	kfree(sbi);

 	/* give only one another chance */
 	if (retry_cnt > 0 && skip_recovery) {



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
