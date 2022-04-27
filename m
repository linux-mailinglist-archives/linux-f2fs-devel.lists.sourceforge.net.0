Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7895127D6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Apr 2022 01:54:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njrU0-0003AU-Rf; Wed, 27 Apr 2022 23:54:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1njrTz-0003AO-QG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 23:54:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t4qis+J9QIOKnM3fbYktt9NFhZKrRI7DhwX8G2bL9zc=; b=SlxKPLPgKoo+zRbW25MZgb4Bas
 z3Yv7/qT/YB5KZRiKHGRRWqM0J4nn2lrj7W9GSwsiVYtBZLXc71tT9Ujg3xrVcz9oB+G/qf8sUH6W
 k4edZGMffOUsNUO41ZtdKwXOVCAGySo9Plw4wbSbAyy3hFcAvwLnxdGog4wPxpTPs+nk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t4qis+J9QIOKnM3fbYktt9NFhZKrRI7DhwX8G2bL9zc=; b=kQezcIP00uWsa6gkCVJtz46Se+
 hSdrZJKdJ6F3zZeiJBME3T50hmyX3RUsmKHMjNgxVFFjb2pu2FHczo/hKKKmqGT3NS9e1GEdFE05U
 /5pyW2/GgpAghTeab5V6UuE1TDvfpD8sBekjzPzXzfdc//8gEz17d9yIXUvdlnNz0tAo=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1njrTx-00011u-H3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 23:54:05 +0000
Received: by mail-pl1-f182.google.com with SMTP id p6so2884765plf.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 16:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t4qis+J9QIOKnM3fbYktt9NFhZKrRI7DhwX8G2bL9zc=;
 b=iN+UPB0fT9Tymj/bj6qEeCswLHP85Llfxbr19N3xUVlLNsllpZ9JCwDgOdGGxoJX3t
 A1YFcQv+dLlb1vNSQ5N696fnA9CtzfLlnBqIW9jr+ybQpa/YPBWPjJOIUcFvFeGdvt4C
 6GpAjUVkFyx3L7ZQhpdYNyb9JohMhT/AD5FEF2BcTIWJw43gYw8XHk+ivTODUaeneG2J
 2b/Hh7qU1NfxhSu9Jjj2tIefKLSDuwQpDKZNayzad8oYKvwOecy4SNYfAeC55e/KAua1
 sR534OWBeAGenxKvv8jygebUpuTZc74Zh1GgiUzLhEU76IsQEKtGgyOF12tIObcXDhl5
 b07w==
X-Gm-Message-State: AOAM532oLG1aLbP9CT9lWThMPy4Z7LTNcFWSr1WnuA+XYIxck3cz9Nqh
 ZjaFOHvBiaitpm+ZhzYVDYQ=
X-Google-Smtp-Source: ABdhPJzohQgvyNpdAnb7nqeKJuNjp6awQ1YNHqFULIu63hwwYMU72SrE0583NaL55rzyxWBEIH5+Qg==
X-Received: by 2002:a17:902:cf0b:b0:151:9d28:f46f with SMTP id
 i11-20020a170902cf0b00b001519d28f46fmr30536375plg.53.1651103639942; 
 Wed, 27 Apr 2022 16:53:59 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:6cbb:d78e:9b3:bb62?
 ([2620:15c:211:201:6cbb:d78e:9b3:bb62])
 by smtp.gmail.com with ESMTPSA id
 p125-20020a62d083000000b0050d475ed4d2sm10860790pfg.197.2022.04.27.16.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 16:53:59 -0700 (PDT)
Message-ID: <bc18532b-a98f-26f2-4dd1-d189c0415820@acm.org>
Date: Wed, 27 Apr 2022 16:53:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Pankaj Raghav <p.raghav@samsung.com>, jaegeuk@kernel.org,
 axboe@kernel.dk, snitzer@kernel.org, hch@lst.de, mcgrof@kernel.org,
 naohiro.aota@wdc.com, sagi@grimberg.me, damien.lemoal@opensource.wdc.com,
 dsterba@suse.com, johannes.thumshirn@wdc.com
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160259eucas1p25aab0637fec229cd1140e6aa08678f38@eucas1p2.samsung.com>
 <20220427160255.300418-4-p.raghav@samsung.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220427160255.300418-4-p.raghav@samsung.com>
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/27/22 09:02,
 Pankaj Raghav wrote: > +static inline unsigned
 int bdev_zone_no(struct block_device *bdev, sector_t sec) > +{ > + struct
 request_queue *q = bdev_get_queue(bdev); > + > + if (q) > + r [...] 
 Content analysis details:   (-1.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1njrTx-00011u-H3
Subject: Re: [f2fs-dev] [PATCH 03/16] block: add bdev_zone_no helper
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
> +static inline unsigned int bdev_zone_no(struct block_device *bdev, sector_t sec)
> +{
> +	struct request_queue *q = bdev_get_queue(bdev);
> +
> +	if (q)
> +		return blk_queue_zone_no(q, sec);
> +	return 0;
> +}

This patch series has been split incorrectly: the same patch that 
introduces a new function should also introduce a caller to that function.

Thanks,

Bart.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
