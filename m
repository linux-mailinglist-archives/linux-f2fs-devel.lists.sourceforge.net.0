Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DBC3C2C03
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 10 Jul 2021 02:22:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m20ks-0001hU-A1; Sat, 10 Jul 2021 00:22:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1m20kr-0001hE-0y
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 10 Jul 2021 00:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4JQRquj2WSnTK/ElVv8woMfn2bLRGjF1n2csJ7+L0+g=; b=SThJyUu0G4bla6enywDC7cygJY
 kAqWHenWkqbEuklvslwL/SFMIXC/WS4Mewxn6agJkuhRsqtAm5Sh/GVnaj/NX8vgAoSzWeX+Rv2oS
 aUZDzqxuQxr0tayYnhM+woH95mU6h6eHQZlHNPidQoAMCjLUeYH/Jf86SuofhPrSMRuo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4JQRquj2WSnTK/ElVv8woMfn2bLRGjF1n2csJ7+L0+g=; b=g
 FumpcLqAZansJxZz7o9x1sProUXMWAsTFNo7wo+tCxVgpW4XBqnuJkd+7lTZn+xcMhYn47IvPJ8Qv
 ZCMmhl7dhUYHre96TLlOt7JtSJsfarE8+mqJvLlBt814QBrwdQZ2DmWsCKwxdBWXs9heArIPUSYix
 4/Ne6uA9y3CvjFmE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m20kh-002fLY-Pv
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 10 Jul 2021 00:22:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B3DA61375;
 Sat, 10 Jul 2021 00:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625876506;
 bh=6rpgsXcYHXTRiRxbsoV4Xmj8XUN/0RGWjpURDGJOTU0=;
 h=From:To:Cc:Subject:Date:From;
 b=khpmeHzHN9ANnhwgb/6Hh+zDei/BGn1Yv6fWJvX9q+xdlxcyuI6aJ0M7MMJ33DFy6
 xMKaA1pmznYabKV1vi96XwpCw6LLEMzrtOWHBJnC/XR2dEsdGctle2dbM0sdMGM9gH
 szJv+Z/b7+yy1f2mTapBPl6L7uwGgPvA0/BmtOtQH0jpnf4qu5ZtY6t7vdvgu1y1Vu
 lVGfQREyLTfsZ+h8AXFShiT97BMhYG+oNgqrmlaOYeSSmRYRIryKlrvi//CztYEk7A
 gt9hAqe2wcnBztBRBDciLTlrUccsEY560yhwScNcxXkgtbxX0BEHfttWWPhCJTLRD9
 j3YLbFmfOj4YQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sat, 10 Jul 2021 08:21:41 +0800
Message-Id: <20210710002141.25086-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: 5kft.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m20kh-002fLY-Pv
Subject: [f2fs-dev] [PATCH] f2fs: compress: fix to set zstd compress level
 correctly
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
Cc: Chao Yu <chao.yu@linux.dev>, 5kft <5kft@5kft.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As 5kft reported in [1]:

set_compress_context() should set compress level into .i_compress_flag
for zstd as well as lz4hc, otherwise, zstd compressor will still use
default zstd compress level during compression, fix it.

[1] https://lore.kernel.org/linux-f2fs-devel/8e29f52b-6b0d-45ec-9520-e63eb254287a@www.fastmail.com/T/#u

Fixes: 3fde13f817e2 ("f2fs: compress: support compress level")
Reported-by: 5kft <5kft@5kft.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5099652c260b..4bc89dd9487e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4160,7 +4160,8 @@ static inline void set_compress_context(struct inode *inode)
 				1 << COMPRESS_CHKSUM : 0;
 	F2FS_I(inode)->i_cluster_size =
 			1 << F2FS_I(inode)->i_log_cluster_size;
-	if (F2FS_I(inode)->i_compress_algorithm == COMPRESS_LZ4 &&
+	if ((F2FS_I(inode)->i_compress_algorithm == COMPRESS_LZ4 ||
+		F2FS_I(inode)->i_compress_algorithm == COMPRESS_ZSTD) &&
 			F2FS_OPTION(sbi).compress_level)
 		F2FS_I(inode)->i_compress_flag |=
 				F2FS_OPTION(sbi).compress_level <<
-- 
2.22.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
