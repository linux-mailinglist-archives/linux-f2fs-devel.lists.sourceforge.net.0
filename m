Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E75EA01E41
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jan 2025 04:37:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tUdvl-0001bs-0X;
	Mon, 06 Jan 2025 03:37:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang66@gmail.com>) id 1tUdvj-0001bm-Pl
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Jan 2025 03:37:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iLPtRbtGEa+mBJPdTtjo4hImxFMP4KOO18lJsBNVW0M=; b=MrvN5R0li1GoYtmfFavSPSzXYG
 XJWEvsmu0g3y4mWXZrB1JBc/LHNsOpUdWp+l3ffEOsYeONPgU/Cro4fyNt3A4XTxZ8CiLpJQxTV+/
 6CSDrgUXT8c9o/BAn7YLgZl1E9Xz+rcZTJUn87L4sd0kqcFKue3zfY6Am+eTpcKFivV8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iLPtRbtGEa+mBJPdTtjo4hImxFMP4KOO18lJsBNVW0M=; b=i
 6yAcG9rS0vWjPmlX8oQkMQzgYVjGtbv68SSWyo2OvFEVC+b04LM9ZhMLzNlJMBe1OwkaIebu9x8Zw
 XZI2uAgaHiyqPQiABX7HVUZC2stMTy68+MJi6dKXhMFUOGZkGaWW07VBmVHTfKiDXU65aiY+hpSvN
 42sHJBGGe6uKp3Nk=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tUdvi-0004du-Kg for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Jan 2025 03:37:27 +0000
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2ef8c012913so15255705a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 05 Jan 2025 19:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736134636; x=1736739436; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iLPtRbtGEa+mBJPdTtjo4hImxFMP4KOO18lJsBNVW0M=;
 b=NTgHx/4DcmHxpl9bw1Kf1d6DOZRA21JmvOkXELn3YsZMXPxFT+TrDwqMotMwHBzZCq
 W7JkqBt0aQ2p0reUlIqW9Ug+ZBy06doXUZlq/8PFX7OadvIqolcf3Q5fNFXn4uzJdEeI
 TKa6MQFkrm7XpKJkRq1gI/WhfdAk4l2NFDkJNfZH1tg6COcDfThHdrJnprnMUscfG3Cm
 +hwfUb53Y1JGNbmpkR7ohXFFGjQscMZWGauoL0uozvuvhdzJC1BcxU297OeoGBxu6Zur
 v2Kl7Yxg+USi98s+WbUfz7MFMGYgKcUOQGILXusxM7mC0hVjMw08vkP5jeynsjFi/rY6
 W4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736134636; x=1736739436;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iLPtRbtGEa+mBJPdTtjo4hImxFMP4KOO18lJsBNVW0M=;
 b=rIg7I8SieL3yXjr5gj9lwd5AQkw8orp6AjOV2N+PfRrmdR9KiE55iDfRp/lgB237bN
 kUaAPZnUaOB4kkzDUkntD66hydISfwh3EqF1yLBmt5kfP1GSVTd0KZPDHqwsNm/bwbYS
 65sf6WfMBl00aGcMIrXkSUSc6jrCQ56RTjodGat+kmykWTI7cJMVdFQzZSByeLj2Dive
 x35E6uKa0wn1GZ64aNrr7CXEUSyRF5OWla1k4AoQuRlJLJzK7JAKAN/pZ9K7PeseX2xM
 TfIE5oVW0fa+E/oXKDFF6NRQI9PLYtjcr4paHiUSORbo4gUCFmrmBxCGwmgWJyIV/dMp
 SA+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNuAo21709Ecz03J7KYB/izWwhTZm8mYGw782aQAPdUAiperIyMSsxS+TbKriwnbyYH/DPTE0YqZ5ZNsfgjJMn@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyu7ZF1jbEjVvJ/qyl6FkM7rTWP+E64kUNql7Ug9+hDIHeYHQIU
 1VWNlSnMfwf84OGRhjtulTwqkC1I4t3d188qTYwgalIT+38kYkp7
X-Gm-Gg: ASbGnct0J0pLv2e1JcwpZJ2rGl4noCmQ3o+UemFZJvg8nEZlInmBp16+qXjtGrN6ueO
 dyiHSWNb6E0qyrbSHlBdMjGqP88SvU/68MHnvMNhuzwgEHu1nYtBQVvNsaOl3Bb8m5NKxEs8Al+
 CSEI98CP7izl8JpTl6SuTFqLoQaiztThNMi3BjqA9/mdx5yenbShYKLMvfIFO+/2h6wwSZAFJMQ
 Iwhy5DaYW/OHurqg0vs3mPiZHsvAJ9O0AwWhRIij9Y3p3bFXKBQGDUUOfnBw+7eK+0=
X-Google-Smtp-Source: AGHT+IEiGPZ+QN5vuq+SORhI6FYKRQgbA2CV0CQAJWglVxl/XO6DI/ww+TIuLDisbBojF5e0qsusEA==
X-Received: by 2002:a17:90b:2e4a:b0:2ee:ab04:1037 with SMTP id
 98e67ed59e1d1-2f452e36956mr89705391a91.17.1736134635933; 
 Sun, 05 Jan 2025 19:37:15 -0800 (PST)
Received: from zyy.mioffice.cn ([2408:8607:1b00:8:b27b:25ff:fe28:43a8])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ed644846sm38112695a91.28.2025.01.05.19.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 19:37:15 -0800 (PST)
From: zangyangyang <zangyangyang66@gmail.com>
X-Google-Original-From: zangyangyang <zangyangyang1@xiaomi.com>
To: chao@kernel.org
Date: Mon,  6 Jan 2025 11:36:45 +0800
Message-ID: <20250106033645.4043618-1-zangyangyang1@xiaomi.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: zangyangyang1 When f2fs_write_single_data_page fails, 
 f2fs_write_cache_pages will use the last 'submitted' value incorrectly, which
 will cause 'nwritten' and 'wbc->nr_to_write' calculation errors 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [zangyangyang66[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.46 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.46 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.46 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [zangyangyang66[at]gmail.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tUdvi-0004du-Kg
Subject: [f2fs-dev] [PATCH v3] f2fs: fix using wrong 'submitted' value in
 f2fs_write_cache_pages
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
Cc: jaegeuk@kernel.org, zangyangyang1 <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: zangyangyang1 <zangyangyang1@xiaomi.com>

When f2fs_write_single_data_page fails, f2fs_write_cache_pages
will use the last 'submitted' value incorrectly, which will cause
'nwritten' and 'wbc->nr_to_write' calculation errors

Signed-off-by: zangyangyang1 <zangyangyang1@xiaomi.com>
---
v3: No logical changes, just format patch
v2: Initialize "submitted" in f2fs_write_single_data_page()
---
 fs/f2fs/data.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 94f7b084f601..f772fbc7f331 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2816,6 +2816,9 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 
 	trace_f2fs_writepage(folio, DATA);
 
+	if (submitted)
+		*submitted = 0;
+
 	/* we should bypass data pages to proceed the kworker jobs */
 	if (unlikely(f2fs_cp_error(sbi))) {
 		mapping_set_error(folio->mapping, -EIO);
-- 
2.43.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
