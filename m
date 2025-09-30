Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E70BAEC67
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 01 Oct 2025 01:30:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfpv7IrurhMm1WAA0ixOQN7j1vSPGfOf36yX8U7iuEo=; b=NoM3q7dw2KDRH/ynr0snk/4P/S
	M526juyM6k82Y1IQSh1PTQWYBrhMBmtbewhujGWakGHMsBWe723wGuX6M8JpGd8PlAJX8jhMCJuV6
	JdCEfJp25/gMO8xAey/ZXwEBDaHNS/o0L95jtaf7gHAjQnHPWl2ylxVJ4rlraYOZXDjU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3jnV-0000AH-SK;
	Tue, 30 Sep 2025 23:30:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mjguzik@gmail.com>) id 1v3jnU-0000AB-MP
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Sep 2025 23:30:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WKocoFyhYs5voJ1j0rINOqN8fPDxe4oLJZbuE7DLMzA=; b=AsuTsW59KImUXz6gkq7wBEJlZF
 MFneCmu1TMF54EWgZYTsYYS1iBZzKH6a/NgDjTI68ubfiWWEWDxvu71w36cAOvDt0zvh0j7PLnDEt
 AArOhjo9xd0LM5Kh+U2UrjSDygEMri5NozCxoifK0ZiuflhrhIeMboRKzwRSogK+OwHE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WKocoFyhYs5voJ1j0rINOqN8fPDxe4oLJZbuE7DLMzA=; b=Va0DuIN8meUpH8P80N0v7ZY4BC
 +YQTDX1zwCd0x98+k12P9Am6TGa3WOkRMO336uxHcjlAQdxy7Gzr6PqBGuk5SjLGbgAX/hR1roafu
 /IBS7iKsGAy+Ruh0TTKnknDYBdbAOF4h97S45YcZiaRiBpwpsfSwf1q8fdxcPi4li9B4=;
Received: from mail-wm1-f43.google.com ([209.85.128.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v3jnT-0008BP-Pl for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Sep 2025 23:30:16 +0000
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-46e504975dbso23407915e9.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Sep 2025 16:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759275004; x=1759879804; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WKocoFyhYs5voJ1j0rINOqN8fPDxe4oLJZbuE7DLMzA=;
 b=Hvmrp0dRMib99bu4401qhD3n31jDAe8BmQDK+2HC00UyjcOeoNLVuLmG4KKupnE8rG
 t2aOOdQbbh+5Wbe97pKjsjtIviVVUGp2J8yZVkVfmieoF3/2nrEf1ahtHl3id6pAg6yT
 JukwOuc6T3st1mAl6nSSQmr/gvJ6heop94wxbmXmTKM9hRg7B/3rrY5nny1vU296LJ2X
 JvPEhdD0YVanBQItGqs4QSXwZAzftCTzrMbhn7c8zDIVfMz87iKIBpMcKVX1JUpjszl7
 Chk58am8746fiEYj58SNcl5Q7E4tNAARSKXV68vfFPj3kz/DMK0rWzwEZsTl/4z8eByx
 8lMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759275004; x=1759879804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WKocoFyhYs5voJ1j0rINOqN8fPDxe4oLJZbuE7DLMzA=;
 b=Srzs3ulY45dXcnhSO7Z6c1P51v2mBVTgdxaACY2NqmZGLFibqwpkovpZHH4aKZ3ZFy
 5/dbFb6lZxT7T6WykXbt9nyriJZbDTPP09Oo+H7HeQ75TdOtuyQjsyioi14gkDYZs/ho
 5Gt1NnnODqV7erTp1HYvq78MU8I5wQeoc1i3Mm1pNLOx+GD61gqrDs7DngKP5CsF+S4S
 BcqmMXG68UrCz4kiz1aNoaECZaRZtWKj3q9CxVt2vOohm6elHz/i9rk1BW8Mvb0e7Eoq
 8bQLqf0EHUMNblk1RYVWAgZ/hu3s6ecxznEM9ICff2JOvLiKtgrF02FnwpK/EmZtyyIX
 tNmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX58kMe5+8eiRleGDpo9khrVRI2RBZGW+SeNAwVjlH/FTrLNIVVJPmxvMSkYElCxs0LuB8+CtqM6/5uQ11M/LoS@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzsW/UGAYDxTZS7pKjIPwpMjKK2lfKLRP+AkNkh5wuFTmu3zCso
 Qk3VWw1VlzWka5uSXiUYmIAEKpPeZq8jFbxtNwtpFHSgv2u2jBNDwAUz
X-Gm-Gg: ASbGncuy/aC9VM7v2R4+pBQq2IjEEGNLZpwblRRUpNLI5SICbwzLoEDQN/g0suS43Oi
 KXtAIkfEoqoGL+/gFpb1fafwiGnKRIg77+DcP6j15LAamt2WQdAQZCSEaXw1Yxe+aU+7svtU7Wu
 pzVtzwKYwBY5cnza+Di3pl5zWQksTql2ySD2Ej7StQa+A2kPqKbFrikzah7MYIH88Qmu5xSpnvJ
 kAroQG9sdwwdiWBZsyGBCeMsc/2+1PrNd4cWeNr4gchB40JUw/5VfSmKvtuPUZf4CncOjHXkV5Z
 BvEaCObchf/Jn3q8jZzNuaxdc1o0YieWEbheY3Ey1OZ3+n972mTX6K73S4uYotF8KBthUZcBn7b
 DnyqiJH5QEAGN+ruMzVoCWTsTVlBwf+Ep0hYsnK+0s2zW8KdOpNfPDHqXFdtlvzrmaSzua4vE3A
 nOwCUFptp8L6abzfyPl/SLgg==
X-Google-Smtp-Source: AGHT+IGrlrBcqkdbjFn8gHHNIH9V5H/OJUSkp8w+fjG+KJIkz3Qh/I+P4TAxPxRIKI9Oo1ZDCt+OuA==
X-Received: by 2002:a05:6000:2381:b0:3ec:e0d0:60e5 with SMTP id
 ffacd0b85a97d-425577f0a74mr1070502f8f.15.1759275003933; 
 Tue, 30 Sep 2025 16:30:03 -0700 (PDT)
Received: from f.. (cst-prg-21-74.cust.vodafone.cz. [46.135.21.74])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72fb2eesm25156984f8f.12.2025.09.30.16.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 16:30:03 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
To: brauner@kernel.org
Date: Wed,  1 Oct 2025 01:29:57 +0200
Message-ID: <20250930232957.14361-1-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202509301450.138b448f-lkp@intel.com>
References: <202509301450.138b448f-lkp@intel.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  iput() calls the problematic routine, which does a ->i_count
 inc/dec cycle. Undoing it with iput() recurses into the problem. Note f2fs
 should not be playing games with the refcount to begin with, but that will
 be handled later. Right now solve the immediate regression. 
 Content analysis details:   (-0.2 points, 5.0 required)
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
 [mjguzik(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.43 listed in wl.mailspike.net]
X-Headers-End: 1v3jnT-0008BP-Pl
Subject: [f2fs-dev] [PATCH] f2fs: don't call iput() from f2fs_drop_inode()
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
Cc: Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, oe-lkp@lists.linux.dev,
 oliver.sang@intel.com, linux-fsdevel@vger.kernel.org, josef@toxicpanda.com,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

iput() calls the problematic routine, which does a ->i_count inc/dec
cycle. Undoing it with iput() recurses into the problem.

Note f2fs should not be playing games with the refcount to begin with,
but that will be handled later. Right now solve the immediate
regression.

Fixes: bc986b1d756482a ("fs: stop accessing ->i_count directly in f2fs and gfs2")
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202509301450.138b448f-lkp@intel.com
Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 fs/f2fs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 2619cbbd7d2d..26ec31eb8c80 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1769,7 +1769,7 @@ static int f2fs_drop_inode(struct inode *inode)
 			sb_end_intwrite(inode->i_sb);
 
 			spin_lock(&inode->i_lock);
-			iput(inode);
+			atomic_dec(&inode->i_count);
 		}
 		trace_f2fs_drop_inode(inode, 0);
 		return 0;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
