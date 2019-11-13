Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B87FA6B4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Nov 2019 03:42:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iUibb-0004e7-Ld; Wed, 13 Nov 2019 02:42:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <axboe@kernel.dk>) id 1iUibZ-0004dD-Bg
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 02:42:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c7pgGUOErKCone57ckbGDS/eeyPemc6EIW0Fbaye1l4=; b=j3UG03NF4QhedVF3sMb1IFtNQC
 gg/U+OST/3OWr9bbP00qui88OtirCSdevHzFU8/NSTaA1yMzJ0R37dqURqH0isLJTi0m+7joRfR1N
 DEuER08vvBkB1KiI+/bQq2e77mQfBwrjs58y3cS5AkeqB5jaL4dBv+UYLrZQ697hkImA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c7pgGUOErKCone57ckbGDS/eeyPemc6EIW0Fbaye1l4=; b=AdZ8kNXbbJFw/fMqjqPF0QfZch
 DEL1+RrUcF1NoIcVCciCEFoqk2I1ohp4kFvOPBdD10pryyooeaJGh9cGHHt9s5nfAp6ueJLayUpu8
 Q0+EPBdwOBJ4F3rLjeKPCPXJEYF9zYJa4Ibo86W8wZOoWyqf+DVuHKm8UZds8G5Uds/Q=;
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iUibX-000OcQ-F2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 02:42:01 +0000
Received: by mail-pf1-f195.google.com with SMTP id 3so537257pfb.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 Nov 2019 18:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=c7pgGUOErKCone57ckbGDS/eeyPemc6EIW0Fbaye1l4=;
 b=J1GKzxf5D4PNxbYKxDELs3k7YlYHe/IgHvU8Etzan0v3SuwtZ62rEm1vWFQAXFTWqg
 q5GbIvG6C/Bi2hnba2PXWn2pywiaPhAqj19zLVeHVpUB/w+bJn62gzb9mmaePzydVmxv
 XAYZZFMdQ6jMS+xxsqXiz430ptjXzzatWh97FtCiIUx8TWg2NGykQo3WcHtCfcJrMFcr
 eqAqztK9aojc6IvhkKDL8UM7ckfiwhqjgW7yUs9sNKNCQts2WY/qf/Y56U6wCuW8N3t0
 HTWIy5X+Nktu52sYBB0Vz/LfvTjVsXzxChLk+jf8NXDEItN26y685XWjFOthOBTTeLzq
 6W0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c7pgGUOErKCone57ckbGDS/eeyPemc6EIW0Fbaye1l4=;
 b=AwYAy6aQVQwZx/KMsuNk4vNPmACES+GkkXqcpUs7Jzu99PibA0Jz0Q9o77G2LrCijl
 O1jq/hIbd+6eU//O/UAJp5+Yk39RyrvT8ikR7aaZhdI8zSjydwx5ECciyHeFsdy36Cf1
 BlAsbie3MDxgqJvNbVQDgYh0O6JHrUub0OaKAsSn064q4DuDAr8S0YZ6Ex8eAtyDnzfJ
 dY5HRtvvAPHIsVc/Y2bLDml07juMeK2CtmlMi1gEapbFGJUPPbbkNAVnuGlMErbOXMz+
 5AojZcd6U4/84y98ehe1FK21W5aOInyKOBfNWH3ZxldHM1XGpmxLekI6vOBp+uC1zfk8
 wTkA==
X-Gm-Message-State: APjAAAWCHd8yyTFInnMpD6ahi1uZeAqpoxDsVc2Mj61U4392PygOnbJo
 b2aVr48OrBbfmHkh3GMXLHehUmMfiI0=
X-Google-Smtp-Source: APXvYqycpY+BSOLB53HT4o8SEWzgzYFea+fu4bX8JbhALJ60LxNdAWEQSjGNGVeVl5dehnnO9BWleQ==
X-Received: by 2002:a17:90a:a114:: with SMTP id
 s20mr1410230pjp.44.1573611402828; 
 Tue, 12 Nov 2019 18:16:42 -0800 (PST)
Received: from [192.168.1.182] ([66.219.217.79])
 by smtp.gmail.com with ESMTPSA id e17sm303534pfh.121.2019.11.12.18.16.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Nov 2019 18:16:41 -0800 (PST)
To: Damien Le Moal <damien.lemoal@wdc.com>, linux-block@vger.kernel.org,
 linux-scsi@vger.kernel.org, "Martin K . Petersen"
 <martin.petersen@oracle.com>, dm-devel@redhat.com,
 Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
References: <20191111023930.638129-1-damien.lemoal@wdc.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <a0c1c1bf-d6e5-8be1-ed99-6bfed3483d1d@kernel.dk>
Date: Tue, 12 Nov 2019 19:16:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191111023930.638129-1-damien.lemoal@wdc.com>
Content-Language: en-US
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.195 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iUibX-000OcQ-F2
Subject: Re: [f2fs-dev] [PATCH v2 0/9] Zoned block device enhancements and
 zone report rework
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/10/19 6:39 PM, Damien Le Moal wrote:
> This series of patches introduces changes to zoned block device handling
> code with the intent to simplify the code while optimizing run-time
> operation, particularly in the area of zone reporting.
> 
> The first patch lifts the device zone check code out of the sd driver
> and reimplements these zone checks generically as part of
> blk_revalidate_disk_zones(). This avoids zoned block device drivers to
> have to implement these checks. The second patch simplifies this
> function code for the !zoned case.
> 
> The third patch is a small cleanup of zone report processing in
> preparation for the fourth patch which removes support for partitions
> on zoned block devices. As mentioned in that patch commit message, none
> of the known partitioning tools support zoned devices and there are no
> known use case in the field of SMR disks being used with partitions.
> Dropping partition supports allows to significantly simplify the code
> for zone report as zone sector values remapping becomes unnecessary.
> 
> Patch 5 to 6 are small cleanups and fixes of the null_blk driver zoned
> mode.
> 
> The prep patch 7 optimizes zone report buffer allocation for the SCSI
> sd driver. Finally, patch 8 introduces a new interface for report zones
> handling using a callback function executed per zone reported by the
> device. This allows avoiding the need to allocate large arrays of
> blk_zone structures for the execution of zone reports. This can
> significantly reduce memory usage and pressure on the memory management
> system while significantly simplify the code all over.
> 
> Overall, this series not only reduces significantly the code size, it
> also improves run-time memory usage for zone report execution.
> 
> This series applies cleanly on the for-next block tree on top of the
> zone management operation series. It may however create a conflict with
> Christoph's reqork of disk size revalidation. Please consider this
> series for inclusion in the 5.5 kernel.

We're taking branching to new levels... I created for-5.5/zoned for this,
which is for-5.5/block + for-5.5/drivers + for-5.5/drivers-post combined.
The latter is a branch with the SCSI dependencies from Martin pulled in.

-- 
Jens Axboe



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
