Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B9431270B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  7 Feb 2021 20:06:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l8pOJ-00063p-9N; Sun, 07 Feb 2021 19:06:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=665305f4c=chaitanya.kulkarni@wdc.com>)
 id 1l8pNd-0005wH-EA
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Feb 2021 19:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5y+6mQ+LZv/ZpYvUioYulL/iibBdUW23iJJmh2vJQOk=; b=U4tcx2WXlXmkSd6wcY8eeQ6fxk
 3I+7Uob8vfwefF09Q8WXy26bHXAXFRNWo6LZi+yLWzQ9mtfelo+O6AGDXaov/0EIz1CLfmbkikpab
 R/NL10pKDKNQ9ty5Ove5JGBUVTPpFTwAxbzFuokL2jHzUdRKag4RnAoixFaLrgchEyPw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5y+6mQ+LZv/ZpYvUioYulL/iibBdUW23iJJmh2vJQOk=; b=nHjAOINdqCTRoKyv42J3MZuPh5
 t7olNPrBqix0SHeKhgz6Np5VksMyYh3yjAvyO0ro6f0G8fx6uzL2t+uVd0V/eW+j/Xn7IlFOUw2u6
 9druZ+ovCK0bd9/RhgokmDs8Y01jINiWh5+kFZ6ZkJyfnEF9UhbbKkQZGuexCYSsl+MI=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l8pNb-00Dxf6-2F
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Feb 2021 19:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612725642; x=1644261642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e4vze4agz5qI/6i5moaf/fwbfxYs65n7gouRgw41U/E=;
 b=AgmbAdaMlP8WiBgqNsMRY64wc6i4jOqfv7T7SKDVa7Y1k3yxcdYWbTGP
 bNa/cBLCLI9QJKsHQzfQweUs59w9+sHIWvnTZjo9IZ12f9HmmYwfEQwzy
 3ZCRnShBMnk76Cwke/iRRGXikMq7XNeA9z2KWJTjLDALnstx/+Ss1Evn+
 EJfFsHtJpEa7Che3x5YyX61w64e9MGZ+geLilB8NkHvSSOm0isDV3Fe9e
 Ea6k0yaL2TIeNwS5KI91pes8/4AdA+/jgfwTbNAZWuicwJw9sFnmQx93X
 KMeODmSdQkhnd3FHyZmRlI4oD9S0K34yk7OsUBmDb80z6ZVA14QRSVhH+ g==;
IronPort-SDR: bO6xl22KMJm62nPfsCHDk4vIvkSCIPXaHalHf4Nl+TxLAVAY1OdExjWp+1cBid5wC0CVxCzH00
 FWlQRKBLDKFpT8iTmhHg+Tnxcl31jAyrBE2OLfePVrlE0hfWl1xD/OsxzG0Nw3DTBiim/o9fIg
 9GbGf+oUmiWZ3Nhu8GX+fc1M5gQTnGBYjdRQOmSAkD1B65/FyyhrsZj5ZFefjnzNR1PfL2VPXW
 R7RMtnzJ4JyON+Fni/P9dstmGS/l3UeioXdsiWKyjd3IlnsYhmeeWMEaCV0sCb4qT/fCJxbVpL
 4Ko=
X-IronPort-AV: E=Sophos;i="5.81,160,1610380800"; d="scan'208";a="263497389"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2021 03:20:34 +0800
IronPort-SDR: hMPO09cCAQ7c8s2iQUo6cJJtt1xe4oetElV0aldeYrGORnKvlpX9tuyx1FqhGn5EvMK1KbaV++
 0nNDt7dFDO2t46Y5hUbrcGHhwWYrdNC50rY6Y+tHuUComwuPgzLW7j6Eo/3nC+qRblS3If8Bm8
 1aLKJbjNVWgNgXyJ1gWf0a5FV67qbdopxGgwpbNUt2ybmq3NguiHM/d0P+QzM51aiEsnzYvE2c
 jqiiAzcqbE3RvyLVg7OKI9fMNvbinnBgKGI78ZNn2Dr7Ge1Az/OVg7PR0AnkQ1QIr/Yfei4sLR
 DpbMCp+goq5oxyc11Ca72hI3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 10:49:43 -0800
IronPort-SDR: 43sJyMm+E8HHgPMk2LqQoOndsIqMY2uxtZc9Zo3NeUktByX5cUc+e7r1vsPvEqvYJHKVJ3Or86
 BuXhCpv7P+wcwaPweZ7VodIlEaWUlqrDMhvfVz8SFeQ3Has/3V7k9knr6HZcWkazEioNxOtfai
 8hgEan6PoOi7NG1nMyP9jcXGC5ycxVtppZHe9HkTB5axK67Hbr3QSjYHfNv0ADwQ5FPYBEchp3
 kydAR4oGU5ktepD0fHi4lz5EhxbrcYGVM1q/wuv/rWZ4YmLA9nHQTC2SyNZ/YZTuUVDqYbhNGb
 Dl4=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Feb 2021 11:05:50 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org
Date: Sun,  7 Feb 2021 11:04:23 -0800
Message-Id: <20210207190425.38107-7-chaitanya.kulkarni@wdc.com>
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
X-Headers-End: 1l8pNb-00Dxf6-2F
Subject: [f2fs-dev] [RFC PATCH 6/8] ext4: use memcpy_to_page() in
 pagecache_write()
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
 fs/ext4/verity.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index c8e07f8a792d..cc4b046490b0 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -77,7 +77,6 @@ static int pagecache_write(struct inode *inode, const void *buf, size_t count,
 				 PAGE_SIZE - offset_in_page(pos));
 		struct page *page;
 		void *fsdata;
-		void *addr;
 		int res;
 
 		res = pagecache_write_begin(NULL, inode->i_mapping, pos, n, 0,
@@ -85,9 +84,7 @@ static int pagecache_write(struct inode *inode, const void *buf, size_t count,
 		if (res)
 			return res;
 
-		addr = kmap_atomic(page);
-		memcpy(addr + offset_in_page(pos), buf, n);
-		kunmap_atomic(addr);
+		memcpy_to_page(page, offset_in_page(pos), buf, n);
 
 		res = pagecache_write_end(NULL, inode->i_mapping, pos, n, n,
 					  page, fsdata);
-- 
2.22.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
