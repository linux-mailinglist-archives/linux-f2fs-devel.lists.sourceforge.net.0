Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cA6vLCfDDWr32wUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2026 16:20:23 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F3058F78A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2026 16:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ASdaGurS13Mam4/daF2S0VT6/g8nz0rLqLg30A4XBD8=; b=Bop6WZSzXd+nKjeKqwDjyjVdJF
	i36S+WQuJXpea7riq1fNRdyWDW3BZ+TAiwyWFzw8zBJf4s9Obl2wgMKl8gJnou75GbeY2MFBnnrX+
	8p2uNKcRugUKU2p6hhup06eHn0OYgxWcvOFgW5QoqYd0LXQNAWDDaRHHPRo9u+azkQt4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wPhm9-0006LX-WB;
	Wed, 20 May 2026 14:19:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wPhm7-0006LO-S5
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 May 2026 14:19:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N/optvoqfk3MFiaoqRCWHtWPUy3J4YhFqwK2eGRiasM=; b=ECOjnHE8qXHxy6vB99Au1odyPt
 efOMhzt5e9UfpCzNxC4Db45lxuvzmopmrwaxNmPfAPqvSA7FSp93RPcwTvozdfcfgSqjswbUjUoWr
 hvD3432VkfG3EHGwCOU70YREYkzwJInvsghTNKRn7/k0o+ZqvHxoNQ1UMtydFIfVuhcs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=N/optvoqfk3MFiaoqRCWHtWPUy3J4YhFqwK2eGRiasM=; b=T
 0VE217VcBmjY7+fPpxoAbHV/Pr3E1ssqm3ONh0FXutdSURu+ad1hQCeKyrrNj/38s0aFosDzO/GOJ
 Eu3AFm7gmUJnaE0KV1U6d6Kx0b0Lu4Fr5gFifzWz89/mVaqZjYID1ws1MceRR1EYzJbdCSeyMCbXU
 O79RbYWSZ/J0vG9k=;
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wPhm3-0004KQ-VQ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 May 2026 14:19:53 +0000
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2bc85eda6b6so23463385ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 May 2026 07:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779286782; x=1779891582; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N/optvoqfk3MFiaoqRCWHtWPUy3J4YhFqwK2eGRiasM=;
 b=jnKyOMcTbFtdamezg40g3PVkGSFAqotsXo6VOfgqlrsAcYwicC/fGD/9SBJCJYUyRi
 q5eZVgqz1j9W43vFZMSZC07fHwK6RUTpg7QqF5FgskFIFf+KY5jWrhPS2yo589cqe4Fm
 ywl9OtewOkOYA8TANLwXqjyu/gah7jEyfLI4Js5m4TFj78QEbGk7g2NrCH9AL0oHQUwv
 d6EdJJ/ISX+4cNeJjWixzqIBrCjR67OFcrG7Z5whEizrLYsU7xoBkTDdb4WX9/wsYdPW
 Qq3TVXCj/4sf7RcIsuSq+NjqFlyn6NEYHH0yn0yxlStjkwyqr6xrobIPMduXIB5nCKHM
 ICzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779286782; x=1779891582;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N/optvoqfk3MFiaoqRCWHtWPUy3J4YhFqwK2eGRiasM=;
 b=eltaGEb/DVBex3dJtjwbZCTrh0NBQ4fbe9N0sDhgMlsqoEekN6zD0mm/r2BT3W3aPL
 xOANPBHoVxiN4LmGIGzG4I6ZP7IoOgAkaLCTKGZ3p8xqm7yMAyemL5qouXlFELuD8HF/
 vMDkP1dFRy8fISNEQu2rC6xOxezG7TWuQ3zBCZRgOMUrXfAO32+2xnErNJVS60kn2+d+
 jaA/M+VMJahV/WRI2wvUBBY617mcs34pzDCyTtmmBTYznIcqY5zXwb3Y4cxOf0QP4m8m
 sK3dekqJbEXzisPAeezer6zQ57N2XNbrKVoIj9lmSJ23f1m5K30B7UR22MVnDh0yNJoq
 Lh7g==
X-Gm-Message-State: AOJu0YyNywmaGzLx3j9hjGoB8hH4jSpR48oEhBWWsjSAltETC+E4OGNA
 sC0UK6UNmWNexR8T3TUt7USfCycHBsMuyX/K/IELxAJ1wMyd7LgStxOz
X-Gm-Gg: Acq92OFK3tWJa4VuizNqHvwM1rxu8lIjdV5lKibM4LMjH/fotdONFcwdE9TX4c9jwVB
 oQuD+MW+SGd5l8z0yGY68eNbJjvnUcxQpKOpHM62gWaaZGCkHxCykhP6Mbd978PV/d7DCbHxnb7
 +ezG4GBePVt75MwC5Ibxmxw2FHsIki0Dw/oxIpf8gZH+Muobgo21nDyNGqLgdtNWFaEY8Yfg1vr
 X7gD0Tz97cJQdrO/O7w1Hj7aW8q8vUx7QtNwptIV847NPWJAmQGETHL7E6Baf8dFVTt1wBMyQpN
 gGagq+DZVZIibVOVkWKWWEn5og1xHhriwcd9bw0XM4dQ39S5kyUH3SM7H6cVx7lCq6BlPYOkfuT
 3/STr0jxL32PjYwvhvQe2tJmenPlV+F/t+NSppPSx6EBTOJbaGb1C38azJSXiaDodqaJlrNJyNQ
 w6D8NRPjRGszNkHaRL9Y9RS20RUVaArB16cegfDzBY6VKbbHB6IskC+wN2Xm82hOmTGCTdig==
X-Received: by 2002:a17:902:d591:b0:2bc:78ec:54cf with SMTP id
 d9443c01a7336-2bd7e831f01mr270433185ad.9.1779286781647; 
 Wed, 20 May 2026 07:19:41 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c05f287sm298281985ad.24.2026.05.20.07.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 07:19:41 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 20 May 2026 22:19:35 +0800
Message-ID: <20260520141935.1363513-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The user.fadvise xattr handler reads an unsigned int directly
 from value, but it is also reached by xattr removal and does not validate
 the supplied value length. removexattr("user.fadvise") calls the xattr set
 callback with value == NULL and size == 0, which can dereference NULL. A
 normal setxattr() call with a short value, including size == 0, can also make
 t [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.177 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wPhm3-0004KQ-VQ
Subject: [f2fs-dev] [PATCH] f2fs: fix user.fadvise xattr input validation
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:mid,xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 41F3058F78A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The user.fadvise xattr handler reads an unsigned int directly from value,
but it is also reached by xattr removal and does not validate the supplied
value length.

removexattr("user.fadvise") calls the xattr set callback with value == NULL
and size == 0, which can dereference NULL.  A normal setxattr() call with a
short value, including size == 0, can also make the handler read past the
provided value buffer.

Treat a NULL value as clearing the large-folio inode registration.  Reject
non-NULL user.fadvise values whose length is not exactly
sizeof(unsigned int) before reading the value.

Fixes: 39774f27deaf ("f2fs: another way to set large folio by remembering inode number")
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/xattr.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 84273936f2a..4e11d774a2c 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -80,10 +80,19 @@ static int f2fs_xattr_generic_get(const struct xattr_handler *handler,
 			     buffer, size, NULL);
 }
 
-static int f2fs_xattr_fadvise_set(struct inode *inode, const void *value)
+static int f2fs_xattr_fadvise_set(struct inode *inode, const void *value,
+				  size_t size)
 {
 	unsigned int new_fadvise;
 
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
@@ -116,7 +125,7 @@ static int f2fs_xattr_generic_set(const struct xattr_handler *handler,
 	}
 	if (handler->flags == F2FS_XATTR_INDEX_USER &&
 	    !strcmp(name, "fadvise"))
-		return f2fs_xattr_fadvise_set(inode, value);
+		return f2fs_xattr_fadvise_set(inode, value, size);
 
 	return f2fs_setxattr(inode, handler->flags, name,
 					value, size, NULL, flags);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
