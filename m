Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8855B1BE6D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Aug 2025 03:51:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmxmI0d35kTi0kRZd9rfMR9rm4eZmLyEcGnBD+Rkcm4=; b=jFUm+57nX7TCoPTwpoLjADJ+58
	v6hq8CdCAvZ2NHeZ9NhklHZ7fPbKl655MYZVt/MUSDjxh1WLlFXYYVYK7PCXabzGPa4w9QvSwlWGw
	0bkV4QDcQP564EW9LTMUTi6YqldAyMIbF1G1EhXNtaz0Vjjj0f+yNNWBtACLTd+BzoCw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujTJZ-0000XG-Kp;
	Wed, 06 Aug 2025 01:51:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ujTJY-0000X0-HR
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Aug 2025 01:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MCqV+OsydVF7Iw5BT+d6Sb1mEwe/HvqJ5iqrSH7o2pM=; b=U+R18tyvK8Qf00YX1zHuitbGXF
 /L5eMiIX9hTERKfxrCyNpjtd1YGQ5Z8GllEj/yxwdu5hNHc+Nnc/AfiK7nlh0qQjiQawh5cm4qnvt
 fJnYYChTcAykRBIlet3W+eRqUcvTMYYpJqn3kic3/4xzgVu1i8ZECnYCF3lgZ68ghw7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MCqV+OsydVF7Iw5BT+d6Sb1mEwe/HvqJ5iqrSH7o2pM=; b=ir2B/VBmLUdtlvjImvrhIvQ5HN
 Pp0hcGciRFfrL9OEbJf8gXKc80Zl57ctZVIPCYrz5o1suGe8QMQt6/WLO19Gwfub/YCIgZ7NCXmlh
 n92MT1rkEXhf6RoBiTnmyXQrUg4OmdhYmXCuSW21vZw+ONZ5LP2IUcbRivC1B9paJs18=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujTJY-00048l-4o for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Aug 2025 01:51:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 54CE9601D1;
 Wed,  6 Aug 2025 01:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C37C4CEF0;
 Wed,  6 Aug 2025 01:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754445084;
 bh=PQZc/q65JiHh2RcepehYW3OIxX4IWqymq4kCk+fM0AQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=QRSpdYWQYR+w2LYdyxUXBtmuhF+9HbKn3Z3mvkANZVtnTi6SlnkfF8Byb8fwAwQmi
 X+L13NeutfFEbr+1dLnBbf3V6u6tYDEhxuRPLshqI1EctW4H8YopKIY25a1gVTU5S9
 pUMB1NcdP8Q/xaSWlWAwsKhAJtlQHc5AziSU3B7YLcd1HEna+BV0En/NjPQCtZ4ZYD
 VjRTkoanJPiUWPSTlMXPOpovqOOnSaAvtNaPj/QJYspUSXpf/t49tFyWtvqj9eeJ9a
 RgB1GP9ZGnziWOBW+Oj8SN3GgIJxSCgv2gBiqwSYTdqupaZ2jOyUClR09a+RWnYgOY
 UjfBwJeJLnv6g==
Message-ID: <9c7ef111-548c-4751-af9f-335563bda263@kernel.org>
Date: Wed, 6 Aug 2025 09:51:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jens Axboe <axboe@kernel.dk>, jaegeuk@kernel.org
References: <20250805061914.3067747-1-chao@kernel.org>
 <587aaee2-8d84-4eb5-9b87-22947abd0752@kernel.dk>
Content-Language: en-US
In-Reply-To: <587aaee2-8d84-4eb5-9b87-22947abd0752@kernel.dk>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/5/25 23:37, Jens Axboe wrote: > On 8/5/25 12:19 AM, Chao
 Yu wrote: >> f2fs doesn't support uncached write yet,
 for write() w/ IOCB_DONTCACHE
 >> flag, let's return -EOPNOTSUPP instead of ignoring [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ujTJY-00048l-4o
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to return -EOPNOTSUPP for
 uncached write
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/5/25 23:37, Jens Axboe wrote:
> On 8/5/25 12:19 AM, Chao Yu wrote:
>> f2fs doesn't support uncached write yet, for write() w/ IOCB_DONTCACHE
>> flag, let's return -EOPNOTSUPP instead of ignoring IOCB_DONTCACHE flag
>> and write w/o uncached IO.
> 
> Didn't we agree that write support should be pursued first before
> bifurcating the read/write DONTCACHE support?

Yeah, no worries, this is just used for test purpose, will drop this once
Qi Han prepare the new patchset supporting dontcache in both read and write
path. :)

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
