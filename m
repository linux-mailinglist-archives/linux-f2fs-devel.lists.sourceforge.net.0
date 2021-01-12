Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8B82F28D3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Jan 2021 08:19:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kzDxq-00064t-Pj; Tue, 12 Jan 2021 07:19:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kzDxp-00064m-Se
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jan 2021 07:19:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tPUOp5cNbvOoqzNpWwA1N4uqKLzNDXYrswRK3PWcW9s=; b=IuYWCMnIami9fvD37GrALkGfkU
 4dO7RrbQQtzlsvK58C0l1JNmL58K1ouM5rk8ZBmBAKxKia5jDz2vGbQNp0YnY5P2KdNfCAexIdfev
 rwRmEVx3KFJaszCW1+93KqG//gYEDA/JNeezAlrPlPjVUrKUt5gC00bK+N+MrSVdlGBE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tPUOp5cNbvOoqzNpWwA1N4uqKLzNDXYrswRK3PWcW9s=; b=gnz2jIHC3LmiwJzQr0IeJvHozL
 EZP6JfnH3fadtcv1f2UEe60sZa7gk6flPNaRjrVFswEV8OOHl+FOYvqJxYmntKc1Lh/d+G9f7nbi4
 VA695JiB8jIaAPsgmA3+pwtHFNpB3IqYx1JB+05olQH5TQ2uBFkQrx6ZvZgbgaTHJLN8=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kzDxd-00BrTH-Ib
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jan 2021 07:19:37 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DFMNX1ZcGzl448;
 Tue, 12 Jan 2021 15:17:48 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 12 Jan
 2021 15:19:00 +0800
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20210112063930.20525-1-lukas.bulwahn@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4d28715d-74ed-2ca2-ae4c-d5e88731e5c6@huawei.com>
Date: Tue, 12 Jan 2021 15:18:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210112063930.20525-1-lukas.bulwahn@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kzDxd-00BrTH-Ib
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: docs: rectify the table header
 in sysfs-fs-f2fs
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/1/12 14:39, Lukas Bulwahn wrote:
> Commit 969945899a35 ("f2fs: introduce sb_status sysfs node") documents the
> sb_status values in a table in ./Documentation/ABI/testing/sysfs-fs-f2fs,
> but the table header of the first column has a wrong length.
Thanks for fixing this, however original patch was still in dev branch of
f2fs, so I prefer to fix original patch rather than adding a new fixing patch.

Would you mind merging this into original patch?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
