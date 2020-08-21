Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A1D24C992
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Aug 2020 03:37:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k8vzw-0003hl-H0; Fri, 21 Aug 2020 01:37:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k8vzu-0003hd-S6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Aug 2020 01:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UVwm9Xlt022Y2IC/bNGgy+xn39IgTZy+/vFNyeAQKWQ=; b=AEURVSZirHHiWYSuH58S2Lag3v
 4RRSoOrOHAQbTTZdOcVTYWGVivr9UflB9wx2Zbfk3a0SDd+4iSla7wxRQZowUtUcn5jbfwRjZ4Uki
 kBDoT3tDNBHuSJU0tNgMaHJkyylHpx7YZVeKWgMdLzSJp86ChftnKyVBdYn/9c4UH/MI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UVwm9Xlt022Y2IC/bNGgy+xn39IgTZy+/vFNyeAQKWQ=; b=lUmgfQnpSvcqxbmIhU5o34JwAz
 xaMlYa0Sd5hmxjz0zPRH1Ze8s0dZmd2TC8ScM6LzQkj8hTnnPi1UUpO79F3bc1wqW2pg/tZS4EkLC
 oLGZWhrz/8iaqFXPBLaXN3NHnYeQAXEYNH5Inoe5G4JOMw3o1Xc8ghXMWXPFILdvx/u0=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k8vzs-00E2NR-Jd
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Aug 2020 01:37:38 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 1D640FABB2D3D12F11C1;
 Fri, 21 Aug 2020 09:37:25 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 21 Aug
 2020 09:37:20 +0800
To: Gabriel Krisman Bertazi <krisman@collabora.com>,
 <viro@zeniv.linux.org.uk>, <jaegeuk@kernel.org>, <chao@kernel.org>
References: <20200819200731.2972195-1-krisman@collabora.com>
 <20200819200731.2972195-3-krisman@collabora.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <1c036ee5-a864-f50d-d439-e2d520e18b32@huawei.com>
Date: Fri, 21 Aug 2020 09:37:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200819200731.2972195-3-krisman@collabora.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.4 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k8vzs-00E2NR-Jd
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: Return EOF on unaligned end of
 file DIO read
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
Cc: linux-fsdevel@vger.kernel.org, kernel@collabora.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/8/20 4:07, Gabriel Krisman Bertazi wrote:
> Reading past end of file returns EOF for aligned reads but -EINVAL for
> unaligned reads on f2fs.  While documentation is not strict about this
> corner case, most filesystem returns EOF on this case, like iomap
> filesystems.  This patch consolidates the behavior for f2fs, by making
> it return EOF(0).
> 
> it can be verified by a read loop on a file that does a partial read
> before EOF (A file that doesn't end at an aligned address).  The
> following code fails on an unaligned file on f2fs, but not on
> btrfs, ext4, and xfs.
> 
>    while (done < total) {
>      ssize_t delta = pread(fd, buf + done, total - done, off + done);
>      if (!delta)
>        break;
>      ...
>    }
> 
> It is arguable whether filesystems should actually return EOF or
> -EINVAL, but since iomap filesystems support it, and so does the
> original DIO code, it seems reasonable to consolidate on that.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
