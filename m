Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF935B333BE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Aug 2025 03:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVmlGqnhaETabdxIEo1Halspig3gA9qsi0B2ZqmNgHo=; b=gqYTKm7RljQJqYlLtqV9PEUFGO
	laxWxu0LBbMk7JExdKecaSBXK+x+b//LUwwJoDWcqR4xtT+RJhP5mtLrcDqN0DbWXSaoz9/hHUHoU
	tj4lQ+NEqU7+wlYFnzf8dCteec+ux2RVcKAvUApoeVZVkb85Zi1+1YqmQWFeOvFybCSE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uqMRU-000401-Vf;
	Mon, 25 Aug 2025 01:56:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uqMRS-0003zl-Ue
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ewsJv9L9UxB9lCqBAppmzYWrTvuTQARSd8m0wCeMyZU=; b=VxGEa0ZMQF+pQ0aayS1BW+skPJ
 xTd3LtiPvTzXISk1Rh55thkzcIL3NuLDewFLd8UwdzuMbtKt9ZxeABaJWeTKSyQDhj22tL5kCsZ6f
 APeKboBUg33UQspsORp3DL3uWW7yWgWJO1aKbuDVddbOT6Nng/Swfaur02w3WK4KbaxE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ewsJv9L9UxB9lCqBAppmzYWrTvuTQARSd8m0wCeMyZU=; b=lv9DomQ+TVnEhGDIEP35Ahv8Kd
 TfkL0W+JwY/4wlxf+5vb8xWfiHKAIMYMBZNaXqFwicrGJ5AdUOZQvDnba1T/K9L6DL7xIrN4i3p3N
 suCUSRK9laO0bFJpwFb4pOZi/W4zge/IPrqqGyMpjbDRfnl7/aORjJ+CMxng7ar+DMUQ=;
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uqMRT-0002ov-DW for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:15 +0000
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-32326e09f58so4527699a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 24 Aug 2025 18:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756086965; x=1756691765; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ewsJv9L9UxB9lCqBAppmzYWrTvuTQARSd8m0wCeMyZU=;
 b=jFjGCWqAicZdvnORYAmD5jrt9nXb7Snxny7fEHC8S/4Pl+ycQUie/gAj2hAc8BQZ+W
 2WFWAsBdTQyWJ7rstcsYXCkBKvDgUtK7NlyIvYJtTa5O/kqHJO5RcVXp00Bw3GNjaxK2
 h5X6vb+l57jkc+kuCDgVBXOf6ghyCxtm6rMSnb+CB4Nj3jOGlqtVaI/R2HpZfDzCa+Qf
 Sw1ImfS+jB8BR0SOhKlOf0QRoyEcN2+4z6sKNhL0b8HofFqr65VTErQjyZDEXo/qrHJa
 G7iEa2i5SLPjexQn5Umzd9NmT1thwjgB1hyYwzHx0bBGzOp+nCTX6SNm+rUb9KRkoaye
 Z8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756086965; x=1756691765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ewsJv9L9UxB9lCqBAppmzYWrTvuTQARSd8m0wCeMyZU=;
 b=K6DsHMHpXMr02niogQwQhsLf+Ip05E/GfrNnV53Za0vKhiMLpALOosVMDX54SudhAO
 z/XM7TJKMGbSRgml/i4dEHhjTpnZCXtvqewde87wdM0LOi/OzUYBaH2KYa51jTzS5cWO
 E4Av2Lr8NIrw2SrVTkVte+KKgslKJgdke2vqMrBeiz5E1A1RiuD6PTzFcI2buubrrWD3
 Ikf2IzwxLkZmrU1DsN0z0wn36OfJsfVTmzGRgLgPX/XD4eO8aQEwlwiUfJhSp6GVcop1
 g2eCQ8m6zxV8Mjh/xjzi0A9viyc+IAj9GPPB5k0gO1GvZDBQukW/fCd/gAzb++C3kkXH
 AbBw==
X-Gm-Message-State: AOJu0YypbrM32TMmjxZjdRi26YXiEpYSaJnfzhddVs7ULibc8OL8gR4l
 7cqJ1eYhAoyX677cVtXqKSzGHYDnCMjF4BQ+KPhkZPCKPimMWGHgH3phcb6RHA==
X-Gm-Gg: ASbGnctX0WofcdK5WUDjRUB/cli4BBBrYPTWWpaYWoayNipaH5BGsyilZqkScv9nZsF
 4AVGdFeggyWfWmfTdCZfv3Ajzwp3RbzCRIqdFgpaumrWbOZ/fh/wyNOgdEoe6dCmL+o4uG4wB0B
 xMfTgmAf8BK+819yDKB9Pw/yIYJZwbduCtAR4sHbQ7V4trcYqcXmOupIGzGPykajF8agdr6cSph
 98JU0mfcTv0EVI7P0CB7ZyBk5f4o98r32UFZR8q+FZYFC5HZ7avofTO9w6+NkuBPXGLrTPu6eB3
 AEPq8Cwd88WeLwfj/BTZB0DaZiisi+Fe5/y6OHnqakwPGSbRxd3IzmzGfCtqdnNht3lU2CiKfgK
 XEe7/Fyh81mK12z7CN67c8Ow7nSb0
X-Google-Smtp-Source: AGHT+IGv1ExadPBEB83m2IfiaY2h6XDQ/Cp1DYouwgd7m1bf4MOagRymo4HcBBdF/yvGggjMXE+LEA==
X-Received: by 2002:a17:90b:17d2:b0:311:f684:d3cd with SMTP id
 98e67ed59e1d1-32515ef7240mr14142115a91.12.1756086964658; 
 Sun, 24 Aug 2025 18:56:04 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b49cb8b1989sm5147883a12.18.2025.08.24.18.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 18:56:04 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 25 Aug 2025 09:54:43 +0800
Message-ID: <20250825015455.3826644-2-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825015455.3826644-1-shengyong1@xiaomi.com>
References: <20250825015455.3826644-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sheng Yong Signed-off-by: Sheng Yong Reviewed-by: Chao
 Yu --- lib/libf2fs_zoned.c | 6 +++--- 1 file changed, 3 insertions(+), 3
 deletions(-) diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c index
 6730bba0da82..92791a768807 100644 --- a/lib/libf2fs_zoned.c +++
 b/lib/libf2fs_zoned.c
 @@ -429,7 +429,7 @@ int f2fs_reset_zone(int i, void * [...] 
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
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.51 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uqMRT-0002ov-DW
Subject: [f2fs-dev] [PATCH v4 01/13] fsck.f2fs: do not finish/reset zone if
 dry-run is true
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

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
 lib/libf2fs_zoned.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index 6730bba0da82..92791a768807 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -429,7 +429,7 @@ int f2fs_reset_zone(int i, void *blkzone)
 	struct blk_zone_range range;
 	int ret;
 
-	if (!blk_zone_seq(blkz) || blk_zone_empty(blkz))
+	if (!blk_zone_seq(blkz) || blk_zone_empty(blkz) || c.dry_run)
 		return 0;
 
 	/* Non empty sequential zone: reset */
@@ -484,7 +484,7 @@ int f2fs_reset_zones(int j)
 		blkz = (struct blk_zone *)(rep + 1);
 		for (i = 0; i < rep->nr_zones && sector < total_sectors; i++) {
 			if (blk_zone_seq(blkz) &&
-			    !blk_zone_empty(blkz)) {
+			    !blk_zone_empty(blkz) && !c.dry_run) {
 				/* Non empty sequential zone: reset */
 				range.sector = blk_zone_sector(blkz);
 				range.nr_sectors = blk_zone_length(blkz);
@@ -513,7 +513,7 @@ int f2fs_finish_zone(int i, void *blkzone)
 	struct blk_zone_range range;
 	int ret;
 
-	if (!blk_zone_seq(blkz) || !blk_zone_open(blkz))
+	if (!blk_zone_seq(blkz) || !blk_zone_open(blkz) || c.dry_run)
 		return 0;
 
 	/* Non empty sequential zone: finish */
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
