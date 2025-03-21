Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A159A6C543
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Mar 2025 22:34:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tvk01-0001C9-V3;
	Fri, 21 Mar 2025 21:33:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1tvk01-0001C3-35
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Mar 2025 21:33:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R3gNTEK4SXip0MhTu2oen60AgaT04JTUdvDNuHpiX3I=; b=cHz3+KxxHRkLdazU56gA9U3WlY
 ZdZMd4BI70PwdOdeTRS6Uu4G9RARI1pSaiaWlTqI/z9UAQEw01tQcBgvP3e73xfavLcnOCND+LF8T
 r3rjgW/95pxZvj0dGnDakT4mOmXybsEdNZMyk847f1zXlN7nzykJR6abweBPVBSwTxO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=R3gNTEK4SXip0MhTu2oen60AgaT04JTUdvDNuHpiX3I=; b=G
 TZArtdHKw2g4/sMfjCXjAZUtusVbG1fGZD53FY4Z++XSeB6ZUv2vzF1tWtEbBsSS6nk2O6EvkGwuk
 G3YJBE4cBB5pD6BkDW9jpglM16yd1JH0Wi8C4ovLADMzG5yRXNjc5LJm/jELAilawKy4i7u1plYbL
 cEZY8HzX7h32AvUY=;
Received: from mail-pj1-f54.google.com ([209.85.216.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tvjzv-0005he-VR for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Mar 2025 21:33:53 +0000
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-3018e2d042bso3151536a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Mar 2025 14:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742592817; x=1743197617; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R3gNTEK4SXip0MhTu2oen60AgaT04JTUdvDNuHpiX3I=;
 b=njeeQPpudC1JfZWLIJnOaCRjWvk+xHKysSvB9PPxjAzv+HJgkyb6Kc0HaW9IDJ3L48
 msNAQzewLS+50CidUwUUVoYIrJW4Aia7Bzfw4zzInK9esJZL/T6H+A3/cQAgXZtyB1pV
 mCBLZwFoEK9HfBPzpxFjYJirHme4Kuq9Gp/bnsZITTPaYxH10GvoPs9RESStCxTRmRFt
 FpwLNS/APlURRlGpp/t7QAwQLXS8sKfci1MmuL5DssQrUpabcoMXL4oNhpct2MsMvJDm
 eyQSHjgrUlYtdC3FrsBH2UKnIaSjJVt0Vy3Z87TAWYQWOJ6jKdBrSt2G5jnB8K0LTld6
 knUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742592817; x=1743197617;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R3gNTEK4SXip0MhTu2oen60AgaT04JTUdvDNuHpiX3I=;
 b=xK6tx19zEnBiSAgU4LgEljH6YEc4KTu0WObfnOn6WLSuOgWtG3P19YIZvtkJ5i/QZz
 3ITgobtNTOHwgoXaGhHIe0Ub8lkuOdxQSCg4ikhdR/cOtqv7ePiULiq2WUzpWOtwhj2U
 in/Kv0Gx6Tcik4mNMv5P621d4iecKLPZL895aKt/6rnYZW/lhfRIq9rkHukqgguRnN1O
 1A/FgpnkXr3JhCMm7uYviOE9kVon23luu5lWhWvP22k4lGxih3yB4ZCStIPOrkWN539H
 ScL74G+yrw6msYwlJ0S3UkiFjdRpBsiSCQ/6s4MZnWMXCxG+qZhG5ICEMCK/YICCeHP4
 GOnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcQ8DcjFaQORcCnFka2ebhp8L9/tjBEq5NvsFEZORr20GYziQsM9AqgF/BlLKDxtY4r7rjzpzd1tYNN0/muV2m@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzRBO+//vrLt6DaVpDvnufjsKtpSnjeq/Ga9Drba8BsXHvS5XHf
 Yh3vTz7X1CPQFuM6A6sRXqlgRsF73zSTVcllHOUQL/eroDrPZGXp
X-Gm-Gg: ASbGncte7Lo+2nxFz9H0zq3SKmyiN8dC8nNMPK6BukXx17SjNQJkSb4/gcO0kXsZEcL
 5jAM+y8aXl/Zgme/txpcEuJec592Hj64yluEW1uaa8TzZKfR+arEjCXyS/WRVe1jvYuns97frUE
 LNsoypYy4SVAZkBOYh4tLS/XkiCZv4hZ/3QFxOjCWwusBp6oEUzeMQUe5VOkl0SdbK/s+u6p2Y3
 G7RVIoe3spuOSAenlVHFqU8dI8OsbXMJ2mfAV2Cr4FlVyyvYpFLWStAOT9+V7yTzwbCccAZXQv9
 1Itgs+/6IeyFmCOg0Kc9ae2caQmkspF6fE1CkH/HX+PlHT95nU4UYfJZi3eMLARMi4CEXcHjZhU
 kc2VEeFsJXDupsLEFozh7YuCeFTCQqz6vJ10U
X-Google-Smtp-Source: AGHT+IHL4gLrRnolLn2RuFalo6zdPIhky0QXHmnL8mIVHFnAXzODNWFN6/G1zjWaxk8afCiljbC3WQ==
X-Received: by 2002:a17:90b:5408:b0:2ff:6788:cc67 with SMTP id
 98e67ed59e1d1-3030ff0dfd6mr5993365a91.34.1742592817259; 
 Fri, 21 Mar 2025 14:33:37 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:ebb9:3c53:835a:6046])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22780f3b493sm22629325ad.34.2025.03.21.14.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 14:33:36 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 21 Mar 2025 14:33:28 -0700
Message-ID: <20250321213328.1170234-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong support a file truncation to zero size for
 device aliasing files. Signed-off-by: Daeho Jeong --- v2: make the extent
 length zero --- fs/f2fs/file.c | 7 ++++++- 1 file changed, 6 insertions(+),
 1 deletion(-) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.54 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.54 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.216.54 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.54 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tvjzv-0005he-VR
Subject: [f2fs-dev] [PATCH v2] f2fs: support zero sized file truncate for
 device aliasing files
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

support a file truncation to zero size for device aliasing files.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2: make the extent length zero
---
 fs/f2fs/file.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f92a9fba9991..69952f208086 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -775,6 +775,11 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 		f2fs_update_time(sbi, REQ_TIME);
 
 		f2fs_put_page(ipage, 1);
+
+		write_lock(&et->lock);
+		et->largest.len = 0;
+		write_unlock(&et->lock);
+
 		goto out;
 	}
 
@@ -1036,7 +1041,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 
 	if ((attr->ia_valid & ATTR_SIZE)) {
 		if (!f2fs_is_compress_backend_ready(inode) ||
-				IS_DEVICE_ALIASING(inode))
+				(IS_DEVICE_ALIASING(inode) && attr->ia_size))
 			return -EOPNOTSUPP;
 		if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED) &&
 			!IS_ALIGNED(attr->ia_size,
-- 
2.49.0.395.g12beb8f557-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
