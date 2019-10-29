Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1621E9103
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2019 21:44:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPYLU-0000bn-Od; Tue, 29 Oct 2019 20:44:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iPYLT-0000bc-Es
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Oct 2019 20:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H99sQMG7es/EvE8xYo7i/A1BavLKhqiOXiXHNzdeh34=; b=PeuY7K5xJnjeemXnESjAJihONd
 4I7zhjVRVCWcDWtKs4vuiK/XCl8ttHAV1+lhNyLx7KPgpgF6F9WMlGir+6xaKNGVzLoEKxqSqBPvn
 kTSr2RYsRat+V6fkj4O2HHZc8fLnRvgrpdk7qzK+kZK4RYShtXhAk6zzxNoYW/m8PV7U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H99sQMG7es/EvE8xYo7i/A1BavLKhqiOXiXHNzdeh34=; b=OIinE0eMevjA7MzYQgAnC/eh6l
 bXCkDdDx26zi6Ohbwj1ps3syXrggG1O4fqSzvVaiYzKEaOaWyGgFjp5KfIUrDH1mzDITybYkQ76Qs
 3f1KqeGkFaGrlz2BAvxDJxX0uCTj0NTl8qGF+gXxeoUqX10WXzZiHyA9u0QGUoFfI+ag=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iPYLR-009PKD-6W
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Oct 2019 20:44:02 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 27ABC21721;
 Tue, 29 Oct 2019 20:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572381835;
 bh=bA1Nt9TWZvija+pWQm/jvZD5pLPHccs35Yz1RfF2GZA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rd7PXg6zwRW6AzBcDukG70kVXPnDFY/Yp1M1Yi465IxdRteBn/mWEGk2RcSAX0bx9
 zel1es+30DpGpOmI1ko07QXwQLI0WJLYWrVJ486au+twTpg7V/PgIwyKBDURx3jDP4
 2oMAidPnxs9Tw9ec8wOtrlajmDWE6C9PK+eKYyUs=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Tue, 29 Oct 2019 13:41:38 -0700
Message-Id: <20191029204141.145309-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191029204141.145309-1-ebiggers@kernel.org>
References: <20191029204141.145309-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1iPYLR-009PKD-6W
Subject: [f2fs-dev] [PATCH 1/4] statx: define STATX_ATTR_VERITY
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add a statx attribute bit STATX_ATTR_VERITY which will be set if the
file has fs-verity enabled.  This is the statx() equivalent of
FS_VERITY_FL which is returned by FS_IOC_GETFLAGS.

This is useful because it allows applications to check whether a file is
a verity file without opening it.  Opening a verity file can be
expensive because the fsverity_info is set up on open, which involves
parsing metadata and optionally verifying a cryptographic signature.

This is analogous to how various other bits are exposed through both
FS_IOC_GETFLAGS and statx(), e.g. the encrypt bit.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/linux/stat.h      | 3 ++-
 include/uapi/linux/stat.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/stat.h b/include/linux/stat.h
index 765573dc17d659..528c4baad09146 100644
--- a/include/linux/stat.h
+++ b/include/linux/stat.h
@@ -33,7 +33,8 @@ struct kstat {
 	 STATX_ATTR_IMMUTABLE |				\
 	 STATX_ATTR_APPEND |				\
 	 STATX_ATTR_NODUMP |				\
-	 STATX_ATTR_ENCRYPTED				\
+	 STATX_ATTR_ENCRYPTED |				\
+	 STATX_ATTR_VERITY				\
 	 )/* Attrs corresponding to FS_*_FL flags */
 	u64		ino;
 	dev_t		dev;
diff --git a/include/uapi/linux/stat.h b/include/uapi/linux/stat.h
index 7b35e98d3c58b1..ad80a5c885d598 100644
--- a/include/uapi/linux/stat.h
+++ b/include/uapi/linux/stat.h
@@ -167,8 +167,8 @@ struct statx {
 #define STATX_ATTR_APPEND		0x00000020 /* [I] File is append-only */
 #define STATX_ATTR_NODUMP		0x00000040 /* [I] File is not to be dumped */
 #define STATX_ATTR_ENCRYPTED		0x00000800 /* [I] File requires key to decrypt in fs */
-
 #define STATX_ATTR_AUTOMOUNT		0x00001000 /* Dir: Automount trigger */
+#define STATX_ATTR_VERITY		0x00100000 /* [I] Verity protected file */
 
 
 #endif /* _UAPI_LINUX_STAT_H */
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
