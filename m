Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7ECB2D304
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Aug 2025 06:34:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8BnQcO5mYXx5llQ7QdCwGp1eJ3b91+bWTWn5L10cuLU=; b=fgFId3N0c7Btg6gjhLRdz4p/nG
	N0P3FpU9k3YsQRqsu6s60RMh5KNgh2WaKpQZRUI6mP9M6MFBZYN7ivF+tcuqUefZcaSbHYbkdddGo
	ytkAd5B3zEFHH53MpkcnhtnU2avwCA3NHsatYQ/VAJReveeSHziTqxBk8WxfxU16KZFA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoaXF-0003zQ-7Y;
	Wed, 20 Aug 2025 04:34:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bagasdotme@gmail.com>) id 1uoaXC-0003zI-S6
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 04:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TTJAhFagm4xZdBY0qvCgrvMP8buEhoobwDciNY3Wj6w=; b=edNEiXJgzqByNOCdsMmqvs75zr
 RksKgpIIaZyF7Kouf7fjWTsYC7Jb3SmAuGPlQQ4rkc/yAlQH/cr6fgwCDbiOmJPFb0cZgYdJJwNM7
 +QOxqcKmCj9JKWse4XNv8DE6vdMTuEt/BOwSAk+LH2H7O/+TtsWxuGTMSbsBLuUstk04=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TTJAhFagm4xZdBY0qvCgrvMP8buEhoobwDciNY3Wj6w=; b=m
 Dj0PKTXxazkzGI9t9O5uf/QU4mh6/U0GZFaghfuGW26J3pROVFYKgaqNhP07ssg4i/f8gCsloeYIF
 caCuE5bLEV6kMkJgctaTWzikSn1yFBgJMmMKbo9Xv2ur0CSd2HSXryZS8MwstfvFJpgZee5skzajN
 0tJVfR+bXKFRPvwo=;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uoaXC-0006W4-IU for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 04:34:50 +0000
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-76e2e89bebaso4464317b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Aug 2025 21:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755664480; x=1756269280; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TTJAhFagm4xZdBY0qvCgrvMP8buEhoobwDciNY3Wj6w=;
 b=J73flXOGo8+Y2rA4Fg1p5vYgsF4WgZD0V3b5j7+/xHNE4TpQ8glFfYxNtGLq5vJ3hv
 uKqOhA5EgI0nizF4rC8HE+MRjj0GT2eRp55/xyviKcdgNnCeBkTqawQTVOPVxWusbLQO
 ZrbfAVme5J4eBHPuH9QyB7f9drHd0YRDg1NTIGE0KEYT6zPuwG9oE77oP0M5asokogLy
 i9YO2Jm+cf+yidfHGQbeTNn7IaOeZJEH29hLpQ8eeBGbMQ6QkTOxX+yzY8us4OHEYHPl
 Y9mPk20++nXXQ352XKQnR320io3xfKtkETGGnLvlEGrBuXX+LsEgy2JAzu/ARnTwY89Z
 4Zpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755664480; x=1756269280;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TTJAhFagm4xZdBY0qvCgrvMP8buEhoobwDciNY3Wj6w=;
 b=t14d/4Z5CHoVrisUI6MrcPia6SzbCBAi675+XGzjGjTlInadN3ZNa8HVRgzhn/NCWG
 wXkgBeJDPtD7QL5mU6YQCH7BBwMsoCuK3LzHFZymMd5Aabcj5QnBj3v4BojxHWB7BOTP
 g3gXfblpL18ItI+RrIYZIPzZ3YEASjhvswiVNL79my1WV3wVjZlIoHw7c+ox/uw1oabP
 LV9CEBpLLRYb2vwS30tLWI5g4gXApFKKc3N8Q+25eDrKSm6lNnYuKRmsLC58hj+aTDcK
 HMFXvzWtKRRi4r+3IQPZmEiDUN574X9ibZdVXa1S9eXQ64ro0OEkWfK/zBFx/UPdNyg3
 URMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn4ahsC/R5DRbMnPqb0zwG3jBs80ko9HaSmSstQzWZJoMIFkL4rhyHi0hU3W9/UYY+AoDvN5nm22bfUG5OZuq9@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwXRpd8TAznUN2DzE/GXz1iTMtn9XMAJ74/7tDCZ+N5rI4BnPLg
 BNX32XWhaiKtWbCSYn1J3rMIlAiHsFVz+1b/lh1Gu4i5+3sZVs6lmKwThMKTlV9V
X-Gm-Gg: ASbGncvwKXaqzfPgvAxqNWzCs5X2bYAXTTfNSR8TKF/LD7A1N9ef/Jkvhsr7ePBDPkB
 JiUrhv10j5cazfOsHT4xsixZfAeM9MEe7Zay9Ds0RS5DIg0mCi9QSqZQwDriXBtYI+IcxtLFVkq
 mWN2Sx2lvIsTMq8VuwwhVRGmrTue8Q8yovSQVt8qpbU8sMLqTaH0gboJ9iqeC22FnOdyHXmDTjN
 XFw3YWmfJC/+mgLzC+hewjUa0eDL+DnOq6UHUyF9SVOw1hGIciBU105aUu9tJcgo1L6lNLS+zPL
 phcpADiCh6Cj1ZeoEm5QX7ip1zDyONNCj7wVPW4LIMDobt5qLKIdJZ4J3m1Sj+UdsedLiQ96nX3
 zbOTP3EZD19wikq4OgDrd2g==
X-Google-Smtp-Source: AGHT+IGuGwomy2t/lnkvzOkQfUGyUDRAElqgYIuRb+Qkfx8/mw8d45XT8gZ/QDWISpdBNTf8K08SbQ==
X-Received: by 2002:a05:6a20:9147:b0:240:1dca:d13d with SMTP id
 adf61e73a8af0-2431b9f7ab0mr2747454637.43.1755664479710; 
 Tue, 19 Aug 2025 21:34:39 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d107ecfsm4026901b3a.26.2025.08.19.21.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 21:34:38 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 00D4742B408B; Wed, 20 Aug 2025 11:34:34 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux F2FS <linux-f2fs-devel@lists.sourceforge.net>
Date: Wed, 20 Aug 2025 11:34:26 +0700
Message-ID: <20250820043432.22509-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=784; i=bagasdotme@gmail.com;
 h=from:subject; bh=1YeFmIIpqckeiU5NMS7nnNpFzX3lE0cdhFLXDBSyjmo=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBlL/Td8LdsnMq374B/Zfad9PzpJGv97u1PPqfylYFZW+
 YLm+HDHjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEyk1Jfhr+gEa7sPZz8YKcqf
 fHXyx4R5OfvWLnxu9aZQ40fv+dKVVpGMDPM1FvXXajSUNiRFHDdTU3tY3XZzxreM/dv6Pjho5/Y
 /ZgUA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, Here are documentation formatting cleanup for f2fs. This
 also includes docs retitle at the end of series ([6/6]) as a bonus. This
 series is based on docs-next tree. 
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
 [209.85.210.169 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uoaXC-0006W4-IU
Subject: [f2fs-dev] [PATCH 0/6] f2fs: documentation formatting cleanup and
 improvements
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

Hi,

Here are documentation formatting cleanup for f2fs. This also includes
docs retitle at the end of series ([6/6]) as a bonus.

This series is based on docs-next tree.

Enjoy!

Bagas Sanjaya (6):
  Documentation: f2fs: Separate errors mode subtable
  Documentation: f2fs: Format compression level subtable
  Documentation: f2fs: Span write hint table section rows
  Documentation: f2fs: Wrap snippets in literal code blocks
  Documentation: f2fs: Indent compression_mode option list
  Documentation: f2fs: Reword title

 Documentation/filesystems/f2fs.rst | 88 +++++++++++++++++-------------
 1 file changed, 50 insertions(+), 38 deletions(-)


base-commit: 37c52167b007d9d0bb8c5ed53dd6efc4969a1356
-- 
An old man doll... just what I always wanted! - Clara



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
