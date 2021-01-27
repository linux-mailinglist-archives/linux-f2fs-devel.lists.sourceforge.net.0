Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDF93061DB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Jan 2021 18:23:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4oXK-0000nc-VN; Wed, 27 Jan 2021 17:23:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <axboe@kernel.dk>) id 1l4oXK-0000nV-3F
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Jan 2021 17:23:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lQKD9AgPexRDubj64bboSIKnHej4WVBTeYTVGyeOaHk=; b=JDch1c+1l43YX8Jbx6l/WmGYg1
 /qaqYQXClq7b2S6izjVQOAjxtUoTFd0TlYbUx2W0u3glG8NW+/DGlRwQ/uzv4PT10wJ1Nb5/4fYhw
 1jHnmxKnYOc6GQrkkSTsizmXp3UJhye0Ey991C1KYTldDQqmNR7JRHCdYtApwy2cXPWk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lQKD9AgPexRDubj64bboSIKnHej4WVBTeYTVGyeOaHk=; b=NQKIJbfJZyp7iu/4XbgejaKpUk
 GaBPC+i3SakkYhz+Skm0RDgtuviYSYILqkGoEavatuLBZzUW60uxW/RCp5mGxB58cNeK0iDv9t1K4
 BzFl5THHe8QbNkI1X0cEFuVvultLNu1B06MP1yxXbWZLCQTVTO0sHdfYJIUWDJAptz2U=;
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l4oXC-00EMOg-Im
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Jan 2021 17:23:22 +0000
Received: by mail-oi1-f175.google.com with SMTP id w8so2976259oie.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Jan 2021 09:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lQKD9AgPexRDubj64bboSIKnHej4WVBTeYTVGyeOaHk=;
 b=0n7IOfJztdBvyCO+NwquWZO/9oDoBxQCCGXsafUQ/GvUYsfJ9GMPAPuFm/2AHz2s7h
 uCjspaY6eWonaZrU5TNO1bFTgmPIbBbshQEov2cSyySKuYe6JHBj4YtmSsCgqqeJQ0sz
 TEp+kDX55Ttsnc0J6mELqLNa4WTTuqIBpHFd3WA2ygVL+9LP+Y/h3dPZ0HRlZG6rjvCq
 o8+mzv9CEKGMlgIZqlWOyLBHKwUPEfZAqrHsgb5eQJ8jwi6mY18MiLv0LfN195kWsU1I
 9aIP573InHU/7bIMgKM0aes7wOoE1YqdbZK7PAc68mg/7wVOpXqK0JLzoUJL/hUqxtsf
 yCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lQKD9AgPexRDubj64bboSIKnHej4WVBTeYTVGyeOaHk=;
 b=kc9qVmrGrEuV4vutjNe2pVoUm7WpTdwgNoNdjnPYHCk7N1EIFC30c2KJQhCi63hqBz
 0MuE2yTVXw1qWUiON3IIevuRSA5/3FcVHQYPI482OB2e8tPrae1BaMbsVqba+Lp4jt21
 NIja1Z7GmqPW9/udKTkemIHO7C6hUmRXKoudA5cYtlyPA62V0mCSbpnoZgh5LyTRF5QM
 D3WizU6tdF3jNTd5/Y8fvYiDYqqO4mybDEDFenzgMrw3wSvE0oGbuB4QW64Ml39GcVrT
 9XYIHRjYEzgB9k5O0wMx7rbor9xIifPGEHwCmPwgznNdVIiMstwSrUoY09tbXZWNOGG5
 zz1g==
X-Gm-Message-State: AOAM530Q0GytGL8PfgQPYRkrEOORDvPu7854kcZp1EXBwYOrdup2TFEU
 2tPNi6RUWV8JT9DDKgBrvQLaVWvF68dXoA==
X-Google-Smtp-Source: ABdhPJznkZAkmGjzE0K3XJ7r+1OuPOB/uSu+0QVk0qZGt1uSi7gcicfz36VtRv3b8tVtY1Mr6zsRVA==
X-Received: by 2002:a17:90a:b782:: with SMTP id
 m2mr6555276pjr.220.1611766334716; 
 Wed, 27 Jan 2021 08:52:14 -0800 (PST)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
 by smtp.gmail.com with ESMTPSA id
 z13sm2914261pgf.89.2021.01.27.08.52.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 08:52:14 -0800 (PST)
To: Christoph Hellwig <hch@lst.de>, Song Liu <song@kernel.org>
References: <20210126145247.1964410-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <53e9b2e0-7169-f2fe-3c33-5f8a28cbd01b@kernel.dk>
Date: Wed, 27 Jan 2021 09:52:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210126145247.1964410-1-hch@lst.de>
Content-Language: en-US
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.175 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.175 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1l4oXC-00EMOg-Im
Subject: Re: [f2fs-dev] misc bio allocation cleanups
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
 linux-nilfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 linux-nfs@vger.kernel.org, Coly Li <colyli@suse.de>,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-block@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Lars Ellenberg <lars.ellenberg@linbit.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/26/21 7:52 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series contains various cleanups for how bios are allocated or
> initialized plus related fallout.

Applied, thanks.

-- 
Jens Axboe



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
