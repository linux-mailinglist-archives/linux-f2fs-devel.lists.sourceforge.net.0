Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87868AD083F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Jun 2025 20:49:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VuauEyhJQIra7ZaBf2zmI7jHJJ2Oo+l8e8dKgCbSubI=; b=FAL4kVnjYhSqp6DZeF9j66AVUl
	IpCTxqw7WOdwgbxRgZOKME/wGrwYOYN8fiioX+EuAQabymNhGwBiRrRKqpCMmms5VmCJR0qiQk135
	6RAUymGQkyN/Dv3UHu7VRnnTBOGGUIQu+jp1vcqvnYWy6rndmzz8bzy7HQxhdrFLQ/vg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uNc84-0005pp-ES;
	Fri, 06 Jun 2025 18:49:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1uNc83-0005pj-73
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jun 2025 18:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VVl18CkOJ15003GjsMWz0RG+tHCTImFD4CbpZhIBGrg=; b=CGC7+xdaLD5s0nRTfAe4QCt+O3
 g5TkbRLnV5Ba3NvYuo9wLKSohNkfiwjJPydcj3zxC74MH95aBPDmekr5Y4LfDmZ8d0EYaFrEz//Ta
 OHNFEoS7PHyGnJAReuQOCUlHEsBHZERDYiXQoLgocg+asx1EkLJ8vOyvHnVu1iyc4W2M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VVl18CkOJ15003GjsMWz0RG+tHCTImFD4CbpZhIBGrg=; b=F
 9gH6KH49gca2BDofValUjGUTE15CRLsnTXftW5FYyHd1BPcAoPSjqou1m64eENpUPPsqCViIY9iGM
 xmc+7cTHJMHhfh5yg0lZLWWfC5gsNbmb9r1P/5AluCgLQs5r6LchIoioNsfMQl4zxxUhKYLMJZAjs
 iSk1qca2iMgz+AsQ=;
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uNc82-0002cl-SZ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jun 2025 18:49:23 +0000
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-235f9ea8d08so17505295ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 06 Jun 2025 11:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749235752; x=1749840552; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VVl18CkOJ15003GjsMWz0RG+tHCTImFD4CbpZhIBGrg=;
 b=boSHqErew7S8j8CG8sfc5JrVWP/sGxn2T6ZI/k7DsLU39MFQ3v3Mkh6jCvY34N/d0B
 PMshP1ECjbYRkoVKpEP5BAEpmRRiuIJxl1vqgbUwysGz8DmT0KWwuU9oHfcMWtIfMIaI
 kiQdA8W4u/6pR5lZveTVXeNuWOI6/S9tNczVPE1+Rp+PIrotr/h18fehIPebXKPV95ZW
 BSqGL2wzgE2ad+Q1NMxJV8n91FmaiRHpvu7kTytxVx27kFR8GygoaLcmQy4R2aLJS6h9
 yZbGXUUHDeg3KB/Vcn3ML4CU24W/bCP6neLrDwdjm/8zD+cQxyD896cnAbv7jRtpa3/C
 rDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749235752; x=1749840552;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VVl18CkOJ15003GjsMWz0RG+tHCTImFD4CbpZhIBGrg=;
 b=SYbbWc2o+nGaTkI/ndT6+kwIiuuYgJOdtd/T4vhzx+OMcO8rmaHjBhR94WdVJY53Ir
 BFXNaDqTrR5noc5WtiH1qiBdVceAY0b/zKnq3SWliYnlehRl1Xy/cHISaaYaaXAghbpp
 KYExUJVgv4q43MFpZoWumRLVxGyB3vgmLSPBU3khx+RVwvPvhWtOs+427pISbsswy+H8
 ltw36MABwV66JHnZR5fPbXadxKfDlftWVGK1oKYAvQYKaroFzu2GDVYr6mW2PUvmJnSV
 upF7PDbC/KydkpocaolS69RNh6IaAxuY0F2pfiNwb9v0bJXnP9IGG0tnODBXyRlPa1w2
 ZqvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4mgksadNN1V5eAobHozWNWkYQ/KBgvczMDwYeOZmhCic+pg/NTuanYiKgCL/gx4Tkt7ezWTzm4pVfpnMSjWOC@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwBe6H8l5GACENCvNM534MiBBq8ANRabXh2DHyFHmrJwGIjoImJ
 FIOQRxs1F2ktEqR2kTa+DU9bt5m/qe3rLarOg9JnMxNbS12AAjUPWnrF
X-Gm-Gg: ASbGncsd9BpI/suiR/i5tNLEMNOdEAPzRUmZJ7c/BfMKVHa3Z0ptRUEGDZM5UWo2Gop
 Aquo97G0bLY3/Zg6qKo2rvDWbRAVhNBQBnOEKOiqjVZsRGCxC8UpjyPno+QDGUl79tGwFQwwLOJ
 HMoYK9cMTu9Q9/mOj3IRYUiFXXkQCJnHZR2L5bS3DQzL+VGFGMhAmRLqbIZreUXUPwia7GR5bZz
 FUyQRp7zBoPsE91msrAOgDcjefIWC43kSjK46fZu4kAG9Uw1UlwscMMwXgOSXKWaLRjAeHfJ23l
 y8+n/YmD4FeoahLT3dTB/Rq4tsZkUs8SG6XlHCdw5sP+IH2g2TGt5sNtFL9ZNd1Xg6j5z1ta+78
 akIykuy/2KtB7OOxym0t5u8YxsnB8G33io3fiZ/G+Kw==
X-Google-Smtp-Source: AGHT+IG118EXQa+ckUV2izSwGgtCI5B5Q2LLS0l1xjh5vEqVA/gR2EMnnsTOfduFFZxs+B8gErHwzQ==
X-Received: by 2002:a17:903:3c63:b0:234:d2fb:2d28 with SMTP id
 d9443c01a7336-23601e21c05mr63997405ad.2.1749235751894; 
 Fri, 06 Jun 2025 11:49:11 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:d02c:e22:e5a4:2f84])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603078d7bsm15542505ad.2.2025.06.06.11.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 11:49:11 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri,  6 Jun 2025 11:49:04 -0700
Message-ID: <20250606184904.224811-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong one_time mode is only for background GC.
 So, we need to set it back to false when foreground GC is enforced. Fixes:
 9748c2ddea4a ("f2fs: do FG_GC when GC boosting is required for zoned devices")
 Signed-off-by: Daeho Jeong Reviewed-by: Chao Yu --- v2: move the position
 of Fixes. --- fs/f2fs/gc.c | 1 + 1 f [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.177 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uNc82-0002cl-SZ
Subject: [f2fs-dev] [PATCH v2] f2fs: turn off one_time when forcibly set to
 foreground GC
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

one_time mode is only for background GC. So, we need to set it back to
false when foreground GC is enforced.

Fixes: 9748c2ddea4a ("f2fs: do FG_GC when GC boosting is required for zoned devices")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
v2: move the position of Fixes.
---
 fs/f2fs/gc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 2b8f9239bede..f752dec71e45 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1893,6 +1893,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 	/* Let's run FG_GC, if we don't have enough space. */
 	if (has_not_enough_free_secs(sbi, 0, 0)) {
 		gc_type = FG_GC;
+		gc_control->one_time = false;
 
 		/*
 		 * For example, if there are many prefree_segments below given
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
