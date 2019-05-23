Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E4827F2B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2019 16:10:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hToQo-0008Ek-3h; Thu, 23 May 2019 14:10:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hToQm-0008Ed-MV
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 14:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UBlQz4x/mGo02LPHHE6rtlz7Icu90oONWHdg34HXFTs=; b=G0RSYoy5SSp9zcCInUajyBEABx
 6grMcfdM9n0VXLZdtux+tI29vTh27mGZTtQAU0bnxJdPP9eYV+QnhwhFre9IU+rGhjRUR5XaFWkyW
 9kTKg/JaoEu3G5uIzyaeuwHEDo8OVj39JGI6kg9lIiVm502sGSEUqdqVpyH0Y4Awgtdg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UBlQz4x/mGo02LPHHE6rtlz7Icu90oONWHdg34HXFTs=; b=lv7D97CXF5mR1cvX3QuYuu3aHu
 geLrhSjZgSygjASTU6qHHrg7IyZQRaLmnaL/c3zvdDactAhrZC0+LYneEUhX4TIQzJ7aD49Ws4KSN
 oBRy1x2K/3UsMomXkEQcbhdNKFSVcu73lURHEJfas15Jnob/p83Mv9SrCebvCqxwnDKM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hToQl-002nHL-JS
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 14:10:52 +0000
Received: from [192.168.0.101] (unknown [58.212.135.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C363D20863;
 Thu, 23 May 2019 14:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558620646;
 bh=ixcR9Su/eu4otNZ6XNrctjmhMzNPMpeugwcE4xUd+bM=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=MK67SX6VFt7kN3ccBoJu2fNVUr2YikNmr5b4NvhXX6xNvqQ2ZutBr1QTYOh2tJTmM
 9nEwNV9R4FGXR+2iNDTB6ufM+XlcWRMj9uEyRljSTBy6+WtCMB8fcYM6KIMK0XK4Kt
 K0suaOybcub6c/Hl8ThEZ/BU66yAYv/UPzZzo/pg=
To: Sahitya Tummala <stummala@codeaurora.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <1558586627-19784-1-git-send-email-stummala@codeaurora.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <0608274b-b532-0210-098f-cb59f815c3cd@kernel.org>
Date: Thu, 23 May 2019 22:10:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1558586627-19784-1-git-send-email-stummala@codeaurora.org>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hToQl-002nHL-JS
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: Fix up nat journal corruption
 with -a (auto-fix) option
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

On 2019-5-23 12:43, Sahitya Tummala wrote:
> Build segment manager and node manager always to catch and auto-fix
> invalid NAT entries found in the NAT journal.
> 
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
