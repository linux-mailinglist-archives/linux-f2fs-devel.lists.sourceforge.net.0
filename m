Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 453B0C86BD7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Nov 2025 20:09:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ry+V/W2endHqnJdLlyADKFrXycl4vQjvlWQ9B4o10Y=; b=aVvjDUii9YhpbkE7N4MZiv0usW
	+G8O2SOjQfE3/ptHORYHl9a+WjnYxPsEh8+2YELe5RMsJmlm/KZ7spjnx9ZtflvAlR6FN6seclhh5
	Y9TXmyXdzEKpTW8o1I2l7UtwgfwCwtOx0Trz3FJKBlLovmvdfcb1VGIc+iB6vLwMT8fU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNyQ9-0007Y2-B5;
	Tue, 25 Nov 2025 19:09:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ckulkarnilinux@gmail.com>) id 1vNyQ8-0007Xw-Ky
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 19:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KqV4ea26VpNRnNDOYj3v3FWNR4t9iRrjXWCFY4hl9NI=; b=YXS6UmDG0IKi41YUqT8f2UzhOT
 HYBQ9WgqoxLkbJmn4Db6t1lGbhQ1Z+xuYojcUCoyRCrvxd8fMBxyzrYmkkNBm3IFPgcOHXv8HbmlS
 /vhiNHGiPERpWzZ2bF9C1TwDtFuUd/FCb1pLHESNN6sXp1JZVfNlxKzS+1hx3zEWGcIU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KqV4ea26VpNRnNDOYj3v3FWNR4t9iRrjXWCFY4hl9NI=; b=OmPqLfCzqoSgtCR/Hp1vrS9St6
 cmw2M8NFNi+Dt3dFl/IetdF2jsKWXwbN1XxCN+3u39h9W6suH2fST3NBiHsxlg1BWc2qYYWlKA8Gv
 FlYhNQpOS2YsO8ixOSeyMJ/ECM52vL8o4BRBYzmqiEmy0HpyxcDYuMvrMmcNpbSGdFXI=;
Received: from mail-pl1-f179.google.com ([209.85.214.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNyQ8-0002pL-3p for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 19:09:48 +0000
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-298250d7769so44031865ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Nov 2025 11:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764097777; x=1764702577; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KqV4ea26VpNRnNDOYj3v3FWNR4t9iRrjXWCFY4hl9NI=;
 b=KgPCzgy1LHBQlrqpBLBF635CCmoxNc09Msc05YBzbJxptydukcB2DP7Q7wXCaPFCZT
 o1raxx7tidob4dVz6F68AUOKfIrmW+DiE/Y1dnoyMpsgunYcwzT/2MMXi/hhrl18AgZy
 M0dJ/fUHOqjXMJmSEOReBa8xLOx//HnnTVQtHm6HU/znNx0GP/eAQrqypm6m2Lyv6yCh
 y6tkGGfdbDwVIFyHiEQGnmmlGAwsGJm1wszyPOcdTrtZs3W0/LNr+Ad51HlXpby7OD0u
 1PnmPTOV1qHgamxU+mjm5sU2p5rhh+n3cHrPB/xplzlM92HvcDveYCobchT5Dt9fJV0Y
 ij1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764097777; x=1764702577;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KqV4ea26VpNRnNDOYj3v3FWNR4t9iRrjXWCFY4hl9NI=;
 b=RaJ6/EAjzTw0vb2pO10aHoZW7iNpo28D4OZG+gfVSxunOC3AAuRYJ18z49W6Jv9hGj
 G6lADYnCivpjJ1PMewZHe/DXoCoj+ybKOCf2yYDbGAgk2MDD+uODiAMri6yh4KJPWikV
 V5XKQ/537ox9CGW1/RGy32Zx/0sSWSw1bHgbg/SibpS+Sum8G3GdeNgM8nOTTejHhSG4
 MiIsWQdkefx9EmyDSYa/22wga4rUSDFxwLZURDFrZLNTd9gpxLTcYfQ/jqvryhAYK4N8
 O9QtoDLecqSbtx1DoIxfB6am8G2uNFd9McMvq3ng6b8HYy+yuRT0kJ66G4zdu+VHdzLm
 pPFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVspBNRXCye2chtntiSw0qRUVONxZGEPP7j7zsa37WTo4eowt+5cfi78zXNdjsmS4DiLrovi0cs6ErIW1SpN7to@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxGtXRi5vIoum+kMmpuoNpod1Mdrrup7PnHrmwZK08/akInTSYX
 BI1trOXABsRIJHWihF+hambvsgmt2C7QnwRq1PuFB5mEINvOnnYd8RSw
X-Gm-Gg: ASbGncuEJoK4UhB5xQB4va5D4HohcfMiNVJUT+iYv/ozLnduP5AVpO6i5UIws6JyJCt
 S3PTgiZdDo58Z62blx0dExxIkYaKJP//OB4cQKYOdIPI52BE7pUAZobY+SS9SuA+cnTigRYB5if
 PKtU4+NnmM2+xe3dY/bHl/RenGNWSIzRe3pP4EPHq7lYxB15K7h6XnijSunnLkaOcNjwAuLU7Q+
 7RinbRC/uPT9hSwASg6a86HIWPjyoOTXJif500+OJ8qb+2QPxsc4EfY82HLNtgYLdGUJ21+8JsG
 p5VejVOg/juHeIdSNemfV6FbmoOnAuviUaEOaMiDcGTe7u/TaiyVApj999ob+AvFGkz+LJUqxCg
 9fzKF3ng6OMCZ14bimpI47ddJfTajgSSTj2fbyj9SWdOEUO552Q5DIE2g/p9ACwIoz6SyqXQa9L
 5Mpoe52iadGfnEPNY/x5xELJbC3n0jjfqcdPH0x4jFLVNm0CV0QzvU099CXPq3mhgP
X-Google-Smtp-Source: AGHT+IHuIf8IdstsNtTBrFtuIhxYayVPP9kbYzco+dRdLBQVBBJBvJGBn5Q65xamj5HkAzoQXFriDQ==
X-Received: by 2002:a17:903:2acb:b0:294:fc77:f021 with SMTP id
 d9443c01a7336-29b6c6b32f7mr194870325ad.49.1764097777372; 
 Tue, 25 Nov 2025 11:09:37 -0800 (PST)
Received: from ?IPV6:2600:8802:b00:9ce0:a9c6:421a:26c5:f914?
 ([2600:8802:b00:9ce0:a9c6:421a:26c5:f914])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b107cc2sm176518725ad.16.2025.11.25.11.09.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 11:09:37 -0800 (PST)
Message-ID: <851516d5-a5e8-47dd-82e0-3e34090e600d@gmail.com>
Date: Tue, 25 Nov 2025 11:09:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jens Axboe <axboe@kernel.dk>, agk@redhat.com, snitzer@kernel.org,
 mpatocka@redhat.com, song@kernel.org, yukuai@fnnas.com, hch@lst.de,
 sagi@grimberg.me, kch@nvidia.com, jaegeuk@kernel.org, chao@kernel.org,
 cem@kernel.org
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
 <20251124234806.75216-2-ckulkarnilinux@gmail.com>
 <e3f09e0c-63f4-4887-8e3a-1fb24963b627@kernel.dk>
Content-Language: en-US
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
In-Reply-To: <e3f09e0c-63f4-4887-8e3a-1fb24963b627@kernel.dk>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/25/25 09:38, Jens Axboe wrote: > On 11/24/25 4:48 PM, 
 Chaitanya Kulkarni wrote: >> __blkdev_issue_discard() always returns 0, making
 the error check >> in blkdev_issue_discard() dead code. > Sho [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ckulkarnilinux(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.179 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vNyQ8-0002pL-3p
Subject: Re: [f2fs-dev] [PATCH V3 1/6] block: ignore discard return value
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
Cc: dm-devel@lists.linux.dev, linux-raid@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, bpf@vger.kernel.org, linux-xfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/25/25 09:38, Jens Axboe wrote:
> On 11/24/25 4:48 PM, Chaitanya Kulkarni wrote:
>> __blkdev_issue_discard() always returns 0, making the error check
>> in blkdev_issue_discard() dead code.
> Shouldn't it be a void instead then?
>
Yes, we have decided to clean up the callers first [1]. Once they are
merged safely, after rc1 I'll send a patch [2] to make it void since
it touches many different subsystems.

-ck

[1]
https://marc.info/?l=linux-block&m=176405170918235&w=2
https://marc.info/?l=dm-devel&m=176345232320530&w=2

[2]
 From abdf4d1863a02d4be816aaab9a789f44bfca568f Mon Sep 17 00:00:00 2001
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
Date: Tue, 18 Nov 2025 10:35:58 -0800
Subject: [PATCH 6/6] block: change discar return type to  void

Now that all callers have been updated to not check the return value
of __blkdev_issue_discard(), change its return type from int to void
and remove the return 0 statement.

This completes the cleanup of dead error checking code around
__blkdev_issue_discard().

Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
---
  block/blk-lib.c        | 3 +--
  include/linux/blkdev.h | 2 +-
  2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index 19e0203cc18a..0a5f39325b2d 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -60,7 +60,7 @@ struct bio *blk_alloc_discard_bio(struct block_device *bdev,
  	return bio;
  }
  
-int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
+void __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
  		sector_t nr_sects, gfp_t gfp_mask, struct bio **biop)
  {
  	struct bio *bio;
@@ -68,7 +68,6 @@ int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
  	while ((bio = blk_alloc_discard_bio(bdev, &sector, &nr_sects,
  			gfp_mask)))
  		*biop = bio_chain_and_submit(*biop, bio);
-	return 0;
  }
  EXPORT_SYMBOL(__blkdev_issue_discard);
  
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index f0ab02e0a673..b05c37d20b09 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1258,7 +1258,7 @@ extern void blk_io_schedule(void);
  
  int blkdev_issue_discard(struct block_device *bdev, sector_t sector,
  		sector_t nr_sects, gfp_t gfp_mask);
-int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
+void __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
  		sector_t nr_sects, gfp_t gfp_mask, struct bio **biop);
  int blkdev_issue_secure_erase(struct block_device *bdev, sector_t sector,
  		sector_t nr_sects, gfp_t gfp);
-- 
2.40.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
