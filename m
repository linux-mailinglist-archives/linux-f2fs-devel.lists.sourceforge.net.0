Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 572C082642C
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  7 Jan 2024 14:13:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rMSxa-0000hU-CC;
	Sun, 07 Jan 2024 13:13:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1rMSxZ-0000hN-K5
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 07 Jan 2024 13:13:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0AZ0NYrGHkvNJ0BuPObLV8cnMGqTc5rnXOPBAm7Oj3w=; b=YiH+9khr4rebtayBj4DXikuO2g
 g/B8dqm4jCZEYSHV+b398GQ05G2Ws0VP4OJS6n5GFHPLKIXv2J6FejilGyHbwkblYyA9FSYhkYcip
 GhwWpfHqKvOaql2HMtdIhDhuC8BhluUoZPT1jv8ZF9qe35wympfC+0FMylki/Wpp/2O0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0AZ0NYrGHkvNJ0BuPObLV8cnMGqTc5rnXOPBAm7Oj3w=; b=m
 HCUV5K9rmDrvK5I23JiDHdtMhcY/FCy0nAxvIvrGleInDBQR0gM14NwOlBgok5zM/2AaJCunZHLsZ
 Xb4F/umON/3X0nRx3R0AKwxW72TtRYUaEXkTFBdkYSDkzKBkjegeOCWHGDdCetp9kwh5wg+/upLrX
 dpFP/wzIMqNLamVk=;
Received: from mail-pj1-f44.google.com ([209.85.216.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rMSxU-0001Se-C4 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 07 Jan 2024 13:13:01 +0000
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-28b400f08a4so921753a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 07 Jan 2024 05:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704633171; x=1705237971; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0AZ0NYrGHkvNJ0BuPObLV8cnMGqTc5rnXOPBAm7Oj3w=;
 b=EK0KEgYZfpbHCf6nwlkLH8UsaViFSITXkr/m92qrB95mM6WcXhjequ44pM+n5UQGaz
 E4J1X5sNdAabwM8UgAGsm8pbmFa4VOstsmy3MpbMlqLzljErY/IwEttJ06fNRmnLRDY9
 fS40tC7ZXZ5EPC2+AIcmsEHFKPEf8PDGJwOpUj2hwaJ8EUT/P2k+AQRoOEPTJfhBUKf0
 Im2n9ptU7ER7taVqAY2Y9DwYxwH3qMrNr6hMkkLfKPiKbx75OU1OIcHhqmDmFfbVJhRx
 XFz1jf/OQBmYJVQbugRB/XyhshK0TR2Zt5Ltv1KEIkmvOdDIp4ijcPsHexUXIEnzFsKP
 EhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704633171; x=1705237971;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0AZ0NYrGHkvNJ0BuPObLV8cnMGqTc5rnXOPBAm7Oj3w=;
 b=lW0S7ktDks0aIZrHN5sSyDexBuLLxavfDFx80ab/AJJG9iIVmxeTB/Kcmjf8JVzMNJ
 SjG+OuqqVr/C8TwgY51VwzxGu4nvLMqPGTAyLTCHh9AIzezmpGD7U/EyPuSE1xmVGK4V
 Edm2AGtf2W3zzHs//ievHARLuGL0Z7iSo+zBhNasBeMUXOi7NpmBJ4/GFkB4TLagdpbB
 kwjeqmMOpSNgozJPK3BWIXOjeSgbDAg0p0LPDL/Ih37r0xab4D1AcvjDRmMPemYdQElO
 XwFpcTqf8NuPrnA7P5sIXeL8Yq/iNyDHgXEKb3bHlzeOneRmTs2AbW7CnmHDQCniQ/K7
 Boag==
X-Gm-Message-State: AOJu0YzC+VE8x4XyeSXEuvy/BPinT0b9i/G/5l79VPK4PC7c/3ixdhQW
 a79YNhX9jD77N0DJUUlT20s=
X-Google-Smtp-Source: AGHT+IEyT6cSkWIap2ItvbxhQ0T2N09gJiyxAbix4fWyCmxtd7aUxUqmQ3xS+BlozSvYsxONSTHncg==
X-Received: by 2002:a17:90b:1b47:b0:28b:7124:c467 with SMTP id
 nv7-20020a17090b1b4700b0028b7124c467mr799077pjb.89.1704633170489; 
 Sun, 07 Jan 2024 05:12:50 -0800 (PST)
Received: from localhost.localdomain ([2001:250:4000:8246:82c:d0d:31ee:3949])
 by smtp.gmail.com with ESMTPSA id
 db4-20020a17090ad64400b00286da7407f2sm4534878pjb.7.2024.01.07.05.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 05:12:50 -0800 (PST)
From: Wenjie <qwjhust@gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org, guoweichao@oppo.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Sun,  7 Jan 2024 21:12:36 +0800
Message-ID: <20240107131236.625-1-qwjhust@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Wenjie Qi BUG: kernel NULL pointer dereference,
 address:
 0000000000000014 RIP: 0010:f2fs_submit_page_write+0x6cf/0x780 [f2fs] Call
 Trace: <TASK> ? show_regs+0x6e/0x80 ? __die+0x29/0x70 ?
 page_fault_oops+0x154/0 [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qwjhust[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.44 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.44 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rMSxU-0001Se-C4
Subject: [f2fs-dev] [PATCH] f2fs: fix NULL pointer dereference in
 f2fs_submit_page_write()
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
Cc: Wenjie Qi <qwjhust@gmail.com>, hustqwj@hust.edu.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Wenjie Qi <qwjhust@gmail.com>

BUG: kernel NULL pointer dereference, address: 0000000000000014
RIP: 0010:f2fs_submit_page_write+0x6cf/0x780 [f2fs]
Call Trace:
<TASK>
? show_regs+0x6e/0x80
? __die+0x29/0x70
? page_fault_oops+0x154/0x4a0
? prb_read_valid+0x20/0x30
? __irq_work_queue_local+0x39/0xd0
? irq_work_queue+0x36/0x70
? do_user_addr_fault+0x314/0x6c0
? exc_page_fault+0x7d/0x190
? asm_exc_page_fault+0x2b/0x30
? f2fs_submit_page_write+0x6cf/0x780 [f2fs]
? f2fs_submit_page_write+0x736/0x780 [f2fs]
do_write_page+0x50/0x170 [f2fs]
f2fs_outplace_write_data+0x61/0xb0 [f2fs]
f2fs_do_write_data_page+0x3f8/0x660 [f2fs]
f2fs_write_single_data_page+0x5bb/0x7a0 [f2fs]
f2fs_write_cache_pages+0x3da/0xbe0 [f2fs]
...

It is possible that other threads have added this fio to io->bio
and submitted the io->bio before entering f2fs_submit_page_write().
At this point io->bio = NULL.
If is_end_zone_blkaddr(sbi, fio->new_blkaddr) of this fio is true,
then an NULL pointer dereference error occurs at bio_get(io->bio).
In this case, the code to determine the zone end can simply be skipped.

Signed-off-by: Wenjie Qi <qwjhust@gmail.com>
---
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 1896928cae77..d08e92bb2621 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1100,7 +1100,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 		goto next;
 out:
 #ifdef CONFIG_BLK_DEV_ZONED
-	if (f2fs_sb_has_blkzoned(sbi) && btype < META &&
+	if (io->bio && f2fs_sb_has_blkzoned(sbi) && btype < META &&
 			is_end_zone_blkaddr(sbi, fio->new_blkaddr)) {
 		spin_lock_bh(&sbi->available_active_zones_lock);
 		if (sbi->available_active_zones > 0) {
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
