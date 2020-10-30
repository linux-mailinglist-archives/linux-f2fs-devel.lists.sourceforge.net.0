Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4539829FB74
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Oct 2020 03:38:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kYKIp-00035d-2L; Fri, 30 Oct 2020 02:38:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kYKIn-00035W-MC
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Oct 2020 02:38:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:CC:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zrRRUAJFPridZfM/u/ExFQ6aq+bhT4nn1lKI4vxNtqI=; b=OT9A4LJ544tlGfYIx7EeIc8gKk
 B21ML+pszIoke+lAg0zUOtXq3AnFWIsJMQxTxc9mz6hmly5qUjkyIhIzsrTlsms9fWiFmZH4hIB31
 Nm+ZCXyVyTVzR1OHOSz27Lrt714/4Rs2T+FiUaR5wy5PNtjYe5+mYiPpLht+Jp8XMsFA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:CC:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zrRRUAJFPridZfM/u/ExFQ6aq+bhT4nn1lKI4vxNtqI=; b=LazOi8k7o3UKUbEaeKeeKOcyT3
 +Cesr7/fyTZEZFH35aom0T7+T3xjZ+bhcj/QO/mWGKcQ3RQu+nR77M6HciQpkv71RXUTGjrl89HQn
 ACyb7W0so84NlZHd/bMORUgtu6eqjAQz2W5O7AafOjOGQcptna+sCnlJiCavXpO+8C9A=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kYKIh-001vYV-NI
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Oct 2020 02:38:05 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CMmgh63FFzhd3g;
 Fri, 30 Oct 2020 10:37:52 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 30 Oct
 2020 10:37:45 +0800
From: Chao Yu <yuchao0@huawei.com>
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20201029041538.4165209-1-daeho43@gmail.com>
 <861e569d-feae-c521-35b7-dcb8b79cdfba@huawei.com>
Message-ID: <61d43f5d-f26c-525a-6405-bae0ca495c6d@huawei.com>
Date: Fri, 30 Oct 2020 10:37:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <861e569d-feae-c521-35b7-dcb8b79cdfba@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kYKIh-001vYV-NI
Subject: Re: [f2fs-dev] [PATCH v5 1/2] f2fs: add
 F2FS_IOC_GET_COMPRESS_OPTION ioctl
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

On 2020/10/29 15:24, Chao Yu wrote:
> On 2020/10/29 12:15, Daeho Jeong wrote:

>> +	inode_lock(inode);
> 
> It's minor,
> 
> inode_lock_shared()?
> 
>> +
>> +	if (!f2fs_compressed_file(inode)) {
>> +		inode_unlock(inode);
> 
> inode_unlock_shared()?
> 
>> +		return -ENODATA;
>> +	}
>> +
>> +	option.algorithm = F2FS_I(inode)->i_compress_algorithm;
>> +	option.log_cluster_size = F2FS_I(inode)->i_log_cluster_size;
>> +
>> +	inode_unlock(inode);
> 
> ditto.

Any comments?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
