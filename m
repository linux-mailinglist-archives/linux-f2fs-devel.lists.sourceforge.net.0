Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0002FF9A1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jan 2021 01:56:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l2kkn-00059H-D1; Fri, 22 Jan 2021 00:56:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1l2kkX-00058n-38
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jan 2021 00:56:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LRDNzE+82OO2sTyfJ6CwAEC8BYZZ/svQHXvPoJJUQys=; b=b6KbE9YFgYZiXWwQ2gMVL2RjFK
 EPUSGwRbm62ZbjIamXIuD02XsprBNWg0DA3YaccvcFsdf/XJNQgbYLfzz3gpXNkvAKRLzV5uTav/A
 Mg9WSkRHMQka60wmxX2e+6ZJcAChVz3Q7R55hG8dO373ZSC/pmPQraREcTKJVL03d/Yw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LRDNzE+82OO2sTyfJ6CwAEC8BYZZ/svQHXvPoJJUQys=; b=PdYZxmlS7NM25pQC9fPqMW8nnF
 zEMUs/5WgUtUNNPG1dYNK/5AnSs7ywwaE4Ehp++Fx9279ty4kx4VE5twxWBo9Eq/hipIS5+LDLqEC
 qndRA4gQPT3gsYZRH/k8Yff6EZeQ6hoOZzsYVwlDW55tp8zyq+ma7w3Z18NTVj1JDvsY=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l2kkN-006on8-HG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jan 2021 00:56:29 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DMLQC1T2Fz15x8C;
 Fri, 22 Jan 2021 08:54:59 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 22 Jan
 2021 08:56:02 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20210121134529.1201249-1-daeho43@gmail.com>
 <20210121134529.1201249-2-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <2e97b330-3e8d-d876-e060-e44123f27f2c@huawei.com>
Date: Fri, 22 Jan 2021 08:56:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210121134529.1201249-2-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1l2kkN-006on8-HG
Subject: Re: [f2fs-dev] [PATCH v5 2/2] f2fs: add ckpt_thread_ioprio sysfs
 node
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

On 2021/1/21 21:45, Daeho Jeong wrote:
> From: Daeho Jeong<daehojeong@google.com>
> 
> Added "ckpt_thread_ioprio" sysfs node to give a way to change checkpoint
> merge daemon's io priority. Its default value is "be,3", which means
> "BE" I/O class and I/O priority "3". We can select the class between "rt"
> and "be", and set the I/O priority within valid range of it.
> "," delimiter is necessary in between I/O class and priority number.
> 
> Signed-off-by: Daeho Jeong<daehojeong@google.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
