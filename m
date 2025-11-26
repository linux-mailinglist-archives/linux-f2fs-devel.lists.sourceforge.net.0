Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A49C88F65
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Nov 2025 10:31:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2qGwGEnq9/PFOGuQ2YYZQJfN7xbaePYoG//fJUmysc=; b=bHwl4enR4gsS4sGLl2z7cQQPJX
	vIRqt5JlU0kbWG/NwzlTx7Iici5R0Rvo/Zx53qC9FAcn+1b7qQysVo/vHU0q8GRO3jh8cPTprG8gP
	t68uxuz9gd9fNWixL434omberJt/QSxa00hSetqMAKk+E5M7U9ADiAT7NstSTvbe4f7A=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vOBri-0007g5-S1;
	Wed, 26 Nov 2025 09:31:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1vOBrc-0007fs-6o
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 09:31:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JBejsC+JPhSGeQtZPmZRWV9tCCyalitmA1XjJ7nCkss=; b=Wu9KJUKG+LhCWudllq+78A4Rmn
 9iEmzxeQtv+yU9sOHToFWS08YdDy5NoUHMK48Yb4/lHoWJKmPzYKqyUIGzYwjYFXsCjiZsQSTP2wJ
 TUcHzB2pekv0eXM4nTe+wvCZswsxo3vXQ4Nyl/SZOui6Jj3OFCUiJuIj/PODuK1iSSvE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JBejsC+JPhSGeQtZPmZRWV9tCCyalitmA1XjJ7nCkss=; b=h+E74P0NmxO0Vl/tfiSoF4wXga
 25qESnR0vdvMYlOLgETlpWblgesxtOB3fS9nwyM2flpTFvnjtg424YeyMmBd8QTa0HyaYGNxAnVnG
 RdpKo/7B1npIhlzLMfC8Z1DP9s9V8+DDsvgliukYoAEkUX8zlhKHG6XMl2G4/9+IPrNw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vOBrb-00024A-JY for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 09:31:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EA95D6016D;
 Wed, 26 Nov 2025 09:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F28C113D0;
 Wed, 26 Nov 2025 09:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764149452;
 bh=rvAFQp/faQsWmqG5lWB+/qsMqMuI5z5YHmDfU6uEkF8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tfamtFo1RaMpb1YTFVTdd+c4JdiuPUAKmY22K0Bh+XtC7jGR9e5K/FItW6P+de8Ca
 2xrkw4O2ZmB39hfCmDLis+XMDtlSIKs9cGW8mk7RZLGTUy7GLCEL+7D5hrzbRamwaJ
 T8+zsGzGW/+Sxg/LKtfoH6Mk5wSQcRfPYhLoo2KcxiLn3iPqZJ0apjkthqfGtVBW+y
 UeY1uy/gVK+RcmZraH3A8sERKIi5Y7XKc4qj2I2yHfDGa17BbRWh/Z607juBkN8MZC
 UivIL3OEC4ViCjB1l0qBIeKQUheEiGzY15J7HRY8FCx1iv2/aoIW3iOwpkZG3tDWJx
 hbjU2ly4jHJsQ==
Message-ID: <7cec7231-33f7-44ec-b82e-f12fba15392f@kernel.org>
Date: Wed, 26 Nov 2025 18:26:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wilfred Mallawa <wilfred.opensource@gmail.com>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, axboe@kernel.dk,
 agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com, song@kernel.org,
 yukuai@fnnas.com, hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
 jaegeuk@kernel.org, chao@kernel.org, cem@kernel.org
References: <20251124025737.203571-1-ckulkarnilinux@gmail.com>
 <20251124025737.203571-3-ckulkarnilinux@gmail.com>
 <2f356d3564524c8c8b314ca759ec9cb07659d42a.camel@gmail.com>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <2f356d3564524c8c8b314ca759ec9cb07659d42a.camel@gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/26/25 8:41 AM, Wilfred Mallawa wrote: > On Sun,
 2025-11-23
 at 18:57 -0800, Chaitanya Kulkarni wrote: >> __blkdev_issue_discard() always
 returns 0, making all error checking >> at call sites dead [...] 
 Content analysis details:   (-0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vOBrb-00024A-JY
Subject: Re: [f2fs-dev] [PATCH V2 2/5] dm: ignore discard return value
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
From: Damien Le Moal via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Damien Le Moal <dlemoal@kernel.org>
Cc: dm-devel@lists.linux.dev, linux-raid@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 bpf@vger.kernel.org, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/26/25 8:41 AM, Wilfred Mallawa wrote:
> On Sun, 2025-11-23 at 18:57 -0800, Chaitanya Kulkarni wrote:
>> __blkdev_issue_discard() always returns 0, making all error checking
>> at call sites dead code.
>>
>> For dm-thin change issue_discard() return type to void, in
>> passdown_double_checking_shared_status() remove the r assignment from
>> return value of the issue_discard(), for end_discard() hardcod value
> 
> Hey Chaitanya,
> 
> Typo here s/hardcod/hardcode. Otherwise, with the split as other have
> suggested:

s/hardcod/hardcoded

> 
> 
> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> 
> Regards,
> Wilfred
> 


-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
