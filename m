Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A9F30F40C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Feb 2021 14:42:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l7etx-0003rS-Ek; Thu, 04 Feb 2021 13:42:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ed.tsai@mediatek.com>) id 1l7etu-0003qo-9H
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Feb 2021 13:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iyWD+3p2q080UDuOHWHEniBrMCC5NgLU0HvEjr/oBrY=; b=BK+I1VUk3LBWS3hCClSU8LHa3H
 QVm5HvEZvRfsKTkrylNRo8F6YdLEhWa/VyaghzO/82VGtDflrnVEnnhFdj0DNuGPs5pt/MayhLJ1q
 xPS1xE1YMOM2vwglsgdyU924I0j9XRmJhF4rWfHOV/X37W0FUitEYmRpRBOtsOt2k68Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iyWD+3p2q080UDuOHWHEniBrMCC5NgLU0HvEjr/oBrY=; b=a
 oMJmb6qHiPSP9KMzX1aiZT7YO9RkL4GI6jCthU3sj2xXyQwu8GY95/foIk+FnXVmHR5hC0jPtvtyh
 uwqIQ7hKmJyd4/PL6hJGTlJ/nRASpP773hN79mGVGnCwsHuVMMkrsm4VkQTSW/GXZmIMaS1lxGPpF
 eYovCulKNb8IB9/Y=;
Received: from [210.61.82.183] (helo=mailgw01.mediatek.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.92.3)
 id 1l7eta-0000ee-G2
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Feb 2021 13:42:25 +0000
X-UUID: 1e28ea95ab33423aaa971d97ffaad201-20210204
X-UUID: 1e28ea95ab33423aaa971d97ffaad201-20210204
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <ed.tsai@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 319922277; Thu, 04 Feb 2021 21:26:20 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Feb 2021 21:25:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 4 Feb 2021 21:25:58 +0800
From: Ed Tsai <ed.tsai@mediatek.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Thu, 4 Feb 2021 21:25:56 +0800
Message-ID: <20210204132556.14934-1-ed.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 264E744759CDFE8E1FA7B7EB4E35E7CEFEA19D310B34A1FB30C8694CD75E32962000:8
X-MTK: N
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mediatek.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1l7eta-0000ee-G2
Subject: [f2fs-dev] [PATCH] Documentation: f2fs: fix typo
 s/automaic/automatic
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
Cc: linux-fsdevel@vger.kernel.org, ed.tsai@mediatek.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix typo in f2fs documentation.

Signed-off-by: Ed Tsai <ed.tsai@mediatek.com>
---
 Documentation/filesystems/f2fs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index dae15c96e659..e1cda214058e 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -831,7 +831,7 @@ This is the default option. f2fs does automatic compression in the writeback of
 compression enabled files.
 
 2) compress_mode=user
-This disables the automaic compression and gives the user discretion of choosing the
+This disables the automatic compression and gives the user discretion of choosing the
 target file and the timing. The user can do manual compression/decompression on the
 compression enabled files using F2FS_IOC_DECOMPRESS_FILE and F2FS_IOC_COMPRESS_FILE
 ioctls like the below.
-- 
2.18.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
