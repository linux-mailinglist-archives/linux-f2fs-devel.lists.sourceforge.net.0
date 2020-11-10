Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FC82ADFFF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Nov 2020 20:44:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kcZZG-0003vC-Go; Tue, 10 Nov 2020 19:44:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kcZZF-0003ul-6Q
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Nov 2020 19:44:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0eCu126V8XAtkUgKu9Pm9beJMz9E3ENBO3RApqCTwzQ=; b=eDTU+U3OjfmixSmTuwWl48GPxg
 z38ie+NCYMxXHjyx8pGbRRStPS1pPAIqdxkVGibv/WNtplEJX2qPw8qiUKziSQwj9C4FuHM1PzVYV
 bNR51pogkHC4+XWmQhnhsRhc20LdrF8K75NIonH8/tMRNQETvEwNWJ4X3YHfVH9Qz29o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0eCu126V8XAtkUgKu9Pm9beJMz9E3ENBO3RApqCTwzQ=; b=K+UmiDDlQIOZgLAZLPkpzgQLjg
 DNt32eVEItikkolPGkwYZoseboPyQjia2pkCZjXvolt1gIZ0FuO5/iFbIS+18x6v42Wl3kmvcBME/
 j6jYQr75Bh18pDgagkKDYuTR/tiGzQRxDgkE8gQoryI9rcgjfhQz+0cIfWZLEflrlJS4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kcZZ0-00Fu1y-Ki
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Nov 2020 19:44:36 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1A0A820825;
 Tue, 10 Nov 2020 19:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605037445;
 bh=seNybUnu/z66DWRDuPPyP69NxwKQVHVpyPN9eY37It0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uwK0m1ZDOh/aPdTFbY070MiBo5SLzbYd7MQgBz8ixdmUB7b+s36x4PTxPMZD0iU1S
 nNPoHgdqo8I50QP6lVW0P1OtiJWF5OTsXB86jXPPEVLEVVAkG8FVPUNETH2WZmHl6t
 O4vOkUwtMbKDwOeA2muP/zuVeDjJpkuPol1Bbu1g=
Date: Tue, 10 Nov 2020 11:44:03 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X6rtgy5Xl7OtrSWE@sol.localdomain>
References: <20201110012437.26482-1-yuchao0@huawei.com>
 <20201110012437.26482-2-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110012437.26482-2-yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kcZZ0-00Fu1y-Ki
Subject: Re: [f2fs-dev] [PATCH v5 2/2] f2fs: fix compat F2FS_IOC_{MOVE,
 GARBAGE_COLLECT}_RANGE
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 10, 2020 at 09:24:37AM +0800, Chao Yu wrote:
> Eric reported a ioctl bug in below link:
> 
> https://lore.kernel.org/linux-f2fs-devel/20201103032234.GB2875@sol.localdomain/
> 
> That said, on some 32-bit architectures, u64 has only 32-bit alignment,
> notably i386 and x86_32, so that size of struct f2fs_gc_range compiled
> in x86_32 is 20 bytes, however the size in x86_64 is 24 bytes, binary
> compiled in x86_32 can not call F2FS_IOC_GARBAGE_COLLECT_RANGE successfully
> due to mismatched value of ioctl command in between binary and f2fs
> module, similarly, F2FS_IOC_MOVE_RANGE will fail too.
> 
> In this patch we introduce two ioctls for compatibility of above special
> 32-bit binary:
> - F2FS_IOC32_GARBAGE_COLLECT_RANGE
> - F2FS_IOC32_MOVE_RANGE
> 
> Reported-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Chao Yu <yuchao0@huawei.com>

Reviewed-by: Eric Biggers <ebiggers@google.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
