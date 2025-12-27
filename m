Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFF4CDF502
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Dec 2025 08:35:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+d8kmN1qjlz4pbvn9w4YnFo4tpuUJD6y3YijVBQbPhU=; b=ZbTMW0Q/whEoYNeI02ZgDkdzFT
	ijPyPwWbKybKabJS5qO7kMYAPJNL7Z+bB1/CYwt4iBuR/Kcn8yhxqPtCVYxj+BamSakmoV6nt/ZLP
	aYueZnFIvISJ2qVnUQspSHsBC6L1qD2xg8EKcPOFdR+04QHb5XaVO3MbK5oNHfcZOWxU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vZOpC-0005cF-5a;
	Sat, 27 Dec 2025 07:34:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vZOpA-0005c9-J9
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 07:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PKibEjknmcLE3/KVjAoucjP4q63Y42/KJ9GCJrT8x1c=; b=d+5MhHgZihlLNn/buTMvtT5OVZ
 CMMM8rOzMFIn7pX9b5dpBL11cIvgi5x7G9j58Z/QQWPbi3faPXGjwIIHxOnvCK53CyI86+AtOAclc
 tOR/owDWPpNCIPYJk9hKuqH4Ig7G6qQAqkHoPCmMLhTS3bEUsSAGBucKqw69+73WnnvU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PKibEjknmcLE3/KVjAoucjP4q63Y42/KJ9GCJrT8x1c=; b=e
 SdNPuV7EK2fAAsnXyGxELmT4ELnnP11WMfKcbhgbaTapl3KFlC4LLTMkb2Vzegtz4IQYL012ldlC8
 Y0zMJ+iGHaPMBPVVTH7+9UGwTjF0/ijPqK6kOYVtjfXIsBO+gEEkNk0bOCnX82kqkCEE6Ie0vULCI
 ObW+GJIzbSYL5y2w=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vZOpA-0006RV-8G for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 07:34:52 +0000
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2a0eaf55d58so50986945ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Dec 2025 23:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766820886; x=1767425686; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PKibEjknmcLE3/KVjAoucjP4q63Y42/KJ9GCJrT8x1c=;
 b=SJq9abtqorRst7/dhsglmpjidqHOYFz4XBs28PkwGBTA7Da0Gg73kZlFb8/DovXM9x
 JwvtBUZl02vdPWvKBeQE/SvQfC0yqrpBpfKnQWKCB6/ucGrAyThEzmUefa3difIhuh+v
 Y4Dw/twjMMksiBpeslnYcJVGLp8nPd3go6PsjFxqxhGiDfZgWtA4mwBNlD3rFVQGe0o+
 pIpWioM+EEBYkW5yBqqIhZDzIThCn3vqBOhy/ZhPzNuIznqL/xoHn6/lhD7oSL1Co93C
 XaMDRXSJZuAfBPsgzYxb4nba6eqZXDaxMIITO4go/SNBysQd15E6gVs53mJREfJBHhGl
 rbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766820886; x=1767425686;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PKibEjknmcLE3/KVjAoucjP4q63Y42/KJ9GCJrT8x1c=;
 b=t2KWnYqrkmPb0mH3nvbJCQGttYbcdI3PmsrJ+wviqBPnDyHQsJopwNpYNC/PPloic8
 Si0TjD42xmhxK1Ma2CQVamtc4RzJn+WSlLPffaW7zn+/7Fu8csIZB/s9LbkxywAiTkqG
 4D1XujDPuvSMu64bLDpdvAKNMe6nl86QGTrsLegMWabeAkuIQUk/Kwa2ErCD+5YJKHTU
 xaKHHHPvOG2qUZLlJ4Z3E8BHoFnMT1f5O7g6cycn2LSmDJXxFNoIg+NkdWPGs0byVq3b
 uL+wIQgqv68I1Hr0tlHsOuQyy5ZVqr5I/id4JcG8EXf5W5Oz2Et4SNaUS13AOWMfFX8r
 cSbg==
X-Gm-Message-State: AOJu0YwdFDO8Tn5mOyQLaabGGmzkPW+WSnHrrva0yuIa2HKFRQDw1xEU
 tePwVai63wykEk/nKd9CvJ8Y45j2SCDLueSnvfXDCEU+8sXnyAqK+ZIh
X-Gm-Gg: AY/fxX77YADlcl8IDbUp22hyBpmAWdys/QC6HavQEWjgeLPDuSJrQL/3wxtDPKOTfhH
 i0RLpdFvLzAJBx0mlDV+ktnrTHsfXeFuGDr2mYZV8vqa3lcgeIZl/yRYgriC6O6cvgd4/OVMClq
 c1titsE8O2BPL4juR41022eAhxtRX9uFThBCBOurPZRvZHa+8TMy1LQMVpha99z3d2Bqt/5BiE7
 BogUgGFaG8Kp0mrFXRKH7qo7yoOYc+KwtUanyTBsW0uKiGr56cqwEfmk6hIrwhtwwFp3pHZz1Vs
 yEE2JFiwlQV/ETFGLwaUk6L3SP/tkmz85id4HlQx76RuITt38uef41hXLQQe4uxAAaXkm+WyujP
 IbFUzz2E5KFcZ8QmY0r1XKLeM++QZF7vfKNmVgvCUDuiX5hHUWX1NbYN9O0BtXPaPQmLI7ZHx0W
 4HB2rPQRJ6uzqTb+Xw/a5rBbES4Io=
X-Google-Smtp-Source: AGHT+IEJwnlnK15ccIwDriofcnTriR1LBbAAIJwTm/FzlGesQFMN8A1jBWoreA70nRVdHNXDeZJPtQ==
X-Received: by 2002:a17:902:e78c:b0:2a0:d0ae:454d with SMTP id
 d9443c01a7336-2a2cab4335fmr249571485ad.22.1766820886455; 
 Fri, 26 Dec 2025 23:34:46 -0800 (PST)
Received: from monty-pavel.. ([120.245.115.65])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c8a8e3sm218806615ad.41.2025.12.26.23.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 23:34:46 -0800 (PST)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Sat, 27 Dec 2025 15:34:31 +0800
Message-ID: <20251227073430.193054-2-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Yongpeng Yang During data movement, move_data_block
 acquires file folio without triggering a file read. Such folio are typically
 not uptodate, they need to be removed from the page cache after gc complete.
 This pat [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [120.245.115.65 listed in dnsbl-2.uceprotect.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vZOpA-0006RV-8G
Subject: [f2fs-dev] [PATCH v3 1/1] f2fs: remove non-uptodate folio from the
 page cache in move_data_block
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
Cc: Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

During data movement, move_data_block acquires file folio without
triggering a file read. Such folio are typically not uptodate, they need
to be removed from the page cache after gc complete. This patch marks
folio with the PG_dropbehind flag and uses folio_end_dropbehind to
remove folio from the page cache.

Signed-off-by: Yunlei He <heyunlei@xiaomi.com>
Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
v3:
- Drop folio_clear_dropbehind, because __filemap_get_folio_mpol will
clear PG_dropbehind flag when fgp_flags /wo FGP_DONTCACHE flag.
v2:
- Remove folio from the page cache via PG_dropbehind flag and
folio_end_dropbehind instead of invalidate_mapping_pages.
---
 fs/f2fs/gc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 6afd57fa5387..8e742f74ab4a 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1453,7 +1453,11 @@ static int move_data_block(struct inode *inode, block_t bidx,
 put_out:
 	f2fs_put_dnode(&dn);
 out:
-	f2fs_folio_put(folio, true);
+	if (!folio_test_uptodate(folio))
+		__folio_set_dropbehind(folio);
+	folio_unlock(folio);
+	folio_end_dropbehind(folio);
+	folio_put(folio);
 	return err;
 }
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
