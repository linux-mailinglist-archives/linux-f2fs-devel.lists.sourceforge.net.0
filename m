Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A52E63E3657
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Aug 2021 18:44:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mCPQs-0002BN-LJ; Sat, 07 Aug 2021 16:44:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <axboe@kernel.dk>) id 1mCPQr-0002B6-Go
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Aug 2021 16:44:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jyBzebSSlchrLQAMP8lLKMmyfmojiYtazje9CNMSlKg=; b=UZkpYgS1Vy1YkMzZggQIuOJeSy
 cNYHHTq7kG4urj/8XJWq71alChas+UZhwDjCjHbLul6c5RGBveh2Vp3ThuqmsaBCUTu2L9R474FyE
 jic+1yAi0TCHLAzxs8TOrnGbZkjLuHVKmpLahyrLKotoTgIiwXX7gtMubDYOugW5UwR4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jyBzebSSlchrLQAMP8lLKMmyfmojiYtazje9CNMSlKg=; b=JNzLb9haDykyvWUG3GfyYFx+g4
 eMsJNrcNKWU9F7iq7DWEz4FgZVRwlEU7f1FsujsrtTQ3/WLjB4Ptz8vVMkKKxf2HLrv9U+G/wRa9z
 wq07kQIY1e5/fADUiOA/zyWtJp1bY/CXvICqjbX8onCxsJzTeOEszyTWtINt0en6Dy1k=;
Received: from mail-pj1-f43.google.com ([209.85.216.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mCPQe-0006Zw-Sj
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Aug 2021 16:44:21 +0000
Received: by mail-pj1-f43.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso22847631pjo.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 07 Aug 2021 09:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=jyBzebSSlchrLQAMP8lLKMmyfmojiYtazje9CNMSlKg=;
 b=MaxxVks2IMBzQ2F9jCxLj/nSiEgTZ5pyDfrDxNCKpZWXarGCZq7vMZRx2Y9Es+aS+Q
 DvYaJvydaaTMlRNk4Dibcc4Na6xlqh3lSo2Rgh/y/+DSsddD9I7N2ujGneS4EtoybCwA
 jQIC3q0tys063u3jkCm8RnL3PTsWJeAOwcdw3AJ9TBKCpKZIae1rohekMUQox60hacb6
 tLQeJoBBbb3ZbH6i4NnnPeBZwHjUuimWAbpYsJIgu3T3jr306+6xr9lNhNQ9lG/Ysnbn
 gJ+3iLP9WJo9xMwJqbyOzTSeVwUc7r4WiOx8sTFmDh4w1srveOS0XcwsCljsysw8vYTT
 Ug4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jyBzebSSlchrLQAMP8lLKMmyfmojiYtazje9CNMSlKg=;
 b=eZ5LLFWuhnBeKEN0BVcTVqGFUvs3fF26lA+IhhUM/sTQNPgPLZz2hBOI8rPoJMjZDo
 8s9fz10brHn0jwjB1lNyLnFUjXFIuVJhpEciIyFvPULdIZJr/iC7jNzhGef8qcI4++JY
 qg8gpGOLf64vKIB88UqTuMfKJ6NSBPg8j3tJlrI3LUo7+0sNY3BcoOf5WMdTYuczCbvi
 SRlt1b4h2euTXtNdsqzWObl9NoGxCUWWWGAX6nEz1swg1necVG3ZLQqwo7sGeO5Uq4xw
 534YTcE2GNELN0jekXWmBj1yf6Mdjh6t4L5Q6XKFUdv9WRCUk2ryRFkyfNbFQu02bjEp
 kF6g==
X-Gm-Message-State: AOAM5311QMBs9AupStxVClqT5r5eauD+XJ7iRSGOzmsXaXHJjQghK+wJ
 /6HRa+icRhR9k/No2U5D4yCXA/pAstwXZ3bB
X-Google-Smtp-Source: ABdhPJws9/JRHOcGdCKqQKGagRxgYns1/oS3OmZs0ZbHu68UHrNfNgca07uWSHK3QGqEEDJyDfYAkw==
X-Received: by 2002:a05:6a00:2a9:b029:3c4:cb96:5b with SMTP id
 q9-20020a056a0002a9b02903c4cb96005bmr10204096pfs.36.1628353140364; 
 Sat, 07 Aug 2021 09:19:00 -0700 (PDT)
Received: from [192.168.1.116] ([198.8.77.61])
 by smtp.gmail.com with ESMTPSA id s7sm14313588pfk.12.2021.08.07.09.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 09:19:00 -0700 (PDT)
To: Damien Le Moal <damien.lemoal@wdc.com>, linux-block@vger.kernel.org,
 Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
References: <20210806111857.488705-1-damien.lemoal@wdc.com>
 <20210806111857.488705-3-damien.lemoal@wdc.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <0141fb21-c0dc-d743-6af9-c2b26d34c4ba@kernel.dk>
Date: Sat, 7 Aug 2021 10:18:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210806111857.488705-3-damien.lemoal@wdc.com>
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.43 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.43 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1mCPQe-0006Zw-Sj
Subject: Re: [f2fs-dev] [PATCH v3 2/4] block: fix ioprio interface
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
> An iocb aio_reqprio field is 16-bits (u16) but often handled as an int
> in the block layer. E.g. ioprio_check_cap() takes an int as argument.

I'd just reference kiocb->ki_ioprio, that's transport agnostic.

Apart from that, this one looks fine to me. A better commit title
would do wonders too, though, it's very non-descript.

-- 
Jens Axboe



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
