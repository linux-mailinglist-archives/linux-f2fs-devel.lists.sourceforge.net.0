Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMkALAyFFmqCnAcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 May 2026 07:45:48 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D72965DF89B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 May 2026 07:45:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5/K2ymU2KWDD0WuNnzsT6dUEul9XqQl8UhQ/Coc63LA=; b=i9oPU+Go2P7UIzYM+nwUcyD3hO
	QRRWcHrra5kLb+q21ltE83gJzrmvvhvVSQRPgEezjx1HX62ftaTk56OlLU2z4P0D+QSmrWFj4u4YK
	q0AlNRm3UoWPIt/k9Z2RUEcF0XeWmF53TL1KzcDjSyBWB4c2Xlk7cJR8ixF7aidMFvb8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wS75H-0003U8-8d;
	Wed, 27 May 2026 05:45:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wS757-0003Tu-3w
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 May 2026 05:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h+X4DuQvTJQaN7iaXZhQ6y46vX3ezvOd+9jCvVhO4J8=; b=RuuCX0uMPnRWF/GHnWA6gXi3rr
 fmFP40llhkzHxhYoQ6VeoKOOAVDeC9M1rdTg3Eqx7hUnk3723SZi5edToxyS6N47ekFF/Qh7Q1q1U
 z2xRW+kSmepX/QVKe96u9G40lU28XwFvxlat4eyrSC3Vu8eO3la9cKIsAG+4hb7Cq6jc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=h+X4DuQvTJQaN7iaXZhQ6y46vX3ezvOd+9jCvVhO4J8=; b=j
 etdzXtP8HC+1AQdXVo9TZjwNd5RWDGWkQCV6sXctiDD1BgCxPaDuK3gine34wxnZ6PFC4MFjJZvQ4
 9x7/9JI8QodeL1atYXGMSs+eAWRFTM5rXGOgDDlM3NsMVInSN+lPnrvQkk9mAmOpT96WaCo3fA+Ou
 rGqqoQq4H2DyCIYE=;
Received: from mail-pg1-f182.google.com ([209.85.215.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wS752-0005Dk-Pz for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 May 2026 05:45:26 +0000
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-c8028fa6039so7521255a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 May 2026 22:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779860714; x=1780465514; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h+X4DuQvTJQaN7iaXZhQ6y46vX3ezvOd+9jCvVhO4J8=;
 b=H55u+mANW5TERKpQy2+2jgKcjUyZo9JNFbKRGVHSPX+hmCUFhDygggrjpU8WML0DcM
 wg3iGfMCI3r9eCj3UCsW7ognacH+KM8WSMIavqAUP3UeoRWr5fqIcGkDNvLZ12D72VS7
 DDGni2Czq7ttd7rTOjglEoph/bySsiBYoaXiHQhEw0XZTWmKJ2A+z0uN9/DNkbAmMCwL
 mSXY4QH1AOIKAfnw8kMUNL9dCm9g01IZgXMtqudD30aDvgN55OeFd0g+QQO5zmBTn9SJ
 FhIpsRfxJyugh/89pbZyXBxzvrJar0MCCopa8IXn/0dm6K1/6qI5xePQXEfphdocOKXs
 lI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779860714; x=1780465514;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h+X4DuQvTJQaN7iaXZhQ6y46vX3ezvOd+9jCvVhO4J8=;
 b=PtZ2vAAOYSnZxJaxFoHlRBF5Eep/256Lc1me0etQpso6Gtm3YGKQp55Sm1q34dmJgo
 ueQAn7bFjDnZb9spugRrhwGuxTU5OcMuAYgyF8B5euvkVTfaHglBGS5mlA5a7jYJAp7q
 6Z72lAHflw7Cwjwazn65KyXyUHW8Q9kxdFeg1AKeyykXdd11qfIkQYCUWMHNujWVhL7/
 mTKH/xyeop2/Z1qYvAYbgNcMTqz8e9mwIC0XlPrEKp8mxiJCaPSthBVMUKy8Ymxs031G
 0c0R5ugUn6QgLzUjI46oC0kpDt4p36TDYl3xVg7jAjFaaJmtvK/XMRk3dr67o6qRUFEV
 nctQ==
X-Gm-Message-State: AOJu0YzR1z+O4F/Q5Z/uGiGlGOKshChC0zHD8G0I7W6CDfSWJc16kNfi
 z4lMtuC02fXW+XoGXwRBK0rmgj0JteZEKtzhp98x76+k67M8F7mCZPDi
X-Gm-Gg: Acq92OFIOo99jtF1S3//EBtSJCDvPLuY9kfs2gJ9VccR/4ofBl9iOraNrCg5YE4Jhk7
 pOX8rlJYwULFqjJHkQJyyo5o35Vsr+gg5U3UtWmdvFOXO7TI8rXq7nXIKAB51qKe0cdv0N3uANb
 V4G4kRKzg2y+SNppvvzkprctVM3zd0Y8pZ1Lv8yk+DceugVnkw0WJZfhGFtfJ8uWiavzHEP3nRp
 a18gcjnJCY8K3kxc8geo1tZTKsmfBf0LH7s5nT/dn8nb+yo+BB9k7ovEt1C4Iy5UqHuU5+zc7n5
 R0SS5/Ztg5vUbV4yf5m5+qHXMm4vCuyQOHOmIPfZCDzVQL2eXBejKBjqDVZWMhKrLwkHQNhWilR
 9Urhg4oj2GXk1s+mukI8kzQ78f5eWDIwIcgMYx3UM+ysuZuM+WgDHz3gj8Nnk3c92e1Jw2dGIY5
 LxcUKRCHIp1frQ9E62K6gbquCyabZlVnflMU4Mx2dejfA9gVRay7SM0fCokjjGPD2cUU1LsA==
X-Received: by 2002:a05:6a20:244c:b0:39f:3efb:e888 with SMTP id
 adf61e73a8af0-3b328eac3e7mr21571072637.25.1779860714494; 
 Tue, 26 May 2026 22:45:14 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c85200c3feesm11941196a12.0.2026.05.26.22.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 22:45:14 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 27 May 2026 13:45:07 +0800
Message-ID: <20260527054507.1900373-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  F2FS iostat is optional and is disabled by default, but the
 direct I/O submit path still allocates and binds a bio_iostat_ctx, updates
 the submit timestamp, and replaces bi_end_io for every DIO bio ev [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.182 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wS752-0005Dk-Pz
Subject: [f2fs-dev] [PATCH] f2fs: skip direct I/O iostat work when disabled
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
X-Rspamd-Queue-Id: D72965DF89B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

F2FS iostat is optional and is disabled by default, but the direct
I/O submit path still allocates and binds a bio_iostat_ctx, updates
the submit timestamp, and replaces bi_end_io for every DIO bio even
when sbi->iostat_enable is false.

The end_io path also calls f2fs_update_iostat(), which returns
immediately when iostat is disabled. This adds avoidable per-bio
overhead to the default direct I/O hot path.

Skip DIO iostat context setup and the direct read/write byte updates
when iostat is disabled. If iostat is enabled through sysfs before
submission, the existing context allocation and latency accounting path
is still used.

QEMU benchmark on a 1GiB F2FS virtio-blk image, with iostat_enable=0,
4KiB O_DIRECT I/O over a 64MiB file, 50000 iterations per run:

                         baseline     patched
  direct_read median    65264.50 ns  55470.95 ns
  direct_read recheck   65553.75 ns  55470.95 ns
  direct_write median   68054.62 ns  56309.44 ns
  direct_write recheck  66873.51 ns  56309.44 ns

Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/file.c   | 9 +++++++--
 fs/f2fs/iostat.h | 6 ++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6edf0105dbc8..3ad8bd660b33 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4799,6 +4799,9 @@ static void f2fs_dio_iostat_start(struct f2fs_sb_info *sbi, struct bio *bio)
 {
 	void *bi_private = bio->bi_private;
 
+	if (!f2fs_iostat_enabled(sbi))
+		return;
+
 	iostat_alloc_and_bind_ctx(sbi, bio, bi_private);
 	iostat_update_submit_ctx(bio, DATA);
 	bio->bi_end_io = f2fs_dio_end_bio;
@@ -4816,7 +4819,8 @@ static int f2fs_dio_read_end_io(struct kiocb *iocb, ssize_t size, int error,
 	dec_page_count(sbi, F2FS_DIO_READ);
 	if (error)
 		return error;
-	f2fs_update_iostat(sbi, NULL, APP_DIRECT_READ_IO, size);
+	if (f2fs_iostat_enabled(sbi))
+		f2fs_update_iostat(sbi, NULL, APP_DIRECT_READ_IO, size);
 	return 0;
 }
 
@@ -5097,7 +5101,8 @@ static int f2fs_dio_write_end_io(struct kiocb *iocb, ssize_t size, int error,
 	if (error)
 		return error;
 	f2fs_update_time(sbi, REQ_TIME);
-	f2fs_update_iostat(sbi, NULL, APP_DIRECT_IO, size);
+	if (f2fs_iostat_enabled(sbi))
+		f2fs_update_iostat(sbi, NULL, APP_DIRECT_IO, size);
 	return 0;
 }
 
diff --git a/fs/f2fs/iostat.h b/fs/f2fs/iostat.h
index 2025225b5bed..d3ef787575be 100644
--- a/fs/f2fs/iostat.h
+++ b/fs/f2fs/iostat.h
@@ -44,6 +44,11 @@ struct bio_iostat_ctx {
 	struct bio_post_read_ctx *post_read_ctx;
 };
 
+static inline bool f2fs_iostat_enabled(struct f2fs_sb_info *sbi)
+{
+	return sbi->iostat_enable;
+}
+
 static inline void iostat_update_submit_ctx(struct bio *bio,
 			enum page_type type)
 {
@@ -72,6 +77,7 @@ static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *in
 		enum iostat_type type, unsigned long long io_bytes) {}
 static inline void f2fs_update_read_folio_count(struct f2fs_sb_info *sbi,
 		struct folio *folio) {}
+static inline bool f2fs_iostat_enabled(struct f2fs_sb_info *sbi) { return false; }
 static inline void iostat_update_and_unbind_ctx(struct bio *bio) {}
 static inline void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
 		struct bio *bio, struct bio_post_read_ctx *ctx) {}
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
