Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01402F3AE8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Nov 2019 23:05:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iSpuV-0004lO-8J; Thu, 07 Nov 2019 22:05:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iSpuU-0004lH-Ca
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Nov 2019 22:05:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nAb9irmCAunDOExsJB2L2MBaTS4yIB16q0lF7rnLn1E=; b=NE0n/wAE7V5d/fZp6C1hdmUb5/
 FLuOZ2RvYktUUmoprDTrTWhYJPidk4kRIzXZXmNxuvRVl4LJOxHJgqAGzH9jkWFGXFgYQNZx/h7QO
 2SJrnI72h2rD8Ns1EhHjiRm7OPdtcupkR06/r+nlBWaYdHB3lxD7E4xWZVVDwlopCdY8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nAb9irmCAunDOExsJB2L2MBaTS4yIB16q0lF7rnLn1E=; b=GycZObWK4TFV2SEon33OnGfUbK
 bBompluMXFBOFvuQxY7MukFzMHUM3FtSj45AmajvDjYIubMC/qlJ5EVjNfSwuJxMOy3iY9JSLVVpU
 Nsqw8oYu3fmtz3ZYHHp93Dgy+uyErpqjNjQ6ZhhgE1nbL0przBZpG/jZnYzns8j9nvwQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iSpuS-004ATA-EY
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Nov 2019 22:05:46 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75F1820679;
 Thu,  7 Nov 2019 22:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573164338;
 bh=cygUg6uzZhrE0QtmMOaogM8YgrVMvUUpNVFQTtn+FhQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U2ahxXJfpD62ZZyL2kWYVQCil+YiEuYvGM8qrEkDSjEVJjfGgM3GEvh0BPqaKZlR2
 3AK1LyQIj/blgbUFME6KpJ1OgdutTDdk902RgybzDOjQPJjSSRYVTaCtNIbbKUWQO7
 BxkzKA5F71d6dLX4jWeEJPrEmQnD9ad5nJk92Dt0=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-man@vger.kernel.org
Date: Thu,  7 Nov 2019 14:02:48 -0800
Message-Id: <20191107220248.32025-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191107014420.GD15212@magnolia>
References: <20191107014420.GD15212@magnolia>
MIME-Version: 1.0
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 1.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iSpuS-004ATA-EY
Subject: [f2fs-dev] [man-pages RFC PATCH] statx.2: document STATX_ATTR_VERITY
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
Cc: tytso@mit.edu, darrick.wong@oracle.com, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, dhowells@redhat.com,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org, victorhsieh@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Document the verity attribute for statx().

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 man2/statx.2 | 4 ++++
 1 file changed, 4 insertions(+)

RFC since the kernel patches are currently under review.
The kernel patches can be found here:
https://lkml.kernel.org/linux-fscrypt/20191029204141.145309-1-ebiggers@kernel.org/T/#u

diff --git a/man2/statx.2 b/man2/statx.2
index d2f1b07b8..713bd1260 100644
--- a/man2/statx.2
+++ b/man2/statx.2
@@ -461,6 +461,10 @@ See
 .TP
 .B STATX_ATTR_ENCRYPTED
 A key is required for the file to be encrypted by the filesystem.
+.TP
+.B STATX_ATTR_VERITY
+The file has fs-verity enabled.  It cannot be written to, and all reads from it
+will be verified against a Merkle tree.
 .SH RETURN VALUE
 On success, zero is returned.
 On error, \-1 is returned, and
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
