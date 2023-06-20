Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D75DD736CC0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jun 2023 15:09:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qBb6t-0001Kz-44;
	Tue, 20 Jun 2023 13:09:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <axboe@kernel.dk>) id 1qBb6q-0001Kr-Ve
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jun 2023 13:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/KU26Z1dxNWAUrZotLa0tGqdl25ICLyY8sSIVgQs95M=; b=htBXxXrkERe9YJrO5fTfGyV0Io
 /X9+n9vysmqXQ4aD1R3tYkwX5NJYoFM9E4Sk4ekcRSb5lfcW8CC4cVvC9fz2LgAoSNkgD6Km3kVDb
 Tk8jsQwt4WwzY+9VRhqX78UVQ8TxMzYSAVoQHZk1Mxj8NPwJgx2IEcXGW17F+3xEtj/I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/KU26Z1dxNWAUrZotLa0tGqdl25ICLyY8sSIVgQs95M=; b=DADlT86uw4tXVf0oloinaIEUr9
 Xel+CL3mIL74q2EsjbH0AlI9fT+SElqZAAbkTdzyzY1k2J3f7BVRd+C5017wMvQUhQ+Ofqhuqoygl
 llwX6LugNVtr5apYHovLVYJzwpfsIc+VczoU8voYOnPHvJgZTCxlBO3uNvUSwCEGfFpc=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qBb6h-0000OP-VF for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jun 2023 13:09:25 +0000
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-668842bc50dso407736b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Jun 2023 06:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1687266550; x=1689858550;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/KU26Z1dxNWAUrZotLa0tGqdl25ICLyY8sSIVgQs95M=;
 b=ck3xsIKjMIK+0byK8ZMLzVCoLURa/n3lrFl7W5YL9w2mDYRxjYfP7Aio8DVg1kdIkZ
 OuWHeEP16IDF5Kh3OFl6qAq0ZBsR+D6YpMv5UKNWPPF8W5R0U2mDCxJZZEbbaP/YubrK
 ayArmEQ4MiuhkgTwK0S0A/gfEJfas645OwZMuhUW00NYVE5WMAVIv3vjqDNGw5XB7ZQe
 zL9NWHZtlP9mgef1wYjkUMvqSIt2mIGOXc5Z+JMbg6zaKHHsKGFBN6g6McYQDu61t9Ms
 xKfnhW4VW0sALo9SxNY3/9wviHYpHmTaCUNUobgTCwlKGQQyobcLmDdBSIqY9nGXMQvO
 Y1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687266550; x=1689858550;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/KU26Z1dxNWAUrZotLa0tGqdl25ICLyY8sSIVgQs95M=;
 b=isOU8yeQKUw5LLjR9UW0rKAmlYK75OhaowzSclmPgmnppSzSQE1h5HduRlHhWipRxv
 stTUj61+kuFDa9KbgeQvRkGxt54Qj7y7V3QvUspQ5jSWgdaCH7RznPT6hsYoaXLQEARG
 yn504TYPy36E7btsFAa95aBfAEMLRiSoLPYhhU5RuHdtjgBtBZhia5fZXvrbA4NA4TD7
 xk1Uw05OTkyxY6qzcGoQwma+MgupbPrGNK4loS8+wiBXlefJZfpKjoVCAuw6UnLV8OFW
 Q7/Zftzg4JyT6h3zM68+7AIKvAt0ekioZlW8Mhf7oJtLXu7YzHl+hd4v3+dVV8F5LfVH
 kJSw==
X-Gm-Message-State: AC+VfDwx5LcnOJRHs3cBag4JIGFwPNsJP8F2bybkiQbSFU0TNaB0jnOX
 1Hb+l59cyIA8xVLEUaBPnvqyq2sf9j7LuptLQgU=
X-Google-Smtp-Source: ACHHUZ7JRYKm54L4fjMnCgCr4bSTR1jXiJ5tnvrQD6etSGNiDtbQ2msPcnDxrf1HXPebLbsYHzneoQ==
X-Received: by 2002:a17:902:da91:b0:1b0:3d54:358f with SMTP id
 j17-20020a170902da9100b001b03d54358fmr14695177plx.0.1687266550121; 
 Tue, 20 Jun 2023 06:09:10 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a170902ebd200b001b523714ed5sm1557766plg.252.2023.06.20.06.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 06:09:09 -0700 (PDT)
Message-ID: <9438ac5c-6370-9df6-7259-c0914391dd74@kernel.dk>
Date: Tue, 20 Jun 2023 07:09:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <1dc1a0f2-9be4-8ae0-da26-3c00c8a71b41@kernel.dk>
 <ZJFENFDFVx++RmhA@google.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ZJFENFDFVx++RmhA@google.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/20/23 12:16?AM, Jaegeuk Kim wrote: > On 06/19,
 Jens Axboe wrote: >> Hi,
 >> >> I came across this patch in a news posting: >> >>
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/co
 [...] Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.179 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.179 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qBb6h-0000OP-VF
Subject: Re: [f2fs-dev] f2fs async buffered write patch
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
Cc: linux-f2fs-devel@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>,
 Lu Hongfei <luhongfei@vivo.com>, Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/20/23 12:16?AM, Jaegeuk Kim wrote:
> On 06/19, Jens Axboe wrote:
>> Hi,
>>
>> I came across this patch in a news posting:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=d618126911829523e35a61f4a5a4ad159b1b2c8d
>>
>> which has me a bit worried. As far as I can tell, all that patch does is
>> set FMODE_BUF_WASYNC, and then just hope that the lower layers handle
>> the rest?
>>
>> What happens if iocb->ki_flags & IOCB_NOWAIT is true, and now we do:
>>
>> generic_perform_write(iocb, from)
>> 	...
>> 	->write_begin() <- does this block?
>> 	...
>> 	->write_end() <- or this one?
>> 	...
>> 	balance_dirty_pages_ratelimited() <- this one surely does...
>>
>> If you look just one level down the latter to
>> balance_dirty_pages_ratelimited_flags(), you'll even see the 'flags'
>> argument documented there.
>>
>> This looks pretty haphazard and cannot possibly work as-is, so please
>> get this reverted until f2fs is converted to iomap, or IOCB_NOWAIT is
>> handled by generic_perform_write() and below.
> 
> Thank you for pointing that out. It seems I haven't reviewed it carefully.
> Hence I removed it from -next, and hope to have some time to convert iomap
> soon.

Thanks - would be great to get FMODE_BUF_WASYNC enabled obviously, just
needs a bit more work to get there.

-- 
Jens Axboe



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
