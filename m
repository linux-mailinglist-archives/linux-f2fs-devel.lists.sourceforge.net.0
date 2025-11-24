Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C419C82DB6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Nov 2025 00:48:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPi9Lv86Bn2eVJrn0ZvNwSbQR+idGUUqmDcf8/rGaqw=; b=V0IlUWUbWw7ENuLdIX0A9ipdwL
	EXFWba2A00ewRG1frtxjuqSKzozJn4gjXGALNyVGxiBelGW19Z6zwZdTgEW9COQ2yezEtGNDWW5nz
	diLcNkAT7Mr93DcKmqe9ULo6NQ5L1ch4IaYNTH6CAQt527ucCpmT0YnwLHVNyTSsnVA0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNgIH-0003cL-I8;
	Mon, 24 Nov 2025 23:48:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ckulkarnilinux@gmail.com>) id 1vNgIG-0003c5-4X
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 23:48:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YcqbQ5S4JXXbau3fgh6ZbMU20qGzRcIfkGSPAKTqhkc=; b=HQ+VhHS+PnYOppIO77VxTve0lb
 KLxVbheSnNaFRAdMtLu3OzIXodNChjoPUJKNM2zSfgfcZX6r1O8pc0OctWoTTBP99Bxz0K8NvoqxX
 0jl84VpFhx6nDfVwPgysl+Kstzgr9RTqVEkb2/kjQ94BL1FP8JSWKamTIaKYrLA2Pfzs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YcqbQ5S4JXXbau3fgh6ZbMU20qGzRcIfkGSPAKTqhkc=; b=Zg+s/Gwx7lFEQI1wNipr5UbOr9
 Yrh4drhrBDvKyUP4JdXQ2wVFYTIxQ7UH3WmKkTQmz0Wkm+P67sgR2AEaEcj6LA0UUC0tZg4DW/FTB
 IQ82S3Lm2cU14+Eel5fTYjjLNWYGxKN4iiNiPjnpa92loujer+uTLn1LUbJAHc7bDDyA=;
Received: from mail-pl1-f172.google.com ([209.85.214.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNgIG-0006KK-IT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 23:48:28 +0000
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-29808a9a96aso56281885ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Nov 2025 15:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764028103; x=1764632903; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YcqbQ5S4JXXbau3fgh6ZbMU20qGzRcIfkGSPAKTqhkc=;
 b=JMzVBqqxYgVRdqdgAqc3lDuXDg7QP0KFNQ2JInQCvxFb6eDSHM8MI56jEArC/FQMlm
 vZXvo4CvI5kQf/19ln7So8KiJGNNfGNrM+NZ5eyEpEeNflLrQccNIFHcgZcP0wfYde79
 CPjs3pVPBpGPSgUvZIV8DixqUrRMGNwL1mh6HQ83ibtdJ64MI0FY/9Xe6kp8p4/Kotj/
 Ep5LD/kEg7PtQ32Bu3CP2f3DB1NYiIsxJNnzbAobeL0bjTnXs0s+7yv2slHUyf9v1vTT
 v9+ggvHNKy5UQJ68KmFDlEuder+d4kaOalhYg4Moae9y+fOYMkDpGaaiu6XL2q/Kt4qb
 PlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764028103; x=1764632903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YcqbQ5S4JXXbau3fgh6ZbMU20qGzRcIfkGSPAKTqhkc=;
 b=xE7H58XpoFGu28uyk4GV/qJMFENG8hE6NYm0af9TLrTo1M8vdBBxGF1EqWiC6wTEx/
 JIOs35rbWtalaJk/bx9/pC2oJXV2IcBsVCOvxqdVOFyysO7whpkYInNvdYYYQAZbuRmg
 teoaWiSKdmVX8eQiNJgBM5fDmgnVnItqWUrBqWhscI+TWcZz82MaOcA2DVL4iQStU6vt
 3K2jy/CnEcoV4tdEkJTkQ+zn5eadB/VKQvskcrZh+LD7krRx9iD5Tm+Is8fKz9LdJW9W
 S71JRSZDDDXgHxoGQd/lfNZbynPin82oQrsxXK77f5gpIBCLZgHyLOQ4GRg3eKw2O1kj
 EfTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvzN4iC4lNjiWnbDkwKdXyuROgEJXesmTZLYzolyWoyYMwsygEWwcCwSiybul8lLK+GWupgfSaTIgSACYEDeZ3@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwODsF8zbo/n6HZ6qULuS9l0JXd/5ETusRPiU4FD0BV4x+iMfVq
 kMGulYXVHfNPcq4asTlOmc/Q05fuIE0bpYR5RBT5HYcLDK3MfML0tn0C
X-Gm-Gg: ASbGnctKEOy88XMA+dwlkqqJa1Pbm9CxbNrNQbD9O8vwYmQiFGS/pMk8uKWSM2rDPBS
 ssbQ1j7qsQMykGl1foVap1nh0ASxR2BIiah+J3zL6vTqCIgs0XyFwxnLUxAgJg4tiuJV8fS7LIz
 9tb9vYGNo0v4DrTVOfmYLpaYO9PF8cV6gMeZskUrrPy63dUq4vW1W3D/OoEYNUwkYdZuVRu+wpR
 CK+mCc+XmVeVTtjQ4CoXbAOpyXR2NxZTOE0TfflW7pHNX6hUndeZ9ZzBWfzK6ueeXMIUJ4YNU3G
 5Kyv4y65+uoljZsW3O3P91ZFIh7webv8LLsE6meaT8Ncr+JTDMewZN7IySfpnNiiMbK1iFNjVbG
 M7Ocek9E6oRKKoNq9ZIhpEAahn2DfgryuSpuGlDpMm/mErFO0TVFJTBmcVsYMb+yXOtRrDqqQwq
 nWuMgC40R4lmiwyPpY0hBNXfGKLkLdOyPm30r9gRuAnvkCGcc=
X-Google-Smtp-Source: AGHT+IH9F80PvdpBpbojg7Y02KngkDHXsfXBdGLUzofDSvSvFO71NKJ3uHp3bN/w9c26If04NsQEQQ==
X-Received: by 2002:a05:7022:d45:b0:11b:c1ab:bdd0 with SMTP id
 a92af1059eb24-11c9d863a0amr6183635c88.35.1764028102624; 
 Mon, 24 Nov 2025 15:48:22 -0800 (PST)
Received: from localhost (ip70-175-132-216.oc.oc.cox.net. [70.175.132.216])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11c93cd457dsm72215056c88.0.2025.11.24.15.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 15:48:22 -0800 (PST)
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com,
 song@kernel.org, yukuai@fnnas.com, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, jaegeuk@kernel.org, chao@kernel.org, cem@kernel.org
Date: Mon, 24 Nov 2025 15:48:01 -0800
Message-Id: <20251124234806.75216-2-ckulkarnilinux@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  __blkdev_issue_discard() always returns 0, making the error
 check in blkdev_issue_discard() dead code. In function blkdev_issue_discard()
 initialize ret = 0, remove ret assignment from __blkdev_issue_discard(),
 rely on bio == NULL check to call submit_bio_wait(), preserve submit_bio_wait()
 error handli [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [70.175.132.216 listed in dnsbl-2.uceprotect.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ckulkarnilinux(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.172 listed in wl.mailspike.net]
X-Headers-End: 1vNgIG-0006KK-IT
Subject: [f2fs-dev] [PATCH V3 1/6] block: ignore discard return value
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
 linux-block@vger.kernel.org, Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 bpf@vger.kernel.org, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

__blkdev_issue_discard() always returns 0, making the error check
in blkdev_issue_discard() dead code.

In function blkdev_issue_discard() initialize ret = 0, remove ret
assignment from __blkdev_issue_discard(), rely on bio == NULL check to
call submit_bio_wait(), preserve submit_bio_wait() error handling, and
preserve -EOPNOTSUPP to 0 mapping.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
---
 block/blk-lib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index 3030a772d3aa..19e0203cc18a 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -87,11 +87,11 @@ int blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 {
 	struct bio *bio = NULL;
 	struct blk_plug plug;
-	int ret;
+	int ret = 0;
 
 	blk_start_plug(&plug);
-	ret = __blkdev_issue_discard(bdev, sector, nr_sects, gfp_mask, &bio);
-	if (!ret && bio) {
+	__blkdev_issue_discard(bdev, sector, nr_sects, gfp_mask, &bio);
+	if (bio) {
 		ret = submit_bio_wait(bio);
 		if (ret == -EOPNOTSUPP)
 			ret = 0;
-- 
2.40.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
