Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hdNRIs92KWrxXAMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2026 16:38:07 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C7766A47D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2026 16:38:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=bl9R1GEF;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=PpwoPaKU;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="h pHCkTJ";
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=m3yNfCT3;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NEeijFWtrK1tsX4O4RB8YArDgAjsTNu/Sz+mG9GNe4c=; b=bl9R1GEFOZeQZl/aY70Gvz/YXB
	ZhbDfFdunEPn9DPCxLI5t3AmukC9CVa9U+swhrHtpXbbyShbIfmoCqalvVmA/Y0PFQAgjvj/TYlGK
	N3qAlL+HdY7vvTtsBuqLXQZSZAA/t6sjohmAGifkGb5okO+pn2NgCboCdxX6p7fqWPEQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wXK44-0004MK-Aj;
	Wed, 10 Jun 2026 14:37:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wXK42-0004ME-F5
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jun 2026 14:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F1+YOu1BnrsSirsX3jkKI3Fi36Vcnyy+9NfJLa+Vbcg=; b=PpwoPaKUcZLIIaGNcuXC2BXQtL
 2RDtJRyxZPheyF76tnnR1RsagiKt2A4UD22jGbH2cnZtQvL1yTRAWyv3JgNRvABMlkwkvLHQyXem0
 9QJvZ2/PbQDt7IaGn4vmSVaLNZMUpj9sYTmtcGKxxfc8/al+ZPZDqSTxIA0qFpmCWSM0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=F1+YOu1BnrsSirsX3jkKI3Fi36Vcnyy+9NfJLa+Vbcg=; b=h
 pHCkTJqs0dforxloNYBjpio/zjcDUUzOBybnKSf+J/eX8PGaIuOb2OfwJtcZ0xkOQFZEHwX3H1rvj
 EAjdaoUcWJbJaPzjF+n5acE0b7CxzjMRM8HoXBvQjBWge3/OYh5jtDQdjQiwc5krwjVO4O8KF1Jb5
 p6MKl+3eXsHSUjPs=;
Received: from mail-pl1-f176.google.com ([209.85.214.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wXK3v-000538-9d for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jun 2026 14:37:51 +0000
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2c0c2a68d01so46208395ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 10 Jun 2026 07:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781102262; x=1781707062; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F1+YOu1BnrsSirsX3jkKI3Fi36Vcnyy+9NfJLa+Vbcg=;
 b=m3yNfCT3m6XDVBmcR8sXae4NxeuPg66PaSRErrCoLcsAGBM0kUnjkp2ruwJPcihxVF
 umJ4n83t6ei8KFoihwO9jUxW1vdbMh3kfnvdhxO+dhSAr5SfRlMPZnYfwZvrSPn+R9sC
 xMo5K2EOthhe6NxHcW+o6O2oNXzDi/SjEEh+QFtxPALtJ9/ZCvXoPG0dk1Ti0+vh8+nH
 wclsn+qicNgLLrNrCHS1Xa5YsC7Hdedcryz2x1Ymx0/R+0Yds47+OqvXlhFtgmbrujVF
 xMosnn6OLp4b9XK5BneTwIoqiX+5AOBwBOORSd+sSU06GbgSLDgAfjT9Gfjs+3gc9aay
 9nYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781102262; x=1781707062;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F1+YOu1BnrsSirsX3jkKI3Fi36Vcnyy+9NfJLa+Vbcg=;
 b=jiTghGWd7XDj5nvo1Sytb/3puk1vQMWUUJX+jT7KuvGupa+uPOV0PooROAe5Qk0WIB
 RAyZh5mqEwQrDepQUdX23HuqmAoJxA/2SgbWZHkUcnbnwoQIoTtLJbfHSeDVCLeI/MNF
 jeSgqE3HVv2afMMoCKHpMRUZyACDfJvtMzHoISbL3Mp8UKYB5vJonEZEMSsP2dskxbLt
 v2VtFi0k5CqxH2wipZTTWRJJZbnVERSm5sqx4gGLnQ/kmikoOFmpzcFOiEC9ir1+Gy9e
 Pv5X1HA4qd/3Q/HNaxEIUoMQJazRMwj8JrwfQu6ou2SfTM3i7baiuUu7EwueobbASkmE
 ym3Q==
X-Gm-Message-State: AOJu0Yz9Z9EegtHLGMLxoJkWxUwNg6XmK5spMEr/+4xwEMZPgfAgE5Ml
 ZJI4lSW4Jg1SiVwmQ3KzCnKtScGISZdiFrRHz1M6VzbBJnSK5QXrTzD/NwdCtOF3
X-Gm-Gg: Acq92OGKf21YLAKEP1w7s9G7GIX7O3qIj0CdacUs2Ivi2qmTuE2U83mtSxvw2M2FUj3
 HnUhWHH4fpw/nBtUnSBepT/06Cy0VUghAQTrXwG4ilirXKE9kHJ2QhHdEebR7mKHhV3gK2rgfih
 xHixoHDp+6VeEn8UHi6915+lLrrlZypMTJRdNO1V3es7NftKSWq3kZEC38lRWjPj5yP8X1UOPtU
 kEWr9eI15CKqH+iL9SscpJ9XJ4gr2yzIb64VClNGwET8Ss9rnO0KBCr9Ebyfylq30Yn509ezAFY
 sx2xovVBYLx7rlYttl8lynMMbDgN2j3gI9TbJpNjYDsj1d4eWMixWphgMLdN8p0zkqqR7LYutnK
 I4OunMtzQ7S4MHhwy2fkbCcpotEI6J/Nw7GOOORXOdtEoKtqZ41qKF0c2vKaRD9jHE/66Ot+NDx
 Xhw5XkXe0XoJZFgVdhG5hD//0yvRSQ9NCDT3rCMyMrhSNqz4ijVzJRcFC0yVuBkvz4OsDppzHJu
 xEEm1Uv
X-Received: by 2002:a17:902:f24d:b0:2c0:d9b7:b7b0 with SMTP id
 d9443c01a7336-2c1e8220afbmr192932305ad.31.1781102261947; 
 Wed, 10 Jun 2026 07:37:41 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c16609e636sm250540465ad.51.2026.06.10.07.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 07:37:41 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 10 Jun 2026 22:37:35 +0800
Message-ID: <20260610143735.3169935-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: F2FS large folios are only enabled for immutable
 non-compressed
 files. Writable open and writable mmap reject such mappings, but truncate(2)
 through f2fs_setattr() misses the same guard. If FS_IMMUTABLE_FL is cleared
 while the inode is still cached, the mapping can keep large-folio support
 and ATTR_SIZE can change i_size. Reject size changes in that state. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.176 listed in wl.mailspike.net]
X-Headers-End: 1wXK3v-000538-9d
Subject: [f2fs-dev] [PATCH v2] f2fs: reject setattr size changes on large
 folio files
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:qwjhust@gmail.com,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,xiaomi.com,vger.kernel.org,lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A0C7766A47D

F2FS large folios are only enabled for immutable non-compressed files.
Writable open and writable mmap reject such mappings, but truncate(2)
through f2fs_setattr() misses the same guard.

If FS_IMMUTABLE_FL is cleared while the inode is still cached, the mapping
can keep large-folio support and ATTR_SIZE can change i_size. Reject size
changes in that state.

Fixes: 05e65c14ea59 ("f2fs: support large folio for immutable non-compressed case")
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
Changes in v2:
- Drop the obsolete user.fadvise/chmod part and keep only the ATTR_SIZE fix.

Tested with QEMU by clearing immutable on a cached large-folio file and
checking that truncate(2) now fails with EOPNOTSUPP.

 fs/f2fs/file.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6edf0105dbc8..80a64f0ff9d6 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1098,6 +1098,8 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		return -EPERM;
 
 	if ((attr->ia_valid & ATTR_SIZE)) {
+		if (mapping_large_folio_support(inode->i_mapping))
+			return -EOPNOTSUPP;
 		if (!f2fs_is_compress_backend_ready(inode) ||
 				IS_DEVICE_ALIASING(inode))
 			return -EOPNOTSUPP;
-- 
2.43.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
