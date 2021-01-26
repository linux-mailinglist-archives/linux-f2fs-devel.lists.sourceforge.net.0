Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D3F30429E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Jan 2021 16:31:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4QJC-00065k-7N; Tue, 26 Jan 2021 15:31:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <josef@toxicpanda.com>) id 1l4QJ9-00064w-CJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dHYhIJF3/5XU6YJf87js06xMy71uM3p96Vow3DtEX9o=; b=BHGcG/wmvzFscid7/OQIbbuW9H
 15RXtWZjRxbhltDGnt/XB5UfrnIBUDvApMXyF8p0U+EhajyI3AB16QszI/7vesJgPs0PiOL4ta/DU
 LM4RRFpMED1hG14YKYJJZ5wS3Qe6jHelahko4kJ7m/dAKz93zGUwd6kWhXrbEtXvgEao=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dHYhIJF3/5XU6YJf87js06xMy71uM3p96Vow3DtEX9o=; b=TkFnNL1aKCjbdZtNIKhFN/ZiKq
 yn4hEB0VrbKeMsvMZ86t0P4F5vsFYRWa4nLvMjCq1IoZuL3a+KlxWqPYxdyHT4h07FwGvbmBSAlCN
 b46uhnCA4k53MUn5CGNkOtZOMTu5OtsnNTesVML72gJe27VA2q7tSEcUdJxB7DlhfFSg=;
Received: from mail-qv1-f52.google.com ([209.85.219.52])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l4QJ3-00AOAz-08
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:31:07 +0000
Received: by mail-qv1-f52.google.com with SMTP id p5so7993466qvs.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 Jan 2021 07:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dHYhIJF3/5XU6YJf87js06xMy71uM3p96Vow3DtEX9o=;
 b=WdWUmiJC+8UYJRTvh/5UIitEcjh/T2145UmBmoaEWnGQ/iLavq64t6tRlvb//BGAQq
 3VCUG37Nar51k+dPiNF3CzPvHK3JYiJMW85otOgYWbeCX8vxizRUbZSXeXuWWIFycBGr
 fjqPj8+dHcL6KrbrlAi0FZAluWAKHuAaVSWDnScYSZ0p7yKyiHcHTUW3cqp+KZfgaCw9
 l/BFmjP/bpcNjnwBO+KhBHjChy/Tbk4sRM98bPFs+rrmeqOQ8iSzM6+HYZ1M0z/ww7C4
 WfRtB8FMyXiifrNQasVAdg6AbxCHsU54Unw0rZbDzO556nGQA5ZP7DBCURAC4mHWVVQI
 +Uxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dHYhIJF3/5XU6YJf87js06xMy71uM3p96Vow3DtEX9o=;
 b=WIdshTwTwosuHHy6mxJ/R+Ii2sddwVx38P2wpEPClrENjcfx1IYHha000kgbD6zvK/
 h1IZWHOb0PWLsfxon+HB0eyzIkgK1xc1waf9ht/okERU82pEJefpGom6rUkHGrlPJYZW
 aGOybnbZr8fClRSvAx3qpPSs9+PTSNhNPeS66ov9KVRKqKJIgVLqUClnVhEbJd7wuatY
 ZO1UpfMJsJzSsaEPdeOMRA5LrY0C0EsbHSoj7r+fD6vhS96zRVuLxG/nc5EZKvrI1/o6
 1LWekk60NiHkHoeIzwUkf/1JIl3PEQVdXk7nt4YnLOysFJx4ChMiLEFTKUMCH5qr7HZ7
 sjbg==
X-Gm-Message-State: AOAM531RKGlqgQT3OvGJjOAVtPC7mwJy5Cz1Q40q0JB6FBoF+6fbC6FE
 6WqjwJkwdEIDVx/HeVG/fkr8ua/bvGl2SK4drvM=
X-Google-Smtp-Source: ABdhPJy3NpFp+R6tlPWp0jY9EiL4vU+Cs/B3eEjfsSBgMM797jtRUTY+hlBsCIlFeHp5zjWk+0XbYg==
X-Received: by 2002:a0c:fdc4:: with SMTP id g4mr5783824qvs.18.1611673298035;
 Tue, 26 Jan 2021 07:01:38 -0800 (PST)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com.
 [174.109.172.136])
 by smtp.gmail.com with ESMTPSA id m190sm14220105qkb.42.2021.01.26.07.01.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 07:01:36 -0800 (PST)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 Song Liu <song@kernel.org>
References: <20210126145247.1964410-1-hch@lst.de>
 <20210126145247.1964410-3-hch@lst.de>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <d3717e48-9e42-fa7a-12c2-a6c97eaf4a7b@toxicpanda.com>
Date: Tue, 26 Jan 2021 10:01:34 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126145247.1964410-3-hch@lst.de>
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.52 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.52 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1l4QJ3-00AOAz-08
Subject: Re: [f2fs-dev] [PATCH 02/17] btrfs: use bio_kmalloc in
 __alloc_device
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
Cc: Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org, dm-devel@redhat.com,
 drbd-dev@lists.linbit.com, Naohiro Aota <naohiro.aota@wdc.com>,
 linux-nilfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 Coly Li <colyli@suse.de>, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 linux-block@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Lars Ellenberg <lars.ellenberg@linbit.com>, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/26/21 9:52 AM, Christoph Hellwig wrote:
> Use bio_kmalloc instead of open coding it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

yay I contributed,

Josef


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
