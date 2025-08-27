Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F79B37A38
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Aug 2025 08:15:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+eXFdl6twaqi/tw2VYSxlCtVOe73+Ifpc6WZEOh5qUw=; b=gpKALz06Sxm2iHvrl+GFvTjAP/
	PHWKhdy0gALSnJ5wsHtXiaBOog7F8Pl09A4wChPqY9uXeyUdjSHM83uMPuZJ7+X3tTWuettHXOD5u
	b2ZKIoZA2t7gYh2BF3zPKg1KNNOnLKnhH86qUgCPe+nfsqSDBubH1+0rB5fky69MJS80=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ur9RR-0003bF-7k;
	Wed, 27 Aug 2025 06:15:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang66@gmail.com>) id 1ur9RO-0003b8-TP
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Aug 2025 06:15:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ckxtE7yYr+Z660QKMcXyAJfcG7t7ao2D2GxPAq6N4Cc=; b=hyZf1Q23NqUS6vEXCJ6ADtFtUq
 vYtASGp8bRmM0rM3Wm31r8qxhYp7T/LHyYLbYgqtyXiaryJTxPyttol4j9rj/4nQT+omt4GGaW6bM
 CongX784wjggFSLgC7kl0MwApM82pVFWAfq+5sNcZAlPVs9BV9+d8mVQlvTC+4qOyb1Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ckxtE7yYr+Z660QKMcXyAJfcG7t7ao2D2GxPAq6N4Cc=; b=W
 zzaR5CmT8F+C50D77bRMMDz6M1cUUj/9rfCkMx551tRO657zZ4hgMGFYKxBwmyp7g/nzsXpAwKskf
 2686+lU2LDEKt+c3GRAGlLGjfBEVvLKS4qqd0R2vSyEwPqKK/E9xXCG6no02tYkaoidgyz3eze1yv
 Zpa8vTpgovnSCyDo=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ur9RO-0004ww-IZ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Aug 2025 06:15:26 +0000
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-24646202152so50397375ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 Aug 2025 23:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756275316; x=1756880116; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ckxtE7yYr+Z660QKMcXyAJfcG7t7ao2D2GxPAq6N4Cc=;
 b=btbHXvJqstvPKM8BDwJw/JB9RP7d6rMg3JCFPsBIGTqNFgZAN/bLw12upruWcuT61B
 7lL62XY2MP2591J6UEADS/9jQSHF7O1qR4kCoheZQmZ/bxqdJLT71cqDDc1g8+Vq16L7
 FZ+x9iOkse3e/mWQk1CNsxWdkyH41ZqdeS7LwwQp/l1yqctuN3eLd4dekhxR5/rPKPpp
 QpUqw6/EDBYjJUPe3h9WG6msciKTnrZ98rYWoPUnVvn/9xhYDxl8eqs68FGzmIz062/O
 g+ZWU8D6M50sZhSa0PB9LBzKG+wX8/OZ74HTLkHSd3To+BR0Om2UQS/niYwpPzsk+rms
 neOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756275316; x=1756880116;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ckxtE7yYr+Z660QKMcXyAJfcG7t7ao2D2GxPAq6N4Cc=;
 b=TlOYyH5pPRN8XOIvNGq/+TMvNH56K8+sfTONYzsg1zjQuI/cB9ftdKLMbJBHEcJf08
 FkPCowbdtJerPEONNHbiSaXfmtEq1x3oyBkuLuE3KrMyeLp1wFNk92YVzlb9eo7ZsUYi
 2LuUhmlnsnKPEIumVOepdJTTfJBhT5p1iBjiojuetkKHmzmwGXpEHXbqv33mNPaKFmin
 9LSdLohTie3Kwm8iRhVL/CFrRPuTqyHYY48YSmssAOxWRK9bxAotIO5f7QJ7NB00n2/7
 SZe9UYVkOo+9geNlnnq3fXiqIXw1D8sW26hsP5Ef4fwg/NbC9wRwNjN1FrtRiLYZzjKV
 iKgQ==
X-Gm-Message-State: AOJu0YwA9zlFUxs0tI8sZYHYKt+6EQm3pH9a8m3FRsi2qUXVuSwb/B1P
 1steKGQL60Vn9MiSRfqL4BcY8a1nb3zxg/uofeXtpCY6IaBoq07dIGPK
X-Gm-Gg: ASbGncs9LB67ubFMdizHZUokvu8IHXTLkECBTf8+KYjgmcEPupyifY70VEAhq53ERIv
 ft1wq3GhqI5OPlWMMxvgsLiSxuJCYiFky+XrSQ6v9z4MyIRbprufMVRwhi6kRWyUuq6QxLUKdgm
 5t5b4M7p9M06XuAQauR0CbPxYNb54Enbj3cP1Hlp+DIcv5dEuGrmbdcti2zLCcwOVQQ0gmvqow6
 JxJP9EybZ5zfHMTPL6s12GQls1A7czfgB+TKuckXCSKM2ypxMcUnvFntTWXK2MUTxXVYN7p1i/N
 WmLjm7yEVPM/A1OZbmGKJNTYjPA5pUJD+P/6AciBTOAgD412jNy+hQYSnH+7WLzjUpVGebEhA+4
 C+83tql2eRQGWLvKLtSOYMsUrCr7yjbU6dw==
X-Google-Smtp-Source: AGHT+IFyr70cK78o5VZiQFCXVmmz/HXRzLfJa9oC05UegE0fBgY0IoNo98xV7Ab9eugXqwfMoBDyvg==
X-Received: by 2002:a17:902:d2c7:b0:248:9429:3641 with SMTP id
 d9443c01a7336-24894293aa4mr26333765ad.48.1756275315809; 
 Tue, 26 Aug 2025 23:15:15 -0700 (PDT)
Received: from zyy.mioffice.cn ([43.224.245.240])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24882c84b6esm22443315ad.6.2025.08.26.23.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 23:15:15 -0700 (PDT)
From: Yangyang Zang <zangyangyang66@gmail.com>
X-Google-Original-From: Yangyang Zang <zangyangyang1@xiaomi.com>
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Wed, 27 Aug 2025 14:15:07 +0800
Message-ID: <20250827061507.1340092-1-zangyangyang1@xiaomi.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Yangyang Zang --- fsck/resize.c | 12
 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-) diff --git a/fsck/resize.c
 b/fsck/resize.c index 58914ec..bef05d6 100644 --- a/fsck/resize.c +++
 b/fsck/resize.c
 @@ -753, 19 +753, 21 @@ static int f2fs_resize_shrink(struct f2fs_sb_info *sbi)
 int f2fs_ [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.214.182 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zangyangyang66(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [zangyangyang66(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ur9RO-0004ww-IZ
Subject: [f2fs-dev] [PATCH] resize.f2fs: print resize size
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
Cc: Yangyang Zang <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>
---
 fsck/resize.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/fsck/resize.c b/fsck/resize.c
index 58914ec..bef05d6 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -753,19 +753,21 @@ static int f2fs_resize_shrink(struct f2fs_sb_info *sbi)
 int f2fs_resize(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
+	uint64_t target_blocks = c.target_sectors * c.sector_size >> get_sb(log_blocksize);
+
+	MSG(0, "Info: reszie wanted target FS sectors = %"PRIu64" (%"PRIu64" MB)\n" ,
+			target_blocks << sbi->log_sectors_per_block,
+			target_blocks >> (20 - get_sb(log_blocksize)));
 
 	/* may different sector size */
-	if ((c.target_sectors * c.sector_size >>
-			get_sb(log_blocksize)) < get_sb(block_count)) {
+	if (target_blocks < get_sb(block_count)) {
 		if (!c.safe_resize) {
 			ASSERT_MSG("Nothing to resize, now only supports resizing with safe resize flag\n");
 			return -1;
 		} else {
 			return f2fs_resize_shrink(sbi);
 		}
-	} else if (((c.target_sectors * c.sector_size >>
-			get_sb(log_blocksize)) > get_sb(block_count)) ||
-			c.ignore_error) {
+	} else if ((target_blocks > get_sb(block_count)) || c.ignore_error) {
 		if (c.safe_resize) {
 			ASSERT_MSG("Expanding resize doesn't support safe resize flag");
 			return -1;
-- 
2.43.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
