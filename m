Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B2CCF083D
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 04 Jan 2026 03:08:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8K2NzsQ2khDVe5y884x8wjOc23oIkqvrIGc8OsFj28=; b=lH1epPAJAcMF94RNdyxGEMiezY
	mbQieGmG+YzeevJldzv47Ooa88Jxf/t1qJa/UkOf8cqiHXdVgE3jtcj7h8xHt6hJeavqJglSY1mn5
	sat3Iovc0fyIIAiKEDdW8eDB8ApkqjicRTTyqQpk+9e6TqWl6q84QS43qEC7DQgA81m8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcDXl-0000KZ-8f;
	Sun, 04 Jan 2026 02:08:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vcDXj-0000KJ-5V
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7jnEtwrLTBay28lPsy60DJnrEc3anbnKVl/Ezj0J/wg=; b=DPwm706R3PYbA4a9ZU9O3YQak9
 NOMLcfl4xDzjrMT2StzBJRbawmsUIL/TIEKp1OK6A27A40HKQOqaK3JWvSSDLE+bPoZubPO+i3SN8
 ljSOK5HgFTmU1G6fkx/hLu5YyXm7n5Q7X3hT0T/jBN+tlf8ONxlK6N217phtUid4MlCQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7jnEtwrLTBay28lPsy60DJnrEc3anbnKVl/Ezj0J/wg=; b=Y/UgcqulFa0gssW1SfMTt1+u5E
 OyktSRhpaBFQU07dskYnCdoQcF2FDMkLsiLrJd0aBcB2GOoTAqzq4PIEMS5HUDUjIRyUUSQDBuMTy
 swij5R6h8d8SCH1hRjElnEnIlMyYpQIA+cM1NGx94pemoJhKuAC8VLapgadaE6mx5P00=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vcDXi-0005oR-Ni for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6905C44366
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  4 Jan 2026 02:08:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F603C19422;
 Sun,  4 Jan 2026 02:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767492500;
 bh=jX6g10Oq1TXR9DdxfB9gw3828M6ZwD/ePQBBBxe2fKQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=enXTZSsEcjjk2D/cfV806Ama6PEu2mVDoJTEpTg3PfJM5zgJyNEg/u2N756us+IlP
 TEstRhjf8BLDnrYQ0DdXbR27DZ/42ykDEpYH+hvY3MHF7SfKctpKWgg6mw0Nmn0sDG
 k1e4t4p53sISHFY/RR53ZuEKxY1n/76l4CBFE2RgbMOjvTDswoTFamqat8syUkZt47
 ukiHX+0zA/AvyMRhqNCRplcwbL4kB/TSQkC0sI89FS8+ueUx6y0r0+ZMwcxJ7aOyrX
 z/qIeP+SxMZkF2V0iA9KdP8HzfzGLkjSVFkIQGPKA/tideLBNpg0Wf+saFCDqZSLiv
 pK6ZgeVntlbWw==
To: jaegeuk@kernel.org
Date: Sun,  4 Jan 2026 10:07:27 +0800
Message-ID: <20260104020729.1064529-12-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.358.g0dd7633a29-goog
In-Reply-To: <20260104020729.1064529-1-chao@kernel.org>
References: <20260104020729.1064529-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  No logic changes. Signed-off-by: Chao Yu <chao@kernel.org>
 --- Documentation/ABI/testing/sysfs-fs-f2fs | 2 +-
 Documentation/filesystems/f2fs.rst
 | 2 +- fs/f2fs/f2fs.h | 2 +- fs/f2fs/segment.c | 2 +- fs/f2fs/super.c | 2
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vcDXi-0005oR-Ni
Subject: [f2fs-dev] [PATCH 12/14] f2fs: rename FAULT_TIMEOUT to
 FAULT_ATOMIC_TIMEOUT
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

No logic changes.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 2 +-
 Documentation/filesystems/f2fs.rst      | 2 +-
 fs/f2fs/f2fs.h                          | 2 +-
 fs/f2fs/segment.c                       | 2 +-
 fs/f2fs/super.c                         | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 648ddd0d59f6..de5a80124e04 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -741,7 +741,7 @@ Description:	Support configuring fault injection type, should be
 		FAULT_BLKADDR_CONSISTENCE        0x00080000
 		FAULT_NO_SEGMENT                 0x00100000
 		FAULT_INCONSISTENT_FOOTER        0x00200000
-		FAULT_TIMEOUT                    0x00400000 (1000ms)
+		FAULT_ATOMIC_TIMEOUT             0x00400000 (1000ms)
 		FAULT_VMALLOC                    0x00800000
 		===========================      ==========
 
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 9b3b835a174e..2d71efa7db7a 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -215,7 +215,7 @@ fault_type=%d		 Support configuring fault injection type, should be
 			     FAULT_BLKADDR_CONSISTENCE        0x00080000
 			     FAULT_NO_SEGMENT                 0x00100000
 			     FAULT_INCONSISTENT_FOOTER        0x00200000
-			     FAULT_TIMEOUT                    0x00400000 (1000ms)
+			     FAULT_ATOMIC_TIMEOUT             0x00400000 (1000ms)
 			     FAULT_VMALLOC                    0x00800000
 			     ===========================      ==========
 mode=%s			 Control block allocation mode which supports "adaptive"
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 54cde9a0e24c..8c0ce9fd954f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -63,7 +63,7 @@ enum {
 	FAULT_BLKADDR_CONSISTENCE,
 	FAULT_NO_SEGMENT,
 	FAULT_INCONSISTENT_FOOTER,
-	FAULT_TIMEOUT,
+	FAULT_ATOMIC_TIMEOUT,
 	FAULT_VMALLOC,
 	FAULT_MAX,
 };
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 776b0df828ed..469d37c37398 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -371,7 +371,7 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
 	}
 
 out:
-	if (time_to_inject(sbi, FAULT_TIMEOUT))
+	if (time_to_inject(sbi, FAULT_ATOMIC_TIMEOUT))
 		f2fs_io_schedule_timeout_killable(DEFAULT_FAULT_TIMEOUT);
 
 	if (ret) {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3583a640e614..9e41fe39dbf6 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -67,7 +67,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 	[FAULT_BLKADDR_CONSISTENCE]	= "inconsistent blkaddr",
 	[FAULT_NO_SEGMENT]		= "no free segment",
 	[FAULT_INCONSISTENT_FOOTER]	= "inconsistent footer",
-	[FAULT_TIMEOUT]			= "timeout",
+	[FAULT_ATOMIC_TIMEOUT]		= "atomic timeout",
 	[FAULT_VMALLOC]			= "vmalloc",
 };
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
