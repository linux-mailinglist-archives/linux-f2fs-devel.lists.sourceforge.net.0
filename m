Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AAE14C0E8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Jan 2020 20:25:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iwWUb-0001Wi-Ta; Tue, 28 Jan 2020 19:25:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iwWUa-0001Wa-4h
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jan 2020 19:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+wb5QnhsxxiWxVevFo3rcYs5500P9NHKkAqpSPYp9mY=; b=cY6VhK/KyWsnhpc6HfqBOb2h9a
 0AAZKn5mBjoMCBGcx/XwIGfSp3XQVlmqJ5BjlTqwmI4HF66dtAnA2p521Vc4qPs5OBzjhRM1xTKrh
 WN8wffvN+FMWnKqm92QsAz/mNzys+CFn9PdYoVfKoSRRHQtPg2kJDrmzV1whoZuLYuVU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+wb5QnhsxxiWxVevFo3rcYs5500P9NHKkAqpSPYp9mY=; b=Z
 ZMzyBQiVnHrv8KEykDs1Iw8x6zmQvW2hxb+MWlOsgfVmJCTEuP9qbYDKP9tUxRs5EfcPewq7Kyu1t
 zQ7fsrjMMZu1ZzFY+mmsU72UMWwP9WY4M4bMcJyAeUuVY6JQV3f4x5N/DQHqEgCyQ602kTZi1XRDa
 ZJdxLpedRA8NWLVc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iwWUY-008U78-U0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jan 2020 19:25:44 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4AA6C2467E;
 Tue, 28 Jan 2020 19:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580239536;
 bh=M3Y7uG3L87hHEIblJRkwGCUrIWxfUyUuQcFB65l6IOU=;
 h=From:To:Cc:Subject:Date:From;
 b=wTXco5V78aTgUxIfwidPR1INdxREciyqDqF7/pont4zqUkKXRrsNfKNTjuIRuIHZi
 HsblQFNH95dkMKqBw5aclAbH+itf7iLvYRjERPOvlbxYPyvh1sZPAml/cAuxvPEZN8
 trvb/I0cedRqTxCE15eKdSyDtZLYoF5gFJyGdWOI=
From: Eric Biggers <ebiggers@kernel.org>
To: mtk.manpages@gmail.com
Date: Tue, 28 Jan 2020 11:24:49 -0800
Message-Id: <20200128192449.260550-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
X-Spam-Score: 2.4 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iwWUY-008U78-U0
Subject: [f2fs-dev] [man-pages PATCH v2] statx.2: document STATX_ATTR_VERITY
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
Cc: linux-fsdevel@vger.kernel.org, linux-man@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Document the verity attribute for statx(), which was added in
Linux 5.5.

For more context, see the fs-verity documentation:
https://www.kernel.org/doc/html/latest/filesystems/fsverity.html

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 man2/statx.2 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man2/statx.2 b/man2/statx.2
index d2f1b07b8..d015ee73d 100644
--- a/man2/statx.2
+++ b/man2/statx.2
@@ -461,6 +461,11 @@ See
 .TP
 .B STATX_ATTR_ENCRYPTED
 A key is required for the file to be encrypted by the filesystem.
+.TP
+.B STATX_ATTR_VERITY
+Since Linux 5.5: the file has fs-verity enabled.  It cannot be written to, and
+all reads from it will be verified against a cryptographic hash that covers the
+entire file, e.g. via a Merkle tree.
 .SH RETURN VALUE
 On success, zero is returned.
 On error, \-1 is returned, and
-- 
2.25.0.341.g760bfbb309-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
