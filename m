Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BC4ACE36F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jun 2025 19:24:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h86P4P6w2sC/oIOuGnUd0pknyfEge/pQ7Ls+BNP/1Sk=; b=QaPW0TciSb+Cd4jJ21/z+r1i5E
	e8dX+DzBMWg/UeZGNDxwiTK/5g0LoVe4Xs2Nfzdbm8fTcpWbh4qwqQzD+SquXofa/1lwL/q+8bCr5
	z94zYoEhRTcyILU4+L/xZLVSRY/OnDki/dfTy+wLAiHg4pEQDG+bLJ3qNCQTVYJIuJio=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMrr6-0005tV-9f;
	Wed, 04 Jun 2025 17:24:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1uMrr5-0005tP-LP
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jun 2025 17:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zhG1JhoXZUo1f3yXWr0+fS3M+qXdVl1plAhbPO0kUgA=; b=C3h3N0HGFPDdhdFT00kaaJxLHd
 JSpUjjcrA/28bt1PltbJIY1Ly6POyJGn0pCTd2GpLYPt8y96hRfSBrS5QHDn2xErPM+3DKoe4w/oX
 biJPGzimdsAfcx3rzBXDpD/OE1g4OGKhebB+6DcJpKI1BAS88MLhlpreD1lCa04s45gk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zhG1JhoXZUo1f3yXWr0+fS3M+qXdVl1plAhbPO0kUgA=; b=g
 /cNC7BRTs/ooh/EYIuWhMSL2iXdkm2mJYwRhpQLY727hjvNgWvedUnJmw4/oeDh1pua/Kc+iICfP5
 0rH7a0ESXuQ7kmas5ASJta275AsHkDUthTSO7QIAwqj2GjCqtNjofUF3F43WHr/NFzc23U+oQ7iBt
 nxuoc+NxuUppupPU=;
Received: from mail-pl1-f181.google.com ([209.85.214.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uMrr5-0003Gt-1e for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jun 2025 17:24:47 +0000
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2345c60507bso684235ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Jun 2025 10:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749057876; x=1749662676; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zhG1JhoXZUo1f3yXWr0+fS3M+qXdVl1plAhbPO0kUgA=;
 b=kTXlWg1cDcUOXfkBQQOi9ludc/D3pC0DffaKxJWrQpovk7OaxyFeeMKop9+GzwFEm9
 ItBrkRCTw1KztX2rWmKbHpRLFofPwzAQRsJ49pPIOOEXWH/7jnEDLp1wv3Vao8sp8+l8
 A1VYu+dDcU4oSAJZqK6NMec86LgG132WISE0imnuOOiaW0Hj4avX9DvN463+45vE3xQQ
 kMIXZY30ngizrs0VGAK9Tu6ZjO/+1V8mEc/7DACG6MJ05+mnYYAlboS5fGlzvRFtML41
 xMzxpVELDSeMUwxCYxVR3sr3dRiBQOgbybG5Uh448wNSdrz7FSjNzn+wD/Gh5UtdTTlh
 3chw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749057876; x=1749662676;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zhG1JhoXZUo1f3yXWr0+fS3M+qXdVl1plAhbPO0kUgA=;
 b=gSAWzmsE++B4zW+ngqNcWPyeIzMfoDLvNApbNaKKoq1Qg6W1LDVg3blRH+gkCM2fwz
 2sToWGMzp8eCACb1TXIW2YaI62AaBqJxx96Zbv/eIsjcEo6/JkkXODJox+IUKVq+lQNC
 HkQxRJUFjJvLZ4XBi4uBVg+YQAiZ7IHjp4fBbihez99ZkyRH9mC3FmUf2+kT5rLwe3tW
 4m9Vw7h0ltmgHs8Oz6oZRu2M5+8fVoz9upfLPxjMhnfVhVJ606Dik3RxNxkE0S39E8hC
 s3+L97yTcWRy9zrzim+EQ3HaB1UEjOKiySvwSLGTz/m/oUE6DiE0b9BHo1ztspElWhLc
 yA1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWneAeLhqLuOIYZcsVTaAHSjeYWkWQ1ssh9Ev5SGov6IHdbFNu/ssBArwhHCM2SW8wIQPf6WX8DtuIDLx8QWmv@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwkHdjvGoFkPBfh4hlJkiJ7iHZPisSU+/41lXhfPlox7DfrqCo2
 NxbMVRz62+MSwoPbtPplJzmlEJldSXuJedSmrZVJFEAdFQhuX5KUqPOE
X-Gm-Gg: ASbGnctAupLdEu10NH1odxRi2JCROhEVmb+E+prf2N3OoO1bxb8Y3H3FpFZS0vzm8yc
 mO9aePrSG9Wp1RGSbo2ZQLp3K/ZeazcPGtLfqUikKkKzmYZEQoLQGfpa6dIMuZtIBSMtlekX6qX
 N1gnqOM1gjR5stRj6wT0iWrDUXZr7S8PeGCpwvQ5s1f8dDexeYjZYUqOG7zG77n4qilmNIVTra3
 mnAuT7gWEcX/Ts35otdpBXXJ5dSIKTFxmvv90GIGWF9bZy5hCs3dDRjfKO/Vr03NDh6ebTBoc16
 EGHnx3e4eYT6M4gzFF0+BWKZQfG+Nxk/hPYoMKS3NyAnQHdytT+VDgf6REPyZIXpO5Fw4h3vfT+
 Da5h8ZHMKUmoM2JGTowIgV8Natxj2XD2DOa23M2eQ+A==
X-Google-Smtp-Source: AGHT+IFX+2C7dStz6l25B6CR114tcxl2LulaJZmZkforLWsc1A1k86t9Ufv4s0w9RWZANI/jnMPbPg==
X-Received: by 2002:a17:903:22c5:b0:235:779:edfa with SMTP id
 d9443c01a7336-235e11e3c77mr57450655ad.32.1749057876157; 
 Wed, 04 Jun 2025 10:24:36 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:5d7a:a6c3:97d2:ecd])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2eceb9d33csm8944908a12.47.2025.06.04.10.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 10:24:35 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed,  4 Jun 2025 10:24:26 -0700
Message-ID: <20250604172426.3683837-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.1266.g31b7d2e469-goog
MIME-Version: 1.0
X-Headers-End: 1uMrr5-0003Gt-1e
Subject: [f2fs-dev] [PATCH] f2fs: turn off one_time when forcibly set to
 foreground GC
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

one_time mode is only for background GC. So, we need to set it back to
false when foreground GC is enforced.

Fixes: 9748c2ddea4a ("f2fs: do FG_GC when GC boosting is required for zoned devices")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/gc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 2b8f9239bede..f752dec71e45 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1893,6 +1893,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 	/* Let's run FG_GC, if we don't have enough space. */
 	if (has_not_enough_free_secs(sbi, 0, 0)) {
 		gc_type = FG_GC;
+		gc_control->one_time = false;
 
 		/*
 		 * For example, if there are many prefree_segments below given
-- 
2.49.0.1266.g31b7d2e469-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
