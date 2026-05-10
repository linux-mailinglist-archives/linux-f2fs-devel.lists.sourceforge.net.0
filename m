Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJ/PJmsIAGqaCAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 May 2026 06:24:11 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD10A5027B1
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 May 2026 06:24:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QmXZ2p2m0/F0aleSo9o3BGPVB6YzdyCamjNeYHuzmD0=; b=IfiHfgamYYVZ/csYbvrd3YEXat
	RsKlUnhBeRO6lCMA1Icbl5EuPDxaSzsFmieZbIpX7JCR5yP9PwQ5LUOB+O2fV5e6uwAtrrGzTJdKN
	AfGOXkBm3KtB3ew+2Sm6j4kVn5G3JthZuMfTxjtaYkHQL1tPlMiJp43gWWjW52J4nY4Q=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wLvhu-00036F-Iy;
	Sun, 10 May 2026 04:23:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kartikey406@gmail.com>) id 1wLvhs-000366-8A
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 May 2026 04:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mV54JMHYJV5YWN9iMTCDdA1Mk9u+5RjYC0kj8awMIeg=; b=KPdBxKILkq3d9nEc1siRAqYwKw
 jZBz2Ii6RQ2gf/2jFWORsbsUiXVSsS2dqznJKIel2IMF6diLygLVxMeGwyv6iv1LVJDUPrd7ATQKX
 V8qqT9aOYlG04NKAr0ldyc/4il8mRS0rodAMQa6RJgztS7ua32PadrMr/w1dXPqcBTzU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mV54JMHYJV5YWN9iMTCDdA1Mk9u+5RjYC0kj8awMIeg=; b=l
 9EamJl8ZUAKoo6Y0VnGm2Keomp5PzdE8HLdX6lCWLwVf1drDGwUX+pk4JLgilch8IImoPnxfVNKQw
 UtJnZfxe7HdRaN/tKlMdUGFD90zToK653moXZ71xS5MJtb1VLQGfMTZZ8rdKOSEVtBZQa7E0sLefC
 i4zVO1/3F91kL568=;
Received: from mail-pj1-f42.google.com ([209.85.216.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wLvhr-0001rc-Gt for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 May 2026 04:23:56 +0000
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-3667cf0136fso1555217a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 09 May 2026 21:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778387025; x=1778991825; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mV54JMHYJV5YWN9iMTCDdA1Mk9u+5RjYC0kj8awMIeg=;
 b=cbA5zgAv7Xsj1EKzNF+O6+20Nq+YAmPfU2ehPtaEMpQUOewhHpLZsd/paVssPEniCK
 JKBsmkjFHsWpQRS1X6hpXHh1KbkoBSf5bs3t4vFxgsFdB16UTdo026WC17YDq1fyvSya
 ImvuyllEoC12Fkr87cSSsbEGhx293MSyzGwohvxyhxdTp/wNY5f0tc1zLc8XRrTsg5SA
 51dp11A2L07v72ALaFDTrX2w6b2kpFwTbaNQA775VNdot8Ih24Q6JMUiB2YiIopPXa3S
 UvgSrOgXOoKbR2Mjztzb1+tY96Y6ZLr7wMEtcENZGM5v18KmoE5lhYYWkpKeVZDXpo1G
 vLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778387025; x=1778991825;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mV54JMHYJV5YWN9iMTCDdA1Mk9u+5RjYC0kj8awMIeg=;
 b=JUrhIOV9zLW0YIVXnIXNN6lHsY6Xbxxa3/h4R3gbfBocApXzj1iC9xZzlLhXW2o8jW
 9yemRfHlvxUPnscMx8zsG0S53a6/QrCTljfc4Zk6JbrnyqWF6tj4EFLQ6pvOF1AnQule
 crCE290/DmccZAfCpaiztFfv/+8BnVdIOziUhheXZpOhtq+BbeqnuxOhW5LK+6lqs3/1
 fwsJPH8egapuIoBCXv/gQap8/V3vEMKjeXKDjgNk9kIyBzNZC4JCEvBVjn3Jo7fDsoo/
 kp6VaLEYYovwTL5cjxn2XcEpIt5/hReWkwSuW+7N/E7kRnpFVjqBeBlyUzpvH/6u3wp/
 AvYQ==
X-Gm-Message-State: AOJu0Yz/4eG347ilTU9oqDJJdnJa1lU3fbw/LMnNyw7cmBkqUXXmSRBX
 ycqdBrhmP63oHbHo40XVAvOJul4R4XUAmLtj70RTBQ4Jyz246h2MWUSk
X-Gm-Gg: Acq92OGeOnBlJwAqaxbQAizfVEbRHoTUT59Z2NZemvUhhp5OkJymPjJrg3BO5pin9X9
 U8SbLS7RUMZB5kcCJEqntnHgiY3tDT+gYtcpEEovT7hIeUNZ/fZeExssvfnsrnzEimifhpLiLCI
 YOmD/0z6Tc0nPC1CDhhj/ryD4JoIGM4e9YnpUPbrqJ4+DThbSR1INIsMf/ILq0t2acALYDxvG/u
 nC2ZkYPAfwOVJ44KCQ4FWQQl6ArpH53/drAPtihBedyKTwSu6xIVR1SQU6cQ8M3jifiIMMDhX0l
 KrU4y2VdxAqF13QNiwOZkcSRVegbcycSW0FKZFrnryu6rr8P29BKEvmoaabs7Blp0vmqFAggqbr
 FSpckxpfqehX1J/If4p6w5Ke/4UtE/pUiXdvD9J0ibXoCdz6Bfc1Eyhu280rkfaaTcHsxOfoLOg
 HX5jgq4nIEWRKOhfYB8bP/62kHspJC24Ke4TBWLyzodmNVAuygMcUR1+HvQMxX1FOSCSJVLfvi9
 jybEyA=
X-Received: by 2002:a17:902:c412:b0:2bc:90b6:3e6f with SMTP id
 d9443c01a7336-2bc90b64100mr31890385ad.4.1778387024685; 
 Sat, 09 May 2026 21:23:44 -0700 (PDT)
Received: from deepanshu-kernel-hacker..
 ([2405:201:682f:383f:5d23:3a35:10d1:5ed6])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1e8df57sm65976135ad.64.2026.05.09.21.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2026 21:23:44 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun, 10 May 2026 09:53:36 +0530
Message-ID: <20260510042336.94751-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When f2fs_get_valid_checkpoint() fails during mount (e.g.
 due to an invalid checkpoint CRC on a malformed image), f2fs_fill_super()
 takes an error path that eventually calls iput() on the root inode. [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.42 listed in wl.mailspike.net]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [kartikey406(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [kartikey406(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wLvhr-0001rc-Gt
Subject: [f2fs-dev] [PATCH v2] f2fs: initialize ino_entry_info before
 checkpoint load
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
Cc: Deepanshu Kartikey <kartikey406@gmail.com>, stable@kernel.org,
 syzbot+eec8f2693d71386bd600@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: CD10A5027B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[kartikey406@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:kartikey406@gmail.com,m:stable@kernel.org,m:syzbot+eec8f2693d71386bd600@syzkaller.appspotmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kartikey406@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,syzkaller.appspotmail.com,vger.kernel.org,lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,eec8f2693d71386bd600];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Action: no action

When f2fs_get_valid_checkpoint() fails during mount (e.g. due to an
invalid checkpoint CRC on a malformed image), f2fs_fill_super() takes
an error path that eventually calls iput() on the root inode. This
invokes f2fs_drop_inode() -> f2fs_exist_written_data(), which acquires
sbi->im[]->ino_lock. However, f2fs_init_ino_entry_info() has not run
yet at this point, so the spinlock is uninitialized and lockdep
complains:

  F2FS-fs (loop0): invalid crc value
  F2FS-fs (loop0): Failed to get valid F2FS checkpoint
  INFO: trying to register non-static key.
  The code is fine but needs lockdep annotation, or maybe
  you didn't initialize this object before use?
  ...
   f2fs_exist_written_data+0x53/0x90 fs/f2fs/checkpoint.c:787
   f2fs_drop_inode+0xda/0xbf0 fs/f2fs/super.c:1852
   iput+0x651/0xe80 fs/inode.c:2009
   f2fs_fill_super+0x6047/0x7850 fs/f2fs/super.c:5461

Move f2fs_init_ino_entry_info() to before f2fs_get_valid_checkpoint()
so that sbi->im[] is always fully initialized before any error path
can trigger iput() -> f2fs_drop_inode(). The init function only
depends on raw superblock fields (BLKS_PER_SEG, F2FS_CP_PACKS,
NR_CURSEG_PERSIST_TYPE, __cp_payload), which are populated well
before checkpoint load, so the move is safe.

Fixes: 3063c80776e3 ("f2fs: another way to set large folio by remembering inode number")
Cc: stable@kernel.org
Reported-by: syzbot+eec8f2693d71386bd600@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=eec8f2693d71386bd600
Tested-by: syzbot+eec8f2693d71386bd600@syzkaller.appspotmail.com
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
Changes in v2:
 - Add Fixes: tag (suggested by Chao Yu)
 - Add Cc: stable@kernel.org
---
 fs/f2fs/super.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index c6afdbd6e1cd..6a231a5b0d62 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5140,6 +5140,13 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto free_page_array_cache;
 	}
 
+	/*
+	 * Initialize ino entry info early so f2fs_drop_inode ->
+	 * f2fs_exist_written_data can safely take im->ino_lock if mount
+	 * fails after this point and triggers iput on cleanup.
+	 */
+	f2fs_init_ino_entry_info(sbi);
+
 	err = f2fs_get_valid_checkpoint(sbi);
 	if (err) {
 		f2fs_err(sbi, "Failed to get valid F2FS checkpoint");
@@ -5184,8 +5191,6 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	f2fs_init_extent_cache_info(sbi);
 
-	f2fs_init_ino_entry_info(sbi);
-
 	f2fs_init_fsync_node_info(sbi);
 
 	/* setup checkpoint request control and start checkpoint issue thread */
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
