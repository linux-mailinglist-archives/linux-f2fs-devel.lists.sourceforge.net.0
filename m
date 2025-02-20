Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D67A3DF3C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Feb 2025 16:49:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tl8nm-00023x-Qw;
	Thu, 20 Feb 2025 15:49:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1tl8nc-00023j-L4
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Feb 2025 15:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2E2MTvAYQWg7krEfkXP1hDGVQ7vMKcc+OhnV3fQUlZU=; b=Zn1KokuJ1TnVob+ywgwcsDBvTa
 12CgncX4/H/hPzHvrGldTynHkVelcEVU7pdGCNqjNPncw+pYSX7Pqd7OkU3nHcvXWs/T3aTL1TAdW
 CiDCmoE6pjJV1QR0fq9S3AO+BI6cVzefA1Z1Udmwhrq6DvoUdqA8ssLXXxYl9fqCTZPg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2E2MTvAYQWg7krEfkXP1hDGVQ7vMKcc+OhnV3fQUlZU=; b=g
 KE3+7NAhoVjw2FN1R0Nl2s42lFnmpV/2IOcGn55P3NEgC9VZzYY9hba4K7LL/RRNY1oyT0PoxkXov
 sHm47mCZBuAUyq+c0HTxcLvb1bhmBhUxuNp6E+I1FLJYplWI8Flz2jZBxx+hvABHIq60EvlNN90Aw
 T9LMxx/1S8MGYUo4=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tl8nc-00015m-1d for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Feb 2025 15:49:16 +0000
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2fce3b01efcso468664a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 20 Feb 2025 07:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740066550; x=1740671350; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2E2MTvAYQWg7krEfkXP1hDGVQ7vMKcc+OhnV3fQUlZU=;
 b=gUppFRqdlNS6+lAhrED7oajVLICYnHBciwyF0nxZwQ81RRJQGURGDUAPkk7Ueq1+aL
 G9YP0mIj9U0BJGnipWSvd55/owQYHNKZySlUZF5AhSBvy1A1mCM8ABASprzEc/t77hMW
 o948ReaHPHzLhY+Av0O/671ZfHyi76OXMYnzlb6CRWJwmPU5LrDXZAOZqcJ68bRakNOM
 py8S13YCMeMngzfE6nwr5GWz/0ebObyYs9+I75kYnCEU57+J+DZBFoHSMuB25vcbHHP6
 fL6Oz4QXWpZeCWY0acb3RXWCll3l5kyfryR9km2Uey8wG8S/1pIgt446XTUcWW9GfhR2
 lreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740066550; x=1740671350;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2E2MTvAYQWg7krEfkXP1hDGVQ7vMKcc+OhnV3fQUlZU=;
 b=OyTJckZDs+vZ8XE/z8LoJG4hfv4xWEm263s+3dpwqhsoInxWApUEDLEmoAT3idrzfG
 yBPkgMkp0jnLb19Fs6isYyVw/tmmzXu7G5mr5wnv6LdDlWWUqxORasNXnIaeIvm5YuyN
 oMOSzGVw5yPJDha8ssWzMS0ftO7Mpq4Zd4biI02KkLdK0us+RtwAHfQUYX8MoGxJCuZI
 F02Qkpkm0FqYFqN69SVMDgHTlVF5gTEgTMoV+Lu1UQqpq7AD3r2wLqhUu10fiXafd7SR
 pyGyzjlvUl0J64Z5TWc2wV/5Z+xjcQ12FGoWcjwIgUnDirtW+7XFJTrl6bQ8ktbhIyGX
 3rxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2ZVSsQUtm/Wis+Sy2SNDBiG98RkvOvYlD5ehAamsgbnf9FjH0u87XIlApuhAwK4/EI4G1wK8rRd+NsoZ30rb0@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxue1KSElaqfTUkrsGqcX8rz7w8Ne6fgq5uX/75Z+NJvi1vf4f3
 FWUk2UNdf2OkPowOM53lyljVjnt8BZ7t8rsbUOxFdMpcBrCqOqRVIMgKDQ==
X-Gm-Gg: ASbGncsrqZZqY/LFfMbscXxbroYzmHC53Z+p4b+o3cq1HhpcQLjp+IVV1UhQmGp02wp
 uYBp/4GQSMcHxdWHpdB8scVmC3ElMHRdD0x7N3mwQtLXyVadkupzVoVGsytcTmQr+cGeSJMcYEm
 FWvrXiW7iJ/h5E2u6sMVOgWkKMfwjgPp1cEqhIYxPaeTRCw5+3YYDcrh2pfR6A2JQd+ENoQ3GAF
 I4VPSpYCt76/qV2ffFYdgM7/iuyWtL+T/XCJm2rJth/KazFde8mF+Sqwhc79vqe+LNAYHkQvXbM
 P2Lx0urdQMMgorwHoiRp8Jb4/p0NxqOB/Au8GsPxW7jPvxf7326JArCnZx2XeBz39hDmHMUIIHy
 YxtVfQLE=
X-Google-Smtp-Source: AGHT+IFyTr4GZkLCpTuA2k65GDMtmNGCygaMOCQt011avMeIOZw1OH1WNoTpr4HlNT9cp+z23E6Uww==
X-Received: by 2002:a17:90b:2644:b0:2fa:137f:5c5c with SMTP id
 98e67ed59e1d1-2fcb59e5914mr12072369a91.1.1740066550186; 
 Thu, 20 Feb 2025 07:49:10 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:d4e3:981c:2900:970e])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fc13aafa44sm14044962a91.5.2025.02.20.07.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 07:49:09 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 20 Feb 2025 07:49:04 -0800
Message-ID: <20250220154904.2698964-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong When we support segment or section unit
 discard, we should only focus on how actively we submit discard commands for
 only one type of size, such as segment or section. In this case, we don't
 have to m [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.46 listed in list.dnswl.org]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.46 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.46 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tl8nc-00015m-1d
Subject: [f2fs-dev] [PATCH] f2fs: do not use granularity control for segment
 or section unit discard
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

When we support segment or section unit discard, we should only focus on
how actively we submit discard commands for only one type of size, such
as segment or section. In this case, we don't have to manage smaller
sized discards.

Reported-by: Yohan Joung <yohan.joung@sk.com>
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/segment.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c282e8a0a2ec..4316ff7aa0d1 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1661,12 +1661,20 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 				f2fs_time_over(sbi, UMOUNT_DISCARD_TIMEOUT))
 			break;
 
-		if (i + 1 < dpolicy->granularity)
-			break;
+		/*
+		 * Do not granularity control for segment or section
+		 * unit discard, since we have only one type of discard length.
+		 */
+		if (f2fs_block_unit_discard(sbi)) {
+			if (i + 1 < dpolicy->granularity)
+				break;
 
-		if (i + 1 < dcc->max_ordered_discard && dpolicy->ordered) {
-			__issue_discard_cmd_orderly(sbi, dpolicy, &issued);
-			return issued;
+			if (i + 1 < dcc->max_ordered_discard &&
+					dpolicy->ordered) {
+				__issue_discard_cmd_orderly(sbi, dpolicy,
+						&issued);
+				return issued;
+			}
 		}
 
 		pend_list = &dcc->pend_list[i];
@@ -1701,6 +1709,13 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 
 		if (issued >= dpolicy->max_requests || io_interrupted)
 			break;
+
+		/*
+		 * We only use the largest discard unit for segment or
+		 * section unit discard.
+		 */
+		if (!f2fs_block_unit_discard(sbi))
+			break;
 	}
 
 	if (dpolicy->type == DPOLICY_UMOUNT && issued) {
@@ -2320,10 +2335,6 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 	dcc->discard_granularity = DEFAULT_DISCARD_GRANULARITY;
 	dcc->max_ordered_discard = DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY;
 	dcc->discard_io_aware = DPOLICY_IO_AWARE_ENABLE;
-	if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
-		dcc->discard_granularity = BLKS_PER_SEG(sbi);
-	else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SECTION)
-		dcc->discard_granularity = BLKS_PER_SEC(sbi);
 
 	INIT_LIST_HEAD(&dcc->entry_list);
 	for (i = 0; i < MAX_PLIST_NUM; i++)
-- 
2.48.1.601.g30ceb7b040-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
