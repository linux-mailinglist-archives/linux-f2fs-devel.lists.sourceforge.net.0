Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D4C7EFD26
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 18 Nov 2023 03:31:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r4B70-0003up-Jp;
	Sat, 18 Nov 2023 02:31:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3axtYZQYKADQTheiUdWeeWbU.Sec@flex--drosen.bounces.google.com>)
 id 1r4B6z-0003uf-0b for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 18 Nov 2023 02:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tr34ob542s4ed/d1TuUjgEiMRik6RfIXC+Oz8Qv370A=; b=icC7i0ldX1jLtz5dnFszMEXVS6
 STuJp0QCDP4iFMK6aNKn4xsH/mlPsJpgYnZwbWMH3BD0wbIJWm1bIxOCqoliIulpJG+4NLFIoRmNM
 qaLv7i2cfc78o5u1lovuP+kOFHWxa65WZrdXCTZy5ub575BY90Xyez84dHNNvCnRFjBk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tr34ob542s4ed/d1TuUjgEiMRik6RfIXC+Oz8Qv370A=; b=Jie5vCuQpCCkAu48meqs+fYZ2h
 Ty99vsSAa6xgq7uOkS0YLIxUFHU7eT8waDJjmboDAYCk/TIyRR77reMbGZy+M+o5npPYNj84xX/iy
 LXMcwPfCMI8BGbtk7uk42kxYFyTn+4oQDc7XTtktAF7QlOc/5i6lhx3OmIKS3OkUKCpY=;
Received: from mail-pf1-f201.google.com ([209.85.210.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r4B6x-0007m1-1V for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 18 Nov 2023 02:31:07 +0000
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-6b496e1e53bso3879664b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Nov 2023 18:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1700274661; x=1700879461;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=tr34ob542s4ed/d1TuUjgEiMRik6RfIXC+Oz8Qv370A=;
 b=alXH5OJRvM8GJZY/sZ/mddpFO4WeBsCk2Hy9Bz0xwNd87Pnm6bp+x3j7I6MICyaR7l
 YcxixWPcjMLeqtcbSUsxbSNiIGiszqYdly0D5KimZb4/fHpabf8v+lV4Nzm7uKPGoxkn
 Z25ZX0G55M0Pj9fqZR7HQDVXJvYxrn79Jr5fwbSmsnH1YM4K59F4Rf3ZGYj/Xr24qYDD
 k1dJVMO189tYdlJZhqtLUdmw9tGn37mrRtYEvf3bOAD0tnn0FJKRVm8NxYYmEyNONE48
 YtJ4WwkDScupAj74E5Ec6eI8MbIg0gmZXlt0jJviSdkHaEYv3tP9XkGgl2FlShgaOHU5
 CzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700274661; x=1700879461;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tr34ob542s4ed/d1TuUjgEiMRik6RfIXC+Oz8Qv370A=;
 b=tbV06e567cjLXSfkEOnGU8UTAEJlQtNsOZdhlcqEauMttzMvKLwktbBpS5Zc0rz/bW
 E56Mgcpwe9JB2bDHL/Qf8o7lVtSuo1xm0TkFOTPBAFOIxxxGTjhE0d6yEEa9+laHrUno
 yUfxCxTfnyxF/jpgV1lsKax1kkwfewGqvqgBFl2YhfyYZD88LC44A64Aq3fC4TFqjtw3
 C2Vej2+w5ImHIV6760bT/cS10n4InM3cHXy4fnChpO99EwJhS6mA6dRQRWNKyG8WxaTF
 Zv7wWOStxUMgHD00NtDU4Ws0nz+j4NPZInqU1F86WfLtjPhIcMRw1PgL3eK172+nGQi7
 o92g==
X-Gm-Message-State: AOJu0Yw5HvID961N87wB7Al0L59JZALllsDEnbSwBoRI+vaGIWyY1UVs
 PqhoIlvvRX8mfwfEt39puuOvgkbM8bq5x75n24biuYmL5C/RSNRMc+e33zG06FW2VIX1RQql34B
 EsDelcJqxptZ3dUMsAItAODWTONqIRSG/614ko0cQcgwSf3OAXXcY+i2Ru3M5jYOWcvQBm62duU
 GOI8TAN5w=
X-Google-Smtp-Source: AGHT+IGeRlkEDxOMDz6U3QRL6zq+ukqgmMLNJT1u1+XH7x5gYLPrHwYuOJja6P3tPXlb5mO2FUrQjmQgYiY=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:5334:1f35:bdef:529b])
 (user=drosen job=sendgmr) by 2002:a25:348b:0:b0:da0:567d:f819 with SMTP id
 b133-20020a25348b000000b00da0567df819mr24825yba.10.1700273003544; Fri, 17 Nov
 2023 18:03:23 -0800 (PST)
Date: Fri, 17 Nov 2023 18:03:08 -0800
In-Reply-To: <20231118020309.1894531-1-drosen@google.com>
Mime-Version: 1.0
References: <20231118020309.1894531-1-drosen@google.com>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
Message-ID: <20231118020309.1894531-3-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The cache is initialized during the first read, however, it
 requires the block size to establish its buffer. This disables the cache
 until the block size is known. Signed-off-by: Daniel Rosenberg
 <drosen@google.com>
 --- fsck/mount.c | 5 +++++ 1 file changed, 5 insertions(+) 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.201 listed in wl.mailspike.net]
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.201 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1r4B6x-0007m1-1V
Subject: [f2fs-dev] [PATCH 2/3] f2fs-tools: Wait for Block Size to
 initialize Cache
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The cache is initialized during the first read, however, it requires the
block size to establish its buffer. This disables the cache until the
block size is known.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fsck/mount.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index 72516f4..658e601 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3860,8 +3860,12 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_checkpoint *cp = NULL;
 	struct f2fs_super_block *sb = NULL;
+	int num_cache_entry = c.cache_config.num_cache_entry;
 	int ret;
 
+	/* Must not initiate cache until block size is known */
+	c.cache_config.num_cache_entry = 0;
+
 	sbi->active_logs = NR_CURSEG_TYPE;
 	ret = validate_super_block(sbi, SB0_ADDR);
 	if (ret) {
@@ -3881,6 +3885,7 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
 		}
 	}
 	sb = F2FS_RAW_SUPER(sbi);
+	c.cache_config.num_cache_entry = num_cache_entry;
 
 	ret = check_sector_size(sb);
 	if (ret)
-- 
2.43.0.rc0.421.g78406f8d94-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
