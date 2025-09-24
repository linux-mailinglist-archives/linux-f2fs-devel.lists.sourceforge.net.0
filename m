Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D75AEB9B919
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Sep 2025 20:54:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BmHcarYriL7WXw7Teaw4SXmN0yalgjRtUZCHpwncaGY=; b=QkOHav0fXYXvp+Od/nbzj1WYeb
	dCwiHjg/2rvH9IFUBkfzzS3s3wl6kYAHqnU24YY1I/rgDl7qsfFHxQLr4B5DuXFoK2z/duWGvgMO9
	K7QxQjZ3usHSCJMRtdpO1Rlob5ZwnT5MWPrQ2HKjDSmoiun3yzK7Z18c9zZ7wH4/q5y4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1UdU-0006uB-H6;
	Wed, 24 Sep 2025 18:54:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1v1UdT-0006u3-EW
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 18:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IqwAEqTBE6b59DB66pQT/3pm7jIu/QwOKP+AOYUUBYY=; b=NX/hdkRVfGtU87zFlcwN4DFsVQ
 jnhtwujsObLiQgn14lIX19sli9+BOTnuo3UpJzpteY2W1xHrNAkSHax55z06bPfMX1zdlf6QDaJj4
 Rbm8jQ+eLySTWDRG0CJdqO14d/x+ivoKeY/qrdwvVIvy2e6GBTCKR7IQz8utRXwuzG4o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IqwAEqTBE6b59DB66pQT/3pm7jIu/QwOKP+AOYUUBYY=; b=Z
 YlXzqvFexx6Wbx63SigMRBLDn7TL4Xn5S/MZVRI6oMdmbCmkx+rC08kiPd+BLfK5kNaHTFsXRZSVv
 aKojsGhDktnfAvdFW6dfg05WTwZUKx4/LuNpsw/mtYaUqxj1piOU5MWV21gsoB1GyRA3h7uLJFW1w
 nxdTfUFertNQc7qM=;
Received: from mail-pf1-f176.google.com ([209.85.210.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v1UdT-0001ID-56 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 18:54:39 +0000
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-780292fcf62so142602b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Sep 2025 11:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758740068; x=1759344868; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IqwAEqTBE6b59DB66pQT/3pm7jIu/QwOKP+AOYUUBYY=;
 b=S2/heqbGqoMh+oJKx6aUVSYTNtwGecKZJOFku2FVl0Jl5P/5LYv9thoHbbEV82xpVr
 U7d3bsqEucJQ/fwzanMzOMdBBoIQ0pfbM643DhAbpdQmBOVpHPLe2tfVpvB7Tnxn7mDm
 zg1ms+gRf5kF1Gy36Wax1LIJFjoJI89gbOMxwB5baAoR93/7HLs3bEsjA4+QJfpFsbFA
 waHAzmrEm2ekRQ5sp2Na0Ekr2hNIQymABigDAVrELJ8aHSfsH7ngKr3E5IEiP08A5U4i
 RIMmn/DIxGDMdA79jVdoBYQm7MFQ8EVz21U+pd1ADv+rs9HWdiNSLe1cEBJPtUfbqHYB
 XoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758740068; x=1759344868;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IqwAEqTBE6b59DB66pQT/3pm7jIu/QwOKP+AOYUUBYY=;
 b=n5FfBFI/NloJma65xT5Flbpw2AX7PLmcEdQsS/Q3knQ6pdCg89g5V7urCCI/g6WRl1
 NR9LO8CHlkrBzKfHLTRc/Q6iRN8L2bw+kTAZaY//ag4YukjLRZSOP1n3Db5L9XDoxaqN
 7iVGMrr0qFefxTQDzui78zePEs3WoYxcwJXLP0PzMadZAPnP8Va4TyvWLnLurrpWAeMe
 3l2q73sVrYTxXgbTPS6xv/lUUBdDMUf7Nfk30KkpdFiuWU+S7AtMum3aIP+0yKIwk+Q6
 Du7BgIWEsJxTS6msIzBV193foMF4/yg5P1r6DqM4rgcVPNBh7HgESFkAGzhbaN+5x/VG
 UcTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8IvMvzLbBW13wJUeUANjBcqR5GUsJ57VxOGU2mvriwRpNFfMobEp/sxlkTPYrCeV0tdoOcZ9JVMG+uNnErwub@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxYEn/aVZQxYRomocKEg4N3rpUj9M6w4RfdV2zta3OSjHQlR/8z
 JJTGjH6WVa2tr9FxvN/X0G5Qh6XfXPlMNwTYZk3Lh3P3MJgEuRj/37KV
X-Gm-Gg: ASbGncuEv47MaTiYaZ71uK/NbiSKrlXKxDdaIOxxNrewFRvBCyr3mzQB9kINaaQbHof
 hile4N07uXVh9nEqjCTc0bPC+I4RuaAlbAnAzHohrC7HaBhLmqSm3eqUiOPrCD8cPPTnsKWPWfa
 gzMbNEQjAmJTSQpCkI2AFUQRMasl6SS+rfRIy80+sd6IWBFCNFS0wM+wsTpM7Swwja/mUkvGFvY
 ltlYTtUoPs2IDIgM9kXKNy+yBN+guXxa2fXwyYWaSlxLEuCw7q8T99XmKoQNFWSTJsyAh/aNpQV
 5aMx8OJ7jAm/jNw/5E01qLpxLIMsih7W/DUb/OiBqtj/J0+/unNnvf767SWoUBrFOWQgfb5CHbO
 MDRkRjl2ggOgEw3i4p7XGfdR4j20zEVehGjzDBW3GuvQbEblyYrl/CW+zWhgb4CQNMsNFFe10lc
 kbllREM2QwREYD
X-Google-Smtp-Source: AGHT+IHJaGhoiMOlyzHM/t4stINekj+pvdXlDYcZUDwdEs6KGRC3wOyX9c6CPyGL2G2VVee+Ok//Vw==
X-Received: by 2002:a05:6a00:2e18:b0:774:1fd4:1007 with SMTP id
 d2e1a72fcca58-780fcec0a5bmr665250b3a.23.1758740068437; 
 Wed, 24 Sep 2025 11:54:28 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e7c:8:3874:3b2:58c8:9116])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-780763550d2sm2200332b3a.84.2025.09.24.11.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 11:54:28 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed, 24 Sep 2025 11:54:23 -0700
Message-ID: <20250924185423.1305104-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.51.0.536.g15c5d4f767-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong total_valid_blks_available is already a
 multiple of c.blks_per_seg. So,
 we don't need an additional alignment adjustment.
 Signed-off-by: Daeho Jeong --- mkfs/f2fs_format.c | 3 +-- 1 file changed,
 1 insertion(+), 2 deletions(-) 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.176 listed in wl.mailspike.net]
X-Headers-End: 1v1UdT-0001ID-56
Subject: [f2fs-dev] [PATCH] f2fs-tools: remove unnecessary alignment for
 blocks_for_ssa
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

total_valid_blks_available is already a multiple of c.blks_per_seg.
So, we don't need an additional alignment adjustment.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 mkfs/f2fs_format.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index b98976c..55a7505 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -500,8 +500,7 @@ static int f2fs_prepare_super_block(void)
 	if (c.feature & F2FS_FEATURE_RO)
 		blocks_for_ssa = 0;
 	else
-		blocks_for_ssa = total_valid_blks_available /
-				c.blks_per_seg + 1;
+		blocks_for_ssa = total_valid_blks_available / c.blks_per_seg;
 
 	set_sb(segment_count_ssa, SEG_ALIGN(blocks_for_ssa));
 
-- 
2.51.0.536.g15c5d4f767-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
