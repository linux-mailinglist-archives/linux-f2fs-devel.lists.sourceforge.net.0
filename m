Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F27A4C937
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Mar 2025 18:22:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tp9Un-00013I-C4;
	Mon, 03 Mar 2025 17:22:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1tp9Ul-00012z-VF
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 17:22:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=content-type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j2WbdJlNdbhkCclRf7c22dSf77+O9W2lmcMP4hLabTY=; b=gwfhT242sgIUr7oudt/UQlfX8k
 9kdV6577wWFgJikH6kr8Mffl5qwsKwR8jhoTqaPF0oCj42ZysRulKADX4QeQ3I0DJg5vUBZ8+JBZs
 CZYKlJSPV7XL6cz44VSaQIkbG/cm3EZSLB48eIlW8V1KMoMGbK+qrJZG0emd+SVcu9UU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=content-type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j2WbdJlNdbhkCclRf7c22dSf77+O9W2lmcMP4hLabTY=; b=SJz0lUFWFFyYVrbLtsevo5oWIE
 WuPWL9WhX8N6FqIR38VWlTtY8n8Apem47DEOAir/4P+3PNXE4gTEJbwrTMRAZA0ywxTtgsBn8ENbx
 BtbF57dIRzb9Zor/teYePW00uML9yMsGtdfp/Ocdd+jBOKWEZqspHUnKaxQ7kN9Em1g0=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tp9Uc-0008Rl-0h for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 17:22:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741022518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j2WbdJlNdbhkCclRf7c22dSf77+O9W2lmcMP4hLabTY=;
 b=Bk7YMBxurdbAYk14dzbAK2JzjdXEbt1OH/18cVHyTL8BPlA6dGVR1kKLDoiVu5lgd0ZoWq
 tNvUKJ7NiEwi/uhLew/eBxSxe3mGEtLqVlNQ0+bph/KKdZ26xfsCzL1VJaapct3ZLoJHdi
 5TxhF1qF4sDwNGYuP3VaWJLtGKlA2b0=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-SjuGXMPHPnSEhoMsinwPJg-1; Mon, 03 Mar 2025 12:21:40 -0500
X-MC-Unique: SjuGXMPHPnSEhoMsinwPJg-1
X-Mimecast-MFC-AGG-ID: SjuGXMPHPnSEhoMsinwPJg_1741022499
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-85ae1c53d9fso61786339f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 03 Mar 2025 09:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741022498; x=1741627298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j2WbdJlNdbhkCclRf7c22dSf77+O9W2lmcMP4hLabTY=;
 b=rGRlHNPHPX7J11LBoecO9LBBYTJ/1qF5fxTv3308ZQ0NaRLAKdA6QiGMcmF+ZQaSDk
 Gv2qOuPoz3a9cMBfW2Rwequ6gzqSw1yB/eYaQ68NJnxlOWHX25sRGTwrxglW1Wq1CKdT
 KNYadVOyDAUDgtEBRBVKGE7UZeqrbX+dx3KH9tk64CGjGqFw7peppxa7Y22thyck0Kxj
 DT9g/mSSTRygAXt7tO+30wXLSXIEI4ME5MnQKEyQJzSGaH4XpKiNHtnEMZ36bhAKSfqy
 avNz6B+5ElvOWQk3OTf67Hw2iW8vWUcG271F0iMH0J+47u8a5clsZOqN08UsEozdESqP
 j7vA==
X-Gm-Message-State: AOJu0YyjFLbB4c4BAqfNN0gLoEpWV1IzccwJ2y40LwN5cnmmJWZtAh/N
 r33bENpzSKQe87IlA2iu4J9dedB5Yy03wCRCKJo2VW9ODYf892dkVcoR6nOJuz/ouw5edyEz8J4
 f9n5dhTSEAzHpys4CGud/gzUCxZ2jgk/oahxYK95eY7prPeC1lB65EdiXim45Zhz1IKiCfyRucl
 EGueiRv4s/TY/DAGGx13Jd9nitwRgWuZutDkBmIs2qgyyaAxSVqa0e1N1TyQ==
X-Gm-Gg: ASbGncuxMhvCIDqiyt6D7tvzo3AH+uDk/G3HYUA4BVHyG+b45l+HzAqyMhc9/Qjj5ev
 IrOFHzl0jYZ/hE3NGNvLdWT9+YK66jwWy17/iC4LCuyEmMbmXrn9f0bSA04aXl+AXmr4CVVMhfs
 eoP0qq03Y6vr7nuS/I3NsQg3arEmuDhjpXYqdftIz6Z3WHOdGBYsB2AZoaf4m1NGjzO4XOeYhvq
 OQlG3Y0A4kQHGbG5KmA1bMXomPoSxzu5WCFIRpMwL62dOKB7JihYab8C4bIQOUx5INFDF51cFLK
 r6pXfZCa8dOB6tjZhnFhmdmpAt7kgU4=
X-Received: by 2002:a05:6602:148d:b0:855:bd9c:7180 with SMTP id
 ca18e2360f4ac-85881f71692mr1510315939f.9.1741022498532; 
 Mon, 03 Mar 2025 09:21:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWaLuZxAD9vSRShq4AQ4+cBdGetOHBZWS4uRNdKPzL2QMXwvJ3R2CHnBVqynGAkZlbLd4LpA==
X-Received: by 2002:a05:6602:148d:b0:855:bd9c:7180 with SMTP id
 ca18e2360f4ac-85881f71692mr1510312539f.9.1741022498057; 
 Mon, 03 Mar 2025 09:21:38 -0800 (PST)
Received: from fedora-rawhide.sandeen.net ([65.128.97.82])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-85add261b4csm49563939f.9.2025.03.03.09.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 09:21:37 -0800 (PST)
From: Eric Sandeen <sandeen@redhat.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  3 Mar 2025 11:12:17 -0600
Message-ID: <20250303172127.298602-8-sandeen@redhat.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250303172127.298602-1-sandeen@redhat.com>
References: <20250303172127.298602-1-sandeen@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I7kQCi0LQAijGDOP7RGnykGJMkseMkfzpakVYwQSHW8_1741022499
X-Mimecast-Originator: redhat.com
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Defer the readonly-vs-norecovery check until after option
 parsing is done so that option parsing does not require an active superblock
 for the test. Add a helpful message, while we're at it. (I think could be
 moved back into parsing after we switch to the new mount API if desired,
 as the fs context will have RO state available.) 
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tp9Uc-0008Rl-0h
Subject: [f2fs-dev] [PATCH 7/9] f2fs: defer readonly check vs norecovery
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

Defer the readonly-vs-norecovery check until after option parsing is done
so that option parsing does not require an active superblock for the test.
Add a helpful message, while we're at it.

(I think could be moved back into parsing after we switch to the new mount
API if desired, as the fs context will have RO state available.)

Signed-off-by: Eric Sandeen <sandeen@redhat.com>
---
 fs/f2fs/super.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 8866a74ce6aa..bc1aab749689 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -727,10 +727,8 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			set_opt(sbi, DISABLE_ROLL_FORWARD);
 			break;
 		case Opt_norecovery:
-			/* this option mounts f2fs with ro */
+			/* requires ro mount, checked in f2fs_default_check */
 			set_opt(sbi, NORECOVERY);
-			if (!f2fs_readonly(sb))
-				return -EINVAL;
 			break;
 		case Opt_discard:
 			if (!f2fs_hw_support_discard(sbi)) {
@@ -1411,6 +1409,12 @@ static int f2fs_default_check(struct f2fs_sb_info *sbi)
 		f2fs_err(sbi, "Allow to mount readonly mode only");
 		return -EROFS;
 	}
+
+	if (test_opt(sbi, NORECOVERY) && !f2fs_readonly(sbi->sb)) {
+		f2fs_err(sbi, "norecovery requires readonly mount");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.48.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
