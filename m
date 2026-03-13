Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFdZEqwMtGlvfwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 14:10:04 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92214283794
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 14:10:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cS7XMiSElKu8fiP1DPwT2MWesfsX1rlIl6JdnoezDA4=; b=RQgiOF5oFnGZX3VYWWM5YZNiLv
	CGKE0zHI1lQXnXHiVgvOfL2qS3smeOCq81dRL8PI6URY10W0WPtSYfpEV3qgOZVL+/j5tw5tbiRfe
	TQ5oVR4XeW4wtrDDxlHgch5D6cRD6hI+fTg2noHtBAByqLKeQJ7Y7rrTjqRURQVtP2Sc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w12Gy-0005ql-Hu;
	Fri, 13 Mar 2026 13:09:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <priv.luk@gmail.com>) id 1w12Gx-0005qb-Jx
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 13:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W8/4r+E7hXjxG7SyQvVjVjAK/YrEZ+VtsKJpfeAwP/w=; b=Jp30bsC3LjZnXCf72ieG2YLijH
 D7+FLrz4q2jXrkJP5okV7wbOhW+BvrVPQ5SC3TzbAir5ldUKKt9ovwbTCWxwlMb3FKQUgisDsUItV
 lqjWqNTqLqeskFUbXTR8eH+Bl+T69FgBxMYV7aOeSLuKK3kU5ncyELzvy5HAG+PVSLOU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=W8/4r+E7hXjxG7SyQvVjVjAK/YrEZ+VtsKJpfeAwP/w=; b=i
 zwefRwdAkMeGQo+hINYJBCnnk82OGTWvvPrGZnD1NcyNubOkkzzPzIX8ie6TXE2IC7whYUSZkG4QN
 l3mNL8z1oVl31m1hNrLZ8daf6ZOlH/vzhOVNfniNr8xVUAMzhNa9kyWqAn6BG2CXkGPGeZ7NRT+Oc
 ZQJ6Zjx8sXDCIqg0=;
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w12Gy-00058J-3A for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 13:09:48 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4852ff06541so22306505e9.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Mar 2026 06:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773407376; x=1774012176; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W8/4r+E7hXjxG7SyQvVjVjAK/YrEZ+VtsKJpfeAwP/w=;
 b=YhzHq18B7BguOPopS9id0hMxthE5jB7rWeQ7i4BhWZRMsQEuRC3q9UcsTNWudL9vGT
 uOHZahWR3t0Hvnx1/CVRZ/T3sPqPQyLr2nq2P4kr5wo0TK1Wtp8d8+Fx4mkbRD7YPZ3s
 diOYlvg6FDq0dPYcuo/3K+e7h4glXqKvIEtmyLG9inU7F2uPq7lF9hpxbsrbj1ZXSuTj
 T8hLvN72wR4m39hIcUSNj2BiC2kUus7fr7cGgQL/LZBKS+AuELl3GkIlUlCsruE0Z0dE
 uH3hhEo2l/E4/dxE8+wTCiEzzWOdlWcedGY4H9cZyV4T1G5i9XaXFKLRTbp+sZlvU4Pq
 qpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773407376; x=1774012176;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W8/4r+E7hXjxG7SyQvVjVjAK/YrEZ+VtsKJpfeAwP/w=;
 b=aqg1zC9HVRgIEWxoLUV6KjS0ZDwqBuYHCykpZ2gzaqm7MTw1h3WIpQAmf/Hg0dPKMF
 OC2ZL1VQV1OrV1L/4hL34hc2ra4HefXOt7rWYbEZ97tXGuYzgfH8bbWLsS4rsY3g+daa
 lzbycVPOmrYG4VbpI5hAQV28aJbZJvjtjXExcmAhkE4NP10QPcOXUqS8k/ogNfMyAcpk
 PiwL6d84F26/8o0SyeNqv+nix8CVqh/SdUM3AHCKf9zzKUz2cHCQpiHl2tuNcaoVnB5l
 D20j4alkJo6BFCYQOFetOoMmes4znnCkqOTkO8zANUOW8RIqp/9hNd1Um2APbchz/rjm
 qpjw==
X-Gm-Message-State: AOJu0YxuZ4vmZ4yJf4+S771JBbJ3O206QXHU2cDXG+/D6HyokvIs01Li
 OBbQXd464jmGPeA8sHLSkPOsTUYSXfvM4ZNEHBvM4l5nHu7wpYOpGG5k/Ug1hg==
X-Gm-Gg: ATEYQzw372frIOgXgve5HTYag2LwtXlNjCe2oTpfUbLD4hHmyPZsTzUc4Vw2rBN0j5d
 Z+DcLkqkeGKoouuk1P+uRiIslKx58yL8dwUXom6pFHoJKtXBGYW39yz4y64urQoa/sajg/Q2IK4
 lodOPqkWNBQmuZ7v1+aq7jdyMlMp98yTPXqAbLW/t3BaNM2HUR5yNjPJvaGA38oa1jDSvmciPft
 vE4PKyAzoRKG1P/prr/lbIwM1/hL0mSYxqz5X4cSF4it+bitAySR4ny8V0h2U7Hj3TeB2SkqQid
 v+3cs9oqbi1ErkttK86iLvM0oQ6vQWr5u+qKl/IzLsk5uxM3yISESom39aROJizuvjh6rz4w9+I
 /+2o6yANyGParZfqvAks0S3nvU8RM2gJkND3IYJvYp//g8ZaAETtr6RpI1mXqQJytcoEc4xMy/W
 jOhQbO8gZbzs4BX9CXHz8=
X-Received: by 2002:a05:600c:8b6f:b0:477:5c58:3d42 with SMTP id
 5b1f17b1804b1-485566d92f3mr52067855e9.10.1773407375529; 
 Fri, 13 Mar 2026 06:09:35 -0700 (PDT)
Received: from luk-pc.lan ([89.228.17.202])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-48541aa73dasm824725425e9.2.2026.03.13.06.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:09:34 -0700 (PDT)
From: LuK1337 <priv.luk@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 13 Mar 2026 14:09:15 +0100
Message-ID: <20260313130915.1752881-1-priv.luk@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  From: Łukasz Patron Fixes: a66d49fd2678 ("dump.f2fs: Dump
    symlinks as symlinks") Signed-off-by: Łukasz Patron --- fsck/dump.c | 4
   ++-- 1 file changed, 2 insertions(+), 2 deletions(-) diff --git a/fsck/dump.c
    b/fsck/dump.c index f5c95de..7d20275 100644 --- a/fsck/dump.c +++ b/fsck/dump.c
    @@ -464,9 +464,9 @@ static void dump_xattr(struct f2fs_sb_info *sbi, struct
    f2fs_node *node_blk [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [priv.luk(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.41 listed in wl.mailspike.net]
X-Headers-End: 1w12Gy-00058J-3A
Subject: [f2fs-dev] [PATCH] dump.f2fs: macOS does not support lsetxattr
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
Cc: =?UTF-8?q?=C5=81ukasz=20Patron?= <priv.luk@gmail.com>, jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FROM_NEQ_ENVFROM(0.00)[privluk@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 92214283794
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RnJvbTogxYF1a2FzeiBQYXRyb24gPHByaXYubHVrQGdtYWlsLmNvbT4KCkZpeGVzOiBhNjZkNDlm
ZDI2NzggKCJkdW1wLmYyZnM6IER1bXAgc3ltbGlua3MgYXMgc3ltbGlua3MiKQpTaWduZWQtb2Zm
LWJ5OiDFgXVrYXN6IFBhdHJvbiA8cHJpdi5sdWtAZ21haWwuY29tPgotLS0KIGZzY2svZHVtcC5j
IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2ZzY2svZHVtcC5jIGIvZnNjay9kdW1wLmMKaW5kZXggZjVjOTVkZS4u
N2QyMDI3NSAxMDA2NDQKLS0tIGEvZnNjay9kdW1wLmMKKysrIGIvZnNjay9kdW1wLmMKQEAgLTQ2
NCw5ICs0NjQsOSBAQCBzdGF0aWMgdm9pZCBkdW1wX3hhdHRyKHN0cnVjdCBmMmZzX3NiX2luZm8g
KnNiaSwgc3RydWN0IGYyZnNfbm9kZSAqbm9kZV9ibGssIGludAogCQkJCQlsZTE2X3RvX2NwdShl
bnQtPmVfdmFsdWVfc2l6ZSksIDAsCiAJCQkJCVhBVFRSX0NSRUFURSk7CiAJCX0gaWYgKFNfSVNM
TksodHlwZSkgJiYgYy5wcmVzZXJ2ZV9zeW1saW5rcykgewotCQkJcmV0ID0gbHNldHhhdHRyKGMu
ZHVtcF9zeW1saW5rLCB4YXR0cl9uYW1lLCB2YWx1ZSwKKwkJCXJldCA9IHNldHhhdHRyKGMuZHVt
cF9zeW1saW5rLCB4YXR0cl9uYW1lLCB2YWx1ZSwKIAkJCQkJbGUxNl90b19jcHUoZW50LT5lX3Zh
bHVlX3NpemUpLCAwLAotCQkJCQlYQVRUUl9DUkVBVEUpOworCQkJCQlYQVRUUl9DUkVBVEUgfCBY
QVRUUl9OT0ZPTExPVyk7CiAJCX0gZWxzZSB7CiAJCQlyZXQgPSBmc2V0eGF0dHIoYy5kdW1wX2Zk
LCB4YXR0cl9uYW1lLCB2YWx1ZSwKIAkJCQkJbGUxNl90b19jcHUoZW50LT5lX3ZhbHVlX3NpemUp
LCAwLAotLSAKMi41My4wCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
