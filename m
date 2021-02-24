Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 146A1324329
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Feb 2021 18:29:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lExy8-0005hh-Uz; Wed, 24 Feb 2021 17:29:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <arnaud.ferraris@collabora.com>) id 1lExy7-0005hY-Dq
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Feb 2021 17:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lSAyfLqv+sLiGN9+LtFWxUtej4kK+OJ0OATIbd3f9kU=; b=IWRNsSg2oSxsOvQktl543b6ZgZ
 PfBE5r6IFokE4iGyn97H31yzH22NjE0gzk6riOYbGJpTd/fFrS95KcEs2MrfYj8w64H6TKi4nJH9x
 tdeww8thtfr3pUDX1N192gmjTqLtlFTKw/2FQ0hsO78uR6rtmdpx1x54AODZIwNvF9cc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lSAyfLqv+sLiGN9+LtFWxUtej4kK+OJ0OATIbd3f9kU=; b=V
 Yc0roWqSIFHCP/WAgodzK6gAMXIGjaH6TY8VL1YBaJaYjbRaeyjl84YICmqcnKjVyheH+ORr0DKVA
 oQxiFqrU1N9Kelw6DLLPIm5f6AEQaAd9VcReFG+9uBGImG8Kg3/6ttaR0ghMgplOYiDAdXSojwHHY
 HRQ9HqOmiOvCz/kk=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lExy5-0001Vq-6H
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Feb 2021 17:28:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aferraris) with ESMTPSA id 0DF451F459E4
From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 24 Feb 2021 18:03:27 +0100
Message-Id: <20210224170327.237831-1-arnaud.ferraris@collabora.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1lExy5-0001Vq-6H
Subject: [f2fs-dev] [PATCH] resize.f2fs: fix new reserved segments
 calculation
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
Cc: jaegeuk@kernel.org, Arnaud Ferraris <arnaud.ferraris@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f8410857b7a81b1b347253fcca713d8b105e9e7b changed the way reserved
segments count was calculated in `mkfs`, but that wasn't reported back
to `resize`, making it impossible to resize a filesystem in some cases.

Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
---
 fsck/resize.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fsck/resize.c b/fsck/resize.c
index 46b1cfb..3ee05f7 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -148,8 +148,8 @@ safe_resize:
 	/* Let's determine the best reserved and overprovisioned space */
 	c.new_overprovision = get_best_overprovision(sb);
 	c.new_reserved_segments =
-		(2 * (100 / c.new_overprovision + 1) + 6) *
-						get_sb(segs_per_sec);
+		(2 * (100 / c.new_overprovision + 1) + NR_CURSEG_TYPE) *
+			round_up(f2fs_get_usable_segments(sb), get_sb(section_count));
 
 	if ((get_sb(segment_count_main) - 2) < c.new_reserved_segments ||
 		get_sb(segment_count_main) * blks_per_seg >
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
