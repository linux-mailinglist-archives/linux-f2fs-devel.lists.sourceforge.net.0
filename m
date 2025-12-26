Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D141CDEC22
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Dec 2025 15:21:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/5gTdRkdz72CCv0bghQQAbfNTncVhP3qfY6px4gtjc=; b=WmUx95nPxir76LHZjarDqr/oh7
	rnQBsxwpVRKxzccCi+RjHmoeunE3PkuBNtiH8OSl5oNbTPVS774z1P+bDxk+KhR/yVaAMAQTtYzp9
	EtLi6wkF1XLzsBlht/GHuSSO+NfzubUR+b3xhtZPJEt8JZC9Egg1j9xey6MLiTg5/PwA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vZ8gc-0002yO-RL;
	Fri, 26 Dec 2025 14:20:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <swilczek.lx@gmail.com>) id 1vZ8ga-0002yE-UR
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 14:20:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JbYjePTpjmWD5QUf3O7b5Ze3QPROlUswpSL84UsdU88=; b=U4Fo70uHf3HmicUS+RgdvDIf/P
 PtkzDpkRgQ+MJGhGIly8fPvxrXWQjlN1mrM4/9x+jjvCCBQkRhk3IiPtQCBEGxAbQ9hQsWfNPqV6T
 qbobT64dPPpESBNWfVI0oKCB+wHo1Fl4X80hy4WVel0lz6xfx5tmoDupuax/MzNXjAD4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JbYjePTpjmWD5QUf3O7b5Ze3QPROlUswpSL84UsdU88=; b=YvBWMTqwX0Ycp8cYZ1qr+n8cmL
 Y/9Z6hHVa1pQsLie41WxH0M+bkMmTOYlfYwVLmVTIyboO9KNhvYdhxcgz1li1nCMCmiv+tvXLAACe
 SYccbu/4j07asaFyU2Ptt2XzUH3UpgNDopSLEsQxQr7RrpPAwRDG7BgBPEs/LtqzILyU=;
Received: from mail-ej1-f44.google.com ([209.85.218.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vZ8ga-00008B-AA for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 14:20:56 +0000
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b79ea617f55so1337525366b.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Dec 2025 06:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766758844; x=1767363644; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JbYjePTpjmWD5QUf3O7b5Ze3QPROlUswpSL84UsdU88=;
 b=GchnT0DjVwAdAqiX3tPUoQh1YFIZu+ngGwtguByxNhiYmESuRM4dAMyL3KBEQMiirO
 h62vTVxehGuGLepMhSpzB9gnoLO37tBtl/OuadLPzHFo6cmVWT8vB41rwmTfP9eF4hbr
 Woq5tm2rJTsaZOabmbl1zEw69j+TKFhLs6rDKOxpqStMHUjHNOC17REnaYIIl8wH0GFo
 LgDSm9pLmELjDgq9wsVOUa18a1JKvrFezNqPqO6WufUqF8+gjS+MHpgK7TEaB7W6naQ3
 l5kLJCNtVpZrYRsPMC7uw5S+llq/MhfvhkPP278MytJnS2xRTmByPIpr4ptUEzG7ZLhb
 47NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766758844; x=1767363644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JbYjePTpjmWD5QUf3O7b5Ze3QPROlUswpSL84UsdU88=;
 b=dryHDDBQ9M2Dw6RqUoC23JAaiSYUo5qAAO6M+tNa9r8hCnXOvvMcCxkbPpJ7G3B2r2
 NNKKSEqnuslnQA9T54A2yZ/Vp4lRSxJ7Y3SXPgqLMKOWCNk50G7tBaZXRkQfOZRO/mv2
 Gsi3UG00vh65haiN8YLXOWgtTqGnXAPqX4EnEHqY+zcOd2Bw1ZZUslwYy20M61ZbtSr1
 jaccimZecTYkK6qNlPIHVCzFoMZqW4cC/bOI2OTNyQ+lt36WwVKcLCO4vdBPZNI+ozhS
 nhXCO5gMUXl5oOBymTXl746lGcQ6xtzkluz2kskcIfBt5hz+4Z5VCtxzG0g4GmAB+zGr
 KLoQ==
X-Gm-Message-State: AOJu0YzJxYJz9JbsWf+dSM7J/WHY9hrPbjQUh0TuxIx52P5nOnUCPNTj
 9N+5v6VKv0lNYequKdgCn4Xx0RzSWZlXZLQAt3WmbjFwu4YHsz5OY+mB
X-Gm-Gg: AY/fxX6Y+ybf61qB/7z6UMbxfLFQ1RQxcp3Wgf2IrFvKkEZRXu/v3xoIP9XYGLMFy9w
 YpDbrZPtTqnQ4y794T8+NRZo8Rbyyu8Y60duSG06/rZK3iKtPoAZmgU0im7mQKIuWjRnvdLb3oc
 eBEm/aIpksT+Xq3FyTbMeY6z7uHfj3Tbn3bmDJG8Q+jOvek/zMr96B7A5HksF245TnojrIeicBk
 JSCEuccayNwHhE5Hf+6zgex2bKE/quppyXcMKtyAcjsC7TBG49LZU6mVneWSrkCSarui7bujXOY
 0Qgxm34QrILH0D/naCk6suRaP2bII18U0tqUmnFaTKdw60rxpkr5ePKF6ElqkQ8gYi2cMLw5h+R
 MwZfSioNKxZJ7SHWBSobRFJNsdQrNjsUlIR6F1vUUd3AXsaNNt1PZ4R97xzl4ojurawd+453WEs
 4UzN3vFQNgVmfLPg==
X-Google-Smtp-Source: AGHT+IG8+HBi/4iyQL7aRggxu4ngBNbdGufAPRhTswtWyIS6MDS3jaUrI3sQRPXi7bfxLEKJqbPnPg==
X-Received: by 2002:a17:907:a4b:b0:b7d:1cbb:5deb with SMTP id
 a640c23a62f3a-b8036f90f16mr2892932866b.27.1766758844151; 
 Fri, 26 Dec 2025 06:20:44 -0800 (PST)
Received: from prometheus ([85.11.110.37]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f0cea9sm2332254566b.50.2025.12.26.06.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 06:20:43 -0800 (PST)
From: Szymon Wilczek <swilczek.lx@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 26 Dec 2025 15:20:24 +0100
Message-ID: <20251226142024.48837-1-swilczek.lx@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223162823.23606-1-swilczek.lx@gmail.com>
References: <20251223162823.23606-1-swilczek.lx@gmail.com>
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
 BUG: KASAN: slab-use-after-free in f2fs_write_end_io+0x9b9/0xb60 Read of
 size 4 at addr ffff88804357d170 by task kworker/u4:4/45 The race condition
 occurs between the filesystem unmount path (kill_f2fs_super) and the
 asynchronous I/O completion handler (f2fs_write_end_io). 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.218.44 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [swilczek.lx(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.44 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: syzkaller.appspot.com]
X-Headers-End: 1vZ8ga-00008B-AA
Subject: [f2fs-dev] [PATCH v2] f2fs: fix use-after-free in f2fs_write_end_io
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

BUG: KASAN: slab-use-after-free in f2fs_write_end_io+0x9b9/0xb60
Read of size 4 at addr ffff88804357d170 by task kworker/u4:4/45

The race condition occurs between the filesystem unmount path
(kill_f2fs_super) and the asynchronous I/O completion handler
(f2fs_write_end_io).

When unmounting, kill_f2fs_super() frees the sbi structure. However, if
there are pending CP_DATA writes, the f2fs_write_end_io() callback might
still be running in softirq context and attempt to access sbi->cp_wait,
causing a use-after-free.

To fix this:

1. In f2fs_write_end_io(), check SBI_IS_CLOSE flag early and skip the
   wake_up() call if the filesystem is shutting down. Move the wake_up
   inside the loop for correct synchronization.

2. In kill_f2fs_super(), after f2fs_wait_on_all_pages() returns (meaning
   the page count is zero), call synchronize_rcu() before kfree(sbi).
   Since bio completion callbacks run in softirq context, which is an
   implicit RCU read-side critical section, synchronize_rcu() ensures
   all in-flight callbacks have completed before we free sbi.

The combination of these two changes eliminates the UAF window: the
is_close check provides fast-path optimization (skip wake_up when no
one is waiting), while synchronize_rcu() provides the hard guarantee
that no callback is accessing sbi when we free it.

Reported-by: syzbot+b4444e3c972a7a124187@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b4444e3c972a7a124187
Signed-off-by: Szymon Wilczek <swilczek.lx@gmail.com>
---
v2: Add synchronize_rcu() to wait for softirq bio callbacks to complete,
    addressing the race condition pointed out by Chao Yu where sbi could
    be freed while f2fs_write_end_io() was still accessing sbi->cp_wait.
---
 fs/f2fs/data.c  | 11 ++++++++---
 fs/f2fs/super.c |  2 ++
 2 files changed, 10 insertions(+), 3 deletions(-)

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
index c4c225e09dc4..924bc30d08b6 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5454,6 +5454,8 @@ static void kill_f2fs_super(struct super_block *sb)
 	kill_block_super(sb);
 	/* Release block devices last, after fscrypt_destroy_keyring(). */
 	if (sbi) {
+		f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);
+		synchronize_rcu();
 		destroy_device_list(sbi);
 		kfree(sbi);
 		sb->s_fs_info = NULL;
-- 
2.52.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
