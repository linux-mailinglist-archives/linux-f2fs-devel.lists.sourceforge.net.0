Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEEACD9F62
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Dec 2025 17:28:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bdBFI5/kNLSbnEJKHWfGCgdDyturl5RHR/Yf/EQ6Nmo=; b=Z4ItHSNQJKxk/E3qx8eOzVhaD6
	djpLWZnpfpnsUAHqBPxbSK3VeC5z5T+SM1xLQYq8ausauDg/XINvO64SggIJ2ee+jsVc2mhfPdlxS
	BPescSC8mefLjitL10mhTbKoV6HvAA3gAsph7cSuWqkBtzIyO6EFunzXEnSlnx5UjaD0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vY5Fd-0006d9-Cb;
	Tue, 23 Dec 2025 16:28:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <swilczek.lx@gmail.com>) id 1vY5Fc-0006d0-6u
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Dec 2025 16:28:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R6N7SmWdG7wGTQNVA34AngnepibAQGWrihX4rBYMWoA=; b=kV6ZJFviqmMHYt4d/9f65pqeFP
 5UtqeM+raqK+eEhVeaygVH4Xe83DSVSbBIpDHBKoN/em7moX4tBfa7EBjxVcANiiUcAEuauLdnsjp
 9GmKvQrP08vZRdQvoQDEzfpq9FBaFHqqs+TJOrTpXAebdhSEHzlI9u2N9Y6WzF/NE494=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=R6N7SmWdG7wGTQNVA34AngnepibAQGWrihX4rBYMWoA=; b=I
 K7A1PovLoTvsUbjtg4GxIUcCz4kSVzv+V/FQbg6QSiN5zQVuHl+hh5A6z7pxbcscO6Sqqs+rspIcp
 zfYlDUKmldMIRS4LeBu9Yw/VSRVJeTt1mw326sd0X7EqBtQiTCd/nxBxKRqdzBKCZV792Yzg8OAP2
 AxnhACaUk2tOGpek=;
Received: from mail-ej1-f44.google.com ([209.85.218.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vY5Fb-0003oy-IN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Dec 2025 16:28:44 +0000
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b7ffa421f1bso1065152766b.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Dec 2025 08:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766507312; x=1767112112; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R6N7SmWdG7wGTQNVA34AngnepibAQGWrihX4rBYMWoA=;
 b=nqePrasHlQL1o+53tCThS8W2/+wrCYB7wSUqI4S7qBzKq31xArj3eSMuXWUEabQGYP
 XCZKE3HkpzSYmIiPCbY4NyHedOHPZl5l/N2bwtw9D9HGnORySMxTG/Mf6iSFIfRzfz2N
 UQAjFAj1v8WeuRRObgDCX0gy49plgZgfjZqOb4Zn5lHxnDhsgpFn4zUzCUKDDig7FYY/
 9nTFA87eVwpXncdZ93+7IWI4c5wDbk2UqFq3FYDFmSuA03Y6HmRWxsNCUnGkJdyaunuW
 EOBWzYL3ZX4DjikZsLp5d3aV0x4r75APYBYldjaNGDH6IsaAygOeYD0Yjct+gEvPMFMq
 BTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766507312; x=1767112112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R6N7SmWdG7wGTQNVA34AngnepibAQGWrihX4rBYMWoA=;
 b=MLnbRj3P2CuIoT8rP/aIDYWfSVjb9gcfOkl5ThJ6ceNIE2NM4/CVmSAb+Eut6oCrRm
 96q86fDhVP2SAkpVtQck/zWQJ9d1pgpNOst1CP7X1O2cHJTjdnED32JPywZ/6e7y+fVv
 54P9VJcFvZZztgrCpw8r9ryy+b0AeI/iUwEX/OINvYxzJIFG9BZGnDNmXjv7G+Tg+6YP
 FJ8DACpjx59uRgaqw3AL+jkWkM4MfKEJpRt3GkTI82uDsgHW/JptCuTz3viWn08UiiX3
 fFmmuzHGVCtaU2Dn191qo6H7MRJj1WBrpJ3i6MrTKxG3SGDBa2SmcM885SeX+b4GkGDx
 AHyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTHLHSZPG4o/0lY275VfaBA7jXJaJBxMhGgnA+yQnIPx7mmmAgmuFu+cQB4SMv5+/YZNViIwTMwiXzBFEgjqWv@lists.sourceforge.net
X-Gm-Message-State: AOJu0YySZIxqBGnSWUsi1LSdfzFadqcVMXV10bSw82DDCmzeMWqsJPOV
 LQ6NdUxRp5t0wWe0eWy8dpfW6RZ5t6FiWYzZQYGdLvnaelvJ6z3iBTPY
X-Gm-Gg: AY/fxX6jOXMW5bT4jpTspPeEiaLJr2aMatuwYkbwIJ89eK/kGd+KDqjkpot/xot6F+x
 vhlVyd3nlinZU+MWmZKwXCyIZi9yaqIEp2DENpktt3LE5P5CfDcvhEHH76zvw1lAYjUf25QGyUR
 uiGZre93wwMqc/DqR2DDfocrT4YsoltHyu9xR7FYsaps5QpLQZVstWPjmXVhV6y3nLF6nCxzctK
 5nFpqS5PQqxdGZp3vKFaoownsoWpeIDlOwoRNHca4HWQeIFQqNJSVCsnsRj3IIEKP90C9k5o9M5
 rI6HykeeLw4lHYOPWK8XC6voqrrOycqY7C5zvludb8eZwkyQm5lLQ/LOK9RwPxxRssFbsWzRGLG
 yrXooLZYFZ477QJOt192VA8myHN3IO7n4ptUWbem+bhmsCk7QNztsIJ5SfSxW1lmBbIJTHPOmw2
 LSCr1oZcr0K9UhqQ==
X-Google-Smtp-Source: AGHT+IGXEWJV6JYzuU1+X/Q+U2xEJJKDgTfcJHzJ4CQpfIzaEW7hSw06XH8iLmHXg+fDADhKWgoVSg==
X-Received: by 2002:a17:906:ef09:b0:b6d:5dbb:a1e1 with SMTP id
 a640c23a62f3a-b80355b2500mr1847721166b.5.1766507311730; 
 Tue, 23 Dec 2025 08:28:31 -0800 (PST)
Received: from prometheus ([85.11.110.37]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f0cea9sm1417276066b.50.2025.12.23.08.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 08:28:31 -0800 (PST)
From: Szymon Wilczek <swilczek.lx@gmail.com>
To: jaegeuk@kernel.org
Date: Tue, 23 Dec 2025 17:28:23 +0100
Message-ID: <20251223162823.23606-1-swilczek.lx@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Syzbot reported a slab-use-after-free issue in
 f2fs_write_end_io():
 [ 86.643336] BUG: KASAN: slab-use-after-free in f2fs_write_end_io+0x9b9/0xb60
 [ 86.644120] Read of size 4 at addr ffff88804357d170 b [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [swilczek.lx(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.44 listed in wl.mailspike.net]
X-Headers-End: 1vY5Fb-0003oy-IN
Subject: [f2fs-dev] [PATCH] f2fs: fix use-after-free in f2fs_write_end_io
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
Cc: syzbot+b4444e3c972a7a124187@syzkaller.appspotmail.com,
 Szymon Wilczek <swilczek.lx@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Syzbot reported a slab-use-after-free issue in f2fs_write_end_io():
[   86.643336] BUG: KASAN: slab-use-after-free in f2fs_write_end_io+0x9b9/0xb60
[   86.644120] Read of size 4 at addr ffff88804357d170 by task kworker/u4:4/45
...
[   86.656543] Call Trace:
...
[   86.660351]  f2fs_write_end_io+0x9b9/0xb60
...
[   86.685123] Allocated by task 5484:
...
[   86.688325]  f2fs_fill_super+0x8c/0x6ec0
...
[   86.697685] Freed by task 5484:
...
[   86.702700]  kfree+0x1c0/0x660
[   86.703273]  kill_f2fs_super+0x5b6/0x6c0

The problem is a race condition between the shutdown of the filesystem
(kill_f2fs_super) and the asynchronous I/O completion handler
(f2fs_write_end_io).

When unmounting, kill_f2fs_super() frees the sbi structure. However,
if there are pending checkpoint data (CP_DATA) writes, the
f2fs_write_end_io() callback might still be running.

In the original code, f2fs_write_end_io() accesses sbi->cp_wait after
decrementing the page count. If the page count drops to zero,
f2fs_wait_on_all_pages() in the unmount path returns, allowing
kill_f2fs_super() to free sbi. If the callback then tries to wake up
waiters on sbi->cp_wait, a UAF occurs.

To fix this, I applied a two-step solution:

1. In kill_f2fs_super(), explicitly wait for all CP_DATA pages
   to obtain a count of zero using f2fs_wait_on_all_pages(). This
   ensures specific synchronization for these metadata writes.

2. In f2fs_write_end_io(), move the wake_up() call INSIDE the
   bio_for_each_folio_all() loop. This ensures that the wakeup
   (which signals completion to the waiter) happens before
   processing of the bio is effectively 'done' from the perspective
   of the waiter. More importantly, it removes any access to 'sbi'
   after the loop, eliminating the UAF window.

Reported-by: syzbot+b4444e3c972a7a124187@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b4444e3c972a7a124187
Signed-off-by: Szymon Wilczek <swilczek.lx@gmail.com>
---
 fs/f2fs/data.c  | 11 ++++++++---
 fs/f2fs/super.c |  1 +
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c30e69392a62..5808d73c2598 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -318,10 +318,13 @@ static void f2fs_write_end_io(struct bio *bio)
 {
 	struct f2fs_sb_info *sbi;
 	struct folio_iter fi;
+	bool is_close;
 
 	iostat_update_and_unbind_ctx(bio);
 	sbi = bio->bi_private;
 
+	is_close = is_sbi_flag_set(sbi, SBI_IS_CLOSE);
+
 	if (time_to_inject(sbi, FAULT_WRITE_IO))
 		bio->bi_status = BLK_STS_IOERR;
 
@@ -360,10 +363,12 @@ static void f2fs_write_end_io(struct bio *bio)
 			f2fs_del_fsync_node_entry(sbi, folio);
 		folio_clear_f2fs_gcing(folio);
 		folio_end_writeback(folio);
-	}
-	if (!get_pages(sbi, F2FS_WB_CP_DATA) &&
+
+		if (!is_close && type == F2FS_WB_CP_DATA &&
+				!get_pages(sbi, F2FS_WB_CP_DATA) &&
 				wq_has_sleeper(&sbi->cp_wait))
-		wake_up(&sbi->cp_wait);
+			wake_up(&sbi->cp_wait);
+	}
 
 	bio_put(bio);
 }
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index c4c225e09dc4..c9ee3fae1958 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5454,6 +5454,7 @@ static void kill_f2fs_super(struct super_block *sb)
 	kill_block_super(sb);
 	/* Release block devices last, after fscrypt_destroy_keyring(). */
 	if (sbi) {
+		f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);
 		destroy_device_list(sbi);
 		kfree(sbi);
 		sb->s_fs_info = NULL;
-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
