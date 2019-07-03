Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AB15DB3F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Jul 2019 03:58:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hiUXg-0007sj-G7; Wed, 03 Jul 2019 01:58:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hiUXf-0007sY-Gq
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Jul 2019 01:58:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LLE3BiFK4ZEjSis3SpBEMKibq3BbsL8HssiVZ3+iV7M=; b=dBKyuVe+mxnRnynS5yuUyEt3kY
 6N806CxtZ7UU9GMK1XhPNF1S+GjKu8rY2sJMvFcgycvlPF7Q+SRWrw6fHIt1lS152h6DPC/4NefZm
 rz+KK8mSPISrmnJYARrU8RgFvryKNkTCmGzdBY7xTzvogeXp5QYRMB54cmWkE7OWAP3A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LLE3BiFK4ZEjSis3SpBEMKibq3BbsL8HssiVZ3+iV7M=; b=XNeWb99VJO48LQwo9M9bfoEi9u
 lG+FVjAMoOg4UTzyOLJZn7g/tWdpyqKFCNjuQOy8b0yTj/+94ChLBW7zqzwuLTUZLCibo42550et+
 12o13zhXDVANFau4u6Ms+WiX/eBIzL8xJfVOEO4HFM4ga2F7O8/RgyEJF0FIxgxZv6nI=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hiUXl-003XLy-Fc
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Jul 2019 01:58:46 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A5D847DF120CA430255B;
 Wed,  3 Jul 2019 09:58:37 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 3 Jul 2019
 09:58:36 +0800
To: Eric Biggers <ebiggers@kernel.org>, "Darrick J . Wong"
 <darrick.wong@oracle.com>
References: <20190701202630.43776-1-ebiggers@kernel.org>
 <20190701202630.43776-4-ebiggers@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <94c2e0c6-c5cf-6f9c-eb24-7f347727d51d@huawei.com>
Date: Wed, 3 Jul 2019 09:58:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190701202630.43776-4-ebiggers@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hiUXl-003XLy-Fc
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: remove redundant check from
 f2fs_setflags_common()
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
Cc: linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/7/2 4:26, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Now that f2fs_ioc_setflags() and f2fs_ioc_fssetxattr() call the VFS
> helper functions which check for permission to change the immutable and
> append-only flags, it's no longer needed to do this check in
> f2fs_setflags_common() too.  So remove it.
> 
> This is based on a patch from Darrick Wong, but reworked to apply after
> commit 360985573b55 ("f2fs: separate f2fs i_flags from fs_flags and ext4
> i_flags").
> 
> Originally-from: Darrick J. Wong <darrick.wong@oracle.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
