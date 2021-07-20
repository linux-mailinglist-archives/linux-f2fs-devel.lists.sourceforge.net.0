Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A1B3CF509
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jul 2021 09:07:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m5jq8-0005tT-UW; Tue, 20 Jul 2021 07:06:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <frank.li@vivo.com>) id 1m5jq7-0005tL-BR
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Jul 2021 07:06:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f1vmAu0s1F9vmTd0naLxnBOlEP55Q2WrUDNUN8op8Mk=; b=Z+xccTkBDzfHC5dYdqtOX84y31
 ATqUK7ACNCkfCsuFGSrwYgd9/us9ikAkToLdTFla23Azjq6Yi5BZBCA+1xaOf9lJ5WXf1spKImHXN
 c7kc/Btpy1arJs7cR1HY2hI2f5xbt2CYrYfa0gXf8nH6a1pNahSw9Nos4W7GI9wEfikM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=f1vmAu0s1F9vmTd0naLxnBOlEP55Q2WrUDNUN8op8Mk=; b=a
 +21NUtosknh8IG2xb0eho+hmqOZzL3VHY0l14PdUehWlUNX5nHYgt/We1mb3TUeHdgzUhJ8YfRWSR
 ijQOYg1ODIGsVS5GAYGQhs9/Je0WHFg96wayGnW76sEWgn1JO21uCI+CCOr0LES3pXBMs2WGkGiJL
 H1DNX4FuJAl7SQwo=;
Received: from mail-m121143.qiye.163.com ([115.236.121.143])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m5jpz-00ELJn-6O
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Jul 2021 07:06:51 +0000
DKIM-Signature: a=rsa-sha256;
 b=FNMwmMawkwxayW6YhuowXD+fpoj9IJswUCXh8yU7R3j3h2rRYB7hhqNHb6DDnCb16ba115cw7fRpCRsYSeIjVk5HJHtbvQQr2/t21pp022o8cdjyPgv72sNjemIcUdK9DW6W0pH9VZRXwTGLPRDns6GwIa276oehOtDEGgQliGU=;
 s=default; c=relaxed/relaxed; d=vivo.com; v=1;
 bh=f1vmAu0s1F9vmTd0naLxnBOlEP55Q2WrUDNUN8op8Mk=;
 h=date:mime-version:subject:message-id:from;
Received: from comdg01144022.vivo.xyz (unknown [218.104.188.165])
 by mail-m121143.qiye.163.com (Hmail) with ESMTPA id 1F6695403EA;
 Tue, 20 Jul 2021 15:06:35 +0800 (CST)
From: Yangtao Li <frank.li@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 20 Jul 2021 15:06:33 +0800
Message-Id: <20210720070633.337851-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRoZShpWTR8ZH0oYHUpCTE
 0fVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6KzY6FSo*Kz9CMgIjNwgCKxcd
 KQ4wCjpVSlVKTUlNTE1PTEJOTEtCVTMWGhIXVR0JGhUQVRcSOw0SDRRVGBQWRVlXWRILWUFZSUpD
 VUpLT1VKQ0NVSk1OWVdZCAFZQUhOQ0s3Bg++
X-HM-Tid: 0a7ac2bcddf0b038kuuu1f6695403ea
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [115.236.121.143 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [115.236.121.143 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1m5jpz-00ELJn-6O
Subject: [f2fs-dev] [PATCH v3] f2fs: Reduce the scope of setting fsck tag
 when de->name_len is zero
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I recently found a case where de->name_len is 0 in f2fs_fill_dentries() easily reproduced,
and finally set the fsck flag.

Thread A					Thread B

f2fs_readdir
	f2fs_read_inline_dir
		ctx->pos = d.max
						f2fs_add_dentry
							f2fs_add_inline_entry
								do_convert_inline_dir
							f2fs_add_regular_entry
f2fs_readdir
	f2fs_fill_dentries
		set_sbi_flag(sbi, SBI_NEED_FSCK)

Process A opens the folder, and has been reading without closing it. During this period,
Process B created a file under the folder (occupying multiple f2fs_dir_entry, exceeding
the d.max of the inline dir). After creation, process A uses the d.max of inline dir to
read it again, and it will read that de->name_len is 0.

And Chao pointed out that w/o inline conversion, the race condition still can happen as below

dir_entry1: A
dir_entry2: B
dir_entry3: C
free slot: _
ctx->pos: ^

Before:
AAAABBBB___
	 ^
Thread B delete dir_entry2, and create dir_entry3.

After:
AAAACCCCC__
	 ^

In these scenarios, the file system is not damaged, and it's hard to avoid it. But we can bypass
tagging FSCK flag if:
a) bit_pos (:= ctx->pos % d->max) is non-zero & b) before bit_pos moves to first
valid dir_entry.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/dir.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 456651682daf..bfe942733b5e 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -1000,6 +1000,7 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(d->inode);
 	struct blk_plug plug;
 	bool readdir_ra = sbi->readdir_ra == 1;
+	bool found_valid_dirent  = false;
 	int err = 0;
 
 	bit_pos = ((unsigned long)ctx->pos % d->max);
@@ -1014,13 +1015,15 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
 
 		de = &d->dentry[bit_pos];
 		if (de->name_len == 0) {
+			if (found_valid_dirent || !bit_pos) {
+				printk_ratelimited(
+					"%sF2FS-fs (%s): invalid namelen(0), ino:%u, run fsck to fix.",
+					KERN_WARNING, sbi->sb->s_id,
+					le32_to_cpu(de->ino));
+				set_sbi_flag(sbi, SBI_NEED_FSCK);
+			}
 			bit_pos++;
 			ctx->pos = start_pos + bit_pos;
-			printk_ratelimited(
-				"%sF2FS-fs (%s): invalid namelen(0), ino:%u, run fsck to fix.",
-				KERN_WARNING, sbi->sb->s_id,
-				le32_to_cpu(de->ino));
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
 			continue;
 		}
 
@@ -1063,6 +1066,7 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
 			f2fs_ra_node_page(sbi, le32_to_cpu(de->ino));
 
 		ctx->pos = start_pos + bit_pos;
+		found_valid_dirent = true;
 	}
 out:
 	if (readdir_ra)
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
