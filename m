Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBBECF86AB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 06 Jan 2026 14:07:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DyGNmjhSnaJlUjo8zJXeTVQUOtbX2Pd9+ML67f5q4oA=; b=abllkNUDlEqn6LzSVn05AtU12Y
	nq8HkFsuHpWvB98M1yQactvQ1TTe67JhIQ8DEUnL9pYTjU7gFAue4wE2AzGYoxQdExQzhbQKrw+2l
	oDiN5KUpFKXfZsV1pSO5jGfJPACoTAktXF6sdshl6OvGBCTnQ2yV4uFEgXhPED4WGg6w=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vd6mE-0001H0-60;
	Tue, 06 Jan 2026 13:07:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <swilczek.lx@gmail.com>) id 1vd6mC-0001Gt-Jl
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 13:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u7eP+ymytmppamfCOkg0zlf3bt2ZyhgktLAKP4vbwPw=; b=bNY8w3lNNTmehQt5kqm0vwqO1B
 cdaY1YFmPN21b9IUBMub5otIkkLmA7AkrODYbHZZ+YHygBpLeGiOUoTcQ692UQyjz1QW7ij3krgY5
 qRr4ObRZStGTA30JJmWbGL9v8XiWqfB0LVeGL8mFseXi5Y0hGr9IAUIX2nkb6p5ZRJOo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u7eP+ymytmppamfCOkg0zlf3bt2ZyhgktLAKP4vbwPw=; b=lym7RDX7EOamBU1k8YubB0gSrl
 mOmo4KVHrM2yVhbDWBw6vkYJmcowFjsZ71HmULE8z/2hrzOBgu847DNzCNZfmZFPHW0zL0+AGOcTh
 3WxEKTExCK6UlVdmrglttlEz7syo/3vIktm4b0E38L5Jv4qDxSjosBCXdAvP5vpwSnhk=;
Received: from mail-ed1-f47.google.com ([209.85.208.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vd6mC-0007CH-63 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 13:07:08 +0000
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-64b8b5410a1so1341558a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 06 Jan 2026 05:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767704816; x=1768309616; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u7eP+ymytmppamfCOkg0zlf3bt2ZyhgktLAKP4vbwPw=;
 b=A3dCdiokRXddwoa/7S9zdiSFaHMxSf7iVIbfOXdd6nHREUxUSG8LoYS+meVWPR+HUc
 pqt4H1qFgj9y2R20H7x4QMngG/8PU5c03ea/HB5X3x6+Tuiwgq4mhvc/qjEPYqR5aNDA
 BD9HhjaxiUI47285uW7hvznejtOWYkTyKP52WBeLu5ak3+paUa59O5APQDKyUG9ksW+X
 4vyH2NGsMy+WRSh9KDnlPQqDGI9lC0v+37uMKUQEus4//ym5CLXOGk6U7Tzhbn9B99nk
 yw7bPB84LP0DAMsMX/nXoV/WWkEYb092meX1QXmhIW6LfmkInk0GhD2BhqYtCEoNKSoe
 zrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767704816; x=1768309616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u7eP+ymytmppamfCOkg0zlf3bt2ZyhgktLAKP4vbwPw=;
 b=TE5kmKRr2KBvUvuisKS7f66w6VYXu1gPXt4mcsuovJuscmurE70WzvPSzr2jQZ0lXR
 fbNZeRcda05wgxmU4Eifu3004/6ItOtfB+UacimChzLTkIcnmsGHsDfXKG51nWhImmg7
 SalZk6HoZaz9hFvJR2g+fc24U3pR2H8ZWxnBuPCpMIS7e9LfYlGEL+pNFtmT08fI8QlF
 10JspSZKnUvaWThlSyuw3E4fCcWjfpi5pk7PTbELOx5wO/r6aXK31R8xmwaxypGjdcwM
 /C4wTP0aIEaBs23CFdjKsCLb8dgGidlT08flk5PjELZBWQnHRDb79BdE8kVibjwgZmJE
 fSfg==
X-Gm-Message-State: AOJu0YzXwxyGi+6lRmdNJcuWhYSFf69nc3/phuYTF/+Q+xdp/BHMRJDr
 adL7WwDnj+ii7JsK9Rzer7GS2wetzj/GKygqVmbmZysMO7IfQsvzQzIt
X-Gm-Gg: AY/fxX61gXgQmSIDrYfzKWnmi2K1mhgQHu2VeQirFGaEI7NCdi2+i8XAyQotpn6VlFT
 gBOjX5jachraqq1FVpIhsTTWE9GeM2f2X0fQKi7lgbePQVcw41ZkN7vbJebobK0xC7s7rPX5lT6
 Y8XoNdqrczuSF4f/ovv68olJwM7K6x+8t1MoveriroHy+OLfVZgYpsIaUJoNe8e4qTEAiP2Wzu/
 l1kIOldRo0cjPI0SMT+0OE4JvUgSlADcaBuJQOOsK+apNfKutGzW7nLtSH14A5JauTv6IQ7phaK
 XrT7Y5stO35bArou6FkjraCdT701Zh8xzBOzfXixSIFTdJZm6ovrXYUCCupp8LkBLQKKw7DvBwn
 NNPbVRZZDLr7bZx4GkK8m5d6yymlK2KuiRn9XOsCUq1KxLd3/LkdhiBuYQYV69v/3fV8Jbq+hEo
 BQR7XiqKYDnBi/VQ==
X-Google-Smtp-Source: AGHT+IH2WIF4hphWW0XtGGA1SToKGTIqx/q3Z92fb/Q7Z8frNrC6d9JrMtsfB3KMI4GNdYnypexj5Q==
X-Received: by 2002:a05:6402:1ed2:b0:647:a570:b756 with SMTP id
 4fb4d7f45d1cf-6507967bd96mr2985723a12.17.1767704816290; 
 Tue, 06 Jan 2026 05:06:56 -0800 (PST)
Received: from prometheus ([85.11.110.37]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507bf6d4acsm2079927a12.30.2026.01.06.05.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jan 2026 05:06:56 -0800 (PST)
From: Szymon Wilczek <swilczek.lx@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  6 Jan 2026 14:06:46 +0100
Message-ID: <20260106130646.15092-1-swilczek.lx@gmail.com>
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [swilczek.lx(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.47 listed in wl.mailspike.net]
X-Headers-End: 1vd6mC-0007CH-63
Subject: [f2fs-dev] [PATCH v6] f2fs: fix use-after-free in f2fs_write_end_io
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
v6: Add comment to explain synchronize_rcu() call.
    Resend as reply to original thread.
v5: Resend as reply to original thread (v4 was mistakenly sent to a new thread).
v4: Removed f2fs_wait_on_all_pages() call as pointed out by Chao Yu that
    it accesses sbi->write_io which has already been freed in f2fs_put_super().
v3: Simplified to minimal fix - only super.c change with synchronize_rcu(),
    as pointed out by Chao Yu that data.c changes are not necessary since
    synchronize_rcu() alone guarantees sbi won't be freed before callbacks
    complete.
v2: Add synchronize_rcu() to wait for softirq bio callbacks to complete.
 fs/f2fs/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index c4c225e09dc4..f5707591ba25 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5454,6 +5454,8 @@ static void kill_f2fs_super(struct super_block *sb)
 	kill_block_super(sb);
 	/* Release block devices last, after fscrypt_destroy_keyring(). */
 	if (sbi) {
+		/* wait for f2fs_write_end_io() to finish */
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
