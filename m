Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCuxLtRMGGomiwgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2026 16:10:28 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF94C5F36EA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2026 16:10:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FW5Bo2k52Oeb8Ua2e9X9U691C9HS4ayRb1u+Acv5ckQ=; b=jIZGMm53CZdEwAJ80cynRHt7Ps
	dHM4nvirUGYMcQN4kWj0pT8MuNWxoljXneTlq/fgu+pYQm1KouEP3sWdLgiqwwMlj3dxsf5OeBWTh
	970Sfyyz5z0wKtbcKZNDcq4FtUaQJL4lccH95W9eLnEvPW6HW0v3fNhrtjCbhUSwdmG8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSbR4-0000aJ-9j;
	Thu, 28 May 2026 14:10:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wSbR2-0000aD-Do
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 May 2026 14:10:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bo5IQXfOkk59eKOhzhkkc8zsYGQKG5WUM5t6Qp2hd5E=; b=X8IkxAN93IsHDg2tEfUBN5GNJJ
 a3+z9fvKko1sXpD7UZK7sM9E2h4YYRMjGARW4fGZ3uhMbqnHK/otO8QWbuLAAoOGlY2K1RUqpSKX5
 XqaPbD6d1UD9RyMuaEYKj/PJc2qH3M68SZ3Gnzq0NelT8W3UIVfAaVOxc4AkI7S9TWuk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bo5IQXfOkk59eKOhzhkkc8zsYGQKG5WUM5t6Qp2hd5E=; b=J
 KSODEQWZ86qajxOHvzs+H1iLEfLgJbgbACt1AzYxzE2PkmHgKcR8m/CN382o5UUi+b5vsN+RcLgwT
 AVpAh9OY1yHJMdFpBCxwHVPLIwVi57nEH4xJJ55OzxN0zxqfS1WGph3vGlzKWLO8bAse/RqFndpjI
 34WTilI6vE5WsGVc=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wSbR0-0008Gi-BO for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 May 2026 14:10:08 +0000
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2bf0ddaf50fso3926765ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 May 2026 07:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779977401; x=1780582201; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bo5IQXfOkk59eKOhzhkkc8zsYGQKG5WUM5t6Qp2hd5E=;
 b=QoN6hqZRZYJmxKzHUfwMRC4m9pSx7xyZBYT/cG0j/LJpoFJu1C0nCbjdPfD6FE4C1+
 npByOmm46f1oN9uY2Jxefa1f0K7Ye/Ng1NunUibrPY6sVNGrJJ6stBs34E6YLAfY8ibO
 LPwtV0saURiGSgkPrQXrXCqyKk7cPe/Kx8im9DJ66hUyloabEjC8/aojuA31t0VWsX6k
 SxnQ/RAksH0sGSnd7zjezfrGRCHml6vEIPowUp1lMQgJ39vaqZ+OiWuRbS2OCTVO9R7c
 wp9MUrkFBvbxh/y9HKKz1hs4y5mzOyKAydHwrFqYN3s4gOF5qkAMt9veohtVwcMshQn5
 iqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779977401; x=1780582201;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bo5IQXfOkk59eKOhzhkkc8zsYGQKG5WUM5t6Qp2hd5E=;
 b=DJdCrMjzdEMvIK1S3CNaESkzux3bApskKwBhxPS4JSn/gGWWRQP4MhE7moR15/SNy7
 SSDzb0Q15vN9qpijroiXuU4buuTofb2Gr4wVRhX8vckmV6x1t5R7nwcvq1KjaIysMi2N
 epWDRiClOjM74s4r20cBakbFwfJKeCVFCCnZGGxRw1uqZYcQHDMWTyjG0lWGu8s/CXWr
 UhKdI2z52WzEPZeBqnU8AvsqoDya1h/Qd3RPxoddsrYZ8csRTj1EHV0mzYqyDIVAOWGc
 F6U9iVc1rb5VtRNgFmj6yJ1faijHjfJj/bu28unX6Pjp1iOBaE9PEmu9ck88+Cu/eEHh
 3kMQ==
X-Gm-Message-State: AOJu0Yyy7GfajexodHYsV34pAShH4T8cWzbCHnW0hWKDc26g2exabbnq
 yGRyMFyxURRISP2AoahqIkRMGGyo+dsjbu2BpAvdV7kV/2sDa5OFBKD1kr8kkfWt
X-Gm-Gg: Acq92OHiFQsQ4smwqDWb2CvSpYQMAzY7Dsi9hRg5Sbl7XNEqr1daK7y3kMAoGQ7Zkfg
 1zxO9yiv/xwFc5WK7dh1z+lJ5MslON9WpR86QubwWcSSEeiZytwBE1ngnKaX8d1+pPlHlugWf3R
 px1YkSQpvhAcqG2lc9RrsL1gkvCrIGy55gakjczzoqFGIJX/hFN+g2nOCrxFVcDMN1yZoBOn8/7
 zvQ0YU/HPgf+lVoSkVUQKHxOCgl9ckr5xj/OmIKZM0i7XK7NELQmXxYMXh7oWezYW6K1emIJxi5
 g7woqlc9CaGt9wPZE3kOm4WW+RxpQ7nxFgyp0nXakrDzgPERa6T/e3eTJsoJvhJdDto/WUYyZcD
 j2APNTILUIuL6b8VFWrRUMUfOa9ukMfUouYbhRFQuBSDIUXMkzr8LRJlyjnUGnAOL8VG+tvaySg
 LnzUBgZosXMt5/XLPa30YUnzeo6qBEyBVd+dApeI34rwwMC+OsDGL4iaWc9r0cOc/C9Wqs4Q==
X-Received: by 2002:a17:902:f552:b0:2be:1c3c:72ba with SMTP id
 d9443c01a7336-2beb0794f96mr308012755ad.32.1779977400976; 
 Thu, 28 May 2026 07:10:00 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bf13d83264sm9398205ad.17.2026.05.28.07.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 07:10:00 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 28 May 2026 22:09:54 +0800
Message-ID: <20260528140954.3205736-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs_do_sync_file() calls f2fs_skip_inode_update() before
 deciding whether it has to write an inode block and continue into the recovery
 info/flush path. For a full fsync, f2fs_skip_inode_update() currently returns
 false when FI_AUTO_RECOVER is not set. That makes fsync on an already clean
 file call f2fs_write_inode(). f2fs_write_inode() then returns i [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
X-Headers-End: 1wSbR0-0008Gi-BO
Subject: [f2fs-dev] [PATCH] f2fs: skip clean inode update during fsync
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
Cc: qwjhust@gmail.com, qiwenjie@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:qwjhust@gmail.com,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,xiaomi.com,vger.kernel.org,lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:mid,xiaomi.com:email]
X-Rspamd-Queue-Id: EF94C5F36EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

f2fs_do_sync_file() calls f2fs_skip_inode_update() before deciding
whether it has to write an inode block and continue into the recovery
info/flush path.

For a full fsync, f2fs_skip_inode_update() currently returns false when
FI_AUTO_RECOVER is not set.  That makes fsync on an already clean file
call f2fs_write_inode().  f2fs_write_inode() then returns immediately if
the in-memory timestamps match the inode block and FI_DIRTY_INODE is not
set, but f2fs_do_sync_file() still continues through go_write and may end
at f2fs_issue_flush().

Avoid that unnecessary path for clean, time-consistent inodes without
FI_AUTO_RECOVER.  Keep the existing conservative checks for keep-size
files and non-block-aligned i_size before allowing the skip, and leave the
FI_AUTO_RECOVER path unchanged.

On a QEMU/KASAN test VM, repeated fsync() on an existing clean F2FS file
improved from about 35.7 us/fsync to about 1.13 us/fsync.  The baseline
issued one flush per fsync, while the patched kernel kept the F2FS flush
count unchanged over 140000 clean fsync calls.

Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/f2fs.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9f24287de4c3..ebd485abecb4 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3668,11 +3668,13 @@ static inline bool f2fs_skip_inode_update(struct inode *inode, int dsync)
 		spin_unlock(&sbi->inode_lock[DIRTY_META]);
 		return ret;
 	}
-	if (!is_inode_flag_set(inode, FI_AUTO_RECOVER) ||
-			file_keep_isize(inode) ||
-			i_size_read(inode) & ~PAGE_MASK)
+	if (file_keep_isize(inode) || i_size_read(inode) & ~PAGE_MASK)
 		return false;
 
+	if (!is_inode_flag_set(inode, FI_AUTO_RECOVER))
+		return f2fs_is_time_consistent(inode) &&
+			!is_inode_flag_set(inode, FI_DIRTY_INODE);
+
 	if (!f2fs_is_time_consistent(inode))
 		return false;
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
