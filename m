Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF080C503C0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Nov 2025 02:48:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Keyy5O6D89FDoqvWYJ6cIoTrj00jQmHUQKkkf1IhNtY=; b=OMrekwR2m3fSzmXhr458TtE8ok
	ePDECaKKYpMXPLCGo3cfgmK9UouUQzSCU3n8WUvFgPNUaCZepRUIHxQfLYic0hDmxUrfUyCjfk47M
	VUQCioqsBqhopZsi5tC/40AosnZGeLKMs6zdXOot5MZzvbfTCVwWKg4dJPyVCOLD77Sc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIzxy-00058w-Dz;
	Wed, 12 Nov 2025 01:48:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vIzxw-00058e-Oy
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Nov 2025 01:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KpljFRKDEQmLBYPD4V8f0xXhR8SBvZlzs1OV5RDUEEM=; b=R0jjiJZ1lXfdZMJe9+e3/tSQa1
 wWX9ZhikzOh1dFoTAci1jwAHuu+oTIegt00CvLRHWHweEEj5/wmFnnqBMuWgjXZYbkkfSvCSKI+jV
 u8zQ/SagOW0fXsNTUuAHIzncIwnJXCfMAttrv1sVzdvw1qIBak40hDFH57mUHALunxBY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KpljFRKDEQmLBYPD4V8f0xXhR8SBvZlzs1OV5RDUEEM=; b=d
 V/O9tNaUrS9foyOQbnLG6m3FrjlKC3KpAPLNLQy2EoxQDqJiiC11qN57z5i4GL+09dAtv9O53wWTJ
 vZZwZTU+WuU40B4CM8rtrV+JfgDvRjI+7iB482B/Tl8UMjIcJYiZsRe1eBYmPs6mltB8pIi3pgscy
 To30ZyWB2Fzlfjtw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIzxx-0004uN-41 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Nov 2025 01:48:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A434141522
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Nov 2025 01:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 702C2C4CEF5;
 Wed, 12 Nov 2025 01:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762912078;
 bh=7nv5fT4fdF0GW5Fyx2VzArTblyNuA16QWAh/M13oABQ=;
 h=From:To:Cc:Subject:Date:From;
 b=RbIIWY48hxQmIvBzZZvWl8aRbPpmsC35EYVpuUd9H0st4AZZl85rxnrSWe6kvXO3u
 hxVU8lUltClEx7IWlmCvycCfn+5ylCQU627mJcMA6DoK8GuIcGYVj4uXcGuMHfUKG8
 Afb/T3a4XYqP05qOuP6C+Qw88DMX7ApEhaHwS1hKltS5cScbq8TYhT+mqdHbJgyQp+
 vKHWeh9ps+/IivR49PX7k7z8sGq8cgrDwtKxUlEMQRLEUhEwvkmr/9MXQvvCrkL0Dk
 DwJDUpaf0eVXQEBhMNHl8GQmLikZrw4DpWMfi6kZErZ0PR/0fZmX/FXvrGfwdpOLPv
 64FvLnp18nzPA==
To: jaegeuk@kernel.org
Date: Wed, 12 Nov 2025 09:47:47 +0800
Message-ID: <20251112014749.2006439-1-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  memalloc_retry_wait() is recommended in memory allocation
 retry logic,
 use it as much as possible. Signed-off-by: Chao Yu <chao@kernel.org>
 --- use memalloc_retry_wait() instead of f2fs_io_schedule_timeout()
 fs/f2fs/segment.c
 | 2 +- fs/f2fs/super.c | 2 +- 2 files changed, 2 insertions(+), 2 deletio
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vIzxx-0004uN-41
Subject: [f2fs-dev] [PATCH v2 1/3] f2fs: use memalloc_retry_wait() as much
 as possible
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

memalloc_retry_wait() is recommended in memory allocation retry logic,
use it as much as possible.

Signed-off-by: Chao Yu <chao@kernel.org>
---
use memalloc_retry_wait() instead of f2fs_io_schedule_timeout()
 fs/f2fs/segment.c | 2 +-
 fs/f2fs/super.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 10d873d1b328..d968a4250b1a 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -234,7 +234,7 @@ static int __replace_atomic_write_block(struct inode *inode, pgoff_t index,
 	err = f2fs_get_dnode_of_data(&dn, index, ALLOC_NODE);
 	if (err) {
 		if (err == -ENOMEM) {
-			f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
+			memalloc_retry_wait(GFP_NOFS);
 			goto retry;
 		}
 		return err;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index c2161b3469b3..2bd7c2320d4f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3139,7 +3139,7 @@ static ssize_t f2fs_quota_write(struct super_block *sb, int type,
 							&folio, &fsdata);
 		if (unlikely(err)) {
 			if (err == -ENOMEM) {
-				f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
+				memalloc_retry_wait(GFP_NOFS);
 				goto retry;
 			}
 			set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
