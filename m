Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2F8109454
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Nov 2019 20:42:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZKFD-0007yB-6Z; Mon, 25 Nov 2019 19:41:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bart.vanassche@gmail.com>) id 1iZKFC-0007y0-MD
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 19:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=42S2SQ4poaCqsC6y0USRopdPGs/iLjn//hI75VsW/20=; b=JE+9cI33GxyKPm4lwfxPG2F9Tt
 MJ/9GOkbY4ckswcjvFCcdPDOm1+bZfpGpkRfmpFDVLmCxsLbf//EDkX9hjf+QNfw6sBPtP/xGcHK1
 KXmallY3ZTc1Er8H2M7eMTUtFIVfJDUf0TVQazG0KYSH5fT+QM5N94aGYSCbL1025urY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=42S2SQ4poaCqsC6y0USRopdPGs/iLjn//hI75VsW/20=; b=ZzFKWaTdZtQ3oHjZzfQE4qenpz
 GdRDjO/z76S78tvDQ+8Q9TYvpwcnC188t9oFm/xgXVcyG4ARcaD6K/tbQXIwQNtC8vhe1aV2bdHct
 HwWmjmX1NuLuPLxHio4KmNCOKVQkjEa2SdENVzV0UtWmmoWTR34q+KBveTEatPP77VkY=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iZKFB-00DRkr-C2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 19:41:58 +0000
Received: by mail-pg1-f196.google.com with SMTP id t3so7237603pgl.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 25 Nov 2019 11:41:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=42S2SQ4poaCqsC6y0USRopdPGs/iLjn//hI75VsW/20=;
 b=Spzs1+eDqWGayVeRbOMkX5fwlsBabxJnHwp6sy8EdLmXHAAZ2lg5mQRfBj9mcos3LI
 08IoBxDfFX4BwJ7TF/fzW7Arj9MjBGGAz/6VyJGqLjNOB08T7LjzZ4TWpq6dZOo6oC8P
 CTCiWFR3qnEMYAW6L2A8MjUeFkkOubVTGx40m7fyeFmKWhexCTqIoGAfETm7aVMEaK8H
 YX6tCTKAG4uVEIiU/ELEf9EAfakP21ECGvsFKhIxMs4FJ5jHEEphQbuvyqjyEsX3GsJn
 DM3S/4mauIdvb7VlDnzl0begBe1bHztPsfGs5zFgrVnZttwTeKvHeOLQrK+qL9wY2cbn
 bJkQ==
X-Gm-Message-State: APjAAAVZXOin8mZAstCHNMqz0pCcmyS74YaLhheb+j/tze7373aGAdO5
 e+PQ/iBhV9B7GXeQn5SWkLr8Rsfu
X-Google-Smtp-Source: APXvYqwdQYkz+o5leZlnK7ZcW9MZs/t4kmmvK7Y8obAlwUG16DQsWhXBgHy6kz+uCDoeegQX6aE9Cw==
X-Received: by 2002:a65:4ccf:: with SMTP id n15mr35051760pgt.248.1574710911337; 
 Mon, 25 Nov 2019 11:41:51 -0800 (PST)
Received: from desktop-bart.svl.corp.google.com
 ([2620:15c:2cd:202:4308:52a3:24b6:2c60])
 by smtp.gmail.com with ESMTPSA id s2sm9668983pfb.109.2019.11.25.11.41.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2019 11:41:50 -0800 (PST)
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190518004751.18962-1-jaegeuk@kernel.org>
 <20190518005304.GA19446@jaegeuk-macbookpro.roam.corp.google.com>
 <1e1aae74-bd6b-dddb-0c88-660aac33872c@acm.org>
 <20191125175913.GC71634@jaegeuk-macbookpro.roam.corp.google.com>
 <a4e5d6bd-3685-379a-c388-cd2871827b21@acm.org>
 <20191125192251.GA76721@jaegeuk-macbookpro.roam.corp.google.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <baaf9725-09b4-3f2d-1408-ead415f5c20d@acm.org>
Date: Mon, 25 Nov 2019 11:41:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191125192251.GA76721@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (bart.vanassche[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iZKFB-00DRkr-C2
Subject: Re: [f2fs-dev] [PATCH v2] loop: avoid EAGAIN,
 if offset or block_size are changed
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/25/19 11:22 AM, Jaegeuk Kim wrote:
> On 11/25, Bart Van Assche wrote:
>> Thank you for the additional and very helpful clarification. Can you have a look at the (totally untested) patch below? I prefer that version because it prevents concurrent processing of requests and syncing/killing the bdev.
> 
> Yeah, I thought this was much cleaner way, but wasn't sure it could be doable
> to sync|kill block device after freezing the queue. Is it okay?

Hi Jaegeuk,

That patch was based on an incorrect interpretation of the meaning of 
lo_device. After having taken another loop at the block driver, I don't 
think that calling sync after freezing the queue is OK. How about using 
the following call sequence:
* sync_blockdev()
* blk_mq_freeze_queue()
* kill_bdev()

Thanks,

Bart.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
