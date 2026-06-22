Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zWZyLYBROWodqgcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 17:15:12 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F946B0A27
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2026 17:15:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=GCkJfqFL;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=mv9LI23N;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=TlspoRVi;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=Vd3BnEIu;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cq2nGS0us8dXKkGmfBPrwmdmiYwq0T1iL9z8llIJv88=; b=GCkJfqFLcgThzF7r8/2t8PBv7f
	L87cEhb1GDExoavgD2TLIUdANoz3lqtduNAbXNqjUJUlg005GOAkoMbXH9gr4nu6C8qxM8hyoYlVp
	UuoIrMdBy5sepY2zBtoRLVPT86Pp75qZZm6compLSNFTPE+Hzeb+J3Ckmk/Cl46a2t14=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbgMV-0007Hv-UU;
	Mon, 22 Jun 2026 15:15:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <iganschel@gmail.com>) id 1wbgMU-0007Hn-91
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 15:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XS2jT7hVM4XCWKhj2hYkN4S7SwrftLDakyjg4kfk5Kc=; b=mv9LI23N3g3ZHbelNLPp+vwAyy
 WcDNZYMeVX1XCQDUysnRGQdv0U+gIvatBlJYaaesiC7+snD6Of+39Q8n9s8DNFvbpnK5z7Vrti9iZ
 KPjFWvzpaR5JXUDUm8nyrG14TdTpl0XYkG2HjD0QtiphUOyR0kKf0JIj4U+6odvV06lM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XS2jT7hVM4XCWKhj2hYkN4S7SwrftLDakyjg4kfk5Kc=; b=TlspoRVilRuPemQjYPUH8WFUGP
 Ci+WVv3pqDlipU8UuUSxtKNaKvbrAzQHalX29e5YRC1OcWj3DTbLzM80Q5NscqjrSPdd0nxqoQUFI
 9rPSgkfbCTi7iVrHttbLbspcRQ6rn2R0Yolx0bsIvvSw0ubXlombC1cT58b5LfNdAx5U=;
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wbgMU-0006sI-2T for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jun 2026 15:14:58 +0000
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-845537740ddso1564718b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Jun 2026 08:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782141293; x=1782746093; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XS2jT7hVM4XCWKhj2hYkN4S7SwrftLDakyjg4kfk5Kc=;
 b=Vd3BnEIurHzFSH3kx948ooUK+h1bljEKqvaR7zkKiO8rrV2Rj2FLS2fKF9dJyJBWCF
 r0ZAbjwdmt82RgHL5kXrLhLI4/FsO2VCU2Ivwx/uBOK4CxCDvwq3P5EgBOscimlIjvh/
 vd2WEsWRm5r29NRpeKIwTQvdOt8iyGsXlBgqHTZowS3Vom/ZCr+HOtGZhFGTj+AxVmz3
 lQU6pIjQS/KAP7Gh8dUFOxwvXYK68hFBUZu9QZ/XBNDYJUNUcJWJ6k9RVe7Z4U97/2vQ
 sLoeRPMm/xKfnnwsVIMlf99fCVRCmvmgqFBoOEFY5TO4J37qCc/G7Hln4V3vPu38rvJl
 0HWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782141293; x=1782746093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XS2jT7hVM4XCWKhj2hYkN4S7SwrftLDakyjg4kfk5Kc=;
 b=sZ6FZBlCIJnqBAdOekvMKWBC7MIkgSGRNoHWYH7Wz593rAO4bhWx+iXxQv91m4sbSl
 g+7ExBTUtTKjLCjbtrxH7DwD7PON2XRcOTDv3XPVAvSSSrDIS6e4ohdMO/0Ccp6lDfk4
 eD9v/gFxNWU8rMPKi5g2U8BoMRmeQj40urzKAsQeiCCTJ1gNNGeIKccuCcK7zGIoBGKu
 AIDsDHoGU7ZiASNDWNL/uCccqQ1y6bRxeK67kRbO7yKJe14NmJvT7p4UYWHqCyoZVRNa
 p6L5+XdVwFtQgqF3EQdCpTlF/WnM5n7UFemvaPIzuuyXiqf/QhkWtexDJ3Umr2/lCj8C
 riNw==
X-Forwarded-Encrypted: i=1;
 AFNElJ//dtMQBl4oOhhMHQOxr/M4wux4tyCLtW5ZL5iLzYma5FJ9LHKu2AjxBuen0e5gVUEAUrdV/LtYDX1143YuMcWH@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzeSxKjuQeStPa0S/fsrVYzJrz5pa+UmhTCxSoXfLwQpnUMFpAg
 13kRZrYMQh37WRSagNsr6Z7sZtXGEPYMP5kkUP83FJq8gca9ysVWWgYN
X-Gm-Gg: AfdE7ckOqnfR2Rv1q6e5z1Ed+oF4rLEqvhIxZ0xbNnxvQhqzOAisUec7+ONbStNBmwq
 mOlNwJf9ARLBxt+kIaK8N0CYPcBt8kg1vPn1cETu8Y30zXyIX8FUyl6D6WYlJOgj+9mDb+2u/2g
 eGar5X1bVs8/mbmuLnSys4Feitq4Qdf6xNJd1s5H8oC75rgQ3sSSqSMATfeYE/kwF0GTtgo+342
 QxChWcb3Xg3S10c+m3zMAHNThagAbtHvGfXpdH5Q0oOjfM0Gh5PsrkJOL10YeFqtO88Gvf6q8If
 D0C25HFJrxATNbZCBkyoiHDrGRjvJ4bY4jOLqibR04TBhZzQuMVpdCzDghYyJRfTmEQ8ttSjWcm
 hMrRrMQ8CCxOYvgb+ijnj+U8133NHOSUW1KwxTItoEYLi2EPtm81cyM4Ts6IEShbbddIaJOfUl5
 QyRq4PxG4VMmH9n8CnJXjS+im9D/7I4hMe9WBzPbZ1mclW
X-Received: by 2002:a05:6a00:a21a:b0:845:2f67:a0e6 with SMTP id
 d2e1a72fcca58-84550b1a5c8mr15972110b3a.46.1782141292825; 
 Mon, 22 Jun 2026 08:14:52 -0700 (PDT)
Received: from LAPTOP-TMVMP5FD.localdomain ([106.222.250.238])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84564d68edasm7514146b3a.1.2026.06.22.08.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 08:14:52 -0700 (PDT)
From: Keshav Verma <iganschel@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 22 Jun 2026 20:44:21 +0530
Message-Id: <20260622151421.806-1-iganschel@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260618200105.3551-1-iganschel@gmail.com>
References: <20260618200105.3551-1-iganschel@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Validate the xattr entry before reading its fields in
 f2fs_listxattr().
 Return -EFSCORRUPTED when the entry is outside the valid xattr storage area
 instead of returning a successful partial result. Fixes: 688078e7f36c ("f2fs:
 fix to avoid memory leakage in f2fs_listxattr") Cc: stable@kernel.org
 Reviewed-by:
 Chao Yu Signed-off-by: Keshav Verma --- Changes in v2: - Add Fixes tag. -
 Add Reviewe [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [iganschel(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.175 listed in wl.mailspike.net]
X-Headers-End: 1wbgMU-0006sI-2T
Subject: [f2fs-dev] [PATCH v2] f2fs: fix listxattr handling of corrupted
 xattr entries
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
Cc: stable@kernel.org, linux-kernel@vger.kernel.org,
 Keshav Verma <iganschel@gmail.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:stable@kernel.org,m:linux-kernel@vger.kernel.org,m:iganschel@gmail.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[iganschel@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_NEQ_ENVFROM(0.00)[iganschel@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 01F946B0A27

Validate the xattr entry before reading its fields in f2fs_listxattr().
Return -EFSCORRUPTED when the entry is outside the valid xattr storage
area instead of returning a successful partial result.

Fixes: 688078e7f36c ("f2fs: fix to avoid memory leakage in f2fs_listxattr")
Cc: stable@kernel.org
Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Keshav Verma <iganschel@gmail.com>
---
Changes in v2:
- Add Fixes tag.
- Add Reviewed-by tag.
- Add Cc: stable@kernel.org tag.

 fs/f2fs/xattr.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 610d5810074d..18f495db20d2 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -581,8 +581,6 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
 		size_t prefix_len;
 		size_t size;
 
-		prefix = f2fs_xattr_prefix(entry->e_name_index, dentry);
-
 		if ((void *)(entry) + sizeof(__u32) > last_base_addr ||
 			(void *)XATTR_NEXT_ENTRY(entry) > last_base_addr) {
 			f2fs_err(F2FS_I_SB(inode), "list inode (%llu) has corrupted xattr",
@@ -590,9 +588,12 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
 			set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
 			f2fs_handle_error(F2FS_I_SB(inode),
 						ERROR_CORRUPTED_XATTR);
-			break;
+			error = -EFSCORRUPTED;
+			goto cleanup;
 		}
 
+		prefix = f2fs_xattr_prefix(entry->e_name_index, dentry);
+
 		if (!prefix)
 			continue;
 
-- 
2.39.5



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
