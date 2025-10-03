Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD59BB8588
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 04 Oct 2025 00:49:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rPWTfVyIkGZbyYytdYfYIKQCPcD1Y/WhLsjNmvcdGQ8=; b=irx9mExAmWhfzTa6nidxpVuqkQ
	hPMbdg5A7ZLpe4L5GyogOpgtTTmLU3O9FcL/GL7Nn/tniMivAqrmI8fmdWLX5GL8PGyaovI1tDrrB
	/hJ5QiXW7RsAZzXopkd3HpTLKI+mV+IuKKKar9s8j4FzMKmyoF/KEXyOOjbWcsYBkiaE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v4oae-0000JO-Sm;
	Fri, 03 Oct 2025 22:49:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1v4oad-0000JG-B4
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 22:49:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oeG9oeMq3V/BRy9XfGgniPTDeM9j7ii3LAYxjxadWNg=; b=nBVpEmjlYYtwsT23922Xrnhane
 RpLBV/XFs/DUaIvHZpolhRQ++QsiPCl06p2axBimv49GgUpU1W1HtKzG+pFkNPTgToCLVPtBfN6tE
 7RJON5MvpYISKVa5fJaMV1YC1b64A5bF7AfV23bDTOvlesU/uu7omC8hLac4a4MMvXh0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oeG9oeMq3V/BRy9XfGgniPTDeM9j7ii3LAYxjxadWNg=; b=c
 JsWw9JBOFL7k1KA5zOOhvfCw5DCRUEmYUn+tXtpfPhoHvPBgxPjW15UbDVdnX0bDH7OTIk/MdmS6m
 7yhguJcVF8sNWzJJfM51E4mkg7dG5J1HNx2qGuQ8PHnUj7qzN6Ki/bXB+aLrDz5iaoIqqKaR0QP3f
 nLSTYaOiPrNtB8bc=;
Received: from mail-pf1-f181.google.com ([209.85.210.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v4oad-0003Mp-Py for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 22:49:28 +0000
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-76e4fc419a9so2754359b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 03 Oct 2025 15:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759531762; x=1760136562; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oeG9oeMq3V/BRy9XfGgniPTDeM9j7ii3LAYxjxadWNg=;
 b=dfCuCC2i9zSGmTTGeHqDFgkgXg1jdRKivLnfFWLOIMTV4rhRJSyTwwBbkNpY5XN609
 Zpj/fjvxQPzwxYBFlyxBmE8+1OIcSZPxEAR0V2Q6QINEcWksLyRGhAqw7MoHc73WMt8k
 biX8XzV8WGu21d6/VbKxcoti/ww3IZBNmfIA3/lUuxAwvmJvDNoqDCPnR4oAcO0qc2sw
 m5ZeOWYLHF0T08/1lUdHTUUR62OY8FRQnLwuRbgT/SOdgOdyiCr43FY+ENp6PMeLIgBE
 wqwMoSlXtJyQs9QAD2F6rBrNRY3h32fxlEpYRTJZm4lBCCWXB9nOZlzuZ+8oXXe9mnup
 rWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759531762; x=1760136562;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oeG9oeMq3V/BRy9XfGgniPTDeM9j7ii3LAYxjxadWNg=;
 b=sWf1CXfAnVYUrlHALl9sxo3spELgI+ANWH5nvcagJibbprjKD4yd3CVZsevP6rPpyr
 voERe6EIFL4baF13MO//MvG7gl2IKGx/If7JbnkEz6t5qbcDdNMppMM5McdKxVlKkWlD
 oEqIJDnPeW0KxFmyX+msFmuamA4x4JD6GY9YiXuFq603kYYiXQP0ahduE9j6EMNT/UaN
 VIYJ4D0LAAOgOPL04T7Je8Dl/ivzTNNWXr9uiDYxDrTgERQ7z5+HnayylEO3HFqtHA7h
 U1bWHnjJGtUvuiven9L0eUsN9OeiulEYTjr2vaoRoymhlXcRsAJwaCMENFzTlSiG9qjt
 gxCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAmfK40wjwxEG239Lo2VngranVH3G+yXtCL+xw8UCRx+TpFHwx2m7YgwbX4s2YtrHzvL7ESXK4g/8lexptgYJE@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz1J2kkoU/CJ/N+n27SKsszd4vbx6kTVhcnet2b4GUvbuo321F+
 EAvhaIcAJQUxrP4yNfvrY0IoCBOcM7vbk3TeGKbAkWxa8OSHc6cQPHhz
X-Gm-Gg: ASbGncuxMRsf0RsujD/+/a5yzygp+plj/of5u/kdQJdjLTDOg5WHiOCISTAx0bqCTrJ
 S077/oNlle/sUuRHZONyXzR6vYr3HOLwdTKrKW2ae1zTUGZ7y7jCDbSMUDrNndX8ZhHFXcjrs9n
 dN1z4CR4mycrSDofBSym3JY8ICNAd4DyrecODz3/30d7mXhwG28ys+ka2afuTqRRof9K1iqoJUF
 cPFVdAuqxTBUwIdQeLo0wWrb+pk63IsJAJkWZFGSr3fJI3apQszMdeX0bY1bB4GHv0Gp2N98nTV
 0GSZy8gWSGj13zmQHmtH619ZC8SLg/EfB40gbjqPzMHyMee7sCy1QfjZ7dhaeiALIVzdodPpTbz
 hrKwsCmMv7TlQxjkVdSZnQeDHP3QMqY+WxVEDvDT9NLbVEzcpu/VQ4O/5PX0XAudtV57J/qdOaV
 0frEf/RCOowHwmnQvFwRHdn/FQ/1O1M38MKivgag==
X-Google-Smtp-Source: AGHT+IEY5vwkWiLQpFdBP/OKiL2TG1owypYb10cyIeolmsHdvVP9kUkUY22iwpY5kr68lwo8OufYEw==
X-Received: by 2002:a05:6a20:7f8b:b0:2e3:a914:aacd with SMTP id
 adf61e73a8af0-32b61deea03mr6012279637.2.1759531762075; 
 Fri, 03 Oct 2025 15:49:22 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e7c:8:5098:8942:78be:db30])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b0204edf0sm5959882b3a.44.2025.10.03.15.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:49:21 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri,  3 Oct 2025 15:49:17 -0700
Message-ID: <20251003224917.1950708-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Zoned storage devices provide marginal
 over-capacity
 space, typically around 10%, for filesystem level storage control. By utilizing
 this extra capacity, we can safely reduce the default 'valid_thresh_ratio'
 to 80. This action helps to significantly prevent excessive garbage collection
 (GC) and the resulting power cons [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.181 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1v4oad-0003Mp-Py
Subject: [f2fs-dev] [PATCH] f2fs: set default valid_thresh_ratio to 80 for
 zoned devices
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Zoned storage devices provide marginal over-capacity space, typically
around 10%, for filesystem level storage control.

By utilizing this extra capacity, we can safely reduce the default
'valid_thresh_ratio' to 80. This action helps to significantly prevent
excessive garbage collection (GC) and the resulting power consumption,
as the filesystem becomes less aggressive about cleaning segments
that still hold a high percentage of valid data.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/gc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 24e8b1c27acc..6c4d4567571e 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -25,7 +25,7 @@
 #define DEF_GC_THREAD_CANDIDATE_RATIO		20	/* select 20% oldest sections as candidates */
 #define DEF_GC_THREAD_MAX_CANDIDATE_COUNT	10	/* select at most 10 sections as candidates */
 #define DEF_GC_THREAD_AGE_WEIGHT		60	/* age weight */
-#define DEF_GC_THREAD_VALID_THRESH_RATIO	95	/* do not GC over 95% valid block ratio for one time GC */
+#define DEF_GC_THREAD_VALID_THRESH_RATIO	80	/* do not GC over 80% valid block ratio for one time GC */
 #define DEFAULT_ACCURACY_CLASS			10000	/* accuracy class */
 
 #define LIMIT_INVALID_BLOCK	40 /* percentage over total user space */
-- 
2.51.0.618.g983fd99d29-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
