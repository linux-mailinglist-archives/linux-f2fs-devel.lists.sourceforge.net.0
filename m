Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A45D8FB68
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2019 08:50:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hyW4H-0007Aq-Vf; Fri, 16 Aug 2019 06:50:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hyW4G-0007AY-Gg
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 06:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+5yEDftGYr2jWWbGHOPw5LQTnQc2dYQMCZDnV+4JBvM=; b=CCuHFib4FPUVqLc+HGFH2ePbk2
 qZHi4lVGNFyNrrHl1jNqq//TS8CaMf3cHNywUZbOtcJ8wR1T8gOXi8ugQKlfL5cp+bk2Msge6q+aA
 WliuV4tLo70wko9qz2lOmbjf30Hct7eROrDQ4+4v/35CGc1M9X9/XR7ARgV6/H6k5Vac=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+5yEDftGYr2jWWbGHOPw5LQTnQc2dYQMCZDnV+4JBvM=; b=YtrutQ7U8MFEVmdK+aQ5JfjMMI
 eX6kC6RfY4dkgp1DOohYnBgA5rJYKPUHiBMjQFaYsp7mSp4vDtXzFgSGyXNBwfULPVrADfFHYUGl9
 1uAxafMMI9KfuUqb1Zh2ZJaMTxayNR0nY/KqH4FTjJ2/FJnlEAPr5cBlB7kF3OVbzVkI=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hyW40-00803C-QZ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 06:50:32 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E8FE46B83525FEA5EA62;
 Fri, 16 Aug 2019 14:50:02 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 16 Aug
 2019 14:49:59 +0800
To: Eric Biggers <ebiggers@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20190816055539.30420-1-ebiggers@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <faefae52-3c06-46b1-8be9-3774a98a212b@huawei.com>
Date: Fri, 16 Aug 2019 14:49:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190816055539.30420-1-ebiggers@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1hyW40-00803C-QZ
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric, thanks for all the fixes.

Thanks,

On 2019/8/16 13:55, Eric Biggers wrote:
> Fix some bugs in the f2fs implementation of the FS_IOC_GETFSLABEL and
> FS_IOC_SETFSLABEL ioctls.
> 
> Eric Biggers (3):
>   f2fs: fix buffer overruns in FS_IOC_{GET,SET}FSLABEL
>   f2fs: fix copying too many bytes in FS_IOC_SETFSLABEL
>   f2fs: add missing authorization check in FS_IOC_SETFSLABEL
> 
>  fs/f2fs/file.c | 27 +++++++++------------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
