Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE34C772A3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Nov 2025 04:27:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kjcErg++xmBb5+fNA1usf4vBjBElyTQKZhphBOVva4A=; b=dIs+PElyi6f5Yi94QHhc1PoN5L
	HthhqoiEHISVseM88EU53Dyf7+RCeDpJ7DianX6VeO5TvjPUEeb5DY5+REyJsHguzopRqeWv2JS18
	85fWcp0fEzqYut1h6Wf6Flq1xfJUcFlXpsGwkXlS2JQfXzRfaDX3wlc70gWxZbdDBiSI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMHo5-0003w4-6s;
	Fri, 21 Nov 2025 03:27:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vMHo3-0003vx-Ff
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 03:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cdYySybBU4ikuLx1VugQfnz5mPXw/9z/ASnXvXm1nms=; b=ZvbODbWih3iOEhxVNAtO3u/E8p
 M3VobF6szvkF5PiAD/jZUgAoRAuQF7Mm5dsB2N0ev3Q70Zpv2r4XmHKeMnYoRwAw+h2PGL/+ZHeFX
 BX2Rdg13BO6OBrfIB6JMh/kBn5EKlYr3uFg+PxqROXvWkAf0EDox39k2ndlBE09+IcUY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cdYySybBU4ikuLx1VugQfnz5mPXw/9z/ASnXvXm1nms=; b=C
 kDppuVEorttHnCtQvxcwlMvkXR3lNJnHIlFMIxL4EZ6nhekOS97MLJ+yMaOT8T518Kff5TqFHe8J1
 j8RiA+QvTkHLQrmkcc2+qiNDNxIQhjvoN7nPOD4kIlTKA5FCvvWXR1HICNfECk4yhoEd0sS/mEW9T
 dVKd9JZTb8qHVu0U=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMHo3-0003MA-Qu for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 03:27:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2026B60216;
 Fri, 21 Nov 2025 03:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC70AC4CEF1;
 Fri, 21 Nov 2025 03:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763695640;
 bh=lv8+yTEJIeZGkAiti08XUOQRFB8Mqfr2jh1MOoVvKtQ=;
 h=From:To:Cc:Subject:Date:From;
 b=svrAuLUEgVbBggxnDz/4dZ4fA91I2w7g1FwRlR3z6VwgigV5ImJrWkqsy+uHieMtH
 IfAUWPiUQ2gTc/nkQrK5QriVIJn8DW1wNg34Rt6y1Fefqcq+ZGqxb7bcgvF+uhEnNy
 OIq022levOj8YRLIdAew8d10HMqpe94uKyFC6ibz4WI4TG/TUvbgt7ZIoPm5Ukjj+I
 bklXEijcjAGq8Y3TB1rVVrrQNlV6RNtm/129Ac9nHhsSPvZY+geqqW7KU4zOxqSi5P
 LLU9QIMwE/NmZXNUOnXSriu5q3w5JhfoOQE6U+gzvUv/mhJRIv2ST/M9HST8fitwrM
 /ZFw0FdFKpg0w==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 21 Nov 2025 03:27:18 +0000
Message-ID: <20251121032718.1993528-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch introduces a new POSIX_FADV_MLOCK which 1)
 invalidates
 the range of cached pages, 2) sets the mapping as inaccessible,
 3) POSIX_FADV_WILLNEED
 loads pages directly to the inaccessible mappin [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [172.105.4.254 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vMHo3-0003MA-Qu
Subject: [f2fs-dev] [PATCH] [RFC] mm/fadvise: introduce POSIX_FADV_MLOCK
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Christian Brauner <brauner@kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch introduces a new POSIX_FADV_MLOCK which 1) invalidates the range of
cached pages, 2) sets the mapping as inaccessible, 3) POSIX_FADV_WILLNEED loads
pages directly to the inaccessible mapping.

The inaccessible pages will be invalidated by evict_inode or explicit munlock().

Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Christian Brauner <brauner@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 include/uapi/linux/fadvise.h |  2 ++
 mm/fadvise.c                 | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/uapi/linux/fadvise.h b/include/uapi/linux/fadvise.h
index 0862b87434c2..06018688b99b 100644
--- a/include/uapi/linux/fadvise.h
+++ b/include/uapi/linux/fadvise.h
@@ -19,4 +19,6 @@
 #define POSIX_FADV_NOREUSE	5 /* Data will be accessed once.  */
 #endif
 
+#define POSIX_FADV_MLOCK	8 /* Load pages into inaccessible map.  */
+
 #endif	/* FADVISE_H_INCLUDED */
diff --git a/mm/fadvise.c b/mm/fadvise.c
index 588fe76c5a14..849b151d2024 100644
--- a/mm/fadvise.c
+++ b/mm/fadvise.c
@@ -56,6 +56,7 @@ int generic_fadvise(struct file *file, loff_t offset, loff_t len, int advice)
 		case POSIX_FADV_WILLNEED:
 		case POSIX_FADV_NOREUSE:
 		case POSIX_FADV_DONTNEED:
+		case POSIX_FADV_MLOCK:
 			/* no bad return value, but ignore advice */
 			break;
 		default:
@@ -93,6 +94,19 @@ int generic_fadvise(struct file *file, loff_t offset, loff_t len, int advice)
 		file->f_mode &= ~FMODE_RANDOM;
 		spin_unlock(&file->f_lock);
 		break;
+	case POSIX_FADV_MLOCK:
+		/* Remove the cached pages. */
+		if (!mapping_unevictable(mapping)) {
+			invalidate_inode_pages2_range(mapping,
+					offset >> PAGE_SHIFT,
+					(offset + len - 1) >> PAGE_SHIFT);
+
+			/* set the mapping is unevictable */
+			filemap_invalidate_lock(mapping);
+			mapping_set_inaccessible(mapping);
+			filemap_invalidate_unlock(mapping);
+		}
+		fallthrough;
 	case POSIX_FADV_WILLNEED:
 		/* First and last PARTIAL page! */
 		start_index = offset >> PAGE_SHIFT;
-- 
2.52.0.487.g5c8c507ade-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
