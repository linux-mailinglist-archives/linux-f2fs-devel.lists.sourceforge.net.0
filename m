Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E541EFFC3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Jun 2020 20:15:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jhGsf-0002Ld-Fs; Fri, 05 Jun 2020 18:15:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yefremov.denis@gmail.com>) id 1jhGse-0002LX-PB
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jun 2020 18:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QLtVBAQHt79nrKp5l8gcbQoeTzLDxbZbAEut5UfqQPo=; b=T9DNt9Awy/eUO/KMk2ADBZLOIU
 tF83W5/3FrKIDFta0FQmQfAhudGdA3/S35U6+2gAAkDMp2RRjLzUc+fD/J1CW+QRNiiRuDNfCeEGq
 I/OXa9IibTUlJzWp0FlPAphePlT3/Vob9rHCauO6Sw0lBfG+2sXWFhWUFUyaI9sGfH4I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QLtVBAQHt79nrKp5l8gcbQoeTzLDxbZbAEut5UfqQPo=; b=H
 wWwRYOurozhawWwZI46o35uU8h+JMeTjv64Cz+aTjbwKZlKvL93P4Lneh+sDc34cvdn+iK1dw93dD
 ucpqNXB/akBHeGtMhY5zx7xR6aBTWwPQryFW1u1CdFW4LGJnqjNdMTv65Ptjq7hP8bjFwUGos0ZS0
 vFbDX+UCQX+ZLBkY=;
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jhGsd-00A7y4-LG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jun 2020 18:15:48 +0000
Received: by mail-lf1-f65.google.com with SMTP id c21so6360169lfb.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 05 Jun 2020 11:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QLtVBAQHt79nrKp5l8gcbQoeTzLDxbZbAEut5UfqQPo=;
 b=ku3xkIVp3Pa98YlDqdoxg7vcxQ2qp2aN3RSh2hCS7HwmMxkeswsldoIKKtO2X+9etW
 lLO7Aw3du6NHMBXJ4Gs1ZYG8mZ6ljgs0k0EMLt0/uZ6IxycWviazB4wBIstlLBoM3iwc
 w3aYltXts+/zsbRtSjm8HZdHY5feMG17o6/alZKsOmflft0sJW8j7ryQybWIF187g7BU
 VO+2GU7Svg8IczHmN1RyIEMCoaBlOjrraWt+zEUWlUINh25bd6M4+P4q4pTCHquIAob9
 EJjlVrZBhdlEG9Dxk5JXSd+jqjW40Cowd9fv2k+w1qOI+o7OT528linSe5qc3KC0zoUE
 6K9w==
X-Gm-Message-State: AOAM530Omma7v0euyp6e4FKTSMpyRW4PzOv5qOMUOaa1WMYLeONNZT8q
 FJSYgFaOwRbr7FJytQejLl8=
X-Google-Smtp-Source: ABdhPJzKHMsKE8ClyLyxqEZg6cRGaaIv7YE5pplZGmBmwx4+tTKTkQhw2OhUzUAPoKaz5kP4NqBFBA==
X-Received: by 2002:a19:642:: with SMTP id 63mr6064091lfg.173.1591380941170;
 Fri, 05 Jun 2020 11:15:41 -0700 (PDT)
Received: from localhost.localdomain (broadband-37-110-38-130.ip.moscow.rt.ru.
 [37.110.38.130])
 by smtp.googlemail.com with ESMTPSA id x69sm1254625lff.19.2020.06.05.11.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 11:15:40 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri,  5 Jun 2020 21:15:32 +0300
Message-Id: <20200605181533.73113-1-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (yefremov.denis[at]gmail.com)
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.65 listed in list.dnswl.org]
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jhGsd-00A7y4-LG
Subject: [f2fs-dev] [PATCH 1/2] f2fs: use kfree() to free super in
 read_raw_super_block()
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
Cc: linux-kernel@vger.kernel.org, Denis Efremov <efremov@linux.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use kfree() instead of kvfree() to free super in
read_raw_super_block() because the memory is allocated with
kzalloc() in the function.

Fixes: 5222595d093e ("f2fs: use kvmalloc, if kmalloc is failed")
Signed-off-by: Denis Efremov <efremov@linux.com>
---
 fs/f2fs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 8a9955902d84..9a3c8eba37e2 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3130,7 +3130,7 @@ static int read_raw_super_block(struct f2fs_sb_info *sbi,
 
 	/* No valid superblock */
 	if (!*raw_super)
-		kvfree(super);
+		kfree(super);
 	else
 		err = 0;
 
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
