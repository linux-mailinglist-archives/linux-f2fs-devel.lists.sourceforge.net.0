Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEBDCDF3AC
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Dec 2025 03:50:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPQdTF9k6hgfpXtKTYXeAh40o+mOOSGfdUXnMoBF3ek=; b=hC8uElodFNDsE/c5HXwlsh+3tR
	DshFs/AT6YoW6f/MRXNuZ26ut7Igg4Bum+kFwHnRAV25gAccdswmVDgFKA47y2fejHR8auha3rXGc
	Oc2tZDZFZFMcGnHbJjJ14pzW/kO2UW7QBQQvzP2+LJBlE6v23PvhM4JrL1oL03v/lDco=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vZKNZ-0000W2-4u;
	Sat, 27 Dec 2025 02:50:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <swilczek.lx@gmail.com>) id 1vZKNX-0000Vt-20
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 02:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C8FvaxPfkdTbzDfTdRg9piurLhOQti4nRuT6u8LkRaE=; b=e3NkxF1bEDE7R2gPXp/66pzNbI
 hkSXu4gaiAjUqJB6PeQfEDGC8L4uvLRJOrx/KM36LFPmUpk3pepFTxAoPo+1Z8VpHrfXnUOvGXXaY
 uZcAYMOHx9zgu6pmAxfJPTAU+/oAftQXaoLu4bcxyUT0XYozGlQqEwwGGJEOMR623Sr0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C8FvaxPfkdTbzDfTdRg9piurLhOQti4nRuT6u8LkRaE=; b=V/nQNP8qS4PF95+3OcrBwkiPW4
 mnWxY9k5Trazohleo0NEy0UsuWK5GTU3EhIPxSfbNG62HBWuwMklJjCB62SpxGhh1HbxjTAu50lBf
 rW/w99uPLfseYDJp6BwL326nlkJDxYuUjfJvZse6tjaQwAAF/NXftKzva9ECdMsuNu9I=;
Received: from mail-ej1-f48.google.com ([209.85.218.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vZKNX-00045m-3H for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 02:50:03 +0000
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b79d6a70fc8so1336695366b.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Dec 2025 18:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766803791; x=1767408591; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C8FvaxPfkdTbzDfTdRg9piurLhOQti4nRuT6u8LkRaE=;
 b=DNtZkF3HpzWEJ4xTEofmOyFVIL0lTiPafN3ukWcXkV1X5b6fFWhN9XJF6aESXMxJqQ
 H8SeI2YDJ5AC7Ob0rG8RwVdnxmRIlm5egxVk05dxmZJgCOKxvqhNuEGFDlGFf7U30uEc
 D85Q1VuBoMHBeXp/QA1tQVXfTr2iPJlKjaWw2PFfnSmEQ6Rp2BWHRUe6j5qaCU07ZEhX
 Gj6KHGeC1+UmZPn+fmh+/XBZ1zgafZ06rbtC5MCU2W440E9ec8CJ9v4x8lXBU+5csVNJ
 Q/6+ljilykXKAEyOn0sNsvWzKGc1Gvo9eTEP3kWMyIKN1akakGDApmCd3iBDThaxA0f9
 RVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766803791; x=1767408591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C8FvaxPfkdTbzDfTdRg9piurLhOQti4nRuT6u8LkRaE=;
 b=vvnAAYJ6OkJKdldqapOA3FQO392iC356AON+sfD6BfNLo+1hwhBj2A+BTvVHYjReTo
 WK5dhrPsBIIEL4BPHTRH/Rmi49UB/y8frzjmkBKLU7SDjQ/lBKPuwTRX2G65Wcj+OFUO
 67oMCDrvWThpLL2+I2h0PXocMk3ocbeJnKAdIoVhzpcXD0mo9lMAZNgiffVKYsmQxac4
 YMzOZb5vw7GwtOnsPZyW2SIMEMXPlPugEYtYNB40zKfALowX+odIXsz78JZk5uZfAFp3
 jTOoXeYTt0Rsazigru+fveyUuMQ1pYG/SSafkEpfVjgQw6BPbEynj3YfPdZ6WzuQZhOp
 hqFg==
X-Gm-Message-State: AOJu0Yx6dLLDZZf4XH+by6JmQypqx7b8vANJiMQcFGpj3juL9QSk55ao
 CI7LCcIgINkU5XWOi3pMI9iMvCEXBa/Aa/1jurY6+jqNMP+qosc1+jNY
X-Gm-Gg: AY/fxX5NnkRR6sGHDuYea7EGK8OXklLQd6D4KKJxOYuayJwmLXAeZGmOnAWu0FGAc2y
 3VGHs9mYC495W6Sornd7H+7GIehuvimOtBKbW2NfguJFPrqtorSHK5qz/+phqErx9iijXyU4KYg
 37zflpu3LfaPWt8pdeTOatTyM8PTDniUC00z3JMhdG8EM/CRQATtMm4g7DkRsSXKM4qfkJuZoRn
 NKRuVsv+t7iLf00jQCMXnj4linAxXc2T8wVdqcB9AYUeJDw1yFiBODmmlB4W6P1U8/tnLax2CFx
 BCQXIBTfCp883uw3u4MdEaJJm4ogFaU3OlyPWe6L2U/jQXswsnVt56NmzdxtVFQmM9tjpAJHgTb
 kok7GD34GHjprpqFzYqQTzqldDPnnQNaLytzqKvBfQAxicqs4z16QCuYdu8+qenEUWrVR0ZP586
 6s/vp2iprc2HUiMg==
X-Google-Smtp-Source: AGHT+IHnRlEIWh4A48IFGDdJ3VKRi3+KxNdacL2i/9LpMwsvHQe70ec1dSmW1Nw/BRJunQ/58888kA==
X-Received: by 2002:a17:907:75c3:b0:b80:3fb7:f3a8 with SMTP id
 a640c23a62f3a-b803fb7f6f6mr1762351966b.63.1766803791391; 
 Fri, 26 Dec 2025 18:49:51 -0800 (PST)
Received: from prometheus ([85.11.110.37]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b90f5400bsm24497533a12.4.2025.12.26.18.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 18:49:51 -0800 (PST)
From: Szymon Wilczek <swilczek.lx@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 27 Dec 2025 03:49:44 +0100
Message-ID: <20251227024944.8612-1-swilczek.lx@gmail.com>
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
 [209.85.218.48 listed in wl.mailspike.net]
X-Headers-End: 1vZKNX-00045m-3H
Subject: [f2fs-dev] [PATCH v3] f2fs: fix use-after-free in f2fs_write_end_io
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

Fix this by calling synchronize_rcu() after f2fs_wait_on_all_pages()
but before kfree(sbi). Since bio completion callbacks run in softirq
context, which is an implicit RCU read-side critical section,
synchronize_rcu() ensures all in-flight callbacks have completed
before we free sbi.

Reported-by: syzbot+b4444e3c972a7a124187@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b4444e3c972a7a124187
Signed-off-by: Szymon Wilczek <swilczek.lx@gmail.com>
---
v3: Simplified to minimal fix - only super.c change with synchronize_rcu(),
    as pointed out by Chao Yu that data.c changes are not necessary since
    synchronize_rcu() alone guarantees sbi won't be freed before callbacks
    complete.
v2: Add synchronize_rcu() to wait for softirq bio callbacks to complete.
---
 fs/f2fs/super.c | 2 ++
 1 file changed, 2 insertions(+)

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
