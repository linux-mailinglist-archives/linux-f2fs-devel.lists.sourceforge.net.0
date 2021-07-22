Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 645AE3D1C67
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 05:31:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6PQr-0006v6-Du; Thu, 22 Jul 2021 03:31:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack.qiu@huawei.com>) id 1m6PQq-0006uv-Es
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 03:31:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b8RGLvF8kt/+OnKV7kWDD26xqVJ0z18mWX7bRRl0Xsk=; b=LJPgmp6HuyLRL5WKNcBMYZ+8Kh
 oLr2F6wmfAIO9rZQGnVKR41NdBytO5ZwzppKOUmbK462xLxWCbpKNeUqDzrbydubGUKNGpC+OnpNA
 q6lrp7oA0PaY2TbfCeR6XdcdJjE70UvPm+CFebasEbYuuE3QebI7C+8Vaqv6qZUrVXXo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=b8RGLvF8kt/+OnKV7kWDD26xqVJ0z18mWX7bRRl0Xsk=; b=K
 F2YZwm4rG4IllFv5gqeO5aotvbVQvkyJlVY9u1EarrZAGBkE/Y2ijXL2vjDZJ+b32sIQK5GRt8DbQ
 5RySVk299w8pG3+VjMzBzDngwA1z8peGpP0Lx8I6Q09MPLF/0He34qsjXU1eQvG0MnNVE37JhdMp6
 XBN6dEPI4uSRPZkU=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6PQn-00GNIF-Vj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 03:31:32 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GVdCl69mSz7wtF;
 Thu, 22 Jul 2021 11:26:43 +0800 (CST)
Received: from dggpemm500008.china.huawei.com (7.185.36.136) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 11:31:18 +0800
Received: from huawei.com (10.175.101.6) by dggpemm500008.china.huawei.com
 (7.185.36.136) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 22 Jul
 2021 11:31:18 +0800
From: Jack Qiu <jack.qiu@huawei.com>
To: <chao@kernel.org>, <jaegeuk@kernel.org>
Date: Thu, 22 Jul 2021 12:41:30 +0800
Message-ID: <20210722044130.44591-1-jack.qiu@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500008.china.huawei.com (7.185.36.136)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.189 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1m6PQn-00GNIF-Vj
Subject: [f2fs-dev] [PATCH -next] f2fs: fix use after free in f2fs_fill_super
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

The root cause is shrink_dcache_sb after sbi has been freed.
So call shrink_dcache_sb before free sbi and other resources.

==================================================================
BUG: KASAN: use-after-free in f2fs_evict_inode+0x31c/0xde5
Read of size 4 at addr ffff8881d97f0d50 by task syz-executor.3/8729

PU: 1 PID: 8729 Comm: syz-executor.3 Not tainted
4.19.195-00002-g67dceea04431-dirty #31
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
?-20190727_073836-buildvm-ppc64le-16.ppc.fedoraproject.org-3.fc31
04/01/2014
Call Trace:
 dump_stack+0xe5/0x14b
 ? f2fs_evict_inode+0x31c/0xde5
 print_address_description+0x6c/0x237
 ? f2fs_evict_inode+0x31c/0xde5
 kasan_report.cold+0x88/0x2a3
 f2fs_evict_inode+0x31c/0xde5
 ? full_proxy_open.cold+0x12/0x12
 evict+0x2cd/0x5f0
 iput+0x3d9/0x6f0
 dentry_unlink_inode+0x273/0x330
 __dentry_kill+0x340/0x5e0
 dentry_kill+0xb7/0x740
 shrink_dentry_list+0x256/0x660
 shrink_dcache_sb+0x11f/0x1d0
 ? shrink_dentry_list+0x660/0x660
 ? __kasan_slab_free+0x144/0x180
 f2fs_fill_super+0x2a34/0x4a80
 ? f2fs_sanity_check_ckpt.cold+0x2b6/0x2b6
 ? wait_for_completion+0x3c0/0x3c0
 ? set_blocksize+0x230/0x2b0
 mount_bdev+0x2c1/0x370
 ? f2fs_sanity_check_ckpt.cold+0x2b6/0x2b6
 mount_fs+0x4c/0x1c0
 vfs_kern_mount.part.0+0x60/0x3d0
 do_mount+0x367/0x2570
 ? kasan_unpoison_shadow+0x33/0x40
 ? copy_mount_string+0x40/0x40
 ? kmem_cache_alloc_trace+0x13f/0x2b0
 ? _copy_from_user+0x94/0x100
 ? copy_mount_options+0x1f1/0x2e0
 ksys_mount+0xa0/0x100
 __x64_sys_mount+0xbf/0x160
 do_syscall_64+0xc2/0x190
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x47938e
Code: 48 c7 c1 b4 ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84
00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 c7 c1 b4 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fed673b6a48 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000020000200 RCX: 000000000047938e
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007fed673b6aa0
RBP: 00007fed673b6ae0 R08: 00007fed673b6ae0 R09: 0000000020000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000020000000
R13: 0000000020000100 R14: 00007fed673b6aa0 R15: 0000000020000b00

Allocated by task 8729:
 kasan_kmalloc+0xc2/0xe0
 kmem_cache_alloc_trace+0x13f/0x2b0
 f2fs_fill_super+0x124/0x4a80
 mount_bdev+0x2c1/0x370
 mount_fs+0x4c/0x1c0
 vfs_kern_mount.part.0+0x60/0x3d0
 do_mount+0x367/0x2570
 ksys_mount+0xa0/0x100
 __x64_sys_mount+0xbf/0x160
 do_syscall_64+0xc2/0x190
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 8729:
 __kasan_slab_free+0x12f/0x180
 kfree+0xfa/0x2a0
 f2fs_fill_super+0x2a00/0x4a80
 mount_bdev+0x2c1/0x370
 mount_fs+0x4c/0x1c0
 vfs_kern_mount.part.0+0x60/0x3d0
 do_mount+0x367/0x2570
 ksys_mount+0xa0/0x100
 __x64_sys_mount+0xbf/0x160
 do_syscall_64+0xc2/0x190
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
---
 fs/f2fs/super.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 8fecd3050ccd..b041625e06ce 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4229,6 +4229,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 free_compress_inode:
 	f2fs_destroy_compress_inode(sbi);
 free_root_inode:
+	if (retry_cnt > 0 && skip_recovery)
+		shrink_dcache_sb(sb);
 	dput(sb->s_root);
 	sb->s_root = NULL;
 free_node_inode:
@@ -4285,7 +4287,6 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	/* give only one another chance */
 	if (retry_cnt > 0 && skip_recovery) {
 		retry_cnt--;
-		shrink_dcache_sb(sb);
 		goto try_onemore;
 	}
 	return err;
--
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
