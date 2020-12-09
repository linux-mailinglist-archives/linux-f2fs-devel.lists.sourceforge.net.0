Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD0C2D3BA1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Dec 2020 07:46:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmtEf-0005t7-3N; Wed, 09 Dec 2020 06:46:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kmtEd-0005sz-92
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 06:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xUPXBTnxuo3q8J+ZcEG+dOJDhWNwJbf56LwZL36zX/E=; b=YBuXlSRCM7AyqHUuFOlFPQR6+L
 2zo+ABrWyUmYP8vTy+QNPfFCfjF7TUJN4Tt90t27ePkb9U+XdF+iTgZmCVFh80T6idhH3s1ZBJoak
 7AABIqCwHGv25ygtqscNDHbYd5SL5xHVvoewbBFt1q5izUgrQCeR6A5/q6y0jUB2gqYI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xUPXBTnxuo3q8J+ZcEG+dOJDhWNwJbf56LwZL36zX/E=; b=IPhoYshrD2wSBHBc/TlbJbQqZ2
 WiUe3z1X38QGGw+voAgSIZC22L0GXSNn6zDz75AX8hAcAV8oYyxJPRPwvqH6mzoDFGEw/IKyfoKif
 zYrW8oN+C6Z0FbDcc9tFyTwrMTcXbyMqspIWn8hrQ9jdERb6n53rzPXf5f3HprKsMjI4=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmtEW-004av7-8R
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 06:45:59 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CrSGb721gzhp59;
 Wed,  9 Dec 2020 14:45:11 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 9 Dec 2020
 14:45:42 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20201203065615.402494-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <86651979-2c6a-59de-a03d-9c0437703de5@huawei.com>
Date: Wed, 9 Dec 2020 14:45:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201203065615.402494-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kmtEW-004av7-8R
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add F2FS_IOC_DECOMPRESS_FILE and
 F2FS_IOC_COMPRESS_FILE
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/3 14:56, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> +	f2fs_balance_fs(F2FS_I_SB(inode), true);

Trivial cleanup:

f2fs_balance_fs(sbi, true);

> +	f2fs_balance_fs(F2FS_I_SB(inode), true);

Ditto,

Jaegeuk could fix this directly?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
