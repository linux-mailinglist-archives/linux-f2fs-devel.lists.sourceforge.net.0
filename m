Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CJvRMoyrMGpoWAUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 03:49:00 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F296668B562
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 03:48:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="IH/WZr7P";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=is4J11iM;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="D ApxmvP";
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=cNI3Vqvi;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HX1CFX5Q2KFwZhKGbqnh5R9kT0qs6pXoCMd2jt7gA50=; b=IH/WZr7PqiOstY4Y7oBjW0127u
	R9Aj5vyV85pNkzI+nmoOGJKzXByPk1suqPaatpwHCBQvWHjKw74xMG/aHgQzdpoLA+k+Y/mZjBa8W
	p8xHk+xITEeH+ra3oN03klx9cQLRyoua37NQVYmXjXNvkOJ8kCLIOvFZAxlkkznC1a10=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZIv6-0003VQ-0d;
	Tue, 16 Jun 2026 01:48:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wZIuv-0003VE-5O
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 01:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kg+t2f0uBlNFg5duAcjefLpMEBJKzXoZ3vbi19q9Wp4=; b=is4J11iM15LZiuqw3puNvm6MiO
 y1KiB9SJO59UhdkcLVEeQtzzp4iepel0M/F2fivmM4PT/AK+02N+EYYuhH2G8gK8y/HT3XcqLnouK
 08wyjQzaOVkoWDGani6WUvyXl+1964ZCUFngTkiDrtIqUD5Yk+/z07ZwBU4w9Jm3fyTE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kg+t2f0uBlNFg5duAcjefLpMEBJKzXoZ3vbi19q9Wp4=; b=D
 ApxmvPJnPThpphrJueENAG2tpKBf1yJt7X6JVFM6PUSk7XP9hOLQpWSp+qh/0W7RRlyZyrSJDXTJx
 fyZik6kbok+lvCAHi/iB7CDuLdfg/lewO6JWTjntuZlc649oPyMPa8yGaz9BFx/m3MLdTgWsp3+h7
 1yOMV0KbD2P8pdbM=;
Received: from mail-dy1-f173.google.com ([74.125.82.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wZIur-0000lM-Mm for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 01:48:38 +0000
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-304d8362a58so2985526eec.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2026 18:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781574508; x=1782179308; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kg+t2f0uBlNFg5duAcjefLpMEBJKzXoZ3vbi19q9Wp4=;
 b=cNI3VqviMyroiRwzBnVu/68G/M5xlraMxVmxZcSYa+uGWMHoV1nz+ukwG9lRchbJid
 dZ7BxqxI32Zi7+MV/8Sv2omsvtZdAYX/n/Ik72GravaTsH+Mls2uVjysPZlo9oTqHXE9
 +l5wJwiCO/fzt2TBRowOWPgxIWY1uq7l+XyP83RuA43l1YGhh0+amsSBq04BcsCYk45G
 3JhTox1k+lYXo81l+YLOUYbpqCiwUf8+ALh/Bmyb45SVI2RjITTjQ0uOg9GwnGoZxVJl
 qEXJ001f6VuWx0niZMpCZdGxzptFxIewHbNk99Q4aonNznPcKIc6x8cdisNaGvGbj0YO
 9tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781574508; x=1782179308;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kg+t2f0uBlNFg5duAcjefLpMEBJKzXoZ3vbi19q9Wp4=;
 b=tZNmboD9D1V6X+/gBhD594yA6ZHn4rRaYRzbZs+Yo7Q5HJ73XpDl8qB6RgxuNP8T5G
 ThUk0gDuEL8McaBYHEKs4eb/YnMkPw3xjhWBKDkhSeqrkFWDHQUUxTaiLWfdl0qYAxhI
 uFfydA1fUEIVq1yITtwj9S5xxFYWfq0FK7ap/ptNg+K9HGZ/JjYXQYWKbKG4AchmhSqT
 UwGS8JKUsPCmIG/rCBq59/rFcbM1R8HnTKC8g58SnVfFj0XhwINNZTwGS4RkvfrqxKsz
 CZHUBY8+5aHyjdJUAWlyWt0FgKdGRDqZr81v+kBKtcaYWFAKzeHF0OIXhX2bYPSSlOOz
 xTIw==
X-Forwarded-Encrypted: i=1;
 AFNElJ916mvBmh5uaZUAnyIeb2iPci0eKvrUk/h6DJ8DiO0Y5+agwCxa2a54V3XQtFFZ7o8g+/bVi7Qwpb6uGoquGlaB@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyS9KUVvxghWQJxBsjEt2kIlmdynfEvoVXVbTjFpkvrgH+l4HSC
 AGDbCPsTYurhXGmbETmGGAipEpSpnRHtFQe/XtkzY5gWfvof/jD7qpFV
X-Gm-Gg: Acq92OG0XOd5AX3M5oJVzFrFTSbp2i31tDEakIwf5v9JoKZ6NuEBKoSOYnautvNm4HU
 l+RKk78ead8HEcZqgV5wHdoiEMS2rD9W9Hkk+tpLNxVzDUCKeyUDVwRtDyhaY8gpWM7AS/Ig1wY
 OaLvMUFjD5xWBg9pUCdLr8MoMkHidX/PqmTEGASD9HADi+CeePPHHFBg0y9E6FfeaAN9LPm0LIU
 ZFGq6uEYpupmfynlXsVyR1aM/zKT6jQDEtwrWssWhqFUZs1qNTMT5DZ4Ob/n21yHkVH85RfauFe
 JHsA6XlMnYQ6TbrSldBaOjLznpzG6QejFt5X7eIlQ9pZYqBsjcj1Q3eS7pIJb5yfeyYJzCYRY0u
 IZkzdRUyb9gn+DEiHLHmNqXZ5Gqo2t8VjEMCAGs1KlM2hrJc3MW4GkjxBok13XwueCQZvuC6x0d
 ilx/yLqLqLowcTye/rBAqsy8xO5Fo2b4fvSm7mvC+cnMjMjvcVWwGWSFsvMyc=
X-Received: by 2002:a05:7300:8816:b0:304:56fc:775 with SMTP id
 5a478bee46e88-30ba3ad2d0dmr734693eec.21.1781574507451; 
 Mon, 15 Jun 2026 18:48:27 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3081e91fb97sm17826593eec.14.2026.06.15.18.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 18:48:26 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 16 Jun 2026 09:47:42 +0800
Message-ID: <20260616014742.67236-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs_write_end_io() decrements the writeback page counter
 and then reads it again with get_pages() to decide whether the last
 F2FS_WB_CP_DATA
 completion should wake cp_wait. Use atomic_dec_return() for F2FS_WB_CP_DATA
 completions so the wakeup decision is made from the value produced by the
 decrement itself. Keep the existing dec_page_count() path for other writeback
 coun [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [74.125.82.173 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wZIur-0000lM-Mm
Subject: [f2fs-dev] [PATCH v3] f2fs: use post-decrement count for cp_wait
 wakeup
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
Cc: qwjhust@gmail.com, qiwenjie@xiaomi.com, geoo115@gmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:qwjhust@gmail.com,m:qiwenjie@xiaomi.com,m:geoo115@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,xiaomi.com,vger.kernel.org,lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:mid,xiaomi.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F296668B562

f2fs_write_end_io() decrements the writeback page counter and then
reads it again with get_pages() to decide whether the last
F2FS_WB_CP_DATA completion should wake cp_wait.

Use atomic_dec_return() for F2FS_WB_CP_DATA completions so the wakeup
decision is made from the value produced by the decrement itself. Keep
the existing dec_page_count() path for other writeback counters.

Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
Changes in v3:
- Drop the waitqueue protocol change from v2.
- Use atomic_dec_return() directly for F2FS_WB_CP_DATA and wake cp_wait
  when the returned count reaches zero.

 fs/f2fs/data.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d83a21998ec2..58d23eb74ec2 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -392,15 +392,17 @@ static void f2fs_write_end_io(struct bio *bio)
 		if (f2fs_in_warm_node_list(folio))
 			f2fs_del_fsync_node_entry(sbi, folio);
 
-		dec_page_count(sbi, type);
-
 		/*
 		 * we should access sbi before folio_end_writeback() to
 		 * avoid racing w/ kill_f2fs_super()
 		 */
-		if (type == F2FS_WB_CP_DATA && !get_pages(sbi, type) &&
-				wq_has_sleeper(&sbi->cp_wait))
-			wake_up(&sbi->cp_wait);
+		if (type == F2FS_WB_CP_DATA) {
+			if (!atomic_dec_return(&sbi->nr_pages[type]) &&
+			    wq_has_sleeper(&sbi->cp_wait))
+				wake_up(&sbi->cp_wait);
+		} else {
+			dec_page_count(sbi, type);
+		}
 
 		folio_clear_f2fs_gcing(folio);
 		folio_end_writeback(folio);
-- 
2.43.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
