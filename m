Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNaZIR9J32mFRQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2026 10:15:27 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BECBF401CEF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2026 10:15:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+FGXIWKz4MkPWY9NaTHjV+PRcnMbd//+aK4FggGTkFY=; b=VVL5U0IV0w2dLHEBod2YhfYGAd
	W2r+gTpnvth8aEyS4VLo3mvl7Z9NZWwv+qVQVA/9bdq2mtEFgP0JfNNcnx4qH6UREHc64IeavWsNP
	kmzhKqiUllLATnY6eWowxZWTSgYIX2jThsWEMI7R/MiL/kX1apiPPkaz3iP/xmXRTMP8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wCvP3-0000Kq-DH;
	Wed, 15 Apr 2026 08:15:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wCvOw-0000I6-7E
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Apr 2026 08:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cr3LYjuSIkdSjgKcjE5pXiQW5P99n+0bc+MlVW7WbAQ=; b=h6+nDP5xVTGd5LhHbEOO4gAuHh
 6BmuNA4l1u+MkgldBFVlhhta7QKp1d3NVj5XHewlqvqIjlb43QpyULOab5UDYq7cr1B52f2lAkHqf
 mrz23m1QrenYbvR0LKMV/O33PBzVdZLPHlyB1Ad95gMCQrf3wgHaJly/+7qcyTYJvJ1k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cr3LYjuSIkdSjgKcjE5pXiQW5P99n+0bc+MlVW7WbAQ=; b=j
 UuHsq41xfksoMeIZZoWZuJXFxjF2YyhdCqr3mbjBouqgmoONSitORLWIVU/nOjCum0R8/nwqsEcC0
 8vHwN+8WrqH7DZ0NNNiVn3ZUTgZzW9HHtMcYDqjfwMUgBK6TNAjsmrjT9AOe7toVrkodSdE0zYhWQ
 99RKfnOwQndi6U6M=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wCvOu-0002I3-RW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Apr 2026 08:15:10 +0000
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2b23fcf90b2so61812295ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Apr 2026 01:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776240898; x=1776845698; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cr3LYjuSIkdSjgKcjE5pXiQW5P99n+0bc+MlVW7WbAQ=;
 b=cdU+Jld7HqifX+Eb8HbSlTpTwPRErpSJopz3qLWa6//MtGqaGuiJc4PYxTul9F9tt0
 KuhW/8M7toL9O77dq0J2jqLKIBWjKlUZ+qh9ONhu8S+Wv3x741cN2IpX7kLUcFF+F6l8
 D2cv61sBeqs/jnZ0QHrkxR+ne+k2B6HKR+876tb5y0w8OLlv9d1tXE3QN+yDZ3FQQa0M
 vaNq7muoqybKcvOJ573m/IOTWFVJTqFneYxzEkxAkOgJmBF7d+/MRv4Ks3Wast/n39/+
 /eNRPdNagG00zCMBA90y1NwVbRTknnBbFQKndGBInHi2HMVvou1l0BHN1HQI2qCgbdmh
 B/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776240898; x=1776845698;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cr3LYjuSIkdSjgKcjE5pXiQW5P99n+0bc+MlVW7WbAQ=;
 b=KbMN3p72CvskVujSGFbsQtNhVkP/BaT6HR6H2nzl+LlfwsBpfJ17/KaWS9H2wYsWY3
 pZvHgUNsRK1zjPjsm5Pjty2AGBg+I1xE5SITl5avSy9xP2NyJtiOITSfxVJXoHkIVUd1
 jLGiIJUGg7xEHdfkZtYsv+5PF6kHfOgnGnIaYczMyPzjk8x1mtmr3pEzrmEGqIt5M+mL
 Ui7pwezKutSF/NEWmJesQ2I00nS59towIeIDYFB/KFmucfmS4EpoGlYWOni3F/BwCmdr
 9F2Syvu15wXe3ZV55hXxomWIzMUFOA3uz7H/FbyulNHJuQ19xdGwHXpaxqZoI2KytCft
 YsuA==
X-Gm-Message-State: AOJu0YxQH/tW7GQQxvuAVP9hpnz9zzy4zDUQDgn67eTKVuVkB8jU0dBb
 Kg6rbUQHOfm5DxKrvkbolkX+yes2cf+svbW40QLYPf4+Sd2SkhSv30Xyj9M8qgVB
X-Gm-Gg: AeBDietig6QK+AlOTk4+M8p1BfL/Mv9xiQcZitZFYBwtz9Iksg7/5C7exru5U7epJ7B
 BMe8ZJTlvw5qgXL6WmUY/7kQvzV9la1yKVOxwx1kOAXh4B2ydHrJBYXxHFBONtAR8JYHAs5abDe
 wVuYDvaVCXYhcbkViL7ErpsMreIJjYa1cpthB+xH2FHbNiYPLToDxviUWHmjXfUJZMChw1yM9Xm
 oTjXAmqepmkClUw9IR3KwmDB49bqDlrkvvyIxQpN+svlRlKzUr3nNe7I6SbbdDahqtqFXPBU2AX
 lAvn3nl32aqPVk96/ZnEB7WlCzaYLNjL9bzaraKbIGxpPuVEHMkun8rPW7fnf8fKs+Erhn8P2TJ
 9wifZ6OtjqcC8qkZ8JNpII/AgG+Zz1wNFmIymdNxTNL/uaE25YwYpZasagaC/DbelunMPePes+g
 zsTUVa5OgZh6FMjN1ixUXg+0NFIfN3miRKe0JeYzxEvw2eNqCO2ptuFiYpboc=
X-Received: by 2002:a17:902:ca93:b0:2b4:6398:6aa2 with SMTP id
 d9443c01a7336-2b463986c68mr64461715ad.27.1776240898025; 
 Wed, 15 Apr 2026 01:14:58 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b478127040sm12630005ad.31.2026.04.15.01.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2026 01:14:57 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 15 Apr 2026 16:14:49 +0800
Message-ID: <20260415081451.2333535-1-qiwenjie@xiaomi.com>
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
X-Headers-End: 1wCvOu-0002I3-RW
Subject: [f2fs-dev] [RFC PATCH v1] f2fs: map data writes to FDP streams
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
Cc: qwjhust@gmail.com, linux-kernel@vger.kernel.org,
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
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:qwjhust@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:mid,xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: BECBF401CEF
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
RFC notes:
- Scope is intentionally limited to DATA writes only.
- Validation used stock QEMU 8.2.2 NVMe FDP emulation with a 16G
  namespace.
- FDP enabled: buffered and direct writes each produced 3 dominant
  NVMe placement tuples.
- FDP disabled: buffered and direct writes each collapsed to 1
  dominant tuple.

 fs/f2fs/data.c    |  2 ++
 fs/f2fs/f2fs.h    |  2 ++
 fs/f2fs/file.c    |  2 ++
 fs/f2fs/segment.c | 24 ++++++++++++++++++++++++
 4 files changed, 30 insertions(+)

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
index 6a97fe767..ef8a3ac55 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3626,6 +3626,30 @@ enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
 	}
 }
 
+u8 f2fs_io_type_to_write_stream(struct block_device *bdev,
+				enum page_type type, enum temp_type temp)
+{
+	unsigned short nr = bdev_max_write_streams(bdev);
+
+	if (type != DATA || !nr)
+		return 0;
+	if (nr == 1)
+		return 1;
+	if (nr == 2)
+		return temp == COLD ? 2 : 1;
+
+	switch (temp) {
+	case HOT:
+		return 1;
+	case WARM:
+		return 2;
+	case COLD:
+		return 3;
+	default:
+		return 0;
+	}
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
