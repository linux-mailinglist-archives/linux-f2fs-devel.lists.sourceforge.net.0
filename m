Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAAB621ECC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Nov 2022 23:05:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1osWiW-0005H9-J8;
	Tue, 08 Nov 2022 22:05:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <penguin-kernel@I-love.SAKURA.ne.jp>)
 id 1osWiR-0005Gy-Af for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Nov 2022 22:05:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:Cc:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BtojO97rwG1uXzhqo4BuE8Wgbb1x7S6pz9yby8+FKBs=; b=T1AR2s5ghCuhXIZwdBVnCrtmxv
 8AYkpicZVrjaX+4Jhsa77LkFBRVyqB2WvlYH4I4Pydf+2WV0gDc/oUiYLxY5tPDh81BNhVq+vqEYZ
 bWtzYckze5uzX41vMA+LnTZl5IdoZMgpStUls2T3tz6S8UZmQis4Ycnj4/vFP5ViTfj8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BtojO97rwG1uXzhqo4BuE8Wgbb1x7S6pz9yby8+FKBs=; b=IX+MgSuA6JkxgJ/BM/SbiS+Zyk
 Y4Cuhdhvg+eSM4i0fS2bk93LAQ+touELnMj8UxIRvWUjQ2QKeMDyOi5AhFHhuD2AbkO5+Rzq/lJJm
 kPM4DiMkG4q6CH8dvZdD1ZAhbw81xWuQyydzt1XeygZrNwU9FZQ8y02AEnjBZ1kOG1wI=;
Received: from www262.sakura.ne.jp ([202.181.97.72])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1osWiM-00HYcX-FS for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Nov 2022 22:05:07 +0000
Received: from fsav111.sakura.ne.jp (fsav111.sakura.ne.jp [27.133.134.238])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 2A8M4gNY082987;
 Wed, 9 Nov 2022 07:04:42 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav111.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav111.sakura.ne.jp);
 Wed, 09 Nov 2022 07:04:42 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav111.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 2A8M4gFU082977
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 9 Nov 2022 07:04:42 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <d8aec8b1-4982-fc06-fd30-0b9a4b4fc4b9@I-love.SAKURA.ne.jp>
Date: Wed, 9 Nov 2022 07:04:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
References: <0000000000007edb6605ecbb6442@google.com>
 <0000000000006a83e705ecea7171@google.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <0000000000006a83e705ecea7171@google.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot is reporting lockdep warning at f2fs_handle_error()
 [1], for spin_lock(&sbi->error_lock) is called before spin_lock_init() is
 called. For safe locking in error handling, move initialization of [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1osWiM-00HYcX-FS
Subject: [f2fs-dev] [PATCH] f2fs: initialize locks earlier in
 f2fs_fill_super()
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
Cc: syzbot <syzbot+40642be9b7e0bb28e0df@syzkaller.appspotmail.com>,
 terrelln@fb.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzbot is reporting lockdep warning at f2fs_handle_error() [1], for
spin_lock(&sbi->error_lock) is called before spin_lock_init() is called.
For safe locking in error handling, move initialization of locks (and
obvious structures) in f2fs_fill_super() to immediately after memory
allocation.

Link: https://syzkaller.appspot.com/bug?extid=40642be9b7e0bb28e0df [1]
Reported-by: syzbot <syzbot+40642be9b7e0bb28e0df@syzkaller.appspotmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Tested-by: syzbot <syzbot+40642be9b7e0bb28e0df@syzkaller.appspotmail.com>
---
 fs/f2fs/super.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3834ead04620..8df94d287a36 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4095,6 +4095,23 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
 	sbi->sb = sb;
 
+	/* initialize locks within allocated memory */
+	init_f2fs_rwsem(&sbi->gc_lock);
+	mutex_init(&sbi->writepages);
+	init_f2fs_rwsem(&sbi->cp_global_sem);
+	init_f2fs_rwsem(&sbi->node_write);
+	init_f2fs_rwsem(&sbi->node_change);
+	spin_lock_init(&sbi->stat_lock);
+	init_f2fs_rwsem(&sbi->cp_rwsem);
+	init_f2fs_rwsem(&sbi->quota_sem);
+	init_waitqueue_head(&sbi->cp_wait);
+	spin_lock_init(&sbi->error_lock);
+	for (i = 0; i < NR_INODE_TYPE; i++) {
+		INIT_LIST_HEAD(&sbi->inode_list[i]);
+		spin_lock_init(&sbi->inode_lock[i]);
+	}
+	mutex_init(&sbi->flush_lock);
+
 	/* Load the checksum driver */
 	sbi->s_chksum_driver = crypto_alloc_shash("crc32", 0, 0);
 	if (IS_ERR(sbi->s_chksum_driver)) {
@@ -4174,23 +4191,14 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
 	/* init f2fs-specific super block info */
 	sbi->valid_super_block = valid_super_block;
-	init_f2fs_rwsem(&sbi->gc_lock);
-	mutex_init(&sbi->writepages);
-	init_f2fs_rwsem(&sbi->cp_global_sem);
-	init_f2fs_rwsem(&sbi->node_write);
-	init_f2fs_rwsem(&sbi->node_change);
 
 	/* disallow all the data/node/meta page writes */
 	set_sbi_flag(sbi, SBI_POR_DOING);
-	spin_lock_init(&sbi->stat_lock);
 
 	err = f2fs_init_write_merge_io(sbi);
 	if (err)
 		goto free_bio_info;
 
-	init_f2fs_rwsem(&sbi->cp_rwsem);
-	init_f2fs_rwsem(&sbi->quota_sem);
-	init_waitqueue_head(&sbi->cp_wait);
 	init_sb_info(sbi);
 
 	err = f2fs_init_iostat(sbi);
@@ -4255,7 +4263,6 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		goto free_devices;
 	}
 
-	spin_lock_init(&sbi->error_lock);
 	memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_ERRORS);
 
 	sbi->total_valid_node_count =
@@ -4271,12 +4278,6 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	limit_reserve_root(sbi);
 	adjust_unusable_cap_perc(sbi);
 
-	for (i = 0; i < NR_INODE_TYPE; i++) {
-		INIT_LIST_HEAD(&sbi->inode_list[i]);
-		spin_lock_init(&sbi->inode_lock[i]);
-	}
-	mutex_init(&sbi->flush_lock);
-
 	f2fs_init_extent_cache_info(sbi);
 
 	f2fs_init_ino_entry_info(sbi);
-- 
2.18.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
