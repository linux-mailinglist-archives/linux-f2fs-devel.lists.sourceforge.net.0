Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D62CA9DF7B7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Dec 2024 02:10:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tHuww-0002WZ-O0;
	Mon, 02 Dec 2024 01:10:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1tHuwp-0002TV-Uo
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Dec 2024 01:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u4zKKihD/i6qJFYYj+uDjT4cXnxBWrrZolbSrdlui6A=; b=kHEI2saJ2Lm7WMT7WOMDekm1F1
 /MbEv5GvniKtjyAx6nPrWvblz8nzs8ysCfVgqFD5941oV+PGjVmF0GEQNIPJUdu08e4uwkcjm17yv
 a3xDYrCNcpOF+HfXy1/+bSGAu4UYulQ5+6SWq5HFmI8e163hLTB9oBrhOyUdguo3LLRY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u4zKKihD/i6qJFYYj+uDjT4cXnxBWrrZolbSrdlui6A=; b=D1XhLSEfV/u9cuM5x8ONYyanik
 jSR86yvPcGcT5IMvVHXmk3iQGBEkd7cByTcFTVJpMzqdviYSTEE6QYjF8I204O+zWxhIjeBlQoEWH
 gEqV0Oz6prSRU3/Y1+pAyfczHi/VG82UmVkTnvMih/lliJ6QKOy7RLNcjnMqH4vJ0eNA=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tHuwe-0006M8-38 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Dec 2024 01:09:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 00D88A40C18;
 Mon,  2 Dec 2024 01:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA70C4CEDB;
 Mon,  2 Dec 2024 01:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733101777;
 bh=sAzD90I338AaM/8blk/uCSyjht7bgmdBUwOqBKuzNIc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VKU68uRvYLBaRovzroTHtIutPCgKC6QkWzoPlcXn8VLM2AALjN1tsYCrjDYauffPh
 vV6r/DOWuGw63oGNuEpGfQeGp7R9lS7LFFszoCHGml3UntRKROIAqiRLuW7StNARAh
 0Ci9DWmxpBAX6yOIkEhsEz/hYmPWznYUul/CrbWG5pymjMcUeQP7p/YkmMyjb5GzJK
 39oZsqc7xqfpiGZ3M6uxZoPUSFSrArat5L/oUnvlg0O/o//5/6kQMa9L/3ikiS0It+
 vQmd5gbRiBDmGq+W6WGs4X/oXNr4Sn9tEdFlgPqNpLYdtbNGTsCzwXVjggoYAnUbKy
 F6ON4jIkYHO3Q==
To: linux-kernel@vger.kernel.org
Date: Sun,  1 Dec 2024 17:08:39 -0800
Message-ID: <20241202010844.144356-15-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202010844.144356-1-ebiggers@kernel.org>
References: <20241202010844.144356-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.0 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> Explicitly select
 CRYPTO from BCACHEFS_FS, so that this dependency of CRYPTO_SHA256,
 CRYPTO_CHACHA20, 
 and CRYPTO_POLY1305 (which are also selected) is satisfied. Currently this
 dependency is satisfied [...] 
 Content analysis details:   (-3.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tHuwe-0006M8-38
Subject: [f2fs-dev] [PATCH v4 14/19] bcachefs: Explicitly select CRYPTO from
 BCACHEFS_FS
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Kent Overstreet <kent.overstreet@linux.dev>, linux-scsi@vger.kernel.org,
 x86@kernel.org, linux-mips@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-ext4@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Explicitly select CRYPTO from BCACHEFS_FS, so that this dependency of
CRYPTO_SHA256, CRYPTO_CHACHA20, and CRYPTO_POLY1305 (which are also
selected) is satisfied.  Currently this dependency is satisfied
indirectly via LIBCRC32C, but this is fragile and is planned to change
(https://lore.kernel.org/r/20241021002935.325878-13-ebiggers@kernel.org).

Acked-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/bcachefs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/bcachefs/Kconfig b/fs/bcachefs/Kconfig
index ab6c95b895b3..971ea505e7b0 100644
--- a/fs/bcachefs/Kconfig
+++ b/fs/bcachefs/Kconfig
@@ -13,10 +13,11 @@ config BCACHEFS_FS
 	select LZ4HC_DECOMPRESS
 	select ZLIB_DEFLATE
 	select ZLIB_INFLATE
 	select ZSTD_COMPRESS
 	select ZSTD_DECOMPRESS
+	select CRYPTO
 	select CRYPTO_SHA256
 	select CRYPTO_CHACHA20
 	select CRYPTO_POLY1305
 	select KEYS
 	select RAID6_PQ
-- 
2.47.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
