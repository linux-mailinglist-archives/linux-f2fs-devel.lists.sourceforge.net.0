Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3718E2571EE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Aug 2020 04:49:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kCZsi-0001g4-2M; Mon, 31 Aug 2020 02:49:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kCZsh-0001fq-7d
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 31 Aug 2020 02:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x/G5G61O5KnR4pAoDBsGpMNezwPc96XAcT92F+Cqc3Y=; b=m3fQKcvIguZxbmVVFJWAcMYzZ0
 PZNAOBG8Prem4htiIHdPZnyCkfVD++jVyf9QXc+heJFzixeIbq6ot/+/ix2pFR1mSoeoKGNIbv0Nk
 ZY5wHAlwjgyD4qD9dOTAdJGIUrzKxeuAx1er9AeMMOiRl4SziuMwkAEG+DeCLcCfr5vo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x/G5G61O5KnR4pAoDBsGpMNezwPc96XAcT92F+Cqc3Y=; b=A+sAGRVt3Cyj3hwIQ0urNhfz7f
 xBUmqvCKnGjsT9iWvH/43RvIgccoh1Xn6LZ2Uc4cpa7wJC7OJr3SVL8BCdG73XS1WfdVkDIklwliJ
 WhLT3QJUYcnKN/BJ+UCyx1gYA5ZjAAocrGk6vvpppSfE/gnp4z/KzLfWaY1o5dncwUhU=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kCZsc-00AJxT-Gj
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 31 Aug 2020 02:49:15 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3C392904D3B68F91D429;
 Mon, 31 Aug 2020 10:48:59 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 31 Aug
 2020 10:48:53 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20200831020949.3218854-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <77e4d1c5-daad-5337-f71d-6975df89d796@huawei.com>
Date: Mon, 31 Aug 2020 10:48:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200831020949.3218854-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1kCZsc-00AJxT-Gj
Subject: Re: [f2fs-dev] [PATCH] f2fs: change compr_blocks of superblock info
 to 64bit
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

On 2020/8/31 10:09, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Current compr_blocks of superblock info is not 64bit value. We are
> accumulating each i_compr_blocks count of inodes to this value and
> those are 64bit values. So, need to change this to 64bit value.

It's not a big deal, as f2fs use 32bits to index block device's address space,
so there is at most 1 << 32 blocks in f2fs, we can not save more blocks than
the number...

If it overflows 32bits variable's space, it must be a bug.

> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
