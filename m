Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D84D3FEF3E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Sep 2021 16:14:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mLnUS-000658-4t; Thu, 02 Sep 2021 14:14:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mLnUQ-00064p-RX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Sep 2021 14:14:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N81l6JSl5HrQRRFYRHfoanvKhqvlMgSfXCXeShGc/3U=; b=B7Viihy3AKpL72JezY2FWvRILN
 IbZG3ogjB3pjhD6eg+JrcrRjWQdqu0Dx4hjUUFeDz8wRG3/Kc9V565nfT3a567wHHE1wfhZ+Qkzfe
 BTuu67qoMmWMiEbak0MOBT0dHgkUUrzTISThXuGWdUQlXF3SYOpMQuPlzVRQJUCTM7Mw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N81l6JSl5HrQRRFYRHfoanvKhqvlMgSfXCXeShGc/3U=; b=H1kbfNM5RfcNJpS6fTTX6SQW8/
 a0BGhYJnHd14Qn8EGqSoOLC1qtinK+0WqQls+XeQ1w214mWETzoTSpDQ0BJJKPmX+xnPPIJrKHhu3
 DHYK7SwjowEVRnm/Vpn6jLnm6hGhMeLUG89m2ivsXrbgOrUrD7hktP6wBcPhmLE42NHk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mLnUN-0003be-GC
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Sep 2021 14:14:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A65661057;
 Thu,  2 Sep 2021 14:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630592077;
 bh=DVAsHIsJD7iFHpLVGXizimiu/8do/vccItG0f7F+Iys=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=s+jwjSCy2dFMjEkXniOZnpqcviUIxHmjT+b50QoEHKXFvk6/J9VEG6GZaBGo+EWkw
 Gn+tw8y+DdlUGLrD99+wLQ9K1CmPDW3q/a8jWt4e9dN+ApKMWkG7B2ElGbQy4pmzTm
 kbCX+BaioAtZtrLNijSzmUwa3ojoQ0RNRzVUP2ukkzd9r1dSQ1faLqAtlSVKwVxGBG
 5DpnchAqUANnzQAjYyP/jsTH5+x+mX5WhS+NXI0DtTeeuciEfDIkhTy8PzPqWlQypx
 Yc8PeWDY0EUsCeL4ANav3JXAIzjmCaXEown9VqEDIAU7YZ8ltDmbMJQ/cYOP8dI7D1
 7pSnPhdofv9YQ==
To: Daeho Jeong <daeho43@gmail.com>
References: <20210831051037.3108944-1-daeho43@gmail.com>
 <33e7e327-5318-e30f-4419-42497fe90b31@kernel.org>
 <CACOAw_wyLX_mnnPV0vWeAqTtEDx_bhG2c72jq6YmjQGOgtVLeg@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <04c6fb07-0e56-bfda-44b2-8fcb4a9fe72a@kernel.org>
Date: Thu, 2 Sep 2021 22:14:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CACOAw_wyLX_mnnPV0vWeAqTtEDx_bhG2c72jq6YmjQGOgtVLeg@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -2.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mLnUN-0003be-GC
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: introduce fragment allocation mode
 mount option
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/9/1 23:17, Daeho Jeong wrote:
>>
>> if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_SEG)?
>>
>> It needs to randomize position of next segment only in fragment_seg mode? IIRC.
>>
> 
> I want the randomness of segment allocation in fragment:*_block mode
> to simulate real filesystem fragmentation.
> How about just using fragment:rand_block for the simulation. I mean we
> can use segment randomness for fragment:segment and
> fragment:rand_block.

Okay, so it needs to describe that fragment:rand_block option has implicitly
enables fragment:segment option in document?

> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
