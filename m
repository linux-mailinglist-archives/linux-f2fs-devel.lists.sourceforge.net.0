Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E0C29FAD1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Oct 2020 02:52:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kYJaq-0005LS-Pq; Fri, 30 Oct 2020 01:52:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kYJap-0005KX-EG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Oct 2020 01:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZVkiMhsOX//WuwINyL54KeYhAXh5QNMekjuTJMh1DfE=; b=iyrjKQDxORYCyw1Mk4HYKxK2d9
 CltsJ3zYAOaP9gt8J14W33A2ZXyNmGXUFmcFl32dPPRpz1WglALU1AWTO7IjIcXhDI1ApI3ojd6eq
 StqqfcKFQbTlQ8jRu1K1OX9mp5WSFBy5vpU8ySmnmCpCqKKHik6T2Z4GOdweyy4hf9V0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZVkiMhsOX//WuwINyL54KeYhAXh5QNMekjuTJMh1DfE=; b=CVblRSIKXObC59avmOvD2MHQXv
 diiAS9kSa2hh7NBGzUND71+ALuizxrUnSnf76tONXwW3HJyy20vWmCGRBFpFs297GVbvDTXLExnBD
 27gQQ8nlisjnyKO4oVnxQRxUFxp1BL4O4txWXE9XhiBzq0fpay+dOZdGt6joqhq41PsU=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kYJal-001sOo-0J
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Oct 2020 01:52:39 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CMlg60RdbzLmp9;
 Fri, 30 Oct 2020 09:52:18 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 30 Oct
 2020 09:52:15 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20201029041538.4165209-1-daeho43@gmail.com>
 <20201029041538.4165209-2-daeho43@gmail.com>
 <92f4da8e-27a1-7577-84f9-39038eaa88cb@huawei.com>
 <20201029155453.GB849@sol.localdomain>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <69dfcb36-158c-e524-494c-6c5377a56945@huawei.com>
Date: Fri, 30 Oct 2020 09:52:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201029155453.GB849@sol.localdomain>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kYJal-001sOo-0J
Subject: Re: [f2fs-dev] [PATCH v5 2/2] f2fs: add
 F2FS_IOC_SET_COMPRESS_OPTION ioctl
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/10/29 23:54, Eric Biggers wrote:
> Note that my intent with recommending ENOPKG was for it to be returned in the
> !f2fs_cops[algorithm] case, similar to how opening an encrypted file when the
> encryption algorithm is recognized but not supported by the kernel returns
> ENOPKG.  For a truly unrecognized algorithm (algorithm >= COMPRESS_MAX), EINVAL
> would probably be more appropriate.  So if !f2fs_cops[algorithm] is now allowed,
> then ENOPKG should no longer be among the error codes this ioctl returns.

Agreed.

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
