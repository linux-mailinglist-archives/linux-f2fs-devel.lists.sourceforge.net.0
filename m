Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 928CF5FEAFF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Oct 2022 10:50:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ojGON-0006WQ-Bg;
	Fri, 14 Oct 2022 08:50:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hrkanabar@gmail.com>) id 1ojGOI-0006Vg-Uw;
 Fri, 14 Oct 2022 08:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uiJoxGZJlGz3xwdy8ebCPccYWzJULAWBypBIpnExuaw=; b=IehNM/mu5d6gxgkmkiXnhJSZjo
 7mft5G97f+n+OTH84NNRhDR3pqP+ZTxoOb3HVHlwc+X1/m1F5QgTIiRFv6XbbK5LjwEN8t6arpO8w
 qJc4QMO/TzPEXrALgVkL/yrxWIo7xB45i+RPYnV6HG0UcVdrPbwG0nDDdKE3XaZ2VfFQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uiJoxGZJlGz3xwdy8ebCPccYWzJULAWBypBIpnExuaw=; b=fHmh3F+VpmS1S0Iz1ga8jlEU4m
 2/bziRNOqoYvadfysf6nbEPoaz/aMqWvYuJrcorlkc65/YImM2aYyL1KPRys5AkCtjJXqN8oKpqnl
 YnD8uTQoQ/zWWmVdTE24hnYvOdNX2iCLgtBlwkVGGwR0NWaceVQ2kK1/vxP+vUaxugOA=;
Received: from mail-wm1-f50.google.com ([209.85.128.50])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ojGOF-003OLq-Db; Fri, 14 Oct 2022 08:49:59 +0000
Received: by mail-wm1-f50.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so4899768wme.5; 
 Fri, 14 Oct 2022 01:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uiJoxGZJlGz3xwdy8ebCPccYWzJULAWBypBIpnExuaw=;
 b=aQXy8rp4jlY1YgDvBq1bWyBZHXn7pusOKrg/5bG7Ec06kepOaaMYlnWN31PAE1PhO0
 TiKU6+usEJZY4E0qpN1rIEdfB92GVvNMKknsSFgjYfgeV3g+pzSFATmKMeE04UQL4scQ
 XjyUVRGfqMnFvZ7+ekfDI2ipLglMQJSCdWubbw9vB3pWX5ZABwG8+g26g3rlQoNdpz27
 C/0CQ6oChQqs+ufVKybV/tfloQQhEVBx2g+7BsjAS96KG2vlZDeo1BThWz9v5Fe5Xwvi
 Sf8I1muhzR3/vs9pECQZgEQhe44GnS7aptOVx0dr6ahIvicPhqcmhnIlZ5BnWfoJOlSa
 FNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uiJoxGZJlGz3xwdy8ebCPccYWzJULAWBypBIpnExuaw=;
 b=f2bPl3rCWsunjeR+42Ok5Pft9Ltc5J1Vez0ulBaMdpU5bWp2auBcaZTXfNzRwxOvSP
 ugsLkJVSHXXFpl3YkAvg1FbxIOyXO7t+zeQ6SY707L+pbo6WHTQ7UGvk0IeB+pm8PB+o
 65avymLELkT/792SsJuXgT7HvAZpnmzZsc8I/9smWC6n+P1AdyUgMKDDG0ZapLhO5iYm
 AOfBNJiK0PlP7YTxIy5XziTNtM4Xd8S/ZBUfAg0m1KVH0O5rDfn/mUKUz2Y37de3in1Y
 ym4jmtYYmdp1Ea+40WpMQRJFp0MWKhUN+XjceEAQv3JqBKiABwb9cgN1d3P/FcGRdLS4
 l32Q==
X-Gm-Message-State: ACrzQf1wUMfbOw/7djuOnc7QQCjUzMolkIwfC6quEwF8xahDE1sfIpOm
 2qAICu0q0V9Sr5WMv97bdUw=
X-Google-Smtp-Source: AMsMyM4FolkT2bmNfdD1h/uAXB6K9stO6Eab/O3lUst48zrWp4fgQUhR7yOOFojOx5Y9yQD+bCbQ2g==
X-Received: by 2002:a05:600c:3c8e:b0:3b4:d224:addf with SMTP id
 bg14-20020a05600c3c8e00b003b4d224addfmr9435669wmb.132.1665737392984; 
 Fri, 14 Oct 2022 01:49:52 -0700 (PDT)
Received: from hrutvik.c.googlers.com.com
 (120.142.205.35.bc.googleusercontent.com. [35.205.142.120])
 by smtp.gmail.com with ESMTPSA id
 123-20020a1c1981000000b003c6c4639ac6sm1547372wmz.34.2022.10.14.01.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:49:52 -0700 (PDT)
From: Hrutvik Kanabar <hrkanabar@gmail.com>
To: Hrutvik Kanabar <hrutvik@google.com>
Date: Fri, 14 Oct 2022 08:48:36 +0000
Message-Id: <20221014084837.1787196-7-hrkanabar@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221014084837.1787196-1-hrkanabar@gmail.com>
References: <20221014084837.1787196-1-hrkanabar@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Hrutvik Kanabar When `DISABLE_FS_CSUM_VERIFICATION`
 is enabled,
 bypass checksum verification in `is_boot_sector_ntfs`. Signed-off-by:
 Hrutvik Kanabar --- fs/ntfs/super.c | 3 ++- 1 file changed, 2 insertions(+),
 1 deletion(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [hrkanabar[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.50 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.50 listed in list.dnswl.org]
X-Headers-End: 1ojGOF-003OLq-Db
Subject: [f2fs-dev] [PATCH RFC 6/7] fs/ntfs: support
 `DISABLE_FS_CSUM_VERIFICATION` config option
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
Cc: "Darrick J . Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, kasan-dev@googlegroups.com,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Marco Elver <elver@google.com>, Josef Bacik <josef@toxicpanda.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Anton Altaparmakov <anton@tuxera.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ntfs-dev@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Aleksandr Nogikh <nogikh@google.com>,
 linux-fsdevel@vger.kernel.org, Sungjong Seo <sj1557.seo@samsung.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Hrutvik Kanabar <hrutvik@google.com>

When `DISABLE_FS_CSUM_VERIFICATION` is enabled, bypass checksum
verification in `is_boot_sector_ntfs`.

Signed-off-by: Hrutvik Kanabar <hrutvik@google.com>
---
 fs/ntfs/super.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 001f4e053c85..428c65ce9a80 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -582,7 +582,8 @@ static bool is_boot_sector_ntfs(const struct super_block *sb,
 
 		for (i = 0, u = (le32*)b; u < (le32*)(&b->checksum); ++u)
 			i += le32_to_cpup(u);
-		if (le32_to_cpu(b->checksum) != i)
+		if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
+		    le32_to_cpu(b->checksum) != i)
 			ntfs_warning(sb, "Invalid boot sector checksum.");
 	}
 	/* Check OEMidentifier is "NTFS    " */
-- 
2.38.0.413.g74048e4d9e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
