Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJoBEmOu4WnuwgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Apr 2026 05:52:03 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAFC416B7C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Apr 2026 05:52:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U0woYhJXwxlSdw/QGDwluME6iBVLzXMCvt3L97w31iI=; b=BMGcBFjROCOOXdqce7e2a/RUDK
	tsK2YRulcix9e+2iJTWkOFr13lDm9jSRUl+3KYnl24tdJAkTUij2neXn+Mao2UUl8LB1mMjlFSXWL
	ylNrkp72QSYKOy1rC8wxJbFQUEzsyMvaP1p1b9lhlcOWY0svyxTVyhgk6IHOxuPgVcqs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wDaF5-0007W9-T4;
	Fri, 17 Apr 2026 03:51:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wDaF4-0007W3-Uk
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Apr 2026 03:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uiMoYM6dbl34o9SsLqCiISFnk0Jr//K7m705ROB9B8w=; b=LRlDxFIA4Tafl+WhXSFyD+W4QP
 1XXe08bZrnxrQUeoXyFHzP4oWZ9X/K3yM/mz8zYW42jVBdcQaspgGDAUUfO/P/FNFzs0cTq+UuD9p
 mbpDkoDeVabzjYawzOTqV2iVembytZ9a1PZgIl/gNe6xOKzAu5P/ftMIooXdmSLsGetM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uiMoYM6dbl34o9SsLqCiISFnk0Jr//K7m705ROB9B8w=; b=A
 QeeqspoIgVLEc7T2avMlNoAZllHzVj25Iydikb2evuomzB+mEm8wyCLY5x8rqpPioYEys1nrWQcLd
 EYycJRtL/BOK+m4s6w3b5VJfkYdDi/qFcr5yQKUonKkLWUVq8yeaxFNJussrezdFb/TKCuAPc+Kim
 rOLiQ6rL2zH/MS4k=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wDaF4-0000z9-CL for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Apr 2026 03:51:42 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-35fc0d7c310so175508a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Apr 2026 20:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776397892; x=1777002692; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uiMoYM6dbl34o9SsLqCiISFnk0Jr//K7m705ROB9B8w=;
 b=KqH/9Um2/HfnF068PJ7xIuxsw2VHdrRDIc+as/toTZReYN04PvqSi4T6YLkXmU16MV
 Ot+k6GEu6v/Mm4fJ8lBPuK2qheaM2wKY7qqovtZ+qFFBTzHU5+3fc67Vmo0dzGiXxbxI
 AXCyyJlNo/B9ySK2QUNdxHG/tHs0fB/eYYLVexVVv3GdsBr1cxppO+myvhkO/vNpsnbP
 nMlTfSpzBrvP1Rndg6mIkefq+4Fsf3CZL7w6nVKq5OPRriJG2/z//RTqcwHWbwMzihbI
 ug8Zjuovuytjt1USPc7WfvzGX/u/7yrca65P/D333wMRHN3BAUXiFp+Kzh8vk0XA5XoU
 9a+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776397892; x=1777002692;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uiMoYM6dbl34o9SsLqCiISFnk0Jr//K7m705ROB9B8w=;
 b=baixUsI1+1mq1ZMY5GRx3Ah6lOARDN+jiq64f1LhnU237+7qa1x+Hs+ft+b60LY/9Q
 rl3KRInCFlXF7JTV6w4VrGptXn0Z32MVWLlVlCPPiSeYA4ecgzLI3rv65lWTBl1+INHe
 nJnQt/OglSF6Ss2doCSARqSXdpMe9rWNlFiR5PfazSgSAM2zxhxV4LipPfZarKCV/mSZ
 7HgRekR+xex1lp690UXOJ3H6Xu5Tp86pEjNZZpvUxshHDtaGoa6zkIfLxRJqWu4aTrc9
 /2IHV0vSi0Jg6OfJiS+7lmBIE8F1MMaXinfY3VF6YYIqL9Ttb6DyoFvAZ+/WYBFw/edi
 SwSw==
X-Gm-Message-State: AOJu0YzkHhxlkFgDxWTERTfmh/NAScn0z5Z0tZlMuaq6z1vKLl3N8lfF
 L4xL6kms+RCADV1IFsdi0fJJ3ZJPUrmoGdpbx+wqFE2umpV9rc6Q9rkP
X-Gm-Gg: AeBDietgb7Lq1tv4h8WWf30h2q25cI549bwkTTED59iHAzdf0UPFzRz8HVV4qY3en/W
 7ZeLAAgXvrVD8WQWd+qWhbKC1H2pBqNbKdLb7Dut9l3E9sIRs/KAkp3d6pvy85K1kE6kCsPs77m
 2xKJJJe4b2Kys0i1dowElzgxZUPgcBUDN0QzeWgqHwrpt5zqVlcQP3kuJ2AzCj3oSee9EMNln/I
 tW4LX0BOZ1HkUmq9im0Rtf08rzyP7jkg1HsrDkAkxcrBautMD8MKqBNVcX7N9tt/XJF70an9Ckt
 YBhgyAwrLgoJ1qtF0JOK7aVScfhGzgGMsNlOUaWYQR/RuBD1rIRIFgWu/nFgWeW4qHd5S4I89w4
 rhyYs4oL+yZwG/glmD4/FM/31Ryj1WDJqXKzIklpqiU0EAolK0yhBy4g+CRdJVhCB40yvkmPeLT
 IX7fn6iXNxMxuqpzz7g93sB7PVc7obpzd5r8seUbnQ+SKVjAIZPn67R135DTrMR9VFvT1fbw==
X-Received: by 2002:a17:90b:278f:b0:35b:e4f8:7cc5 with SMTP id
 98e67ed59e1d1-361404a5988mr1014628a91.25.1776397891553; 
 Thu, 16 Apr 2026 20:51:31 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa176e9sm4266965ad.20.2026.04.16.20.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 20:51:31 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 17 Apr 2026 11:51:26 +0800
Message-ID: <20260417035126.3886702-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Wenjie Qi From: Wenjie Qi F2FS already classifies DATA
 writes using its existing hot, warm and cold temperature policy, but it only
 passes that intent down as a write hint. That hint alone is not sufficient
 for NVMe FDP placem [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wDaF4-0000z9-CL
Subject: [f2fs-dev] [RFC PATCH v2] f2fs: map data writes to FDP streams
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
X-Rspamd-Queue-Id: 5EAFC416B7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Wenjie Qi <qwjhust@gmail.com>

From: Wenjie Qi <qiwenjie@xiaomi.com>

F2FS already classifies DATA writes using its existing hot, warm and cold
temperature policy, but it only passes that intent down as a write hint.
That hint alone is not sufficient for NVMe FDP placement, because the
current NVMe command path consumes `bio->bi_write_stream` rather than
`bio->bi_write_hint` when selecting a placement ID.

When the target block device exposes write streams, map the existing F2FS
DATA temperature classes onto stream IDs and set `bio->bi_write_stream`
for both buffered and direct writes. If the device exposes no write
streams, keep the current behavior by leaving the stream unset.

The stream mapping is evaluated against the target block device of each
bio, so the existing per-device fallback behavior stays unchanged for
multi-device filesystems. Existing blkzoned restrictions also remain in
place.

The mapping is intentionally small and deterministic:

- 1 stream: hot, warm and cold all use stream 1
- 2 streams: hot/warm use 1, cold uses 2
- 3+ streams: hot uses 1, warm uses 2, cold uses 3

Signed-off-by: Wenjie Qi <qwjhust@gmail.com>
---
v1 -> v2:
- document the default active_logs=6 DATA stream mapping and non-FDP fallback
- replace open-coded stream mapping values with existing F2FS symbols where possible

RFC notes:
- Scope is intentionally limited to DATA writes only.
- Validation used stock QEMU 8.2.2 NVMe FDP emulation with a 16G
  namespace.
- FDP enabled: buffered and direct writes each produced 3 dominant
  NVMe placement tuples.
- FDP disabled: buffered and direct writes each collapsed to 1
  dominant tuple.

 Documentation/filesystems/f2fs.rst |  9 +++++++++
 fs/f2fs/data.c                     |  2 ++
 fs/f2fs/f2fs.h                     |  2 ++
 fs/f2fs/file.c                     |  2 ++
 fs/f2fs/segment.c                  | 13 +++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 7e4031631..8c4a14ae4 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -137,6 +137,15 @@ noacl			 Disable POSIX Access Control List. Note: acl is enabled
 active_logs=%u		 Support configuring the number of active logs. In the
 			 current design, f2fs supports only 2, 4, and 6 logs.
 			 Default number is 6.
+			 When the underlying block device exposes write
+			 streams, the default active_logs=6 configuration
+			 maps hot, warm, and cold DATA writes to streams 1,
+			 2, and 3, respectively. If only one or two write
+			 streams are available, f2fs falls back to mapping
+			 all DATA writes to stream 1 or mapping hot/warm
+			 to stream 1 and cold to stream 2. If no write
+			 streams are exposed, f2fs leaves the stream
+			 unset.
 disable_ext_identify	 Disable the extension list configured by mkfs, so f2fs
 			 is not aware of cold files such as media files.
 inline_xattr		 Enable the inline xattrs feature.
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 338df7a2a..df9f4a230 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -508,6 +508,8 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
 		bio->bi_private = sbi;
 		bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi,
 						fio->type, fio->temp);
+		bio->bi_write_stream = f2fs_io_type_to_write_stream(bdev, fio->type,
+								    fio->temp);
 	}
 	iostat_alloc_and_bind_ctx(sbi, bio, NULL);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bb34e864d..2f0777478 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4056,6 +4056,8 @@ void f2fs_destroy_segment_manager_caches(void);
 int f2fs_rw_hint_to_seg_type(struct f2fs_sb_info *sbi, enum rw_hint hint);
 enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
 			enum page_type type, enum temp_type temp);
+u8 f2fs_io_type_to_write_stream(struct block_device *bdev,
+				enum page_type type, enum temp_type temp);
 unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi);
 unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
 			unsigned int segno);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index c8a2f17a8..a3186cfc9 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5064,6 +5064,8 @@ static void f2fs_dio_write_submit_io(const struct iomap_iter *iter,
 	enum temp_type temp = f2fs_get_segment_temp(sbi, type);
 
 	bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi, DATA, temp);
+	bio->bi_write_stream =
+		f2fs_io_type_to_write_stream(bio->bi_bdev, DATA, temp);
 	blk_crypto_submit_bio(bio);
 }
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6a97fe767..902fc654d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3626,6 +3626,19 @@ enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
 	}
 }
 
+u8 f2fs_io_type_to_write_stream(struct block_device *bdev,
+				enum page_type type, enum temp_type temp)
+{
+	unsigned short nr = bdev_max_write_streams(bdev);
+
+	if (type != DATA || !nr)
+		return 0;
+	if (nr < NR_TEMP_TYPE)
+		return temp == COLD ? nr : HOT + 1;
+
+	return temp + 1;
+}
+
 static int __get_segment_type_2(struct f2fs_io_info *fio)
 {
 	if (fio->type == DATA)
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
