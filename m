Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 564E5A4C92A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Mar 2025 18:21:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tp9UC-0007e7-Ik;
	Mon, 03 Mar 2025 17:21:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1tp9UB-0007e1-Fy
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 17:21:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=content-type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rl1o+sBEhbKAJC9JIKkS/yC1Fh56NdcUPRuJTNKItws=; b=Il3aJZS+A9nPdM7d/DDo27M8mi
 eNoD0X1dE99Ckk9c1oWAMeqX/IvoN/XLjDfQ+MkWNJgVRFnJ6Z8Fq0RBjx7rWmqw1ZgYuiOl9dqjP
 UYoRLq1eUORg2TWuWIuNj5MQ9OtSjMuxt1Ndr6yOQugeQef0HajkIpJS6JzBsxfwbDdA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=content-type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rl1o+sBEhbKAJC9JIKkS/yC1Fh56NdcUPRuJTNKItws=; b=hLvsEPWIiBGYQWg0F8fJuCVEUq
 dKo0fizYl3RaosCl/WA5wdTsMXuZvrEyvbaYCWa32RaPy0h/IfFE6dDYt7QfZ1etIzX+FeDHYmLGt
 0zM376S71LdBrj4h5bAjZsQoIJZQK1SE0pBSQ3eRRKNJVkM8lO8k7SjIXPIGcgue1YPI=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tp9U8-0008QI-Qn for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 17:21:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741022498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rl1o+sBEhbKAJC9JIKkS/yC1Fh56NdcUPRuJTNKItws=;
 b=gNQOVolpRTaXcFkwUzbEcoLvq2AYLjBK5p9fiuiXt3/JFXRSU2ncGq2m/JRYYdpHk4kvAa
 LoypovglAS54ZSzwV3rWkxy3wjurcYZ/T+1jv6Mx72hoqICzYdmZSxwqLLyUI4G23MgVIF
 48StEd6gf6viH9kjB0newA4Qzp1A+T4=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-2o7_KJzoP2SUZNSJ-HQwYQ-1; Mon, 03 Mar 2025 12:21:37 -0500
X-MC-Unique: 2o7_KJzoP2SUZNSJ-HQwYQ-1
X-Mimecast-MFC-AGG-ID: 2o7_KJzoP2SUZNSJ-HQwYQ_1741022496
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-85ad875acccso315996739f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 03 Mar 2025 09:21:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741022496; x=1741627296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rl1o+sBEhbKAJC9JIKkS/yC1Fh56NdcUPRuJTNKItws=;
 b=gweriz+vHPrscVrBT5nrN63h1CNInDiCECWPik61eEh/MYgcE/0cBMHGGvMQcs3fAK
 NCDwGF7XMtrQjbpNRTKYBxk2a3pNGmVwL1Cg1SjlDz0/yB0z9Ba84TioiE5EGV+omaEo
 qE88GJcqH/GGWcouU+KpS0Yg4WePAr+FJwHXtVI61futAjxuaRag3mhFkgJHGDSyss/q
 sPXq/l57IM7KAQaf+C2D3yz6xF0ROXXSbzL8rmdDLEAP1BEUr+cQEAFS/hwDYM5OLQ/x
 d1Vtiz3oIcat90QvU8sGM+dRSFG/tEfhUJDGUng8Gux5fmX9CNABi21BKUAXJ+BrYh1G
 eWXA==
X-Gm-Message-State: AOJu0Yw72zeYj56L6n4K2SO+sBWQQQublOPt4Y++TLx15zbYn+Nuajp/
 TmNaW6GVqEDd0+reW3JewSiMVYBOiUOqLxNYOQJ8XSy0tuMqpPRTkIxOKctvlvKkRhwEh3K66NM
 Vtrs0kTw0s4btGYsixD/FbwioeczX7OrNxzlrB17IRLboDXGcjT25SSVKFXMd0MaHvT5Z/Kt2Z7
 PLy5/Saph78ehwvhrcfp0KxBtTN0Wu4QPkzY0EU1CZ5xT+gxMbwb+Dpm4fRw==
X-Gm-Gg: ASbGncs0kLLHD6H1blzwoeSIp2LZYrGytdhDFGfxSpx4kGkYgG3vCOcHWyqQ+I4kZ0H
 LQlEUJeY+kr4MGywyy/AvhwY3IDyoUcVA3NaK3atonqKunnNbt1cYHOQocoGMnM7xGVFFjMzmZ7
 M2QRbnH0wDt4VHwcUdCYzCwVhrb7q8w2K99Jk0xOW3ierEakNISBNC2tWsb9aTROHBHQsOpm4w+
 0jq/AcrCcKny9GbULOIJ353MwLKjB1+lY38iUuMsbnYnlbQxaO2dLcuI5LCsKumhOi/CnGM6Ixv
 982tTLWZKex5UFs0QqMDLxaBlbfnWnU=
X-Received: by 2002:a05:6602:3589:b0:85a:e279:1ed6 with SMTP id
 ca18e2360f4ac-85ae27922a1mr324575039f.11.1741022496029; 
 Mon, 03 Mar 2025 09:21:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiJdtMwxnkHK4nis29c/wQxEv7UYVhulmibA/kl6bWfq5i7ikY+z/the2I7C2Yn/zXqdkqxQ==
X-Received: by 2002:a05:6602:3589:b0:85a:e279:1ed6 with SMTP id
 ca18e2360f4ac-85ae27922a1mr324571239f.11.1741022495677; 
 Mon, 03 Mar 2025 09:21:35 -0800 (PST)
Received: from fedora-rawhide.sandeen.net ([65.128.97.82])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-85add261b4csm49563939f.9.2025.03.03.09.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 09:21:34 -0800 (PST)
From: Eric Sandeen <sandeen@redhat.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  3 Mar 2025 11:12:15 -0600
Message-ID: <20250303172127.298602-6-sandeen@redhat.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250303172127.298602-1-sandeen@redhat.com>
References: <20250303172127.298602-1-sandeen@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dFk9UkjfGi1W8M2cE7gARHp-DYOf9lp3v3R3Qf6dyiE_1741022496
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Set LAZYTIME into sbi during parsing, and transfer it to the
 sb in fill_super, so that an sb is not required during option parsing. (Note:
 While lazytime is normally handled via mount flag in the vfs, some f2fs users
 do expect to be able to use it as an explicit mount option string via the
 mount syscall, so this option must remain [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tp9U8-0008QI-Qn
Subject: [f2fs-dev] [PATCH 5/9] f2fs: make LAZYTIME a mount option flag
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
Cc: jaegeuk@kernel.org, lihongbo22@huawei.com,
 Eric Sandeen <sandeen@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Set LAZYTIME into sbi during parsing, and transfer it to the sb in
fill_super, so that an sb is not required during option parsing.

(Note: While lazytime is normally handled via mount flag in the vfs,
some f2fs users do expect to be able to use it as an explicit mount
option string via the mount syscall, so this option must remain.)

Signed-off-by: Eric Sandeen <sandeen@redhat.com>
---
 fs/f2fs/f2fs.h  |  5 +++++
 fs/f2fs/super.c | 11 ++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 15e4f5a77eb5..5c83e3a558f9 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -115,6 +115,11 @@ extern const char *f2fs_fault_name[FAULT_MAX];
 #define F2FS_MOUNT_COMPRESS_CACHE	0x04000000
 #define F2FS_MOUNT_AGE_EXTENT_CACHE	0x08000000
 #define F2FS_MOUNT_INLINECRYPT		0x10000000
+/*
+ * Some f2fs environments expect to be able to pass the "lazytime" option
+ * string rather than using the MS_LAZYTIME flag, so this must remain.
+ */
+#define F2FS_MOUNT_LAZYTIME		0x20000000
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
 #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 643d19bbc156..e63b3bd75f85 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -917,10 +917,10 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			break;
 #endif
 		case Opt_lazytime:
-			sb->s_flags |= SB_LAZYTIME;
+			set_opt(sbi, LAZYTIME);
 			break;
 		case Opt_nolazytime:
-			sb->s_flags &= ~SB_LAZYTIME;
+			clear_opt(sbi, LAZYTIME);
 			break;
 #ifdef CONFIG_QUOTA
 		case Opt_quota:
@@ -2169,8 +2169,8 @@ static void default_options(struct f2fs_sb_info *sbi, bool remount)
 	set_opt(sbi, INLINE_DATA);
 	set_opt(sbi, INLINE_DENTRY);
 	set_opt(sbi, MERGE_CHECKPOINT);
+	set_opt(sbi, LAZYTIME);
 	F2FS_OPTION(sbi).unusable_cap = 0;
-	sbi->sb->s_flags |= SB_LAZYTIME;
 	if (!f2fs_is_readonly(sbi))
 		set_opt(sbi, FLUSH_MERGE);
 	if (f2fs_sb_has_blkzoned(sbi))
@@ -4538,6 +4538,11 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	if (test_opt(sbi, INLINECRYPT))
 		sb->s_flags |= SB_INLINECRYPT;
 
+	if (test_opt(sbi, LAZYTIME))
+		sb->s_flags |= SB_LAZYTIME;
+	else
+		sb->s_flags &= ~SB_LAZYTIME;
+
 	super_set_uuid(sb, (void *) raw_super->uuid, sizeof(raw_super->uuid));
 	super_set_sysfs_name_bdev(sb);
 	sb->s_iflags |= SB_I_CGROUPWB;
-- 
2.48.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
