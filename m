Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SHAfKEk1Q2rLUwoAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2026 05:17:29 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C55396E001F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2026 05:17:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="FEM1mU/G";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=G44n5Jr2;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="F qQ0yDe";
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=Voum4sWQ;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=chWA0v4s/ZLUqHkI2dFO7Ngp4Fk/xC+ND/NgisGBLi4=; b=FEM1mU/G5YZt4wzF9FJSmgi0tO
	dwavdmOyJL8fdelAVJPI5SdgNPkEu1WEQ0BK74M4zuOpSz4ZHsBb9Qv+sKUiZN5S/0hGv76f1eiEf
	2O8GpQDL/D+aJf3C2WywybBBC7HNGbA6Q0GdJME+Fu7IGkfBLb6n9B3sDf+phgrbpqcE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1weOyJ-0005zw-83;
	Tue, 30 Jun 2026 03:17:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1weOyH-0005zi-US
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jun 2026 03:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WLXvGqRMFA5haqSNVXzF7Y9Rny7xwOL3ekk7oKDx14E=; b=G44n5Jr2ZaQCdIn6Xi9dsJF6FN
 tGjWMujZ8+r5Hw38K+hS2UCIGCMUxz1z+93g4Lrf/mGuDPMLrl/u66eBhJp1967t6THYUSE0sS5yd
 1Mr55Kva5gFeNHNQsjrdOg+i36veNW26ItL9z3owkh+5I9KO5TNigVvDpSpGuUrlha70=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WLXvGqRMFA5haqSNVXzF7Y9Rny7xwOL3ekk7oKDx14E=; b=F
 qQ0yDeV0yRN2iJJX65Qa6RT+7i9DEffe0m/3ZuGlJ5GJt5ix1rs+qOn/V8kcon1EYgZDMl0Wnc4nV
 aBJg/nq7pN6hze3VwuQ5hFMrzclcZeq1cojjK15kwKbMMbkMFHmb8lGnaWZavhH64ByPUGB7UC1pB
 PqqJZMcYrGnXYwiE=;
Received: from mail-pl1-f173.google.com ([209.85.214.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1weOyG-00082Y-QW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jun 2026 03:17:14 +0000
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2ca11143dbbso8412605ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Jun 2026 20:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782789428; x=1783394228; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WLXvGqRMFA5haqSNVXzF7Y9Rny7xwOL3ekk7oKDx14E=;
 b=Voum4sWQC0+mPjUY6n66XMsHYuTTQywe4Yz14CQ6Lp5ht2KVp7f/5Q/Aj9EKIpjmsr
 ZJCkZLaLJA9/QESouB/zTEft+nZ8VqXhWywm4HMcaLPzi8ivXY1Fah9tzp8lmu3Pv9mu
 Y8CkYLVeYvThRDU33C5Tlpqxk1rpjfKMv5fgSNf9GnUR3o2TXAPFYE2oyPQokARgMzl1
 GUCnL/FlAJbYK/Omrl8MBbjGjMfAe5fmHvI10Yd55+/FFOeWIs/RqjLO79n2zRY7F/VJ
 tV7PNbdgV9O2egBEM/Sj2gaRi3i1fzko1IcjXJNWlrSol88ezHGWI/h3eVBKPuHVuNfl
 IDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782789428; x=1783394228;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WLXvGqRMFA5haqSNVXzF7Y9Rny7xwOL3ekk7oKDx14E=;
 b=ogyW4TuzHQJRi3F9IA2GvfmiVhOCdgVts938HGQIuVQIHnyLzfkmIbYcbYa3vgVMbO
 o9CPCxmRDx3PO+qwf+nD72oDCoc/V0RZ/xNK9t+a+EgjlnBRh1iKCKwjFxOnSR6Ba4jA
 31rmtduldW+M/Fw8KbN7WOnCQ3Xy8jO6Qg3tRp27+lardFKv5xn8yxhuZneA3wWEv+rh
 QqfEj+V03HlolLZwk+YOkhga65xVyJmB+lmtoCwfPpXNCw9oaKkCasW30578o+s/znbf
 /a5qo6Ny+2Zhg+U6KOGEEQvudfOqr3UFxZ+i9eNSwYptmv92bLeo5WTCtk+xc6yYU7Xc
 +G9g==
X-Gm-Message-State: AOJu0YzVbr2Jt/fb9AnbV3evRx97JCR8FPdnxknYG8U4tNrX1+jApg0W
 sxsFndpGdayhsXVBgthIZ5Kki7yYNoNy9YCsgBsDLoVqVHwiMRr0cTH2
X-Gm-Gg: AfdE7cmgIeS1Gq2fJfGuY9OYkfdRxc3p2saKwyuvVRCHaqVXdR4nGBSkoXOMFlU4qKl
 pa/X2udPy/a2BKDynFIPnqUrfMFD7ClW9jEHzZ0L74eidt0yCAQKP1YWIyXGzvk142S4gS1xwwY
 zFpJEy6CDCtVOM76PwI04LgU1d3Mb+tFsBZZVXRhokvFCirW8/OSGzkQRGNEdHxXL+K41U29Q1E
 95mUAbXlzFFCKln5BUAeuXmAYdjlwqvs3UUV58zvKFVz3L69dWiWt0en2LxFLXOU4TngRaOnzku
 3Aa1BzThJP/HUeCLHd/H38lTuM/QuPW8ZPY5fgFv/MrT82xjD//kBSbAzPhaL7Kk230tatr6pn/
 dm/d71fJp6KShRDUobNZxiplTbshsCzQu9vNsrGu9Yx1ehA0ICyVCcISkI0sjkX6165MckPfCT/
 j19pl7pWJliGZd9bc4fP662C4Y0T0ckilxtS0NrW0H2RUDzvTI
X-Received: by 2002:a17:903:160c:b0:2ca:c68:c554 with SMTP id
 d9443c01a7336-2ca2ea1d3b7mr13190625ad.38.1782789427548; 
 Mon, 29 Jun 2026 20:17:07 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca37a71260sm4199195ad.4.2026.06.29.20.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 20:17:06 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 30 Jun 2026 11:17:00 +0800
Message-ID: <20260630031700.2573819-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  F2FS_IOC_MOVE_RANGE checks the source range,
 but not the destination
 end before updating i_size. A source hole can expose this: __clone_blkaddrs()
 skips NULL_ADDR entries and returns success, so the c [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.173 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1weOyG-00082Y-QW
Subject: [f2fs-dev] [PATCH] f2fs: validate MOVE_RANGE destination size
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
Cc: qwjhust@gmail.com, stable@kernel.org, qiwenjie@xiaomi.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:qwjhust@gmail.com,m:stable@kernel.org,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,xiaomi.com,vger.kernel.org,lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C55396E001F

F2FS_IOC_MOVE_RANGE checks the source range, but not the destination end
before updating i_size. A source hole can expose this: __clone_blkaddrs()
skips NULL_ADDR entries and returns success, so the caller can still extend
the destination inode with unchecked pos_out + len.

Reject destination overflow and use inode_newsize_ok() before extending
the destination inode.

Fixes: 4dd6f977fc77 ("f2fs: support an ioctl to move a range of data blocks")
Cc: stable@kernel.org
Assisted-by: Codex:gpt-5.5
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/file.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4b52c56d71f0..2a5c6f741f56 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3121,8 +3121,9 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 	struct inode *dst = file_inode(file_out);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(src);
 	struct f2fs_lock_context lc;
-	size_t olen = len, dst_max_i_size = 0;
-	size_t dst_osize;
+	size_t olen = len;
+	loff_t dst_max_i_size = 0;
+	loff_t dst_osize, dst_end;
 	int ret;
 
 	if (file_in->f_path.mnt != file_out->f_path.mnt ||
@@ -3179,8 +3180,15 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 	}
 
 	dst_osize = dst->i_size;
-	if (pos_out + olen > dst->i_size)
-		dst_max_i_size = pos_out + olen;
+	if (olen > LLONG_MAX - pos_out)
+		goto out_unlock;
+	dst_end = pos_out + olen;
+	if (dst_end > dst->i_size) {
+		ret = inode_newsize_ok(dst, dst_end);
+		if (ret)
+			goto out_unlock;
+		dst_max_i_size = dst_end;
+	}
 
 	/* verify the end result is block aligned */
 	if (!IS_ALIGNED(pos_in, F2FS_BLKSIZE) ||
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
