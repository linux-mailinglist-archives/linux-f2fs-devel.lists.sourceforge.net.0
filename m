Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E72712F61E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Jan 2020 10:36:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1inJNO-0003Jd-JJ; Fri, 03 Jan 2020 09:36:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1inJNH-0003Hh-6O
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jan 2020 09:36:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LTGKdJoI2oAJPRWI5jBurFxvUSEf+HmdND9zoShw3CI=; b=QIoLd0D7nfNJnuFIqgnYl0iytr
 lRYSLydpH/RhNwMKW7YanmIK594A+T+DpbEhdCSR+n3wecbOYSykBKkIhUes7MRZWe+4UdV+VAosB
 5mQrnKCIOH+h9i6XHyNH0TcYIdL/HJze/6sQF0Up0hI5N+OwE5Frde1rXCBfp1r91as8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LTGKdJoI2oAJPRWI5jBurFxvUSEf+HmdND9zoShw3CI=; b=TLgeSdqVegEz5dNx4VynPq5WI3
 m1BRy8s/iJgQWoGrLygbGS/kNx37+q+2STo8e6HvKQDjxP3lP9T1Q5IAZZ/ykhUWZt7K1dBsZBOF0
 1qvfEDfDlRovUeu9LoaOT3YJUOPhaxatILZW4Z6bQSDPxUntA3gjER55HesNIUD3dHn0=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1inJNF-0088q4-7J
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jan 2020 09:36:07 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 65AE9B42D64CC75FEFE8;
 Fri,  3 Jan 2020 17:35:56 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 3 Jan 2020
 17:35:53 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20191210164715.28281-1-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <d9526a75-3399-2c5f-9e91-1f704ce2af56@huawei.com>
Date: Fri, 3 Jan 2020 17:35:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191210164715.28281-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1inJNF-0088q4-7J
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: do not access nat etnries in ckpt
 before initialization
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

On 2019/12/11 0:47, Jaegeuk Kim wrote:
> ckpt->entries is initialized by fsck_init(), but we tried to access it during
> f2fs_do_mount().
> 
> The call sequence is:
>  - f2fs_do_mount
>   - record_fsync_data
>     - traverse_dnodes
>      - do_record_fsync_data
>       - ADDRS_PER_PAGE
>        - get_node_info
>         - node_info_from_raw_nat(fsck->entries[nid])
>  - do_fsck
>   - fsck_init
>    - build_nat_area_bitmap
>     - fsck->entries = calloc(fsck->nr_nat_entries);
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
