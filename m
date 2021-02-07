Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 833E131270A
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  7 Feb 2021 20:06:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l8pOE-0004wo-AV; Sun, 07 Feb 2021 19:06:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=665305f4c=chaitanya.kulkarni@wdc.com>)
 id 1l8pNw-0004vm-MT
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Feb 2021 19:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=emEYwJowhdtWQqJL3EVg0DndLnBz0FJbPsUGUETy6vQ=; b=XB7HSvMCwmGVw0s8HmxfLN+20M
 +wiWCW0cYi4GvOBoHUsBcw90h7ik9+bop3htq+Z2Fxl6q1skxRuiGhwrjqH6cG9vJKYFaXxqBh/kv
 i7R543qyDRCMDIDz+p5Aypp9GbCVPw6x1j0/0Jl45Vhyvh9sDIi5OLp/Igzw41VK2Rls=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=emEYwJowhdtWQqJL3EVg0DndLnBz0FJbPsUGUETy6vQ=; b=ae0bp/JNXgZE76wuC96/b8wpFR
 YA8AJ4x42O2Mk1B+hgh1ub0YZY9gcVGlKJbgJxV7v+4Nh2SXwU+lYU4ddII9byAbTKju+YNATo7vC
 0vhsbKb1bB0NgqTykCN57K4eMzKkSk4NF3of/Fcy3xskP+InfR19ZqtifVt0nOtro5fI=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l8pNj-00DxfN-SH
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Feb 2021 19:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612724763; x=1644260763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/sU16hyrajvlrgbsNAHlb0pAxwxEoMR2N8xqIOC5Bzw=;
 b=nAS2avLv6RKkfRWgMc9h+/8Xl1bcxqs6jWUg0rwYh8u8KwDLg2E07nAO
 Q+oucNHaBM3bYwT4mArBzLX4g83Tf3I1wb+z6GqNYBVTmh00Ytml0CJ5X
 TWW1GlxRT50tnOeFjDjFpGNX0bIDdJTd/aOW6tOKlv3CDL2146eNZMpnb
 dhkRp2pFq4z4WtWsF338/VU1uxETwypp9aePjOiqhV3WNaAq/6sdAOCvg
 Ui08EEYxvE/jSXYAvHg7BU7gCRYD1ZOSpaJ+bEwm4rUcOgW070Pq7eChk
 unLa/g+iQsP7Cl4UiOihLv3GTy4dKpBlh6aKOAFMHp/wnIeHxMLXTSzGv w==;
IronPort-SDR: BZk+/lu8FkLKFUn3qJEnKtyeh1HzsiA7Efd259eAuqS3CLOZ8m7966o6hVCSWIWyi+WY2WvXfk
 udwsSGZ/SrueDTk8JRmJ5h3RCDIWoya3djJxDqYf/Qkx5AbGihzqcMp2xTG6i8Ovd7Vto8GJt9
 Y/LVytrk0M5hzlvx9JNHdAIwyl2VXo/YB22c1gQuJOkbQQ+arm3PawefVzY+17tPVlV4XLROdh
 74ivRMtEwvXsPlmqLRoee1Y5lBZwdPTeKZmfaIWSxxnJEBblMqcOjFgMTeoZKIvjZbc/rWtowm
 qZs=
X-IronPort-AV: E=Sophos;i="5.81,160,1610380800"; d="scan'208";a="269855539"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2021 03:05:58 +0800
IronPort-SDR: BCGiG+V+h4hcN7iPwpINVcYmmbXO3KZ5cLGBfKTYIscS/dZvnKQ9fK3Ln275e7LaK5udQcvnBr
 0ALUZO1hC9dnBbnXQ3Q1X1M/I8w46BZ9c0WsHdksCaoQxplO6Varm/6rZZcvucoVN7Gl/jjc4M
 7dfS7JCKH9iuFHPKOcyBGEQCjgKPr1BIq9BhL40O6o9j2IA9yQ6FXdUkcHAcTs+4lJCm1tGjg3
 Dv2D0RwkL/4T4+iRL0SIaVZXCfsLnqbZq5wAKrgw3HRm/AYvfKaqXikx13ye/BzUO2Kk3fj1Gv
 2sMupc0JDl+CIO2ISxltmisi
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 10:47:54 -0800
IronPort-SDR: Fh0a8KOx8UaWk2LjpLfdutmd2ZUZW4sTiB+72pFPwJmhQv9cItQK4N4vh6QK1NTzhF2pNQ2OQX
 ek/hhLyR9dj/BahvaXDLEkuILAf/UIf19rwag54p+32immh2DiQpUSJrcb5f/xx2eQS90p2Xp7
 Z/mNQDvFZUBz4EGwOtn/urCM1pO9tHUayhheIx7bB1AaDLfK2huaALMv7a0fnTRBE5ttLKIhl7
 32xqGxR0tsvTklF7k0y2ddxPy0Pct+UY5PvBXkbrm5prRkgWzo8U6vI3ViIKd4YZXu9DTfWuQC
 f5c=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Feb 2021 11:05:58 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org
Date: Sun,  7 Feb 2021 11:04:24 -0800
Message-Id: <20210207190425.38107-8-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210207190425.38107-1-chaitanya.kulkarni@wdc.com>
References: <20210207190425.38107-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l8pNj-00DxfN-SH
Subject: [f2fs-dev] [RFC PATCH 7/8] f2fs: use memcpy_from_page() in
 pagecache_read()
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
Cc: axboe@kernel.dk, hch@infradead.org, damien.lemoal@wdc.com, tytso@mit.edu,
 bvanassche@acm.org, chaitanya.kulkarni@wdc.com, dave.hansen@intel.com,
 johannes.thumshirn@wdc.com, ebiggers@kernel.org, clm@fb.com,
 adilger.kernel@dilger.ca, dongli.zhang@oracle.com, dsterba@suse.com,
 jaegeuk@kernel.org, ira.weiny@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/f2fs/verity.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 054ec852b5ea..44e057bdc416 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -47,16 +47,13 @@ static int pagecache_read(struct inode *inode, void *buf, size_t count,
 		size_t n = min_t(size_t, count,
 				 PAGE_SIZE - offset_in_page(pos));
 		struct page *page;
-		void *addr;
 
 		page = read_mapping_page(inode->i_mapping, pos >> PAGE_SHIFT,
 					 NULL);
 		if (IS_ERR(page))
 			return PTR_ERR(page);
 
-		addr = kmap_atomic(page);
-		memcpy(buf, addr + offset_in_page(pos), n);
-		kunmap_atomic(addr);
+		memcpy_from_page(buf, page, offset_in_page(pos), n);
 
 		put_page(page);
 
-- 
2.22.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
