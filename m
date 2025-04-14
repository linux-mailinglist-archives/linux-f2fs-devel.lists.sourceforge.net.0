Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F52CA88EED
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Apr 2025 00:15:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u4S4w-0002TV-Vv;
	Mon, 14 Apr 2025 22:14:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1u4S4r-0002Su-S0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Apr 2025 22:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IMJlaezvtAOEHUJT6Sk6FWS2jlSc/jxA9tr8xDztoUI=; b=YnKsU7oESvLVhM+J0UFzEXnHem
 jzep7ZM/Eu66L/L0H/htZs/931b0Ukp1aDYcmHk95cqpQjYsC5nFOvmgP5QcKQOr7dZBnheeqLcXC
 z6s00ZI8C4lJ/AOkiao3b3f71B+FUsHfZOfGDchtxeSNxehL30X/MuxXt9/XNG3OAYX0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IMJlaezvtAOEHUJT6Sk6FWS2jlSc/jxA9tr8xDztoUI=; b=aFPjsjZL2LzTNHaBuPfgrHAwJs
 NGxADn/rh9Bu1jtgP/8/QnQcQmaauj/I4ZkB3aS2j5TuXaW4ggZeNgIFiykSzUHBUFSN9GWScQsJH
 N7rYuljQZMGPgyquFo/UH3XkyP6kh6QUSIWB9tZpjlsDKYFeCuVldjIB/PRuadSSy95c=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u4S4c-0006LB-Ey for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Apr 2025 22:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744668872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IMJlaezvtAOEHUJT6Sk6FWS2jlSc/jxA9tr8xDztoUI=;
 b=G6hkMTWk/Eu7Mw5Fbf4ugDdWgHdMjDAwK8uM/OSojjehHFr30ZTtTdVFrz8/8RdiSl6dob
 8WINvadp3fk869GJzt6AglPoaYK6H03OcB+tKPh4NGxl2ZYMjF3WXp+pJ3PFmkAC6R6MAB
 2b+JRgj1qJI0hLTiUr2Ggsay1E0a3uU=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-8SXjTGONPY-WLXQWC7iogg-1; Mon, 14 Apr 2025 18:14:31 -0400
X-MC-Unique: 8SXjTGONPY-WLXQWC7iogg-1
X-Mimecast-MFC-AGG-ID: 8SXjTGONPY-WLXQWC7iogg_1744668870
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3d451ad5b2dso54271605ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Apr 2025 15:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744668870; x=1745273670;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IMJlaezvtAOEHUJT6Sk6FWS2jlSc/jxA9tr8xDztoUI=;
 b=eOpbIj87lPvU6RP7e5HJ4zRSv6kqGEx8TerGlvJrm1cLCQevy0fv+WZz89GUaodxcN
 P9XrK8bD1bsGvGeAAtA5mPr2aF7MBNZdpw09tuQf2B5hbHYA7uGsx3aHfboXaQ6yMcBI
 QmwSXKwYJzHoPi9RYwqIgkz9wdAzD4jk3pYGGuwueVLTlzphSqTMemezTTsCkwO+Q+80
 CCrabKrCBKPzBjJat9NrSekaMv0TpHX6HpaEc7VHguG0QRndm5Jou+/RuGZ1zNoB1jB9
 rN+oPlsYt2uzUN3hyVT/22NXsytmUV3qamhzrPkvpsDmqKisUC728J9vF9Rl7nPHRqWR
 c7fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXifTQQvtz3KL8nt3WiL5NT6zkaoJLD6eBf92suF9u69iU96J5D9CZ+xH7VQveUBk9EFzRnwEUqpl9XMMXImkPn@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzTFAamaD0kG/TNaxfsw/ILIsJa7iRuU7JyyKvztWtTGsPCrisp
 Wua778tqm8mvOXFEOEc5WFDKINcvWi5ACOOpQrSHLJcCZ23uMq0Z/ZXC0RyxmemV6pajb9hBC/L
 rjbB7Xf//KA5+cVIq05Gp+uBGt8UoNDTmizVsxxHVZX+dzVtDmqlIO7uq+GeFXxRsNFpBdraFvX
 hjItnauqIJJA==
X-Gm-Gg: ASbGncsUh/WxFY3bOKoxhicBLe7FBUaXY8bvxyjJUJjY5q2K+eGO8BffrgmXaKW6V/V
 quzp83rVYkl1/dGV6DaRQ5HBSSGMgIhmd5yEz6oyEvSjbfz53x3HoLBE6k4yHGp3sLADvG3HddI
 uQrmBCcHw99SxzAliKi6wXdXxt1M74WQzdULwmSSZJ6LYiTzK4xEH+n5NsxZFOpZ2JURffRXbmH
 nHWp0dUEFy1CsTwTGfgt+JU9HTDIr5IB/VAsbLrA4BA8hoKKhS9Hbm/y0sz88JrqMnn0VKLZtlZ
 /QITZMLXtDQ8J7wvwJRe
X-Received: by 2002:a05:6e02:3b06:b0:3d3:de5f:af25 with SMTP id
 e9e14a558f8ab-3d809ad0dc0mr13384405ab.0.1744668870083; 
 Mon, 14 Apr 2025 15:14:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnkigJbJ3ZpFz/MRbCIa/gkQj8DBhcMpoX5V+N6Jpch1yxQaBQAa1eRbq4PKUSqENdeIpNhQ==
X-Received: by 2002:a05:6e02:3b06:b0:3d3:de5f:af25 with SMTP id
 e9e14a558f8ab-3d809ad0dc0mr13384255ab.0.1744668869681; 
 Mon, 14 Apr 2025 15:14:29 -0700 (PDT)
Received: from [10.0.0.82] ([65.128.108.16]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f505e798cesm2779911173.145.2025.04.14.15.14.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 15:14:29 -0700 (PDT)
Message-ID: <de3d60d5-bdfb-4566-9c82-80b42bb83a15@redhat.com>
Date: Mon, 14 Apr 2025 17:14:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20250303172127.298602-1-sandeen@redhat.com>
 <79090775-413e-437e-ab07-ac6965932a32@redhat.com>
 <c2d62ced-3a4f-442c-b438-043eec017a45@kernel.org>
 <63ecf5bc-7ddf-4d66-9e64-9d5923d12fcd@redhat.com>
 <6527ce81-e2c7-42fd-a39f-93380e133367@redhat.com>
In-Reply-To: <6527ce81-e2c7-42fd-a39f-93380e133367@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -yi9__y6kNUl23QZeYuXSH_8yoBH1j0bfduyO5g7kwM_1744668870
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/12/25 12:17 PM, Eric Sandeen wrote: ... > FYI - I don't
 think I will be able to complete this conversion task myself - f2fs is >
 by far the most difficult conversion I've encountered, and my time for these
 sorts of > projects is sadly limit [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u4S4c-0006LB-Ey
Subject: Re: [f2fs-dev] [PATCH 0/9] f2fs: first steps towards mount API
 conversion
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
From: Eric Sandeen via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Sandeen <sandeen@redhat.com>
Cc: jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/12/25 12:17 PM, Eric Sandeen wrote:

...

> FYI - I don't think I will be able to complete this conversion task myself - f2fs is
> by far the most difficult conversion I've encountered, and my time for these sorts of
> projects is sadly limited. I do have one more patch series that moves a lot of the
> on-disk feature checking out of option parsing, and perhaps I will send it as an example
> at least.
> 
> But I think it may be time to ask the f2fs experts to take over this effort, because
> I'm just not getting through it on my own.
> 
> (We are down to only a small handful of filesystems left - in fact, I think only
> bfs, 9p, and f2fs, that don't have patches anywhere. So it would be really great to
> get some help on this.)

Sorry for replying to myself.

Actually, I will take one more try at this - when I first looked at Hongo Li's patches
to do the conversion, it seemed like there were a few problems, and I didn't review
fully. I realize now that although it was a different approach than I had been taking,
perhaps it was on the right track after all.

I'll try to evaluate that patch series more carefully and see if it solved the problems
I am struggling with now.

If it does, I'd be happy to work with you, Hongbo, to get this completed. Your series
will take a bit of forward-porting, as the codebase has moved forward quite a lot
since then. But I'll go back to an older kernel and evaluate the net result of your
changes, since I have some custom mount-option-testing framework here, and see how
things look.

Thanks,
-Eric



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
