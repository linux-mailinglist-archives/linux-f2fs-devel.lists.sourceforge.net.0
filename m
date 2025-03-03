Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C41BA4C92F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Mar 2025 18:22:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tp9UN-0000zF-0Z;
	Mon, 03 Mar 2025 17:21:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1tp9UL-0000yt-J5
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 17:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=content-type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KK1GgQVMwTeet01ybpOk9tWnDU1x3paagR1u3Pnbig4=; b=e8XMUodo+kqynAxDBQmMBm0vLO
 fFjeKUqFCQ5pKoA7KP2zY9gFmmkcWg4lxzlZBO45t7RRgyChn8fogVPHnKtIvSInkz1d7bdzh7bkn
 xM7M0QR9tsdvf4xnheQHSEGbwrMIYu8TgCToMoYe218rDFYr+91+GsnqXFZATaIFR7Os=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=content-type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KK1GgQVMwTeet01ybpOk9tWnDU1x3paagR1u3Pnbig4=; b=iItyCtBJkQbWb8gT49NrgM29ht
 bF/P/E87kY6uuKi4r9iT5tvUlGXi6zam+tLdP02o2hHizaBvsXjTZ0fSIY0m4tML6vEShvnU4yYOD
 PYMAzaazSAOlbdbiiLuuyu3CBLleBeV8v8QiAMv2axci2gvrfbSidLBzfxq79PlOFHFs=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tp9UB-0008QO-M2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 17:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741022496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KK1GgQVMwTeet01ybpOk9tWnDU1x3paagR1u3Pnbig4=;
 b=FATMjDjFckc+SbAtBq8wqU1mss3c3lRV1KjC/WgZ44hgkb9/Bn4sgfxr2T7GJZnVxEdwft
 wWXVrbmduvh0EWhtEO8elGcaBZYNcWy4sEEWuMaQ+/EJdypO4S81BBADypDWfgtyHe1LAw
 ZKhqpTpZ2Kncj5LbZOAUFAVLYUU0GfE=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-ewsgdmS3Owaej9aEGU359A-1; Mon, 03 Mar 2025 12:21:35 -0500
X-MC-Unique: ewsgdmS3Owaej9aEGU359A-1
X-Mimecast-MFC-AGG-ID: ewsgdmS3Owaej9aEGU359A_1741022495
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-855a5457110so438973239f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 03 Mar 2025 09:21:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741022495; x=1741627295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KK1GgQVMwTeet01ybpOk9tWnDU1x3paagR1u3Pnbig4=;
 b=sPg+8vnJ8b2vWd2ZDx53m+MvkEY0PhoXxKXOgPqeEuc+w7QkcE9IOIAMePmnj9BJca
 xhEAigPhdls5ASQLXNndASqacba6Q3WTBcjRX3Ok49S2b5HxmPWU1IodAfFwQADtsnpp
 mNBxmdThlKsYXAcRJwjXuEnC21ZZsbbvdVFvdkWFtgtEVf9Dx3/Tfla59UCyvfNqlXYb
 ouUNq9RzFY1+kUzHR91LhobMruXTzjR9ZPock9IfiLM/4oEjaYRK+SNpZsXcmo2RqhyS
 HHbWZ56XHKclO4KLd8X68KSPV7FMhjE0W7bAMgnp+CT0RQaWA55eQphIfaNkxb1xPa/O
 G/KA==
X-Gm-Message-State: AOJu0Yykqln6IXDDL+afz3zpq28dvXNBT5kA9hLtM7XxjXipmaKeEpWd
 QOuJnzg4MEwuviCcXgZtTXQTXWekzoc3OfP6m1hdPa2xVuL1AKz+VMjUqHev5KVsczW2l5h2kJ0
 bk2UG4Gx55DR6jIHRPZwJkD+EJHHlGaRkvLkbLvAw+FvUf0vjIIy2jj3Rr1p+1IgTGlA3RZDsQ3
 rnwN/D0vk/ITQX6FAyIkK4uCAQrwbr+wTd05O1CZWSEfWo/DnbaGCsuqT3+Q==
X-Gm-Gg: ASbGncuq0DGUNoz0EKR0KIS/4ytr/oJvRLEodK4JF36Q3VhEgkbyXubwfqi2h74V+fm
 j0cIVwAiFj+L/CH3sBuDs23/i2WI94d+PVklCeaPgya/Myg3CM56ufNoLGgi/HBTe5RIpeUcDWO
 nGAn1LC8Rubcc68noxQ9Pr+zGa6oRoJhR1BrRCoBOHplYp3m4714r/Jmn+V1GSJeUtbYFlPybs9
 YUWzMTwmXrur4aBND3xvBlLIpKYBqerFjrtHFOUUsodyY0P2j82OLkoNO7j/P6hI99gKKjVISiz
 QVKCMb7rLMs9FGnZslldmjRzb+ji9ks=
X-Received: by 2002:a05:6602:601c:b0:851:efec:53ad with SMTP id
 ca18e2360f4ac-85881f2fe85mr1488417539f.7.1741022494737; 
 Mon, 03 Mar 2025 09:21:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGTCqJ3svTWS7P8zrmjirxjCDnlIgb50sBjs7nrRoo7HXigvIdJ2BFDESd/oh4roTgxExtyQ==
X-Received: by 2002:a05:6602:601c:b0:851:efec:53ad with SMTP id
 ca18e2360f4ac-85881f2fe85mr1488413739f.7.1741022494344; 
 Mon, 03 Mar 2025 09:21:34 -0800 (PST)
Received: from fedora-rawhide.sandeen.net ([65.128.97.82])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-85add261b4csm49563939f.9.2025.03.03.09.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 09:21:33 -0800 (PST)
From: Eric Sandeen <sandeen@redhat.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  3 Mar 2025 11:12:14 -0600
Message-ID: <20250303172127.298602-5-sandeen@redhat.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250303172127.298602-1-sandeen@redhat.com>
References: <20250303172127.298602-1-sandeen@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sT_uLqg17YIDU40NIsoaNoc0hxejU3cpWJ212knGJZs_1741022495
X-Mimecast-Originator: redhat.com
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Sandeen <sandeen@sandeen.net> Set INLINECRYPT into
 sbi during parsing, and transfer it to the sb in fill_super, so that an sb
 is not required during option parsing. Signed-off-by: Eric Sandeen
 <sandeen@redhat.com>
 --- fs/f2fs/f2fs.h | 1 + fs/f2fs/super.c | 5 ++++- 2 files changed,
 5 insertions(+), 1 deletion(-) 
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -1.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tp9UB-0008QO-M2
Subject: [f2fs-dev] [PATCH 4/9] f2fs: make INLINECRYPT a mount option flag
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
Cc: jaegeuk@kernel.org, Eric Sandeen <sandeen@sandeen.net>,
 lihongbo22@huawei.com, Eric Sandeen <sandeen@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Sandeen <sandeen@sandeen.net>

Set INLINECRYPT into sbi during parsing, and transfer it to the sb in
fill_super, so that an sb is not required during option parsing.

Signed-off-by: Eric Sandeen <sandeen@redhat.com>
---
 fs/f2fs/f2fs.h  | 1 +
 fs/f2fs/super.c | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1afa7be16e7d..15e4f5a77eb5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -114,6 +114,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
 #define	F2FS_MOUNT_GC_MERGE		0x02000000
 #define F2FS_MOUNT_COMPRESS_CACHE	0x04000000
 #define F2FS_MOUNT_AGE_EXTENT_CACHE	0x08000000
+#define F2FS_MOUNT_INLINECRYPT		0x10000000
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
 #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 7cfd5e4e806e..643d19bbc156 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1036,7 +1036,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			break;
 		case Opt_inlinecrypt:
 #ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
-			sb->s_flags |= SB_INLINECRYPT;
+			set_opt(sbi, INLINECRYPT);
 #else
 			f2fs_info(sbi, "inline encryption not supported");
 #endif
@@ -4535,6 +4535,9 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	sb->s_time_gran = 1;
 	sb->s_flags = (sb->s_flags & ~SB_POSIXACL) |
 		(test_opt(sbi, POSIX_ACL) ? SB_POSIXACL : 0);
+	if (test_opt(sbi, INLINECRYPT))
+		sb->s_flags |= SB_INLINECRYPT;
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
