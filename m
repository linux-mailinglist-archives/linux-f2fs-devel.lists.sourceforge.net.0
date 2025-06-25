Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9177EAE808A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Jun 2025 13:06:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W91/gP70lsBpblHafvaatpVEoJma55nCxNYmwTyBbGk=; b=gL85EUpc/D8CG1uCO9+UAYu3vF
	olK8t/rv2KVmPBeFsVSx5T9J5WnjN/TfhRdHGJHCw/vlaQtlZ1Z+rfzkhbiyizNjlBaUNP9J+Asd1
	H7Z259k1Rfmv4Ve9zf5XaJiOzvugSPVKaGxUAJWh4BMCVhgV2gob78i4rB/JH66nhpIM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uUNx1-0005HV-Je;
	Wed, 25 Jun 2025 11:05:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <abinashlalotra@gmail.com>) id 1uUNx0-0005HL-FC
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 11:05:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CNMyLG0/0oSyVY4Kn9SLnpAitEEY4h0zMz72v9Ot1R8=; b=Hlbo5DBQmq/feefva+gTGWTZvC
 EKXfxpdYVXRQQX2SiGXS2WzbAo00ghIWmNTEmjLRFd7yIZ5IIBBALYg64lwt3mHHQefY3DhbfQq8O
 a5kgNRoqeEHMs/nOUt+XAMHZ8GDL4s2WPGhQuuyOKz0Wm2idgY6fAP7NPKQBP3UtEme4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CNMyLG0/0oSyVY4Kn9SLnpAitEEY4h0zMz72v9Ot1R8=; b=NDiuMjY8pZUElwfACXUgE2tZ/O
 iDt4QI904hXU9ZT2LduZtf+UU4/uMJ4A/tTzpENhAmjAxpdTPBm4Vqd3HJSElxf6UG1KsR3uf1GFk
 BR/rVQbGX24cvSX8+9bDkj2C+FJpdHIwwBjKLRe6F2MBoh/prhha+J3yb3tjugl854DE=;
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uUNwz-0005Uc-LI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 11:05:58 +0000
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-74264d1832eso7664619b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Jun 2025 04:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750849547; x=1751454347; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CNMyLG0/0oSyVY4Kn9SLnpAitEEY4h0zMz72v9Ot1R8=;
 b=MaFRQ0l62jyZV3etXpi0tGqRsoaLc4zmsZj70BmmFZ9Rywk3PloBAcjt/NuIrYUL+x
 wO4qSFnC2YUKCE+MrAwxET3TAEV5XCePtcJKiwD32KV6PWFO19Q/WlG6Ok89nLIIqbes
 NnbzQ8+ncHfabSQB4WMG7BZrjsPdr/eqZvvWEd/hQzjuKQgzfNtuC2kP98JXat9nZKyf
 z92i7idA63WLJEOa5lpEG+GYKajdeu5Lnfjai3FPsdZ1VGvmV22S307fD3gRUGnYfMxc
 rgAQisPSIHUBWYkGKeAGbMc7Z249zFatD+myEG1vnQ7/foE9ROZW74e64fu5JXgZiNWU
 Xn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750849547; x=1751454347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CNMyLG0/0oSyVY4Kn9SLnpAitEEY4h0zMz72v9Ot1R8=;
 b=rPGuS5SBQqGgpkx7+CXs0mHOU1opAyS7ElRBHh/n0JpQs/36eFD8/nmCx8Z5rfrPHt
 iLAo6sjJExvZIMC99Cw5CqSlXimVY+UPz2n9P9a95GBYPjRc089ZhIlMdOTElAbxs79m
 AJ0jpSZ5CD9ioaIvZ5FFD6TUOQVsyFJYU5b+xQM2HCEfPun0eB36kyEy+Iux5B1bFOn1
 dT2uG5WA7FDHwvYmwx33STkrg2YOYAQqZlEAfHXicGMldGt5IT1IxVzMr92IbSNBY+Cm
 AQOM077kRXjIvJGScV40jFhvgXm3UoQ4wnWxGxdzctLB9y9p2UvtkLSty3T0w8aopsQJ
 3RzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVji3sGuUUED9X5lTT2RdAzCiWtYtQ1A3TCF/b4P3MnWkX8MMe95RLiCS8fdlqNevNa+cnHY9xaoK37qhYrotnl@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxA4qi53zEvWbS1wG5cMzlqic694DEqVp+yBIZJV8zuWmDYYkE3
 wRpXp4U44sf/cfvnSJgFArirReprixs8yj5lHce797GWaUHe6q6lKQqh
X-Gm-Gg: ASbGncuzsYcRPwbp0xZ1t+S3SYjs11UoCsCAx4lfc1CJFJBdWbjDt43MFG8iwU/KQKC
 T/lV0pL05HNM2GwKwV3VWE5TiXRYOdeONwDTwvfDoLMogW/84ILc5eMFIFcYSLbhUzNHNXWwZtK
 x33zVMPvMLjnI2tff44eZD6Nwz/Ol2bVHkxjPpXBU8HtlbGu5xSZQSkuv1Fo/PdwEN/kPO3yO6F
 RGYfwf46DPDs4ipd1SL1PocgbHrdRegoaQI2DCrTRi9A+XlRmLxdylIvjfGShYAJHYd4vI7uQ6I
 p50uCwKQAmwyTJBck4fwua97teE6HentbcI17MXCZU3qrtu/iZEsNF/Ttrbc3YRtdel7J3ET0nT
 VHueZSPOLGYJfQekKmRk=
X-Google-Smtp-Source: AGHT+IEysA6hmEMCHBftoGPxxrMX8x7rQIN8t6NhhCljZQ1qJAhej2tYzOSCXdyZVbFj0sKLouB8Nw==
X-Received: by 2002:a05:6a21:ad1b:b0:217:ff4b:cc57 with SMTP id
 adf61e73a8af0-2207f31cca4mr3128157637.39.1750849546835; 
 Wed, 25 Jun 2025 04:05:46 -0700 (PDT)
Received: from avinash-INBOOK-Y2-PLUS..
 ([2401:4900:88f7:9fa5:cd1:28e1:73f6:ea42])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f12423d8sm10710622a12.41.2025.06.25.04.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 04:05:46 -0700 (PDT)
From: Abinash Singh <abinashlalotra@gmail.com>
X-Google-Original-From: Abinash Singh <abinashsinghlalotra@gmail.com>
To: chao@kernel.org
Date: Wed, 25 Jun 2025 16:35:37 +0530
Message-ID: <20250625110537.22806-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <29dac4f4-3f46-49b6-8a9f-c26ffcde11d0@kernel.org>
References: <29dac4f4-3f46-49b6-8a9f-c26ffcde11d0@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: KMSAN reported a use of uninitialized value in
 `__is_extent_mergeable()`
 and `__is_back_mergeable()` via the read extent tree path. The root cause
 is that `get_read_extent_info()` only initializes three fields (`fofs`, `blk`, 
 `len`) of `struct extent_info`, leaving the remaining fields uninitialized.
 This leads to undefined behavi [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
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
 [abinashlalotra(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.177 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uUNwz-0005Uc-LI
Subject: [f2fs-dev] [PATCH v4] f2fs: fix KMSAN uninit-value in extent_info
 usage
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
Cc: syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com,
 abinashsinghlalotra@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 abinashlalotra@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

KMSAN reported a use of uninitialized value in `__is_extent_mergeable()`
 and `__is_back_mergeable()` via the read extent tree path.

The root cause is that `get_read_extent_info()` only initializes three
fields (`fofs`, `blk`, `len`) of `struct extent_info`, leaving the
remaining fields uninitialized. This leads to undefined behavior
when those fields are accessed later, especially during
extent merging.

Fix it by zero-initializing the `extent_info` struct before population.

Reported-by: syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b8c1d60e95df65e827d4
Fixes: 94afd6d6e525 ("f2fs: extent cache: support unaligned extent")
Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
---
v4 : Added Reviewed-by and Corrected Fixes
---
 fs/f2fs/extent_cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index cfe925a3d555..4ce19a310f38 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -414,7 +414,7 @@ void f2fs_init_read_extent_tree(struct inode *inode, struct folio *ifolio)
 	struct f2fs_extent *i_ext = &F2FS_INODE(&ifolio->page)->i_ext;
 	struct extent_tree *et;
 	struct extent_node *en;
-	struct extent_info ei;
+	struct extent_info ei = {0};
 
 	if (!__may_extent_tree(inode, EX_READ)) {
 		/* drop largest read extent */
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
