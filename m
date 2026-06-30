Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wVhSIB19Q2oFZQoAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2026 10:23:57 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D82286E1A16
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2026 10:23:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=HEYMyTdO;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=W+kA94T+;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="j KBFXrt";
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=W0qnczOI;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3/x0kiTq2yO9PH8i1/jt0Iy8drzZhoII4CCKGecrg/4=; b=HEYMyTdOPo1pt87A/dHkZzxJq6
	RCG6vKBskfBxJhcUsvXbCduvju57WWrR1344OUqm1+uoRDQNPhqqGG2OJ9q0kDWOmqaUVh4Yrhn8B
	lcHs9LY3PqOffKNtPwHE17h5I4ca5QcgfcSMFjHOBQGffwBj6m2PbOkAm6b7fg1uzigk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1weTky-0005Et-2g;
	Tue, 30 Jun 2026 08:23:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1weTkw-0005Em-Ko
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jun 2026 08:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ai7j7K4SitNJNYHWTCBnxrcpwUg65/T2eSrR4aBgQtw=; b=W+kA94T+WvYk3R/w1aDyA5FhjD
 QHL5Ai9eAH9BHUBp/Lyhh2cQn1qqi+UTRHlUSsi58cq/MmJ0J21pxyedjHrVckz2phUWCTGbT+owl
 Mq6gQxiPeKo0o/fgc8j0u1vcVHDMHefEqGtl3PRvfZfDXA74v1J00AaDmBxznetf7v7Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Ai7j7K4SitNJNYHWTCBnxrcpwUg65/T2eSrR4aBgQtw=; b=j
 KBFXrtv4656TwWsLm3NdeJuXZ+dI6BfrS8gwZML2z5d9yrm33LzAn+TGICfBDPd+mOvvfrc/RaXLW
 pdXdfhHojSugmQ9mXcoyD2UGBU0wjVceJMldlDbWtqGk5JIlQxh1mBdqUzdeN68xt/NmykzpzYbQv
 13Gq5g7IU47XfLCI=;
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1weTkt-0002EO-IZ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jun 2026 08:23:46 +0000
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-36b9d265355so2070191a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Jun 2026 01:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782807818; x=1783412618; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ai7j7K4SitNJNYHWTCBnxrcpwUg65/T2eSrR4aBgQtw=;
 b=W0qnczOIdMZKKG8HCbHf54L+bVo7k6hmPM6lKqNksU7qCvUCZjUeMKOsN73LNV8w+A
 NYo5nmFsA4+H5kHl4jMWZz3oWjl7bgaVH1fwdZnPsKjCH2g8Lh61as5cjVcGDCuO41OH
 T1R+HLK+1MbI17z5tacZUw23cfQ9rU2ZB8QKve27JOskjs2uYkfIJm2XbzB7outqLTrf
 JyWdKIx30mUGXmX69nBpyYp08uLFAIqzLv+QYqxuMRbk1vlzfAt6DVts45s5vQjdYFP2
 +7mtrJR2gsm9IWoCf6MCwX10Ln/m/U/MIUb1yE0iDCcLkguXuEzWVex2ebnWjdbUGYlf
 34YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782807818; x=1783412618;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ai7j7K4SitNJNYHWTCBnxrcpwUg65/T2eSrR4aBgQtw=;
 b=Zwdn6tCpaZnRg0DaeUx8UQ2POtFwqp0bRzRQOg84t8/7/oX0ggc4XK6zlzQ/aA29rn
 ZXVKOc00T8XmhxY9rA9uLkLrocGdRUiosgBqgDxXC18FXTqDBICPoc7lef8A5u241L3I
 Ul/vak2XA+O5I+d0/dAvqhP96sv4xW5EsEkTamjgZvYwgYow8MMaOJVjSA+5gYmf165I
 4XjVQinebxP0je44TnMYQ/N3QcAl9Za5wcfz07ryvTygBKiKpLaeJPdZ36J5f9s72LBQ
 QoUFRlDShqRHcvOhw2nSx4VbGw2t9QQeV8kwpiyUpOyoRRDroJ/OVs/ALFm2LCvhQ+W0
 wgHw==
X-Gm-Message-State: AOJu0YxbQBvj3FoDWz8uwXHQFJZtY7Deow6hxxhSSTj0+q9rdq9btVLA
 k5yUkS1kOgF/NWFaDhuoJoGojMsMW+qf0i+Zpq497drhZPT8d8/Q6WFD
X-Gm-Gg: AfdE7ckgWd3g2I4iIbUShwH9h6juSSiryyGWHRP3Yd/RMe/L+y7ifMCKaqawWyq3AF5
 HEEGutavOFd795D7WQy+ISkPjRxrWIQzkeKq3TJ72QGrTRKR73BI5i5QsxuHMXf5ubODmKbvxa1
 cb8vO7cDioJ4w4xeps5zciJo6avbE6Gq5RcR0NGYSX6+YrCfhoGI7/CbjrBaeg+Tx86tFLVLRDo
 1SdupF1L90SBo9aTbOaUz64sohuSYwwphJKKsIvRO+wLDKjrrr97mqVCc4b6zZ6qpr7dfTAW12O
 02XbiIBBr+6AKv/iWo2nedhhtIJhVLH/ysB15d/7vQVgpCFTCDaxLiL+7ncLtbUk2h9f1L+C4gR
 yU87tMJi/8k2EMiO6nIHRHeMs/RkiRxPR5Zt1oaf+43rNlDLuEi1GRwb4KOSLmixjGbmr0j/TcR
 j8Ql7IS/oDhj07hVXhY7fQqs1XupujUHEXR/bdxTOFqDN7z1mn
X-Received: by 2002:a05:6a21:3949:b0:3aa:f9cb:d438 with SMTP id
 adf61e73a8af0-3bfc50b3d1bmr2362651637.21.1782807818196; 
 Tue, 30 Jun 2026 01:23:38 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c9bbc6d9ed9sm1108183a12.7.2026.06.30.01.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 01:23:37 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 30 Jun 2026 16:23:30 +0800
Message-ID: <20260630082331.2757376-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: F2FS stores recovery filenames as a length plus a fixed-size
 i_name buffer. The buffer is not NUL-terminated, but recover_inode() and
 recover_dentry() print it with %s. For a 255-byte filename, recovery logging
 can read past i_name into the following raw inode fields. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.51 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1weTkt-0002EO-IZ
Subject: [f2fs-dev] [PATCH] f2fs: limit recovery filename logging to stored
 length
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:qwjhust@gmail.com,m:stable@kernel.org,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,xiaomi.com,vger.kernel.org,lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D82286E1A16

F2FS stores recovery filenames as a length plus a fixed-size i_name
buffer.  The buffer is not NUL-terminated, but recover_inode() and
recover_dentry() print it with %s.

For a 255-byte filename, recovery logging can read past i_name into the
following raw inode fields.

Print the name with a precision bounded by i_namelen and F2FS_NAME_LEN.

Fixes: f356fe0cba0e ("f2fs: add debug msgs in the recovery routine")
Cc: stable@kernel.org
Assisted-by: Codex:gpt-5.5
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/recovery.c | 41 +++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 89af8407b667..3fecfdbd5958 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -158,6 +158,22 @@ static int init_recovered_filename(const struct inode *dir,
 	return 0;
 }
 
+static const char *recover_printable_name(struct inode *inode,
+					  struct f2fs_inode *raw,
+					  int *name_len)
+{
+	static const char encrypted_name[] = "<encrypted>";
+
+	if (file_enc_name(inode)) {
+		*name_len = sizeof(encrypted_name) - 1;
+		return encrypted_name;
+	}
+
+	*name_len = min_t(unsigned int, le32_to_cpu(raw->i_namelen),
+			  F2FS_NAME_LEN);
+	return raw->i_name;
+}
+
 static int recover_dentry(struct inode *inode, struct folio *ifolio,
 						struct list_head *dir_list)
 {
@@ -170,7 +186,8 @@ static int recover_dentry(struct inode *inode, struct folio *ifolio,
 	struct inode *dir, *einode;
 	struct fsync_inode_entry *entry;
 	int err = 0;
-	char *name;
+	const char *name;
+	int name_len;
 
 	entry = get_fsync_inode(dir_list, pino);
 	if (!entry) {
@@ -229,12 +246,9 @@ static int recover_dentry(struct inode *inode, struct folio *ifolio,
 out_put:
 	f2fs_folio_put(folio, false);
 out:
-	if (file_enc_name(inode))
-		name = "<encrypted>";
-	else
-		name = raw_inode->i_name;
-	f2fs_notice(F2FS_I_SB(inode), "%s: ino = %x, name = %s, dir = %llu, err = %d",
-		    __func__, ino_of_node(ifolio), name,
+	name = recover_printable_name(inode, raw_inode, &name_len);
+	f2fs_notice(F2FS_I_SB(inode), "%s: ino = %x, name = %.*s, dir = %llu, err = %d",
+		    __func__, ino_of_node(ifolio), name_len, name,
 		    IS_ERR(dir) ? 0 : dir->i_ino, err);
 	return err;
 }
@@ -282,7 +296,8 @@ static int recover_inode(struct inode *inode, struct folio *folio)
 {
 	struct f2fs_inode *raw = F2FS_INODE(folio);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
-	char *name;
+	const char *name;
+	int name_len;
 	int err;
 
 	inode->i_mode = le16_to_cpu(raw->i_mode);
@@ -331,13 +346,11 @@ static int recover_inode(struct inode *inode, struct folio *folio)
 
 	f2fs_mark_inode_dirty_sync(inode, true);
 
-	if (file_enc_name(inode))
-		name = "<encrypted>";
-	else
-		name = F2FS_INODE(folio)->i_name;
+	name = recover_printable_name(inode, raw, &name_len);
 
-	f2fs_notice(F2FS_I_SB(inode), "recover_inode: ino = %x, name = %s, inline = %x",
-		    ino_of_node(folio), name, raw->i_inline);
+	f2fs_notice(F2FS_I_SB(inode), "%s: ino = %x, name = %.*s, inline = %x",
+		    __func__, ino_of_node(folio), name_len, name,
+		    raw->i_inline);
 	return 0;
 }
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
