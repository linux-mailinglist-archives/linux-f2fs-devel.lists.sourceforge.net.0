Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Cc+I1vQDmrOCQYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2026 11:28:59 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1A15A255C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2026 11:28:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UZA/vqLj0EH8LQqGLllb2gvRyg2bf6G2n0wgrYub8uo=; b=i9YbCFVNM3u0R+SlDU2FCQmKhO
	BFAiSCSB7sjwNMMmkGcKIxShhq2bJrKvQx0Yze/d7dhFTLHebJk0VCs+zEkQFRto05XRDg0ZeYoBQ
	XngFOHl45u9iE/CFf4Sp2K0a1abIh3EW9Ayytj6SDy8eml9PLM7xYe3pBhcQcGGK0biU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wPzi1-0006ne-QD;
	Thu, 21 May 2026 09:28:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wPzhz-0006nV-OP
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 May 2026 09:28:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FPOB9/LhhNolHMWfaKZ2hWCuBSSjRf0Ctgup9iENNso=; b=ZHE+rWQJ/RyQlD4ZVQZBmfjmLg
 8mWIC2OPuMgonY7YvIOFmnX6U940XEQEcLHCbInp8Uj73Nn/ioeGW4gCq9mp3D2OfTEeVzIPMEq37
 CIIlxLYhHvLcjpxMBux+Ltvw9R4E+4QEM7evAw86TveXuIJRG3wDTokFruiQVHactojs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FPOB9/LhhNolHMWfaKZ2hWCuBSSjRf0Ctgup9iENNso=; b=V
 kJ1UAiZZ9jjKsa7VvG75grORKvTaq1hcp0JvGxgfhpgytOVv8ibT0RlXc9eloQKaFv+aw7GDsCPfZ
 YfcTu5T5l/P5mA7PvxA6BuiunT7gKeWV9kSQnIm7jW/vMYooVbtONYp6QCC/Kkz0McSOLtpzLDqEJ
 3VkhsXTbLtM5p79M=;
Received: from mail-pl1-f172.google.com ([209.85.214.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wPzhw-0002rr-8f for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 May 2026 09:28:49 +0000
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2bc7b311e77so25932485ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 May 2026 02:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779355723; x=1779960523; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FPOB9/LhhNolHMWfaKZ2hWCuBSSjRf0Ctgup9iENNso=;
 b=isy5ciKdBhvpk6Ro2MyjaA42gnWjMFPbGZbalyrBnPXvGYJPZeS87Qtcga4bCj67bn
 8XDBPMNJYfIWp1bS8wKombjYfq1Trz8o1TD5NRI3phey+ByISkCHK3/biff1PUb7G5lt
 nkvM4FsuOSzr5WQfShvQ/8Az6gWOhYnfBoLwWW9aVk2sFouH4MWkb7hm85iB2G7/pflf
 xEGimBskBkNkIDtQMsvnecCag1fQCoki222gdpIlwokPXl51lZzEvhAs+l1Oya5pQyMd
 iE15Kqd/0KE6XO3AQHrCDres4pHcvlK1j2Ew7IFN7mYm7Af+jbypX7+VOC/sPiVEDOS3
 GhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779355723; x=1779960523;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FPOB9/LhhNolHMWfaKZ2hWCuBSSjRf0Ctgup9iENNso=;
 b=lSGm9YCQtb8GrzZRfxF3hwCGTWaL/78NMi9SvnMUIE6fx0QAKDW5ydY9/rZHYl7y4V
 Paw6YB+IsdzE3sgEyz3Io7hvsHe1vR4JG7LimuUZL4fELXhVGTN2NWwawM2OmZammIhf
 WwkTQj8rfzioFL0LkLa0Jn3rMixIc35Fu1BeGIn10fkjWGGdIpUv0A6TsWsUToE6tKRj
 Kj7mx3+rxpPyBLbghdVyOviNgKLZOF7L/cq3BlvgU/4XIyq7QjhwLDJJr0/tVXbFOWZ0
 vrEkbGCAjdtH8BOg9TDgfM2aCd22WPF7Dl/ukc29jC1YYVW0PHlz7+/h4Ef8rJVdktGy
 6Rnw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9mgLqa2YPyIyZZm/Cj/EpnUd7NucJXh4+ym5ukN+Js5Nv0BUYtgVmpSoKjd0yQNqFEaCOJLXIBfnlGXFbKa0Np@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxWw64d7txjqqjY6JWU3duqg7ANKwXCTPLcvpowaZgsqQaWIozk
 LjGQ7bfTSU9eEkyuFlhtQTd4tpaDXVrhpuNBHJsJcRoqwqQGaEdcZJ/w
X-Gm-Gg: Acq92OHH8BSgzbQzp075ieGfSjLVg3pBFz/BfMYRgtbv57ukPUFXr2WxAjtnh1st5HK
 qkgilmtfMbevJb1NdwI0vEUstDw1RKCvfTX5h9zGpq3hj07zUD45a5uZmBs81eslfivLhBicq/9
 kNU6xccXZo/CRLdXEXSmfGTw/Z2faN17S5pAUKbb6qdzgZndBCRIyAS7m5RTQPzaOZeXGXJkQjf
 voSBn8eNMxZ0msNapDJwvDLq0PBFY0s0KDn0JxyPHeKBJ4jtXWRBI741ftXlkFu9/sCyBwhLdER
 Iv3roIbwwezOVt32b08o52fnt6xShvw1lB4S7vY5u3s4168n83HZKyVZJ5sg/Iy6wDfLZzDwlIE
 KHwPCDCv+Q6IhWiXOnsaSXfx/QoCyvR45p/XzeZiefpVWBkjEUSskEDJKbyTc/nXgGDQoezRZQu
 5n2Rv2qNSB4l81d5quvrs4pifKNcSDxG5a3Ll9nIFA/NcUZvuXjUiUcFHy6kE=
X-Received: by 2002:a17:903:350c:b0:2b0:6068:4c5f with SMTP id
 d9443c01a7336-2bea21d2cafmr21681565ad.8.1779355722567; 
 Thu, 21 May 2026 02:28:42 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bea9495041sm4898095ad.35.2026.05.21.02.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 02:28:42 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 21 May 2026 17:28:35 +0800
Message-ID: <20260521092835.1930997-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The user.fadvise xattr handlers read and write an unsigned
 int value, but neither path validates the full VFS xattr input before using
 that synthetic 4-byte value. removexattr("user.fadvise") calls the xattr
 set callback with value == NULL and size == 0, which can dereference NULL.
 A normal setxattr() call with a short value, including size == 0, can also
 make t [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.172 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
X-Headers-End: 1wPzhw-0002rr-8f
Subject: [f2fs-dev] [PATCH v2] f2fs: fix user.fadvise xattr input validation
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
Cc: qwjhust@gmail.com, linux-kernel@vger.kernel.org, qiwenjie@xiaomi.com,
 stable@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:qwjhust@gmail.com,m:linux-kernel@vger.kernel.org,m:qiwenjie@xiaomi.com,m:stable@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,xiaomi.com,kernel.org,lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: CD1A15A255C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The user.fadvise xattr handlers read and write an unsigned int value,
but neither path validates the full VFS xattr input before using that
synthetic 4-byte value.

removexattr("user.fadvise") calls the xattr set callback with
value == NULL and size == 0, which can dereference NULL.  A normal
setxattr() call with a short value, including size == 0, can also make
the set handler read past the provided value buffer.

The get handler has the same length issue in the other direction.  If
userspace calls getxattr("user.fadvise", buf, 1), VFS allocates a
1-byte kernel buffer and passes that size to the filesystem.  F2FS then
returns 4, causing VFS to copy 4 bytes from that 1-byte buffer back to
userspace.

Treat a NULL value as clearing the large-folio inode registration.
Reject non-NULL user.fadvise set values whose length is not exactly
sizeof(unsigned int), and reject non-NULL get buffers smaller than
sizeof(unsigned int) before using the 4-byte synthetic value.

Fixes: 39774f27deaf ("f2fs: another way to set large folio by remembering inode number")
Cc: stable@kernel.org
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
Changes in v2:
- Add a comment to describe the removexattr("user.fadvise") NULL value path.
- Add Cc: stable@kernel.org.
- Validate the user.fadvise getxattr buffer length as well.

 fs/f2fs/xattr.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 84273936f2a0..48bd25e3d266 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -45,10 +45,13 @@ static void xattr_free(struct f2fs_sb_info *sbi, void *xattr_addr,
 		kfree(xattr_addr);
 }
 
-static int f2fs_xattr_fadvise_get(struct inode *inode, void *buffer)
+static int f2fs_xattr_fadvise_get(struct inode *inode, void *buffer,
+				  size_t size)
 {
 	if (!buffer)
 		goto out;
+	if (size < sizeof(unsigned int))
+		return -ERANGE;
 	if (mapping_large_folio_support(inode->i_mapping))
 		*((unsigned int *)buffer) |= BIT(F2FS_XATTR_FADV_LARGEFOLIO);
 out:
@@ -74,16 +77,26 @@ static int f2fs_xattr_generic_get(const struct xattr_handler *handler,
 	}
 	if (handler->flags == F2FS_XATTR_INDEX_USER &&
 	    !strcmp(name, "fadvise"))
-		return f2fs_xattr_fadvise_get(inode, buffer);
+		return f2fs_xattr_fadvise_get(inode, buffer, size);
 
 	return f2fs_getxattr(inode, handler->flags, name,
 			     buffer, size, NULL);
 }
 
-static int f2fs_xattr_fadvise_set(struct inode *inode, const void *value)
+static int f2fs_xattr_fadvise_set(struct inode *inode, const void *value,
+				  size_t size)
 {
 	unsigned int new_fadvise;
 
+	/* removexattr("user.fadvise") passes NULL to clear the hint. */
+	if (!value) {
+		f2fs_remove_ino_entry(F2FS_I_SB(inode),
+				      inode->i_ino, LARGE_FOLIO_INO);
+		return 0;
+	}
+	if (size != sizeof(new_fadvise))
+		return -EINVAL;
+
 	new_fadvise = *(unsigned int *)value;
 
 	if (new_fadvise & BIT(F2FS_XATTR_FADV_LARGEFOLIO))
@@ -116,7 +129,7 @@ static int f2fs_xattr_generic_set(const struct xattr_handler *handler,
 	}
 	if (handler->flags == F2FS_XATTR_INDEX_USER &&
 	    !strcmp(name, "fadvise"))
-		return f2fs_xattr_fadvise_set(inode, value);
+		return f2fs_xattr_fadvise_set(inode, value, size);
 
 	return f2fs_setxattr(inode, handler->flags, name,
 					value, size, NULL, flags);

base-commit: 520760b9f9156bf9698de38dc44c614fad68a1f9
-- 
2.43.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
