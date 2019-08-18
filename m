Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE66E91785
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 18 Aug 2019 17:43:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hzNKe-0005mw-EZ; Sun, 18 Aug 2019 15:43:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hzNKc-0005mh-RD
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 18 Aug 2019 15:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TjVPSZ12mBf25YAwvA8/vajrPQ8KUwqfYAtEIbWo1nY=; b=J2V3pnYOUo6FzJvvLm5yK3JEqZ
 54S7QXXUe05+ej6Vs1HC23enifgv/fdMj6YSMEgAblUp32U6BZi0vxj1IUZP51WsSzYuD0sn1Uflc
 khwYAlehPWTD0kn45qT9o2g/sL7sZn/iXlAE16/EiI/Jk1xk+TLBP4r4zKtTEA+qkiNc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TjVPSZ12mBf25YAwvA8/vajrPQ8KUwqfYAtEIbWo1nY=; b=dQDHS/1hMV0rutR6kSYGBeePfx
 zDOywFp8bpuzalx1h74c+yGKhO58KOOBgcunOSVv8Et8o0leU3CuqLhMv9o3ulVuVG8ygZF2Qj1sb
 T96YBWOX8Gsgwvf+5e3r4dy3XxUwzmX4+q1mykLYwq707nj5yKebncPJiGzoSfU/djIs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hzNKb-007rTb-Rr
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 18 Aug 2019 15:42:58 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2FFF5206DF;
 Sun, 18 Aug 2019 15:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566142972;
 bh=12rI1TNx6Y2qilOwuz6R9N95nHRaKPGPwYW0VznW0Ts=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=idX0HNz5upAQWmnCou8S0BnjkQWcByibS9Z335Lk7m//innetVGN+H9IZNyDzDoyI
 5qFqX1kWsPwllZRQl62YdgPlVml/7nBPJsEiLjUTlXvQOdIGXgXEXD/nVrDt4Yg7VX
 KYxb5yXF9bATsk4qsii/K1VawahUsbQz/wtGy9wQ=
Date: Sun, 18 Aug 2019 08:42:50 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <20190818154250.GB1118@sol.localdomain>
Mail-Followup-To: Chao Yu <chao@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20190816055539.30420-1-ebiggers@kernel.org>
 <faefae52-3c06-46b1-8be9-3774a98a212b@huawei.com>
 <26511603-db36-f614-3066-0fcd3f5af483@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26511603-db36-f614-3066-0fcd3f5af483@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hzNKb-007rTb-Rr
Subject: Re: [f2fs-dev] [PATCH 0/3] f2fs: fixes for FS_IOC_{GET,SET}FSLABEL
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Aug 18, 2019 at 09:03:21PM +0800, Chao Yu wrote:
> Hi Eric,
> 
> Do you mind folding these fixes into original patch as it's still in dev branch?
> 
> BTW, any comment or suggestion is welcome in my original patch.... :)
> 
> Thanks,
> 

I'm fine with the patches being folded in.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
