Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3263B9385
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jul 2021 16:42:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lyxt7-0005e7-Ux; Thu, 01 Jul 2021 14:41:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lyxt6-0005bV-Ic
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Jul 2021 14:41:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sp7mzO1FAEYMYGTtCMj4FNG6AcC0QoG15D2FuvcLVyE=; b=ARUDQ3zu+QW3t+/u8Ph6E/Vmiu
 reFfrdKC8szi5UuVfoQJi2hpPEUq6tYyK2eDFqvhuBM6hISg660XkvIx/d8aLItsmZCSWX80VQbvi
 g0Cg9gRVRXLghI/q5SemOoLUvcVSrabYUy0M0fQTl41PMbUc14KUtbHQfj4kDl3pbLsY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Sp7mzO1FAEYMYGTtCMj4FNG6AcC0QoG15D2FuvcLVyE=; b=ZWqKFmfnoKkEjQ1lUS6sr37Ful
 wEQ+X5i5SmyAplQhA2XbRMZrY+o/tuiWb2k+DVOIBjlQW6bxxmOEUzAbqkG6s+xmAczTQgN9M9rNo
 DAcFKOeq1vpUHl2x2cNGQS6clbjnYu4vd3aO8/6IkN1LrlZ26Ogkj/9rMeBMGFIp2RJY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lyxsp-00062x-7X
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Jul 2021 14:41:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0B8361414;
 Thu,  1 Jul 2021 14:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625150493;
 bh=N9LvBZmSN+Wmht/RZU9ESnqNi4gD3FpdAoKEyaqLOi0=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=JVAmUqApWYaNKcGwOsOlGbsNHOjHvNQHASi6mfeCdcYt4U81Jr5RUPu5JqHVC91DA
 RBqxbaO8QQ9sFeisGOOE0lH7pc7w3ilXTSuABLlxmkOOr+mHCW7EH+BTdsVAWPylhx
 lG8To1/ai11YS8q/l0Dtya5+WxhOIvUr/tfnx2vY1crNSRNXwCwzdcUZ7Y3a6yhfaz
 xG8hm7dueRkjgokgmMFRQXlx9JHDRGeIvpOffRL7yl1wbVoJiwCidNyMSu4/SKzKhe
 vAIc3PkhH/v0NvQMFkynNsq10Ks6uRUhNLb9Aox0ufehnaE4F3AmAZJVuNDGRQQ5kn
 kVtTP+95S7uaA==
To: Sun Ke <sunke32@huawei.com>, fstests@vger.kernel.org
References: <20210630113736.551843-1-sunke32@huawei.com>
 <20210630113736.551843-4-sunke32@huawei.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <acb98dad-931a-12b3-37f7-6ef57f4ec38e@kernel.org>
Date: Thu, 1 Jul 2021 22:41:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630113736.551843-4-sunke32@huawei.com>
Content-Language: en-US
X-Spam-Score: -0.5 (/)
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
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lyxsp-00062x-7X
Subject: Re: [f2fs-dev] [PATCH v3 3/3] generic/260: f2fs is also special
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
Cc: guan@eryu.me, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/6/30 19:37, Sun Ke wrote:
> It fail on f2fs:
> 
>   [+] Default length with start set (should succeed)
>   [+] Length beyond the end of fs (should succeed)
>   [+] Length beyond the end of fs with start set (should succeed)
> +After the full fs discard 0 bytes were discarded however the file system is 12882804736 bytes long.
> +It seems that fs logic handling len argument overflows
> 
> The root cause is f2fs can tag a special flag TRIMMED_FLAG to indicate
> the whole filesystem is trimmed, so after mkfs/fstrim(), following
> fstrim() won't trim any block.
> 
> Suggested-by: Chao Yu <yuchao0@huawei.com>
> Signed-off-by: Sun Ke <sunke32@huawei.com>
> ---

Reviewed-by: Chao Yu <chao@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
