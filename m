Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83999AD3C68
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:14:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DS2Vp44mI9QogBxLnjRcNBhLxJONhXhuD0/4rdi9Lrg=; b=iTPWEOifqDPVuKnBzwSAUvCEGY
	dBjPsftTzrwAzRsKrM87NvWWjnFdFmciRtP0sNB0CjqlqTCE0GUy7mSnTGSuhf7Nus78sGEakpWoq
	GmHU25IWzaQ5AAMOk3URSHYjV7q258c5gr8Z5bqt2hDL3SRRZZYIS7NS/CqhQo9P4TPc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0gP-0005pF-U1;
	Tue, 10 Jun 2025 15:14:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0gO-0005p6-IO
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:14:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JSk9rawYxXsf9k9M7tLJDLFOJ6iCCpNPICjeBZC1AnI=; b=lrV0+GCqqUzw2ksLLv2ayBcB57
 JQOGSDlR7+wJ7RqHoc7POFWAYyTUH5SsN+WZWIwrLpoFSzTYOjCf4tYPN3N2/jU9O88w9FwZv1he7
 f82QMjS9h/P+LHN4rcZdn1dnah017YBdc2YLdrwlMYqz7SasKblLn+W7MJY/7HHisJow=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JSk9rawYxXsf9k9M7tLJDLFOJ6iCCpNPICjeBZC1AnI=; b=BXwIKSNXEtPqv8/1JlJAsc+8P1
 COEJwMniyuTYpLLqLALlMRWD+kY6NO1XDsic20VXavxPem9c24cOQECKUtURS8IrRQPrtbpjh1raG
 t9QCrbNaxwlnaWnuPO4UW1jHCAI5BW/Or+ERuyVDSMTPDyAO5Khj4pMSZrO5qc4uQvHA=;
Received: from mail-oa1-f48.google.com ([209.85.160.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0gN-00034c-RG for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:14:36 +0000
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-2d4e91512b4so3471595fac.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749568465; x=1750173265; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JSk9rawYxXsf9k9M7tLJDLFOJ6iCCpNPICjeBZC1AnI=;
 b=eqfBkITNYYZ4ANl5v8c6juevSKarjLMh+zsarVZb1SWDRTWW3BWgx98/gZ386NYYIx
 C80shreta2nkhMUiRuVoQQU+ymoxnmdtPjtpN1oX7xiXi+ywbkYyaQ3fYz5dBVC+t/4Y
 X8+GkbqqWZ6JzCxl+AyznRSHb5E7hokikOMn4BSAaPnMznTkMVHKTOrguwXasiOyGPfs
 BBYzRLeceC/53z+NwLvZfEiyOyWYqH5+NgIVmertvEnA1kEw1XKb+8F1DlefsksgU/+h
 iMwT5019qQL/KQO1uSYxHEf71QcVb3+N+IfrMcnsWB4id4rE1JeaxWJonAlXI7fBka2w
 N0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749568465; x=1750173265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JSk9rawYxXsf9k9M7tLJDLFOJ6iCCpNPICjeBZC1AnI=;
 b=wMILa/9ciysem+Iv96qr6CR1jrc/2QkAQdErXZLnrX860flzEW64RxYutT+s7/cjaK
 arKeQs+P3l1RVNNRLBGGRcKMxirgXrwm3oz9lDVqWCmsTd0WmoQv4SAqkz2Tz2TyVp+n
 fOGrdBLiIe4F7cdZ21x61FegnRjtxraSlVcmBnh9z+A4S4wK1CDmjlp46glsbR3cuGYh
 xn15LvE9EZJVOByUGezCb9AxYIhDatFzs9sgHl9oOFiENiBuDsty7JFLze2xkTFPBhLr
 tU7L9mFj3PrsRUne7bDvo8sRJAfxWFQgbIFWHrSboF6ZhXeXNsxvJDT+4clBA/j3yNO0
 e1sw==
X-Gm-Message-State: AOJu0YxVsGF3tG6V0w3tLywyR1vnwNKYqarElzKUaiCzgBK2IPcrNYWy
 rq6XVxQDNdrd2GX+V5Kii4GLLLZxnkJPW85/2UWToc8QiNzgzAq+4dEIqVRe7A==
X-Gm-Gg: ASbGncvuDB2i0qKe/f8oqAJiwfZX22IxKHVqlEwG7Ewk78YIrR3dFVaQ9rjGo1nWFPi
 0S0FqXKGAOeRtH9Uzn5UzhD8+Hf0uqG2Fp3BVL+RfjR1NAYW1FOdJ0IgpwRSfIdefeCj10ht7Be
 5iCrBStxFrwklKu/T+fbJhuhWzVry+3iFZfsh2HuAuYqx2nTL+tEirQ9BE1k+bnICTsY7x09qjM
 4NZoRZb5BnNNuWceBgn+mc8IeqjII1CxygjyZxpdvMcDbeRcXp8XGQw2B2vqvied8Ipp8g8/TGp
 0pM0p69/Tt5t2CO5nRcdELhwdDP22hsv11bI7nWVQuvkojl601lpd1VINz2vzja0oSuDATW2jcv
 esLo=
X-Google-Smtp-Source: AGHT+IEsQa8O8f5pJ33P2+FrfCvy6XAhZKfRMaKvI3tTykCYfkZ5PG1prTUVAmN63ulnxkcFpPf/7w==
X-Received: by 2002:a05:6a21:600f:b0:1f3:418d:91b5 with SMTP id
 adf61e73a8af0-21ee256942amr26940200637.24.1749559089713; 
 Tue, 10 Jun 2025 05:38:09 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:09 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:14 +0800
Message-ID: <20250610123743.667183-5-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610123743.667183-1-shengyong1@xiaomi.com>
References: <20250610123743.667183-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Sheng Yong If one cp is invalidate, set CP_FSCK_FLAG
 to allow fsck_verify() to fixing cp at the end of check. Signed-off-by: Sheng
 Yong --- fsck/f2fs.h | 6 ++++++ fsck/mount.c | 11 ++++++++--- 2 files changed, 
 14 insertions(+), 3 deletions(-) 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.48 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
X-Headers-End: 1uP0gN-00034c-RG
Subject: [f2fs-dev] [RFC PATCH v2 04/32] fsck.f2fs: fix invalidate checkpoint
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
index 337acb6f8ff8..b1f8e98dd7f0 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1352,8 +1352,11 @@ void *validate_checkpoint(struct f2fs_sb_info *sbi, block_t cp_addr,
 		return NULL;
 
 	cp = (struct f2fs_checkpoint *)cp_page_1;
-	if (get_cp(cp_pack_total_block_count) > sbi->blocks_per_seg)
+	if (get_cp(cp_pack_total_block_count) > sbi->blocks_per_seg) {
+		MSG(0, "\tInvalid CP pack block count: %u\n",
+		    get_cp(cp_pack_total_block_count));
 		goto invalid_cp1;
+	}
 
 	pre_version = get_cp(checkpoint_ver);
 
@@ -1417,14 +1420,16 @@ int get_valid_checkpoint(struct f2fs_sb_info *sbi)
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
