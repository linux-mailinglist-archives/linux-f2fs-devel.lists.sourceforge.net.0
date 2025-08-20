Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18578B2D306
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Aug 2025 06:34:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GgnFcg2aAPAgRILOt30JqG2BDFjTzKdDF1hOTBivLg0=; b=MziasuMe+6jYPkOe04PJ2xjrl4
	ey441CYT8xvKDA/7Ck6aOAzQBaQyRShqSSG2Jvm6Rt5eOwMfpgvV1BEsgVbVxlGeo5hQWZebSjhiP
	0ipBIIfCMV+y3Gy88FdDF+54hbtQOH2QTebOTqexe8+pjWik5LYSFJJffJJcXUHuGBsU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoaXD-0006j3-Tc;
	Wed, 20 Aug 2025 04:34:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bagasdotme@gmail.com>) id 1uoaXB-0006iw-To
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 04:34:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H5YIgPDQYLfJdyuoeZ22MoAWvyaC+TIoYM7ZDNNZCDs=; b=VWKMuzqBF0iiWHkBOyzPkVe+ZB
 gbfahZLodOVjOMxYXxP+OIZfGeAUXczcC0ExrrL53HaMldwCSRrBGqc3t72ctEm8Hh4T8ZCOOFGaw
 /l7Th70KBCv52hkzTtRAueaecCxEzMYgcpSwLtMCMVCQEXuFggGSPueF1Q9TzjJfDYmo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H5YIgPDQYLfJdyuoeZ22MoAWvyaC+TIoYM7ZDNNZCDs=; b=PsU1TmqtNr9bGWaYhTLo6DrSHK
 UPrgePffXoixqhWiG27q97xRCJeP14te2S6u7iPNpmD63LsvcUpS0b4C5/PWuPj9N3ORnqf1JghjJ
 fLtOKnb3AbUE/nvMr8lPjeCDdLNyjBjmJFHMvsS7qBYxDiAXWskNMmxxja24V9ZY/BDE=;
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uoaXB-0006Vz-JF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 04:34:49 +0000
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-76e1ff326bbso422386b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Aug 2025 21:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755664479; x=1756269279; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H5YIgPDQYLfJdyuoeZ22MoAWvyaC+TIoYM7ZDNNZCDs=;
 b=ezqfiPebcAyDqcN5U1x3MOsJVStl/G+AMrqOImVRX3pd2jSduvx2/8OHR80+R0EfZ2
 uVBaJecWlfotFID1LoHq0o9aYm4AZSms6sK4uNMHbOEjJKg4YryaOAtLS9uP4amax235
 WT1K004xgT2fcElbKOP4+fI5lCSlMTCfQJ61DTASd0ig7qSvbYswII0NTRhant2hlDRZ
 lKqv5uqJa4rMwQMAgHNqOBjGUne+maFP48fLz9B/N6nWsKdS0xfYVCnvSDPjWB8UCZz5
 cpeOA6MtPMEoDzZaLvhaHs5oJIeGCfEHS9e6PFcgjp+6OomYP2mzFxBryWR3+YxauMa2
 kCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755664479; x=1756269279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H5YIgPDQYLfJdyuoeZ22MoAWvyaC+TIoYM7ZDNNZCDs=;
 b=hRmp0bFP953VG3LCZxnj8yM87a44uceX8EJPGNR/UIL/LMaqv5NqxBItLxboq8H7n1
 iqTVRsF9U3+Iyz0+YvZzvxmc3GNEmNaPZMMjYTnAEQys+A+LOcFu9eHk3VDWGUoEoDDc
 Ztg9dsQODl6OcQ1NMoSL3sVA5VzbY4iHIST9t4Ry8/dRHky6Dod5PLYntnBizfeD2G9e
 cjBuFBMH2UkQPsGO3dwehOtonSdV66w4EpS0YkT2i2TgTS/xdoBn9848ptz1NwxQ9Kae
 JVClrax4LnjEHqWwHH1s+lOrst34blv6vM8zTcwoerM+238lRHSKp7x//sI3Ri3ZxRQh
 LXAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv60BysQS/ZcNsFv2MeYxN/7q1/GyFyZKEPOH9B+6Jfk7mDwtUONEoInp8JUYVhNTv4s3r8cuoHli7IMtR0xS/@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz3bOcG43+r7F4szAIBd4ogwKOJuBelPV3kONHINjpcH9TFfzr9
 PgRuCExCmm7ORjOaGqYzWUCCd7VbhPKFjLxARtzZh5aUFLWrOF2s9UjG88jPhL3X
X-Gm-Gg: ASbGncvKK2fb1MPZJFKY/5RqZn9zr1U4FZB2tfUzWNmvmoWlUC023kekcm5c+htt672
 2Cqtuv4lvRshMkE01WcwszMZZHK4JN4lUmppliUZ3YhDs+wyvBsM5//koHHL5Ilcu5UxBj5eVQP
 +ew0bu9mCJ92tUrgIZlLTOeCFlAOukwUmyIk/KEeVuLrwmf3Ii9muaaXctn4r5j9O1wKiChLf8Q
 4q7yrILrL3hc20xJ6csHt4jwV5YlViy7Jew1+VbKOXlUMOPUB/BjnUgWD8N8hg4rDSxejrnn6M/
 EXNPCIPgXRGqQgiqqFOkSXS08FimpgBbovRfY5jpAPsdXeIEPWbup8eXiEM6sVs9bYqgrA8yCXp
 nxBJzQ03S3jrc5Jq34ZJXkw==
X-Google-Smtp-Source: AGHT+IFOdokuGgSnF8qKq3daJpFSDdbQS4MDKvGB1Of1XUNNLmsRd7RwZTWRG7pXgbva/VjqyVS3wA==
X-Received: by 2002:a05:6a21:3282:b0:220:1843:3b7b with SMTP id
 adf61e73a8af0-2431b746b1emr2401182637.4.1755664478823; 
 Tue, 19 Aug 2025 21:34:38 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-324e253b846sm872758a91.12.2025.08.19.21.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 21:34:38 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 54B96411BF98; Wed, 20 Aug 2025 11:34:35 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux F2FS <linux-f2fs-devel@lists.sourceforge.net>
Date: Wed, 20 Aug 2025 11:34:28 +0700
Message-ID: <20250820043432.22509-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820043432.22509-1-bagasdotme@gmail.com>
References: <20250820043432.22509-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281; i=bagasdotme@gmail.com;
 h=from:subject; bh=XPBG+g8op80wWwfXH+4JKxjmC6qZmKE5cKfnLEosge0=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBlL/bexydT9v3HDe32/imzWbrE0nv7ii4yJWScPh4TkX
 mnYmtLYUcrCIMbFICumyDIpka/p9C4jkQvtax1h5rAygQxh4OIUgIl4HWJkuKny4/SWM2U6eqky
 xuf4mB+2tEmYv4uKnGoqwp3yxzqlHKji3bWC6yWMi+ynJGz8uo85+ZPJCpV0j4x0GceNBz6uXME
 HAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Format compression_algorithm subtable as reST table as it
 does the semantic job rather than normal paragraph. Signed-off-by: Bagas
 Sanjaya
 --- Documentation/filesystems/f2fs.rst | 4 ++++ 1 file changed, 4 insertions(+)
 Content analysis details:   (-0.2 points, 5.0 required)
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
 [bagasdotme(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.174 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uoaXB-0006Vz-JF
Subject: [f2fs-dev] [PATCH 2/6] Documentation: f2fs: Format compression
 level subtable
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
Cc: Daeho Jeong <daehojeong@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Yangtao Li <frank.li@vivo.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Yuanye Ma <yuanye.ma20@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Format compression_algorithm subtable as reST table as it does the
semantic job rather than normal paragraph.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/filesystems/f2fs.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 203631566a2c58..132c3080ad5c4c 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -291,9 +291,13 @@ compress_algorithm=%s	 Control compress algorithm, currently f2fs supports "lzo"
 			 "lz4", "zstd" and "lzo-rle" algorithm.
 compress_algorithm=%s:%d Control compress algorithm and its compress level, now, only
 			 "lz4" and "zstd" support compress level config.
+
+                         =========      ===========
 			 algorithm	level range
+                         =========      ===========
 			 lz4		3 - 16
 			 zstd		1 - 22
+                         =========      ===========
 compress_log_size=%u	 Support configuring compress cluster size. The size will
 			 be 4KB * (1 << %u). The default and minimum sizes are 16KB.
 compress_extension=%s	 Support adding specified extension, so that f2fs can enable
-- 
An old man doll... just what I always wanted! - Clara



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
