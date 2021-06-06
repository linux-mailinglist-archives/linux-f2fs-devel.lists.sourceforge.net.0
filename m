Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8899E39D2AB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Jun 2021 03:41:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lq4Gy-0003bF-4c; Mon, 07 Jun 2021 01:41:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lq4Gv-0003ax-VC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 01:41:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wxS1f8EhkoJeukCMkLB8cQo9jOSFKVRJH/P0VYubRF0=; b=blO1GRACX4OHbtQGAK3QpIvNsj
 zAE/krVgL4DgFaX49Mdgm+d0nlZQy02gY0qLwNpJTdpRMD4MGInnDNkagrImZDgFpBQBDoLY60uEA
 ehuu2lQ8LxZtveF65nCKa6Lbid4h2MSdoOBNDjXEt+WyMNuoveG1w/dFD/R0tVeMo7Qw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wxS1f8EhkoJeukCMkLB8cQo9jOSFKVRJH/P0VYubRF0=; b=fnx5drn4pqnO9i8VxcEC+Wgvpe
 3/5TT5jARdsj7GJcLTeLHbFhGLKvHAFUeewwzNcxWbAC5+SLSImLF0s8FB3otYyYQDpzqwijgxxA7
 cYReEflVBDl+KOPGwvyJGoeQzXo1qpihwudrhTQeAIRVyAdxP51DWL8hfNUCTCct/5n8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lq4Go-00BgVY-K7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 01:41:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 38A4C613F3;
 Sun,  6 Jun 2021 13:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622987671;
 bh=SFH/ZCMR4TXuRhQ7dpyXWBOyuppcon3cXoh5Kx6b3Oc=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=d1Ybjgd/DV9ghgZHX7S4bxA/XA4Vfo4k3/3C5NQ1UHyDZcQ5fY/CJIJXataAYs2tW
 ldPH2z59Wfvh6xEhfnSQl5g7FAmN2xL4wPYa/xKKMfS0lZARx5XsAAYhtte5GmW5qn
 7i2Vlo85f/Myu+62AoPhy5TlZ85y7WEUWrH8o8ojKYRtaME7DfJs70Cz1+Gs9wXPOq
 9w/tKuPxCnRukFhI02QTOyPLS0ZdWkcxB7pkbNqyDUrDqjyqSeDrdtlv8qdz5NJctN
 jMY5sLb6BZ9aqzGBcoo3ved7r3eGDnswwAw7b5pasJpf03obeUnfSZco0QYV5BOhtv
 ZO2KC5k84E0KA==
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20210525205138.2512855-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <17318ac1-19e7-dfed-35f8-65a8e325fc61@kernel.org>
Date: Sun, 6 Jun 2021 21:54:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210525205138.2512855-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lq4Go-00BgVY-K7
Subject: Re: [f2fs-dev] [PATCH] sload.f2fs: use F2FS_COMPRESS_RELEASED
 instead of IMMUTABLE bit
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/5/26 4:51, Jaegeuk Kim wrote:
> Let's use F2FS_COMPRESS_RELEASED to disallow writes only.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
