Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7CF518AA8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 May 2022 19:02:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nlvuU-0006uv-04; Tue, 03 May 2022 17:02:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nlvuT-0006uo-2A
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 17:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DRk7BATbee0He7UZ5VJP77cBX11TJXZ34BYAwZ+8AgM=; b=DBTm44FiF9lr51i5X+HxpgTAi1
 wF0prZJ9mimm4UBLjdCfUAqxA4uqtwusInIkOSn/O5ceo8MfwikVafBQjUvwyNLtemdPwbIgbtYqK
 NQgD27rGPPZw7boPzBbdvozlwwxCsbhPJ2iMnB1jCCCDHO59QK8/JTxQ9vKbY6qCoq7U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DRk7BATbee0He7UZ5VJP77cBX11TJXZ34BYAwZ+8AgM=; b=kSmnQ1OdkqhaY2PlAE+7VbIDYI
 d3LpW4f4q2NUV0QyQP7hxyzzf5g23wArrPJhWLXCp49RpjvnQjDgU/cbLXbHJHCisvBJzuS0/3Un+
 08gFd91nUIeFUh7pTOlmgj/0J5WmLD1pwhnAJ9seTiE3BWziQWjIETinchAfW9vKNFqU=;
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nlvuN-0005Gj-6c
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 17:01:59 +0000
Received: by mail-oi1-f171.google.com with SMTP id e189so18780289oia.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 03 May 2022 10:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DRk7BATbee0He7UZ5VJP77cBX11TJXZ34BYAwZ+8AgM=;
 b=nV1tsKwApQ6qXCQXkFafIzmtC705varUYf/WDGp77aMLlmZaddlQtywE2H2SniXJt8
 a63+TIgnOWt8/ghdWZRegYrvkiDUQRFoAatksCYl5Qx6t1V8IDFdweCOk0rlP/undiiR
 fMnu5oEWYIdxhSRYHHSdrbVgRNkvJsqnLUXblrMSQJ2fxR+CxAzk9+COxLIvrwm4oloq
 xbVtYha0RJcg+4fWeemnql0NZKxCMJ1Wf2kd+Ha40zt2NMNWpvArkiFEBzVOHu+FRygh
 yxptkrLPNDK48368R4U5m8/krfMOOKXxxTyxH1JUOlmD383gIsv0aw1wpWjKNLLpJgZ6
 eT7w==
X-Gm-Message-State: AOAM531ZBF3nZby9oz431GxRh8nipzZjd6ilFRFbUrFZrujDhexAfvPt
 2XhfBDyRgWpiWeUqi1SrZKA=
X-Google-Smtp-Source: ABdhPJzQ7nN1tdLufKhuqG6pqOb+aTzQGH1sI9Wd1lN/gZWKJGxCZu7MZvXiQsv6VotmI9tLD36qJQ==
X-Received: by 2002:a05:6808:1b10:b0:326:40f5:930c with SMTP id
 bx16-20020a0568081b1000b0032640f5930cmr840804oib.281.1651597309459; 
 Tue, 03 May 2022 10:01:49 -0700 (PDT)
Received: from [10.10.69.251] ([8.34.116.185])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a4ad5c8000000b0035eb4e5a6c6sm5071917oot.28.2022.05.03.10.01.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 10:01:48 -0700 (PDT)
Message-ID: <1b7f3aac-0941-2554-d966-01a6bf76cc58@acm.org>
Date: Tue, 3 May 2022 10:01:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Pankaj Raghav <p.raghav@samsung.com>, jaegeuk@kernel.org,
 axboe@kernel.dk, snitzer@kernel.org, hch@lst.de, mcgrof@kernel.org,
 naohiro.aota@wdc.com, sagi@grimberg.me, damien.lemoal@opensource.wdc.com,
 dsterba@suse.com, johannes.thumshirn@wdc.com
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160310eucas1p28cd3c5ff4fb7a04bc77c4c0b9d96bb74@eucas1p2.samsung.com>
 <20220427160255.300418-14-p.raghav@samsung.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220427160255.300418-14-p.raghav@samsung.com>
X-Spam-Score: -2.4 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/27/22 09:02,
 Pankaj Raghav wrote: > diff --git a/drivers/block/null_blk/main.c
 b/drivers/block/null_blk/main.c > index c441a4972064..82a62b543782 100644
 > --- a/drivers/block/null_blk/main.c > ++ [...] 
 Content analysis details:   (-2.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.171 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.171 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
 -2.9 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nlvuN-0005Gj-6c
Subject: Re: [f2fs-dev] [PATCH 13/16] null_blk: allow non power of 2 zoned
 devices
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
Cc: jiangbo.365@bytedance.com, kch@nvidia.com, matias.bjorling@wdc.com,
 gost.dev@samsung.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, clm@fb.com, dm-devel@redhat.com, agk@redhat.com,
 jonathan.derrick@linux.dev, kbusch@kernel.org, linux-fsdevel@vger.kernel.org,
 josef@toxicpanda.com, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/27/22 09:02, Pankaj Raghav wrote:
> diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
> index c441a4972064..82a62b543782 100644
> --- a/drivers/block/null_blk/main.c
> +++ b/drivers/block/null_blk/main.c
> @@ -1931,8 +1931,8 @@ static int null_validate_conf(struct nullb_device *dev)
>   		dev->mbps = 0;
>   
>   	if (dev->zoned &&
> -	    (!dev->zone_size || !is_power_of_2(dev->zone_size))) {
> -		pr_err("zone_size must be power-of-two\n");
> +	    (!dev->zone_size)) {
> +		pr_err("zone_size must not be zero\n");
>   		return -EINVAL;
>   	}

Please combine "if (dev->zoned &&" and "(!dev->zone_size)) {" into a 
single line and leave out the parentheses that became superfluous.

Thanks,

Bart.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
