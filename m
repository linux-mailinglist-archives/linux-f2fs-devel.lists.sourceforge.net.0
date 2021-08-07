Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5713E3659
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Aug 2021 18:48:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mCPUX-00033J-AB; Sat, 07 Aug 2021 16:48:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <axboe@kernel.dk>) id 1mCPUW-000331-4m
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Aug 2021 16:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hSiQWcxOeb6H8lVeRKmlUrfbadCZCq/IN0zGwt6aOMU=; b=d5gJYbFnvR6zoda5zso0Aq2vRp
 VQNO/B+NBiz0VDUjw4eXeScSgh7UALAdCYIJznA035JlrQYyVrWi5OO4xbJ+msGYmPj/8M7NUt80F
 DMgunFIDlGckvGnAiPUCvSeSmeICQRTXhRyjXTtQ/xhZetbRvd+OI551cqvfFk6WReKY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hSiQWcxOeb6H8lVeRKmlUrfbadCZCq/IN0zGwt6aOMU=; b=UTquvd0OEKLDUBiZIblMzch2Ug
 q1R3oR7sgrYuHwh+97mGz8cZ59HJqaRK7Y6ol3Sr8C5F8jzAi8agk1xf6yjdsa5siXfTj6gNPfirk
 STrOrDS3ZvrF/WzB3AhIOBuL7ndpXfmd2ePa4bYSZ29E+Nng+11hJiyrGioDGDs57KKg=;
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mCPUR-00G2wo-Jx
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Aug 2021 16:48:08 +0000
Received: by mail-pj1-f51.google.com with SMTP id
 u5-20020a17090ae005b029017842fe8f82so13595485pjy.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 07 Aug 2021 09:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=hSiQWcxOeb6H8lVeRKmlUrfbadCZCq/IN0zGwt6aOMU=;
 b=h+IjOjM/QHRahEtxOtPJ0luI2z0uupCF+/HWgHixl7GEsjmqkgXiYb0lVuGjoGHmSn
 A6GBt7YlD5bXTnNAqOwjdCBMYGDzIDpfLeju7oarB224Dr5mjaVT1kHrXRbHYZ4oVTNu
 VIj380LDnV1DJop+wNJSa3SgL8w3rdGPLgsoFGxQAzO3ynf6XsVRGYCo2Z70HNe+85MH
 PC2ejeJKOh9b2b0IA1NBN36IujdtaEr3VO/Pwt8f0reYNIaPe5XtbhPz3IuRYptEIOxc
 OhUduZI8FQzGAoKvhqgm7jinPuehwTGTcVc4NdyjU1HYLYIVDnOyYzmJEoBr15D6+RH7
 reHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hSiQWcxOeb6H8lVeRKmlUrfbadCZCq/IN0zGwt6aOMU=;
 b=BI8trhHO+1fQKlTD3BWESLALVgf7ZtyVq1sA9FeEFdKMU7iY50ZNfgIY7npHm5qU5U
 i4TNIgfcNknSK2qAGpD5mCkk5EQILGLChODy24Ict7iyeec/X92A5Bmi9ZTWl3xI91kx
 HKr4ReHS1FKfVnzpYZsWkWSSIzXlJQ8QAVnsM2NOypzBK8E+iQIwZ7wFPVjzAFXJXNka
 xpQla8qlS9Ssy8d19GOsYKtttbiDZRGaYlfJrR4k93QRyYKJ+cRtI8Z4r6kt6m5eh4gP
 1TXsSBXHt5fwDK43SJ8pxeHvXn7gtsgzESvg4ICpQliJb9TJfNXumjh5TJF0wlrmdIgA
 vk8g==
X-Gm-Message-State: AOAM530QdAR7rk3jjaX4mQ7CJSjDTAaID8vBaklSf5dEcG4kYsvFOjbo
 3t6bLI5KJI5TDxZGABcITnX2hf3nJpZ8woQ8
X-Google-Smtp-Source: ABdhPJyAiu0tJuRJYapivcu+TujecpU4eiJWcmiXFrpgW71PZtm6W1SstJsz9a57oqvzz880JnqWVg==
X-Received: by 2002:a17:902:a406:b029:12b:c50a:4289 with SMTP id
 p6-20020a170902a406b029012bc50a4289mr13472963plq.56.1628353001915; 
 Sat, 07 Aug 2021 09:16:41 -0700 (PDT)
Received: from [192.168.1.116] ([198.8.77.61])
 by smtp.gmail.com with ESMTPSA id c23sm14578792pfn.140.2021.08.07.09.16.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 09:16:41 -0700 (PDT)
To: Damien Le Moal <damien.lemoal@wdc.com>, linux-block@vger.kernel.org,
 Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
References: <20210806111857.488705-1-damien.lemoal@wdc.com>
 <20210806111857.488705-4-damien.lemoal@wdc.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <5f2640c5-0712-b822-9ac7-3daa974c0c30@kernel.dk>
Date: Sat, 7 Aug 2021 10:16:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210806111857.488705-4-damien.lemoal@wdc.com>
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.51 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.51 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1mCPUR-00G2wo-Jx
Subject: Re: [f2fs-dev] [PATCH v3 3/4] block: rename IOPRIO_BE_NR
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

On 8/6/21 5:18 AM, Damien Le Moal wrote:
> diff --git a/include/uapi/linux/ioprio.h b/include/uapi/linux/ioprio.h
> index abc40965aa96..99d37d4807b8 100644
> --- a/include/uapi/linux/ioprio.h
> +++ b/include/uapi/linux/ioprio.h
> @@ -31,9 +31,9 @@ enum {
>  };
>  
>  /*
> - * 8 best effort priority levels are supported
> + * The RT and BE priority classes both support up to 8 priority levels.
>   */
> -#define IOPRIO_BE_NR	8
> +#define IOPRIO_NR_LEVELS	8

That might not be a good idea, if an application already uses
IOPRIO_BE_NR...

-- 
Jens Axboe



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
