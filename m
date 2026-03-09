Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NvbIhOjrmk9HAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 11:38:11 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EC323739F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 11:38:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYcu2slVcOEkxl+dc01RLnHtBG/9oCyaHOfWRHo+mdg=; b=JShivCqxeDAqFOToAzQORqbtIX
	NAGyNrTeo+om+/vI6AtojCaEI7Lq6Wf4WIrHo3bJU57Q7+VtEleA4xp3C5WzknxpfYvQtFoLlsmKR
	DI8BxrOFBJx07h4W4nziJHcmkP/2R5W/Lofc1beNkfNSHIsHU8eyhIt3kBu/xDozf1cg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzXzy-0005z2-8u;
	Mon, 09 Mar 2026 10:38:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <william.allentx@gmail.com>) id 1vzXzm-0005ye-L0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 10:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dBuOUGVLEw4nznHpBENauX1eomvy7I2QzIe17Bzs21Q=; b=Q2PCBhpfH22IaEFt7lglLAZDvr
 u1Cfb3TgQz07bbPa/+RmHGTLmLRjGD7U6coE9QsNerVdVdI79rIF7LnR7iGQVcCuOCjCZIZjQ6ZnN
 U3UKGV+0BaGjj3TzSSzHWHJFpyvG1niLbY/GykUc8sja3EwA8gvdB9yj95B2/cwMg0Io=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dBuOUGVLEw4nznHpBENauX1eomvy7I2QzIe17Bzs21Q=; b=PABUhMn3XdUmkBYjTlrcNWnj78
 R92kj1jFhClO3V18VlL/eooxaBI5satbUc6CktZr1M7bV8d7Y9Vw1E+2Rxm5MX8uEn4T5l/xdfgdL
 gWE8vrUfFL70b05fFvZZyYuoe091zSNppsITgGTw9lUONMb1jbXndZMwSCYqegf8l5ao=;
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vzXzm-0008Fj-8I for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 10:37:54 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-7d74a59262fso868220a34.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 09 Mar 2026 03:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773052663; x=1773657463; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dBuOUGVLEw4nznHpBENauX1eomvy7I2QzIe17Bzs21Q=;
 b=cfy7gyxgOjfdI0MZTHgEOtyQoPCGKZbJ1qsqwZLFu+7ihy8fUA5GK90OkupAobzE/J
 uDXDdNT/zofQ7QarXKKu1d1Br+hrhUECADoxYZSpsqwec43tYKnS+EthCz+0LVVHU600
 2Rf1fhOmcqjdXmJ7BYjGdTFa7n8cT8dIlvX0xBKJJp/Jf7Iqdrec/3SAXnh0T5umTZQY
 FDtnvtbb8iliDXuYQ/A6OduIt9KldjXkNJ1eWZyTYSFrP3NlstsVXAxuebBDB1pyCcgO
 /0oQQHsjOKdRwFxoLAeAoALhOGHgegDJiJ+LGCC4Rwo7yer8XwJnO1cT/dexwkVf0fBB
 KK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773052663; x=1773657463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dBuOUGVLEw4nznHpBENauX1eomvy7I2QzIe17Bzs21Q=;
 b=GAopkasHGsYzXI47/lBdSTPPX4/iZJhzKTahoqxdFLhpjO8S4Pm/p4vrqYIimI7hkU
 4PHRbuIT5oq3gb3sP1wyE/pjex929fi7tGFHe2pgBcujPrAOdde0fqI6gdQCnnATzs0v
 5o5qg0mbut6fHHlDOquO3Mee6jh/mGXVqOEsQy6GEbgYjnj4ZlFZotnJwisRB1yvFlxj
 25VbHTq9U2WsTHyenKa4UyflGQRfBDDwaSr52uxIH3gauzyokUDx4uKERWK1O+f+3PfV
 PWvqXwlgJdRTLbnWKe9hzUbXnvbUuXfSY8ua1PUCQnjabUqeoNsfgaKFBOe9Zx4oI3J0
 bPfQ==
X-Gm-Message-State: AOJu0YwcU3rkyvhXLYyo/l+E3pLhcTueoagK69P0Mxscb7ANDtgfk64H
 oX0IMnQN9zsperSYcfRLMcHcGsmqsCZza3FdtjF8iUW1pOUPKN8e4189uxXUiqyW
X-Gm-Gg: ATEYQzxyEeCJQT+805YT10sUCRoruCPFyd30zIjRhmc38IBzp09lkfBh4+VUe3zSCsW
 DaUW+tasJ6OS2+akGH4832e6wUPsS31A6QM4qPIHznMEmPqPmdBC7Qnuh+rNge827F5UkHol7ep
 pXGt1TOUN96fTJh5886Omssgp7FOERjf7SXdyjDkeCojA2lGibKNaL1cbd93/iHx7IpQ79CXHLg
 Vq+SZd++eNQNKTFY0Bb38zlQaE7ptRVqu0Cnr6eW10+L2Rhsc2rS+DKewa+fXOMg80TluPARjFD
 nKIhSTvnioLRlsh12RMiglJMoNSDonLObAfVPrl1glzwKlaVZQmq7oTz02htYnTnLI0taKn+zxv
 SaTLaZYw55flqhfutSQz9RQnT1Rd9cozbHxV8uCIm1ZdX7GkyMUnUzOdgC422P0eCp3LIyyrEfD
 K5BlVx2mpxXnPSzWnZzyjktsVzPOG9bJzI7rmVgun566wG/mVSl5Q=
X-Received: by 2002:a05:6830:828e:b0:7d7:45ff:dcfd with SMTP id
 46e09a7af769-7d745ffe497mr2836864a34.12.1773052663327; 
 Mon, 09 Mar 2026 03:37:43 -0700 (PDT)
Received: from starman.tricat-industries.com ([136.49.86.72])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7d755603798sm231247a34.29.2026.03.09.03.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 03:37:42 -0700 (PDT)
From: 'wallentx <william.allentx@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  9 Mar 2026 05:36:58 -0500
Message-ID: <20260309103700.489932-2-william.allentx@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309103700.489932-1-william.allentx@gmail.com>
References: <20260309103700.489932-1-william.allentx@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: wallentx checkpoint validation and
 segment_bits_seq_show()
 can read cur_valid_map without taking the segment lock. A following patch
 will allow zoned LFS segments to switch between shared and private SIT valid
 maps, so those readers need to tolerate pointer publication safely. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [william.allentx(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.42 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vzXzm-0008Fj-8I
Subject: [f2fs-dev] [RFC PATCH 1/3] f2fs: prepare cur_valid_map for safe
 lockless access
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 wallentx <william.allentx@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 28EC323739F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FROM_NEQ_ENVFROM(0.00)[williamallentx@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

From: wallentx <william.allentx@gmail.com>

checkpoint validation and segment_bits_seq_show() can read
cur_valid_map without taking the segment lock.

A following patch will allow zoned LFS segments to switch between
shared and private SIT valid maps, so those readers need to tolerate
pointer publication safely.

Prepare for that by reading cur_valid_map under RCU in the lockless
paths and by publishing the initial map pointer with RCU semantics.
This is preparatory and does not change the SIT layout or allocation
policy yet.

Signed-off-by: wallentx <william.allentx@gmail.com>
---
 fs/f2fs/checkpoint.c | 4 +++-
 fs/f2fs/segment.c    | 3 ++-
 fs/f2fs/sysfs.c      | 9 ++++++++-
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 6dd39b7de11a..7b196d9df0f7 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -354,7 +354,9 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
 	offset = GET_BLKOFF_FROM_SEG0(sbi, blkaddr);
 	se = get_seg_entry(sbi, segno);
 
-	exist = f2fs_test_bit(offset, se->cur_valid_map);
+	rcu_read_lock();
+	exist = f2fs_test_bit(offset, rcu_dereference(se->cur_valid_map));
+	rcu_read_unlock();
 
 	/* skip data, if we already have an error in checkpoint. */
 	if (unlikely(f2fs_cp_error(sbi)))
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 23faf6725632..c9cfc8f17698 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4845,7 +4845,8 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 	bitmap = sit_i->bitmap;
 
 	for (start = 0; start < MAIN_SEGS(sbi); start++) {
-		sit_i->sentries[start].cur_valid_map = bitmap;
+		rcu_assign_pointer(sit_i->sentries[start].cur_valid_map,
+				   bitmap);
 		bitmap += SIT_VBLOCK_MAP_SIZE;
 
 		sit_i->sentries[start].ckpt_valid_map = bitmap;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 969e06b65b04..9c79f7b63583 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1782,11 +1782,18 @@ static int __maybe_unused segment_bits_seq_show(struct seq_file *seq,
 
 	for (i = 0; i < total_segs; i++) {
 		struct seg_entry *se = get_seg_entry(sbi, i);
+		unsigned char map[SIT_VBLOCK_MAP_SIZE];
 
 		seq_printf(seq, "%-10d", i);
 		seq_printf(seq, "%d|%-3u|", se->type, se->valid_blocks);
+
+		rcu_read_lock();
+		memcpy(map, rcu_dereference(se->cur_valid_map),
+		       SIT_VBLOCK_MAP_SIZE);
+		rcu_read_unlock();
+
 		for (j = 0; j < SIT_VBLOCK_MAP_SIZE; j++)
-			seq_printf(seq, " %.2x", se->cur_valid_map[j]);
+			seq_printf(seq, " %.2x", map[j]);
 		seq_printf(seq, "| %llx", se->mtime);
 		seq_putc(seq, '\n');
 	}
-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
