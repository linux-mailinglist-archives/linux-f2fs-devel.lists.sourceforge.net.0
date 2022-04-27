Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E11E85127CE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Apr 2022 01:53:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njrT9-00036c-NK; Wed, 27 Apr 2022 23:53:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1njrT7-00036V-Tx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 23:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=79AFRdpemBVck+ntzsW/yKNt4PCLDqnjtmYL3oWIWPs=; b=E+VoVcmb6tPTYQyjeaj3aQCCT2
 FoalRVuXGP6XL8la+kloIP6XdfyV27CbKqpIocTlj4rRl9wcMebNgJDvmQ33/9gDQl+JIOty4rPF7
 3SAKZrkRcKaKwbmeKAu5V4Qs/GcUVX1nDX07iLW5g9KDXtmaFut8Mp7jDLiUKDKOpsSw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=79AFRdpemBVck+ntzsW/yKNt4PCLDqnjtmYL3oWIWPs=; b=GOzIJ9BiBiP/tgnXU/U2cWLeIE
 gn0uwGQZw2wOMjXnrS2szVlotXw9SUL7qIFLejB1FF7M4WGbZ3tIE1m2qCFmjNFp7Bh0Xo8v+K4kp
 9Bly2kIs++kF+t5bBjEPvz8+6ukxnxY5IpZNrGV2soU271mVJJ+jJ1Cx8o44uPOgUHkQ=;
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1njrT4-0000vl-L4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 23:53:12 +0000
Received: by mail-pf1-f182.google.com with SMTP id g8so425113pfh.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 16:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=79AFRdpemBVck+ntzsW/yKNt4PCLDqnjtmYL3oWIWPs=;
 b=c/YYwEE7k6DJa4ofybVIwz2wLKK6nW8Ai2V6ADJts8G8BGVIXiPb5Xne+klgHBLPiI
 AylF9jSqgyKC2FrTS59JFw+u5yhtVPNcmkIhUUbZMKm3vD9nBAz45bJsnWvwiUbWg2pM
 ywA4CmgBHl/WrmhC/B/+lNk46OQwrFM1A2grwo9BJyKBj6Tbhh15iI5oPFmD12d62zFA
 oM5BIqQ79DTIDtN/Z+htWiI+t5FTrKW+8VLlZzCv5OF/tdDAi6+OKn23lPW7ckEAl+EU
 UNTJT/uBdUeXunH47/EImRXidjOJsOH/HDRRwGi5TbjnIXF8waX18+T/ahjdXxOYDpmF
 u6/Q==
X-Gm-Message-State: AOAM5329ztYMn8J2s9pLAmYVbeBcgha5u60d3Oc2bTQpZMC5+BuAtW6v
 ggA3263AkJbpkf46fDgrNm8=
X-Google-Smtp-Source: ABdhPJwSGv1Za1U51Sy0XzpwyxC0M8/mR/bjHPIzXDoe+MDiEfgeZRKytqp5jH37HlZvkYhAFK/M7Q==
X-Received: by 2002:a05:6a00:a94:b0:4fd:c14b:21cb with SMTP id
 b20-20020a056a000a9400b004fdc14b21cbmr32159218pfl.53.1651103583186; 
 Wed, 27 Apr 2022 16:53:03 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:6cbb:d78e:9b3:bb62?
 ([2620:15c:211:201:6cbb:d78e:9b3:bb62])
 by smtp.gmail.com with ESMTPSA id
 w129-20020a628287000000b0050d4246fbedsm11710895pfd.187.2022.04.27.16.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 16:53:02 -0700 (PDT)
Message-ID: <df8104aa-ca86-4053-5334-3bc4ff786c61@acm.org>
Date: Wed, 27 Apr 2022 16:52:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Pankaj Raghav <p.raghav@samsung.com>, jaegeuk@kernel.org,
 axboe@kernel.dk, snitzer@kernel.org, hch@lst.de, mcgrof@kernel.org,
 naohiro.aota@wdc.com, sagi@grimberg.me, damien.lemoal@opensource.wdc.com,
 dsterba@suse.com, johannes.thumshirn@wdc.com
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160258eucas1p19548a7094f67b4c9f340add776f60082@eucas1p1.samsung.com>
 <20220427160255.300418-3-p.raghav@samsung.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220427160255.300418-3-p.raghav@samsung.com>
X-Spam-Score: -1.4 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/27/22 09:02, Pankaj Raghav wrote: > +static inline bool
 bdev_zone_aligned(struct block_device *bdev, sector_t sec) > +{ > + struct
 request_queue *q = bdev_get_queue(bdev); > + > + if (q) > + retu [...] 
 Content analysis details:   (-1.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.182 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.182 listed in list.dnswl.org]
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.9 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1njrT4-0000vl-L4
Subject: Re: [f2fs-dev] [PATCH 02/16] block: add blk_queue_zone_aligned and
 bdev_zone_aligned helper
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
> +static inline bool bdev_zone_aligned(struct block_device *bdev, sector_t sec)
> +{
> +	struct request_queue *q = bdev_get_queue(bdev);
> +
> +	if (q)
> +		return blk_queue_zone_aligned(q, sec);
> +	return false;
> +}

Which patch uses this function? I can't find any patch in this series 
that introduces a call to this function.

Thanks,

Bart.




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
