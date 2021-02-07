Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4770D312244
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  7 Feb 2021 08:47:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l8eml-0008HH-3E; Sun, 07 Feb 2021 07:47:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1l8emi-0008Gv-8I
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Feb 2021 07:47:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pUtXQHzoja1kvkOa8BJetqNmNiIoWpulrS3RmbyGpcc=; b=H3LyEZae3+ad1TkKSagRne/Iry
 bvUtPgwNAeQqpqfC63yCN0vWIPCUnFXSLrEWFal79KwAQjbGWP9AIjP8zQETIcJtt9DgYpqp77D48
 HdpNBdgXVNhBwTzUxVMYW6ORzMjEAW55Wxx59wF3X5w5Eb+HZNpfw8pwsNZA5Z9SIbzg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pUtXQHzoja1kvkOa8BJetqNmNiIoWpulrS3RmbyGpcc=; b=RwHAViCh69oL2Wek4jYeQkuSZC
 y2DyD43rl7jOBJkFt7OUElLYZbDxGaETdigLd8FHdqhe64eF3c3J+2VaYJJ4lpivotiL20Eysl1W5
 KsTJ9FyDYWPzIBgH3Jxi9EZlVgOz3bNgr2oFwbdAdwgjXLwPkqi2oyLY08ega59ffFC0=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l8emY-00CtE1-Sx
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Feb 2021 07:47:08 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DYLlz6xqFzlH7w;
 Sun,  7 Feb 2021 15:45:03 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.498.0; Sun, 7 Feb 2021
 15:46:44 +0800
To: Eric Biggers <ebiggers@kernel.org>, <linux-fscrypt@vger.kernel.org>
References: <20210115181819.34732-1-ebiggers@kernel.org>
 <20210115181819.34732-4-ebiggers@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <107cf2f2-a6fe-57c2-d17d-57679d7c612d@huawei.com>
Date: Sun, 7 Feb 2021 15:46:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210115181819.34732-4-ebiggers@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1l8emY-00CtE1-Sx
Subject: Re: [f2fs-dev] [PATCH 3/6] fs-verity: add
 FS_IOC_READ_VERITY_METADATA ioctl
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Victor Hsieh <victorhsieh@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Eric,

On 2021/1/16 2:18, Eric Biggers wrote:
> +static int f2fs_ioc_read_verity_metadata(struct file *filp, unsigned long arg)
> +{
> +	if (!f2fs_sb_has_verity(F2FS_I_SB(file_inode(filp))))
> +		return -EOPNOTSUPP;

One case is after we update kernel image, f2fs module may no longer support
compress algorithm which current file was compressed with, to avoid triggering
IO with empty compress engine (struct f2fs_compress_ops pointer):

It needs to add f2fs_is_compress_backend_ready() check condition here?

Thanks,

> +
> +	return fsverity_ioctl_read_metadata(filp, (const void __user *)arg);
> +}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
