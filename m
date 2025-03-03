Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4EAA4C933
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Mar 2025 18:22:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tp9UR-0007fU-9j;
	Mon, 03 Mar 2025 17:22:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1tp9UP-0007fF-Sv
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 17:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=content-type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tnfeTGnJi9mN0JKSqbiJYiLPQIxUPyH6sS/f3rf+dfg=; b=dNRh2qVK7eEmqDlII9QYbAApyh
 bTO1uU9lb7fKcAOrCBOgwGfSxKJqq2aoDa4jViB3S44tU5LOdfAEK1zIfbWSapy2cidEz0M03GAhN
 X7K5Ockn93w0rJcmXkVAfmLd5UK5lcuH2u0SuR3R/W8Zq8Ey1iW6z4N+g98Jdw5NMvE8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=content-type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tnfeTGnJi9mN0JKSqbiJYiLPQIxUPyH6sS/f3rf+dfg=; b=ZJB7jRMjWLcqCa92vNct/zoXMc
 Hm33bSkn3hYBF9ZxY6y62ddCDe5ZuTj142ghb6MTizAo2XbH0eW9h0IRFV0FQB8soCxL2RbjfqJxw
 +DdkXef/HjKl1ogsfCjl/iUpT0uRS4e8cRRsnl9eII6fQEEc0ypDM+8o/LdvAx0fnYcc=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tp9UO-0008R8-KM for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 17:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741022509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tnfeTGnJi9mN0JKSqbiJYiLPQIxUPyH6sS/f3rf+dfg=;
 b=YSfm2o+LnBeXsSiEmjG9bD0Jdkc/gaGORSePO037D6lPBO4NZYJs7Y181mcw8pt2Ojn/12
 LbwYOJCSSDVeKhZLLwCuk6rVOhg4G7LS1rGyp3SIjP0rMHv1aD4sWXONCwPMptzPQqFcwv
 kwFiAuHsg6ZRy6eizCjl4DW8XfJ4VQY=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-SH1-h1-zMq--MALyqY1lKg-1; Mon, 03 Mar 2025 12:21:38 -0500
X-MC-Unique: SH1-h1-zMq--MALyqY1lKg-1
X-Mimecast-MFC-AGG-ID: SH1-h1-zMq--MALyqY1lKg_1741022497
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-85ae5190d4fso86849839f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 03 Mar 2025 09:21:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741022497; x=1741627297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tnfeTGnJi9mN0JKSqbiJYiLPQIxUPyH6sS/f3rf+dfg=;
 b=WwCCQ6PpQi+Ew/TwgHwMJI4mvmcRJB1rJwZSerQq6ekm1LlfhJHzqqGLoQax6owRXP
 ZxTvoavT7VXvzbrDLK5Yihfg7amlhGW6Y4ZTOW9egrcLkHbEepFxadMouutY1nEOlUse
 KZERoEi/GEiMOgQKWjnfeCkKTaRiXrh5l+xmMAYvwC3JF3y99mCRG0fab5F7I5wRgYyb
 CwqNxvmlDVigL0+Hyat9hrQOY59M060q2+cM/rp9uJRRblHB4v+bXPEkHZj4bYf8mSY6
 MirniVYWLu2dso4N+1K4FUtLOXJGrULp9NMZ/JMekx53KDmnudrJ0XmWJry9wfFqz59P
 EFaw==
X-Gm-Message-State: AOJu0Yzs1/3hFpYW6ERMt8jmHrFUoLQvdHaxXP/rLrt1NA5t1XTwO5G/
 6wfiviJ1As9qS20Q/icS1RzV8yfblpBezPvtcYidTluBDlFcdu/yKHfEeOCdUz8JgLZOV5D7vdI
 3neDvekRv4V2LJ3BQYyCk8gfkrQVotPENFMtMjMIgRiFcORLJ/sPWZOIbTRugnjFBi5LrStJedT
 /9jIgLepSdkulyx6MsXgt9DpICfme+MkGfFUBrs+ee2MmCSJXDuhbE1NlY0w==
X-Gm-Gg: ASbGnctvUGvAIxRGEyJl2Vm44tTGWBsva0IvLjoQg36OrSUtb72QZK9+wCCxIXuM0Yu
 NFIhBQ9DR8Kr8r2mbcFREAqlHyM3SqASWYETBd5UzTbV+DwdwG/7pDhKmh0cTRYa7LDn3PWrQEt
 lO5rkkx6Nm7u8gu2WRFmklEOY4FDqbQCL365ODccOpELwAh11QN/05KT6w0Phm9RQr2chD3GdC0
 b+PAiKCXBlUUYvSZksy+RcP/F2PQrIo8DcIxcAe0dhs3bph0LDzCi/NejH5EaARn5VdZaamw5/Q
 r0KYIhMRm1RPtbh8df3/qdsWohBTuZ8=
X-Received: by 2002:a05:6602:3fd1:b0:84f:2929:5ec0 with SMTP id
 ca18e2360f4ac-85881f0a0c1mr1739259139f.4.1741022497162; 
 Mon, 03 Mar 2025 09:21:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtcYrPGoZKO383dfBXmGjrDcSGSI7XeGVAbKYy3Z1KkphtsM5+lcv/SaNbCjkonoe+cOhbrA==
X-Received: by 2002:a05:6602:3fd1:b0:84f:2929:5ec0 with SMTP id
 ca18e2360f4ac-85881f0a0c1mr1739255939f.4.1741022496833; 
 Mon, 03 Mar 2025 09:21:36 -0800 (PST)
Received: from fedora-rawhide.sandeen.net ([65.128.97.82])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-85add261b4csm49563939f.9.2025.03.03.09.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 09:21:36 -0800 (PST)
From: Eric Sandeen <sandeen@redhat.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  3 Mar 2025 11:12:16 -0600
Message-ID: <20250303172127.298602-7-sandeen@redhat.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250303172127.298602-1-sandeen@redhat.com>
References: <20250303172127.298602-1-sandeen@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q4xRYwDfEsC7W7r2F_PRhTR6OJdeiE_iUxvE8jEe01Y_1741022497
X-Mimecast-Originator: redhat.com
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This removes another sb instance from parse_options()
 Signed-off-by:
 Eric Sandeen <sandeen@redhat.com> --- fs/f2fs/super.c | 5 ++--- 1 file changed,
 2 insertions(+), 3 deletions(-) diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
 index e63b3bd75f85..8866a74ce6aa 100644 --- a/fs/f2fs/super.c +++
 b/fs/f2fs/super.c
 @@ -483,12 +483,11 @@ static int f2fs_check_quota_options(struct f2fs [...]
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-trusted.bondedsender.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -1.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tp9UO-0008R8-KM
Subject: [f2fs-dev] [PATCH 6/9] f2fs: Pass sbi rather than sb to
 f2fs_set_test_dummy_encryption
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

This removes another sb instance from parse_options()

Signed-off-by: Eric Sandeen <sandeen@redhat.com>
---
 fs/f2fs/super.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index e63b3bd75f85..8866a74ce6aa 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -483,12 +483,11 @@ static int f2fs_check_quota_options(struct f2fs_sb_info *sbi)
 }
 #endif
 
-static int f2fs_set_test_dummy_encryption(struct super_block *sb,
+static int f2fs_set_test_dummy_encryption(struct f2fs_sb_info *sbi,
 					  const char *opt,
 					  const substring_t *arg,
 					  bool is_remount)
 {
-	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 	struct fs_parameter param = {
 		.type = fs_value_is_string,
 		.string = arg->from ? arg->from : "",
@@ -1029,7 +1028,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			kfree(name);
 			break;
 		case Opt_test_dummy_encryption:
-			ret = f2fs_set_test_dummy_encryption(sb, p, &args[0],
+			ret = f2fs_set_test_dummy_encryption(sbi, p, &args[0],
 							     is_remount);
 			if (ret)
 				return ret;
-- 
2.48.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
