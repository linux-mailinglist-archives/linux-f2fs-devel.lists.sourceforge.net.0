Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41546CE9E0B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Dec 2025 15:09:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eon7U7Waef4pGFEsp/geJjedyQYYuIT8ENUjYEVz2g4=; b=mOzNiNU4rKKglppm/KMSEp8iB4
	zukebLzKJURnzw8d7f8MjkRwp7/31GOziRrf+jsT8wOuGNy/ExOjCn4tgobrnPTvZ3Ua+6w4dX+jC
	KoYdtHedEBqtreKpxIlQPdFDokzbLntrvovMSAoKuj3TbQgTX1Igho8JUN1ASoP1wP0w=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vaaPX-0003m7-DQ;
	Tue, 30 Dec 2025 14:09:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <swilczek.lx@gmail.com>) id 1vaaPV-0003m0-SW
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 14:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xNYXqFxT5QJQe5v6ruCzAN0+zABHEc4TZ+XdBbAtf84=; b=hs0i9NbeeQoUimtmPwsrbcACB4
 mkkluiXGkoNB+Uw+jy38q+HfPMqC7z9BiCW0p1IlqOW8AKBs7XexMAYXjPBTzbQhKdr6cgushJg/q
 n4hxjipVi1uJibduoucCoYvA3zXdS2frQ5ZTqIXP0jdmwKa/s61Ab1DCtHBgtJMgTcd0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xNYXqFxT5QJQe5v6ruCzAN0+zABHEc4TZ+XdBbAtf84=; b=BbZQpdSyADTLb7GcoloHdBCebW
 7qEutaD41sKf8UEuUaIB3jFUYT2gMYgb1ggYXtgp0++LHTSoFI7oUJtAK4Hl/IzvGcnqfQPe+2oks
 0rXQVo2x8wl3yuElwFtYiiN7QNVeoCDtIGdxUpU9o+mGz19EyaDLO3kYtasrv+Vd1Ztw=;
Received: from mail-ed1-f54.google.com ([209.85.208.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vaaPV-0006bE-E3 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 14:09:17 +0000
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-64daeb28c56so8177440a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Dec 2025 06:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767103746; x=1767708546; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xNYXqFxT5QJQe5v6ruCzAN0+zABHEc4TZ+XdBbAtf84=;
 b=SrXdeYyx8qKVXxHykRGx95cJkXqEHKOBGkz9ndbH7fRkRt20wmoRiELF9S4J+T1IEz
 PGA81au4uuvqPZi/ZkUvfReylNIFKu906xgfncVsw7wbOenybO+uofyHt9JlRs0RaF9r
 +q97c7yergf5wEr0W8O3Xtomorm5w6qUTyGoHFjrWxIu9wSoLxOzAQ2oUQRTXi1ty4H1
 3odl8XDrM0354knSDLzcwzSzB34fFYn40jhE9QuPG7tLcdDMr33XcSF7KbQeuM/IC3v8
 cx1ekMbbv+GFXMBQw41c8H7gsimus+d1TJRYyHG47Kfep6JoMRhvSKtAOAyCWK1XtJUL
 aVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767103746; x=1767708546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xNYXqFxT5QJQe5v6ruCzAN0+zABHEc4TZ+XdBbAtf84=;
 b=VScYEo+Sepk9e+qduTAgUpekxHbpYWJ0q5RVNxc8NcnSwLX2Z/u/Axt5dCDpB7PRdk
 K65IkqAv6fpQTS/A5mVkMCMG9fAC3Ne5HLDqqzcQUgFAYOdJWFrZM/7trVj4BAa9VL7w
 lbVlbplxtP3fPaat2eq1FkLGYm2wFycxYqyjTWnJM6B5Mi3iM+mAa2IR/YMVWVSNEa10
 CetatVVMYgTURdVVBYk5TkRxT1MZFHt7evBCPV8CjjUzqXBU3b1naUb39vwyvEok1IcY
 3eIpPFOZAM8QRT8INpbz1ElwyZ7mIsxAZgTpnWqsFyBhZ7wwnzhB4x6jpF4qfM7waaZV
 aoQw==
X-Gm-Message-State: AOJu0Yx+iqzeCpL6CoTccP1/PGTdfr5LFGSvQBIHY5dOnvqzEM52YIR+
 wN1lq9hUl6HEyPfrritw80wmhs/6pUFo2AnpZlRbtIwPqj2ODEJiYKhq
X-Gm-Gg: AY/fxX7QXBA/3r6N8GD39wRM+vJkZWPGxem2nNFICJFKuSlM7/HJqLXOXQP10JyiFlq
 C7qE3kaYhOjQPjpmG0NxCzsOr0F1h2bptm41H82XJ69LvmRUhAEWqBsBOxMikRHFRDIwHfXUuMg
 J5AR0ri4ljjPsHb12asCNonPrc0zWZGaMEO9xDD6mo6vQb6Vg7m3UVpcfkRvtbpEcMFGJjxPfwy
 GqgS28pC/+CaBvVdDss7yrT+bb8NuB11BHUV8p211NOyytIIl+0H9rs54nshs+KU2no/iZYXvfg
 f19C8e9sPIf6C9SGBhH0JxB4YQE4gdNf5RNKp7+ciIaFvrkTNtdReR1M3uEC0w+DWqK0NqsEPuV
 yQPbNHOeMK41Q7WYY5/qo6KxJ32Kl3524sdVO9yr5INfQAciQ0MCrR5NQEqF5KGzCulCgT7rnBY
 IHZVefynzjdDK1pQ==
X-Google-Smtp-Source: AGHT+IEv1sil+gJKqAYQb3RZRsvLaoSinwwr92vDk32fjRdDN9cY/VRKcyT8FxU0jpny//SQWr0V4g==
X-Received: by 2002:a05:6402:1ec9:b0:64b:3225:b771 with SMTP id
 4fb4d7f45d1cf-64b8e82b70bmr34168484a12.6.1767103745722; 
 Tue, 30 Dec 2025 06:09:05 -0800 (PST)
Received: from prometheus ([85.11.110.37]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b91494c0esm34776522a12.20.2025.12.30.06.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 06:09:05 -0800 (PST)
From: Szymon Wilczek <swilczek.lx@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 30 Dec 2025 15:08:50 +0100
Message-ID: <20251230140850.70778-1-swilczek.lx@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223162823.23606-1-swilczek.lx@gmail.com>
References: <20251223162823.23606-1-swilczek.lx@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [swilczek.lx(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.54 listed in wl.mailspike.net]
X-Headers-End: 1vaaPV-0006bE-E3
Subject: [f2fs-dev] [PATCH v5] f2fs: fix use-after-free in f2fs_write_end_io
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

When unmounting, kill_f2fs_super() frees the sbi structure. However,
if the bio completion callback f2fs_write_end_io() is still running
in softirq context, it may access sbi->cp_wait after sbi has been
freed, causing a use-after-free.

Fix this by calling synchronize_rcu() before kfree(sbi). Since
bio completion callbacks run in softirq context, which is an implicit
RCU read-side critical section, synchronize_rcu() ensures all
in-flight callbacks have completed before we free sbi.

Reported-by: syzbot+b4444e3c972a7a124187@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b4444e3c972a7a124187
Signed-off-by: Szymon Wilczek <swilczek.lx@gmail.com>
---
v5: Resend as reply to original thread (v4 was mistakenly sent to a new thread).
v4: Removed f2fs_wait_on_all_pages() call as pointed out by Chao Yu that
    it accesses sbi->write_io which has already been freed in f2fs_put_super().
v3: Simplified to minimal fix - only super.c change with synchronize_rcu(),
    as pointed out by Chao Yu that data.c changes are not necessary since
    synchronize_rcu() alone guarantees sbi won't be freed before callbacks
    complete.
v2: Add synchronize_rcu() to wait for softirq bio callbacks to complete.
 fs/f2fs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index c4c225e09dc4..dfa3c76c6f2a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5454,6 +5454,7 @@ static void kill_f2fs_super(struct super_block *sb)
 	kill_block_super(sb);
 	/* Release block devices last, after fscrypt_destroy_keyring(). */
 	if (sbi) {
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
