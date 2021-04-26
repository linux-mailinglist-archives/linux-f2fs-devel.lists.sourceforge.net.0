Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5AD36BC2D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Apr 2021 01:42:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lbAs6-0006tW-M3; Mon, 26 Apr 2021 23:42:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <nickrterrell@gmail.com>)
 id 1lbAs3-0006tG-RU; Mon, 26 Apr 2021 23:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VsQsmCAgJgJxoXWPONlyxJ9BGgILIRFdOhQAUEyo7tY=; b=C4NukIS9Zt/18+aHnCpJSeQW+S
 vNeS4eN8+D8rcdc1ZLc7imEFx+Mz67+HPE6OYw+eA8LMxYyDgI6f5jXgfvggBB1Tfp3UEULDP7e9F
 CZV9t6ErCKC7Qs+uMVYd69FDRP8jwao+9n8Ay6XPTb8wr+6lC2Ox41FRfhzVp3ArqMPQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VsQsmCAgJgJxoXWPONlyxJ9BGgILIRFdOhQAUEyo7tY=; b=IIAWtF8wWCAH8FBbwUMp5ECWwk
 nBRBlTyUPF3khqa4nCCPVmG4juatDCHrLHegPekbAc5xXbldLsHF4Ltei+HPkXiJVoC3MIl8oufIa
 LQ8lnxjUZphEZK4mvFQL8xfUiDSXwi6Ak27DsI332zC8GIqA5YWxovtrwRnEY60dpxNo=;
Received: from mail-pg1-f182.google.com ([209.85.215.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lbAry-0006WX-DN; Mon, 26 Apr 2021 23:42:31 +0000
Received: by mail-pg1-f182.google.com with SMTP id b17so4076775pgh.7;
 Mon, 26 Apr 2021 16:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VsQsmCAgJgJxoXWPONlyxJ9BGgILIRFdOhQAUEyo7tY=;
 b=Xzd+Bu439mdjn8yl2z798jxgjLJIueP7r/oNdhZWpnH7fkdXHfiqEWPC3ud2fhIG3N
 m0pkmEQiW1/MvVuNoZ/x++oXDuSSksOQO7p/hcRVEOJW2jOvXylXl0VkVX9ER5HyDNH5
 vZ2UZS/griXQEZZ07FhXubjld5Y2CYmr7E2LEraJAYw/aAHTe2fbbANUnQhbNKnyZAzR
 MSlYgq7wSLauROJmYGgt3dEQXoKqbQfr/CnqFwNw/SFx4JAOyIX/tPl/Z90pDJkMbKwI
 1OP+FAnrRZR47uMu3B1J1CqCeL/1He7tP4S7cQOmus4c4Lvf/PlT31RhD6MHy/C4WpW7
 e6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VsQsmCAgJgJxoXWPONlyxJ9BGgILIRFdOhQAUEyo7tY=;
 b=Uc7HrrfEPLPrLUr2f/d3DreUEsjvAptklx406YwhCM6LdfXTxFtW8iCqjZL78h+mDW
 7Js6/J/Kpyz39x72j4AeVLJjZfqnNLSUC2+maMiqV0ScFUtRWHG15670a7ZyyNE/KG4P
 zEU1cMlLtx+1MgclXMKj0UKUWkQnRtTE/NMLkb7WLQN6LslkI/z9XUA0p0KnRExE4NaE
 usIX6V8Lrk7tXWSVqBOIam+g8fKpLLACrE6GEtXp+13JnPUb607puYk+Npd4mXnpNybq
 Dq2WZRfwB4TIl8AWV2RkgRtMipiVv6y5MF95VXfL02DnEsIX/OlrF3UrDN2P+stgh5Zu
 nvlg==
X-Gm-Message-State: AOAM533lE6qr1vN2hylWlxFBE6PSrFWmQA9uS5Mj+7gnhBBTP6H0xi1d
 2/rZ0eNV0/Oqr1uuFBM3674=
X-Google-Smtp-Source: ABdhPJygKGT7O/9kbsuo/ZEUwwEeZWZQv28qIldIprW6wlA3FY+XBIy2K9MxMTsdBqcdBIFAHcpJZQ==
X-Received: by 2002:a65:43c9:: with SMTP id n9mr19035367pgp.19.1619480541011; 
 Mon, 26 Apr 2021 16:42:21 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net.
 [98.33.101.203])
 by smtp.gmail.com with ESMTPSA id m7sm640828pfc.218.2021.04.26.16.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 16:42:20 -0700 (PDT)
From: Nick Terrell <nickrterrell@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Date: Mon, 26 Apr 2021 16:46:21 -0700
Message-Id: <20210426234621.870684-5-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210426234621.870684-1-nickrterrell@gmail.com>
References: <20210426234621.870684-1-nickrterrell@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nickrterrell[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.182 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lbAry-0006WX-DN
Subject: [f2fs-dev] [PATCH v10 4/4] MAINTAINERS: Add maintainer entry for
 zstd
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
Cc: squashfs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 Johannes Weiner <jweiner@fb.com>, Christoph Hellwig <hch@infradead.org>,
 Nick Terrell <nickrterrell@gmail.com>, Yann Collet <cyan@fb.com>,
 David Sterba <dsterba@suse.cz>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Petr Malat <oss@malat.biz>,
 Chris Mason <clm@fb.com>, Nick Terrell <terrelln@fb.com>,
 linux-crypto@vger.kernel.org, Felix Handte <felixh@fb.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Kernel Team <Kernel-team@fb.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Niket Agarwal <niketa@fb.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Nick Terrell <terrelln@fb.com>

Adds a maintainer entry for zstd listing myself as the maintainer for
all zstd code, pointing to the upstream issues tracker for bugs, and
listing my linux repo as the tree.

Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fb2a3633b719..eb67c13ec36a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19890,6 +19890,18 @@ F:	Documentation/vm/zsmalloc.rst
 F:	include/linux/zsmalloc.h
 F:	mm/zsmalloc.c
 
+ZSTD
+M:	Nick Terrell <terrelln@fb.com>
+S:	Maintained
+B:	https://github.com/facebook/zstd/issues
+T:	git git://github.com/terrelln/linux.git
+F:	include/linux/zstd*
+F:	lib/zstd/
+F:	lib/decompress_unzstd.c
+F:	crypto/zstd.c
+N:	zstd
+K:	zstd
+
 ZSWAP COMPRESSED SWAP CACHING
 M:	Seth Jennings <sjenning@redhat.com>
 M:	Dan Streetman <ddstreet@ieee.org>
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
