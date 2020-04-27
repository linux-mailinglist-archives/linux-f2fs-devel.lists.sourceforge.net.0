Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FF11B9978
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Apr 2020 10:11:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jSyr2-0004XC-6o; Mon, 27 Apr 2020 08:11:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <guoqing.jiang@cloud.ionos.com>) id 1jSyr0-0004Wv-Fn
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Apr 2020 08:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BWFYX7PX5iVsUcqkRSw86/RtX5f51iD1D27rAVa9S5k=; b=nL5qC7sLJ9FaqXS6LJKcNoToQs
 BHKrFDnrWBKnJ+EvLBkGhXQ58l1kJWhlg4ApEOav48/9z1mHzJ2eNiPYbdqSGAUA/zvdqorw7JskO
 H80ZPcGZJE/j0mLclRQli3sVtFG6O7pi0IAaQczQ6olDRzsmnPKvDIiz4BYEMmP8M5uY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BWFYX7PX5iVsUcqkRSw86/RtX5f51iD1D27rAVa9S5k=; b=GF68raipW0elFuY+bknlIp1qI/
 z9Xy2lqCNAGUalY01DgpyE7Y+IlSIJKl2dotubff/YG+/BuOUlN4N5At59UaQtXi7qnShDohPNYDY
 +ekUxviv52TpTKhJxozjttBx+B6URJV32Z5PG7KHtrLHg6mG9d7+u7FzpZy1QP/w5ZCQ=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jSyqx-00GCZq-0M
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Apr 2020 08:11:02 +0000
Received: by mail-wr1-f68.google.com with SMTP id i10so19365417wrv.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 27 Apr 2020 01:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=BWFYX7PX5iVsUcqkRSw86/RtX5f51iD1D27rAVa9S5k=;
 b=DkguBcsFj0EPiLpABgT8rwKhoHGfXC4HqjrDIcxCzC0+0m4BwZCxFQWPAH2FMMagvZ
 aBW6P30XZ6aOwyOfyNiBuJ7klTHDbgZo8XUdPiCMQf08pnwW8WgAGS6sKgGw6RiSsJqX
 jP4WPcJrV/j5+q7L6P/pePj7dr7fBhuHh5CC5DMrnzpJGYyDg6p5mDLUOLfCbWYD6kiw
 kdIyZGN+TyFSjeycyhRg1ED+cIQBxHf6W1AhotvuyBgRCd38UmFZ+QCggJccxRAKZny+
 eAz0t+8XaVoJPSl/S+rW+PpOe1/QP7/5db7dNeD3y2hn1+T6yl9oKrzmhdYwnRdEkbb1
 99Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=BWFYX7PX5iVsUcqkRSw86/RtX5f51iD1D27rAVa9S5k=;
 b=O8jT5Fli8eJl0z6GAJavmxBTEu2w5hBJZK0JJGKNBY/UV8RacNjg4XKpLVQNhwLrVm
 yv56y1jNjPgQmSzKyVCu6jbGWkWkMvj7lRwe7TdgMLr34YT115Mvx6xD7BT6V5xqR/WS
 559qQRcdUT/SvdkrUXyEkFOyy4QAi9WFFKOCvxOTSyHW+KEyP7F/JsfuLUwZH4pF0pIa
 ImqWO8tFoFa66yanW/JUCdXW+lCf6ZpK2nFO4aF4YRNLqTf+PGkY1FVHgToGAF6apZb1
 d7z6j00OzofmfKSWsfkZEzZD31Eza557S/ECQ9VSfST8FKVlj+UmOzWSZCSCz/MHqj+V
 5dvQ==
X-Gm-Message-State: AGi0PuaXJAyv57xzK9snK7whu0BQKfXe8D/46KREChGglDECkkEKhCrb
 XjxaDA2iJDbE6HnjTT8u2SsbmPsB2/GQvlwY
X-Google-Smtp-Source: APiQypI47heGwKaekAfcdCP9TA3J1BjECdG45lBsaUSpphpeLIcAoPbP2SxOxrxltJF2SerXzSR0ew==
X-Received: by 2002:adf:e7ca:: with SMTP id e10mr26528432wrn.18.1587975052322; 
 Mon, 27 Apr 2020 01:10:52 -0700 (PDT)
Received: from ?IPv6:2001:16b8:4886:8400:6d4b:554:cd7c:6b19?
 ([2001:16b8:4886:8400:6d4b:554:cd7c:6b19])
 by smtp.gmail.com with ESMTPSA id r20sm13918576wmh.26.2020.04.27.01.10.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2020 01:10:51 -0700 (PDT)
To: Chao Yu <yuchao0@huawei.com>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20200426214925.10970-1-guoqing.jiang@cloud.ionos.com>
 <20200426214925.10970-6-guoqing.jiang@cloud.ionos.com>
 <fc48f93d-b705-4770-0fd0-8807b3a74403@huawei.com>
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Message-ID: <665e77ac-2476-ea75-5c61-eb8c2507d1cd@cloud.ionos.com>
Date: Mon, 27 Apr 2020 10:10:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <fc48f93d-b705-4770-0fd0-8807b3a74403@huawei.com>
Content-Language: en-US
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jSyqx-00GCZq-0M
Subject: Re: [f2fs-dev] [RFC PATCH 5/9] f2fs: use set/clear_fs_page_private
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
Cc: david@fromorbit.com, willy@infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, hch@infradead.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/27/20 4:22 AM, Chao Yu wrote:
> On 2020/4/27 5:49, Guoqing Jiang wrote:
>> Since the new pair function is introduced, we can call them to clean the
>> code in f2fs.h.
>>
>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>> Cc: Chao Yu <chao@kernel.org>
>> Cc: linux-f2fs-devel@lists.sourceforge.net
>> Signed-off-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
> Acked-by: Chao Yu <yuchao0@huawei.com>
>

Thanks for your review.

Guoqing


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
