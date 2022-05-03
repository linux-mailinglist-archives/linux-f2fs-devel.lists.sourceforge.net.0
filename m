Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDA5518A87
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 May 2022 18:54:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nlvnC-0008N9-2W; Tue, 03 May 2022 16:54:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nlvnA-0008N3-Kn
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 16:54:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1eh4gXcwKDJaVq28NyDGAP5u0RiukLhIIz4+qOM8ls8=; b=A4UKdPYkO7gVLqpl83vuyZD1fp
 Cx9BeysCgN6t3YyDzlapVi3Mv3a4g6bnJuavXJhz0hf4W7h/Ey5/RS0aC1ZNYtPZEdR0uLwDAcB6o
 NEYlvNJDso5aYjhJIK0+cLWVN/v744zaKAYUBl6G3H4xDdunmN60B+8+h2KKB0OqI4ew=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1eh4gXcwKDJaVq28NyDGAP5u0RiukLhIIz4+qOM8ls8=; b=aafOqv0RW4ROJ21ux4czAuU66l
 Ty8aPr95cBKU9GGxrXz5EeKWUnirA7olOecbAMhmc9zlajCTpnegKM3OMwUaj/sKfGtawpTbyLnR8
 kGAqvowreXB7/2lTpQn04xEX72It38VrDwQ7l6mCMhKKaEzg1d1Zi9pP5FiejZR7EKcc=;
Received: from mail-oa1-f51.google.com ([209.85.160.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nlvn5-000CJu-C6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 16:54:27 +0000
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-ed8a3962f8so7680649fac.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 03 May 2022 09:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1eh4gXcwKDJaVq28NyDGAP5u0RiukLhIIz4+qOM8ls8=;
 b=GggVwzDmmkZj+9QNm9Y25yd9ywY15q/GceHgXzHoKTHDyrSfYQDow9jZ31sgpDoYHf
 +sG24JRO3uBTFnIXq2paMpFqTSpXOu+geA5TfIWrvjFY7bW5YwJPkoTftIe9PIlT+YMl
 NyYRA8N8veC1WHV0FygkI+/v3a5W3pcqTdAUU0IwyrqwzwXDMrM9Pej/44V2tgT9y9tx
 dMGI8LtL9I9kkqRMWpSfBJW+JcZblv8jIK/HbIG5LZEMiMRjyzi+PwjmxLqwnbRCdsES
 uretLW8lJgwc6oHPUiNks5jCmBwQxOE5LUMI99U3TCOw48goTjWXrf6eH/4lahY2/VFw
 Ilrw==
X-Gm-Message-State: AOAM533yrfx4/8QRjCcB7b8Ek2NSZv9/uNpP9AHzXPYzwk/gaON3p4hN
 MOATIQ734ec/meB6nDYT3Is=
X-Google-Smtp-Source: ABdhPJwIYsdQ5p1P5Q1mznCaYxjTnd/hJJG6oVZ/Lc+drskzCLzSd9wtxgyiNOjNc1Eeeh2wyOvvEw==
X-Received: by 2002:a05:6870:b693:b0:de:7356:a3a3 with SMTP id
 cy19-20020a056870b69300b000de7356a3a3mr2077698oab.24.1651596857587; 
 Tue, 03 May 2022 09:54:17 -0700 (PDT)
Received: from [10.10.69.251] ([8.34.116.185])
 by smtp.gmail.com with ESMTPSA id
 v186-20020aca61c3000000b00325cda1ffa1sm3506854oib.32.2022.05.03.09.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 09:54:16 -0700 (PDT)
Message-ID: <78730bd4-a184-e0f0-4634-d09dbaf59958@acm.org>
Date: Tue, 3 May 2022 09:54:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Pankaj Raghav <p.raghav@samsung.com>, jaegeuk@kernel.org,
 axboe@kernel.dk, snitzer@kernel.org, hch@lst.de, mcgrof@kernel.org,
 naohiro.aota@wdc.com, sagi@grimberg.me, damien.lemoal@opensource.wdc.com,
 dsterba@suse.com, johannes.thumshirn@wdc.com
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160302eucas1p1aaba7a309778d3440c3315ad899e4035@eucas1p1.samsung.com>
 <20220427160255.300418-7-p.raghav@samsung.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220427160255.300418-7-p.raghav@samsung.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/27/22 09:02,
 Pankaj Raghav wrote: > From: Luis Chamberlain
 <mcgrof@kernel.org> > > Instead of open coding the number of zones given
 a sector, use the helper ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ I c [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE1           RBL: IP Listed in UCEPROTECT Level 1
 [209.85.160.51 listed in dnsbl-1.uceprotect.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.51 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.51 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nlvn5-000CJu-C6
Subject: Re: [f2fs-dev] [PATCH 06/16] nvmet: use blk_queue_zone_no()
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
> From: Luis Chamberlain <mcgrof@kernel.org>
> 
> Instead of open coding the number of zones given a sector, use the helper
                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
I can't parse this. Please rephrase this.

> blk_queue_zone_no(). This let's us make modifications to the math if
> needed in one place and adds now support for npo2 zone devices.

But since the code looks fine:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
