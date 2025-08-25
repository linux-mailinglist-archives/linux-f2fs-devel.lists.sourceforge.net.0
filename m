Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A9AB333BB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Aug 2025 03:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhC45CD8WTfpWbSkUAQQyoymH+9lRcYCsd098tWu/ew=; b=LVMKeqHi4pj4o3SkEFiFCcDo7t
	z1oIGPlPLIrc1oBldp/6BqbJAcbgHmlmYjyBYriqboLMmNF0fv77hghwKip9CKLFVcqeRdQUpglng
	8SfYPAyyegx1Ig5C8k2kthc+OfRNq2mATQiEtYgQ026qE6/HT6TZhC5zBfBNUv+wHoZk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uqMRb-00011u-3g;
	Mon, 25 Aug 2025 01:56:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uqMRa-00011l-32
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6d7wanjyKzsSVN7wWJ/XHnF6PcFDXfIoWn3H2banYhA=; b=B+um7/WwjACNtBPHK5manKCmOS
 Vyzq+Di6XoyBwUjFm4mNM+s7qY5+lTJvRHu7qHBMYi26pzrkPvhXd9+tduM2cj7wg6OyByuLLfQm7
 SGAlaayrAeJDTv6hOCmjqb01p+Ur0Zn3ewRRYMx7hIQPkiEddLnTNJxOqmrDpyvkGqOA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6d7wanjyKzsSVN7wWJ/XHnF6PcFDXfIoWn3H2banYhA=; b=kZwTTAshr5uR+WMYjkmVKUr09Y
 Xj63ZmNj3qC/wlV8dzqRdNgr9tko4Jo3UBplYFnrYjgJxHCuofMmbNQ7gGCI8G/tJ4KAMlCyrDHbc
 YRkAqxI0vy1Wrg03+w10SWQbdczA6yMQlSyzeGEQf7ZDSK5dAHo63Wj9LT6mIIRY+B00=;
Received: from mail-pj1-f47.google.com ([209.85.216.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uqMRZ-0002pL-Ns for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:22 +0000
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-323266cdf64so2775192a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 24 Aug 2025 18:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756086971; x=1756691771; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6d7wanjyKzsSVN7wWJ/XHnF6PcFDXfIoWn3H2banYhA=;
 b=CeHLDnnAvkDZP/+FmIiVRwee0awoyk6UaCv6N98bg7FYID+p3pMoPhIMd5CBHktGGU
 WVZdGTz4B+4//gScQZGLjCpNZEJsiLCHS5eVbLuAJp5C0TcXGsIHrugGXIxRQLn4gNiv
 jGA0uPdtvXXoABa4mYBBEXEJm2ueskw8Uu76H36v87gCH2wEfB6ByXWMRG5v8dvP1wN8
 PA0weuL+j13HXJd8EYUUGptqb+VJkfTeYu31et6QwvlTlhHSVk2pllfOQArdxvObXnPG
 OzqVUkEYDKqhnSriyndya1bUrj49gVPa2BglWs9EDM497qmeYdUtbuEIZ5DAyii4Gj9n
 F71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756086971; x=1756691771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6d7wanjyKzsSVN7wWJ/XHnF6PcFDXfIoWn3H2banYhA=;
 b=uCCv5cAbUyaAUr677ZgAj6acSArmGRTAdqQ0ONbzyU0+vKblOcv+ag5+BYRWlu2mBq
 KJiMeeFQJGneVDCCDkR+5UXonqBpbs3ZgAvznmbeWzhnQ2Kcv2O984rkWBLn8ZfhJ12v
 fLpPQrvtXo9lSWpPiYlpUZGHCSY9EuBveNfrbZFL1tPGaUmziWMJRxt6px+Q3Y3fvVJY
 5OssLGLj4YcrXqTzOsn9AL3zmw8356eQp3fmEuafwPVLGeE/P+m/x+Y9Vmn2RRjAgLiy
 YGpUcLU6vv5PPvL5dQ8ZMHk/9bsosirYm1RKqRS0j83MzXzEuvJ+PPA7Ol8MK4fctwQD
 kIkw==
X-Gm-Message-State: AOJu0YyiiPlvultd0t2RYIzWpw7i4/uY3AxRhIW9n1ZKF1MbkPOeZsuW
 Ibc84q/ip+lWARM58Zkl4XF8iAUr2qDt5/y9ZhB9SXp2kqUvNmP6sDyu
X-Gm-Gg: ASbGncu0t/2B4wmsbzowK8xZkNqXLlrGiTXiWNJ9MYvvDoFa8f9HsGhtWXa/2Tktn/5
 SzgW8XKwbCtLfR+x9lkhAxLcLMK6GTNg5VHJIzcTqqGa9OLHPAQL/xU5F9qGHlwjwecV4UqncJg
 Oo6U0Qng9wNxGyi2AmE4qOG3ZG2NljllFqzilTfd0CSK/gTCJQLigA9TEQ3qMNSktaAvPposYRU
 Xb7XNRToK/yBPeP69lvZxWUnnEw5Mm2DuuZ4R+QU1fg6W7HxwvBEm2slL0tdoYyLCY7ZfEdTEre
 APmte77uYliwt07L9x90RWxf7ocFVa9cBlIc7jqHQ5akJnxPyOSmnkyCutQPgKRNWCouuuYjq+8
 eukg1cu4yrRtzLIfmKZDeM7MaA5Pol2uaQCzwIt4=
X-Google-Smtp-Source: AGHT+IF7EY5mh31OiRsPeAyJoNmRrX4q4yOkbWIEpd1RhsRF4kovQhvXCX3A/+hY93l2OwxQFHfYVA==
X-Received: by 2002:a17:90b:1e11:b0:325:823b:f925 with SMTP id
 98e67ed59e1d1-325823c07e3mr4008147a91.31.1756086970759; 
 Sun, 24 Aug 2025 18:56:10 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b49cb8b1989sm5147883a12.18.2025.08.24.18.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 18:56:10 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 25 Aug 2025 09:54:46 +0800
Message-ID: <20250825015455.3826644-5-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825015455.3826644-1-shengyong1@xiaomi.com>
References: <20250825015455.3826644-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Sheng Yong If one cp is invalidate, set CP_FSCK_FLAG
 to allow fsck_verify() to fixing cp at the end of check. Signed-off-by: Sheng
 Yong Reviewed-by: Chao Yu --- fsck/f2fs.h | 6 ++++++ fsck/mount.c | 11
 ++++++++--- 2 files changed, 14 insertions(+), 3 deletions(-) 
 Content analysis details:   (0.1 points, 5.0 required)
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
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.47 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uqMRZ-0002pL-Ns
Subject: [f2fs-dev] [PATCH v4 04/13] fsck.f2fs: fix invalidate checkpoint
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Sheng Yong <shengyong1@xiaomi.com>

If one cp is invalidate, set CP_FSCK_FLAG to allow fsck_verify() to
fixing cp at the end of check.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
 fsck/f2fs.h  |  6 ++++++
 fsck/mount.c | 11 ++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 4c6c0c48b9ee..a4888a817284 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -346,6 +346,12 @@ static inline __u64 cur_cp_crc(struct f2fs_checkpoint *cp)
 	return le32_to_cpu(*((__le32 *)((unsigned char *)cp + crc_offset)));
 }
 
+static inline void set_ckpt_flags(struct f2fs_checkpoint *cp, unsigned int f)
+{
+	unsigned int ckpt_flags = le32_to_cpu(cp->ckpt_flags);
+	cp->ckpt_flags = cpu_to_le32(ckpt_flags | f);
+}
+
 static inline bool is_set_ckpt_flags(struct f2fs_checkpoint *cp, unsigned int f)
 {
 	unsigned int ckpt_flags = le32_to_cpu(cp->ckpt_flags);
diff --git a/fsck/mount.c b/fsck/mount.c
index 1fe2b110942b..c671811941ad 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1359,8 +1359,11 @@ void *validate_checkpoint(struct f2fs_sb_info *sbi, block_t cp_addr,
 		return NULL;
 
 	cp = (struct f2fs_checkpoint *)cp_page_1;
-	if (get_cp(cp_pack_total_block_count) > sbi->blocks_per_seg)
+	if (get_cp(cp_pack_total_block_count) > sbi->blocks_per_seg) {
+		MSG(0, "\tInvalid CP pack block count: %u\n",
+		    get_cp(cp_pack_total_block_count));
 		goto invalid_cp1;
+	}
 
 	pre_version = get_cp(checkpoint_ver);
 
@@ -1424,14 +1427,16 @@ int get_valid_checkpoint(struct f2fs_sb_info *sbi)
 			sbi->cur_cp = 1;
 			version = cp1_version;
 		}
-	} else if (cp1) {
+	} else if (cp1) { // cp2 is invalidate
 		cur_page = cp1;
 		sbi->cur_cp = 1;
 		version = cp1_version;
-	} else if (cp2) {
+		set_ckpt_flags(cp1, CP_FSCK_FLAG);
+	} else if (cp2) { // cp1 is invalidate
 		cur_page = cp2;
 		sbi->cur_cp = 2;
 		version = cp2_version;
+		set_ckpt_flags(cp2, CP_FSCK_FLAG);
 	} else
 		goto fail_no_cp;
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
