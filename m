Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7346C455BF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Nov 2025 09:22:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kbfWwT5kwu2y8GCErb+EZo2qTsk5fYGa40Wy7IMVjY=; b=BUUJx9xF38XoopsKspmybulZYM
	WZB6rgM1oUEGzirI73jxQul+POVhswuyokTQX6IgW2a7scUBqDGe98gPdZDrJ1HiPAZORHEtF1MqI
	sx12ALHe1jOJ6YbAfJbCahI/BffL5CETVwtU+Av6GocO1NkG+orv36+VA4kP++HW1wNk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vINAh-0004Mr-Vi;
	Mon, 10 Nov 2025 08:22:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vINAg-0004Mk-Gn
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 08:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BNYaiNshCudm1f6Y5X+arfRdIqrNvZ4wOD5o4kMjNNM=; b=SrMm2o/9U+XHGrJwzeLXRNIi+U
 Bl7q5xJjFcwIxaIk+Rfjal2/zvD/Bn03TZSwmc+fXdjyNrq2Y+2RFDzjapDLZevcpvLhvPpzLQhhl
 sQPArQqNsC84FQsS6bWl46aVzFbYV8fbpKly231Q22apJq/rWkQ536d0CPat9ccgixw0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BNYaiNshCudm1f6Y5X+arfRdIqrNvZ4wOD5o4kMjNNM=; b=Yvcw22rfXv14MG6IB8gnxbpupM
 RAjH4QycoowNsUcLbIopssmCNDtROdZ1nVSM91E3fuX6k/OnqscnbgjBf+N4WHpPb4+JFZ6Nbmnmv
 4dpl2i7vvdjkZCMef2w/eH5lJ0tc9KmSp9O1NonzJqGiwh2/gYyNBk8kO35m5DmK8j8c=;
Received: from mail-pg1-f170.google.com ([209.85.215.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vINAg-0007Z7-4O for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 08:22:42 +0000
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b55517e74e3so2343485a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Nov 2025 00:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762762956; x=1763367756; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BNYaiNshCudm1f6Y5X+arfRdIqrNvZ4wOD5o4kMjNNM=;
 b=l4DcfuvtSVAODMgdc3l6eQjEETwcH9Bf2ZJ9LthsccMrfImS9Hksr/9xRWjrTvg0+N
 SLfsY2vJKNrKYNDRaqayFOjn1GHims4TSTQ1W0IWKOIHtsPaMUabUCzYu30fkwGoG6PH
 7/5/XJF7ZRULYNwGn6Zcq54Opodmu6aLMNBPotDSeWEwhbsTM4tQSjoEfpmt3F30i3nk
 1EJS3KefqazL7i6lhYX29BHZAEhqinPGWUs3Dqn4U+UFg9uskqbLN0bCpSYz04LZKeIx
 r8o3jp/YbN4nKeQ0mSCNuFv6lJJI8Ydqg49ILrWVBkzfSmgXPf0hVAq6S0CgNYhjR2Js
 bsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762762956; x=1763367756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BNYaiNshCudm1f6Y5X+arfRdIqrNvZ4wOD5o4kMjNNM=;
 b=qF0f8M6janGOidyGBunJsyGPqrS0VAXi4qZk3DcfhZNgjGjLaoERjOw87mjWTnNvl/
 8hD0R4YtcOKkqGf54VcFl+jA91+VgJao0kkNYwDZfVT0dXJ+LOZo3ooWEX98337hhcv8
 5DzxY4kVFrPw0xsm41EP5Ve/91rodieNoh7NLrOBLTZoSXuZFOriBMjemXYG9LsaQL18
 f+sqLQPpDFufyIxNX+xy6MacW7zlruJV+9wu26yoyN0Ue7QS1uU/91NRcdQO06is6g1S
 KoA3OtFnDhd0tBMLTPLpLKuYbcfe+fKGMmLUXjqkg7S9kf6BRD9eHZtI9ilrRQ91gRau
 BRZA==
X-Gm-Message-State: AOJu0Yxx2vQ08A+8Vygn3nJ6h4vN8Z6owTSEiWYS1hjaTX1Vg9kmlps3
 4ot6Mp2ODdPd/aGKmC8rftabiSpWTt4TU8zeCB7oBGkcm9S1iinFz67Fctal0jgx5ag=
X-Gm-Gg: ASbGncsS1v2eEN6OxW/pWMsnEfykNTX/xEvXPivTwdrb2SzUgElv4xeq/yEGR56e1Fc
 z1l/qah9uE96koh6ElR3ckissO9VqlZwURugvOdCzwjqCj800riaQQA5/R3B7BnjFu20FMz4c/u
 0eVoN7sse5JLvI7MTz9n86P0w5JA3BKAAN4BFe+r09RC99UDtcx+FILoqWExTfek9wnwQsrZIpJ
 d73idIUbm52mRIU1SWKZKRcB4HxH9xCGP5ci+4xESJJ55iCBz0cksv/bctWsUKiBs9dcVYghFOn
 ybl9KWZfA8vqsii4br/yJbSTN+sBjt6DOWSO9CKaXrho9uyLibGMmgoUZ8II6i+OgeQH2gettTI
 nzQSoFCz0bIn6X19uUKdA2wTaIm6DaoJfpZMo6HSSEgO1xccIxhaswGALRKWsgwo87k2LuQgGTU
 JC0mBqLOWGac+x7dizRvralJ69NiNrWNxSGk8tRTj9J5vIJpO1MkzdOwVTt4Lmgg==
X-Google-Smtp-Source: AGHT+IE+XtkPbqv1K5X0PFvhNyK5mktF98gkxoj5IfQW1wZ5v1v53wcPiu6RgiXH1davnKlJCr6Ozg==
X-Received: by 2002:a05:6a20:3d84:b0:32b:721e:ced1 with SMTP id
 adf61e73a8af0-353a3562582mr11730010637.36.1762762956386; 
 Mon, 10 Nov 2025 00:22:36 -0800 (PST)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ba8f0d16483sm11590059a12.0.2025.11.10.00.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 00:22:36 -0800 (PST)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon, 10 Nov 2025 16:22:22 +0800
Message-ID: <20251110082223.902207-2-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110082223.902207-1-yangyongpeng.storage@gmail.com>
References: <20251110082223.902207-1-yangyongpeng.storage@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Yongpeng Yang This patch adds a sysfs entry showing
 the max zones that F2FS can write concurrently. Signed-off-by: Yongpeng Yang
 --- Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++ fs/f2fs/sysfs.c |
 2 ++ 2 files changed, 8 insertions(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.215.170 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.170 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vINAg-0007Z7-4O
Subject: [f2fs-dev] [PATCH v2 2/3] f2fs: add a sysfs entry to show max open
 zones
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

This patch adds a sysfs entry showing the max zones that F2FS can write
concurrently.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++
 fs/f2fs/sysfs.c                         | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index b590809869ca..770470e0598b 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -643,6 +643,12 @@ Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
 Description:	Shows the number of unusable blocks in a section which was defined by
 		the zone capacity reported by underlying zoned device.
 
+What:		/sys/fs/f2fs/<disk>/max_open_zones
+Date:		November 2025
+Contact:	"Yongpeng Yang" <yangyongpeng@xiaomi.com>
+Description:	Shows the max number of zones that F2FS can write concurrently when a zoned
+		device is mounted.
+
 What:		/sys/fs/f2fs/<disk>/current_atomic_write
 Date:		July 2022
 Contact:	"Daeho Jeong" <daehojeong@google.com>
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 6d2a4fba68a2..1072cfdaeb69 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1210,6 +1210,7 @@ F2FS_SBI_GENERAL_RW_ATTR(last_age_weight);
 F2FS_SBI_GENERAL_RW_ATTR(max_read_extent_count);
 #ifdef CONFIG_BLK_DEV_ZONED
 F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
+F2FS_SBI_GENERAL_RO_ATTR(max_open_zones);
 F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
 #endif
 F2FS_SBI_GENERAL_RW_ATTR(carve_out);
@@ -1384,6 +1385,7 @@ static struct attribute *f2fs_attrs[] = {
 #endif
 #ifdef CONFIG_BLK_DEV_ZONED
 	ATTR_LIST(unusable_blocks_per_sec),
+	ATTR_LIST(max_open_zones),
 	ATTR_LIST(blkzone_alloc_policy),
 #endif
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
