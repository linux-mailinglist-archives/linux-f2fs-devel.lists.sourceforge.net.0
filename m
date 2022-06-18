Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A26550785
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Jun 2022 01:42:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o2i4r-00069y-PC; Sat, 18 Jun 2022 23:42:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1o2i4a-00069W-4L
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Jun 2022 23:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VKpDHhbrR7Gp0n8HwHNCqvuok+Jqk1APwdsAp1jrGck=; b=L3M0AWbAbYNi1yTjP/KoryGeiN
 cLS6CjTLZUPVSXrbVxFgZT5qlQbC6hefO/aVZ03kEsWIBu3z1Mp49E1cMJXaucm7RLhSxawLVx/5e
 +7X45fQDH4piUChyrXOoFC0OtLGDISgZwin4SrIX52fB5NEIFhTAY/HTcA/9JoGEMNHc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VKpDHhbrR7Gp0n8HwHNCqvuok+Jqk1APwdsAp1jrGck=; b=gFKs5k5nFZ7gVly0Tfo9yDYTpr
 ubweoyUk5tDpf8mtyGQy+v6Sicc/SiorjoIRds37foI6NvQoQmV9ntAD6/zucMoFW4nC4loMf1Zc1
 wUITePPz5BEVQoLbte4h2HsiekN6GbdMpWsYeFhmhF6U6sSk3tOWZKgVs66O5dtDryYc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o2i4Q-0007Zc-C8
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Jun 2022 23:41:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 74FD5B80B52;
 Sat, 18 Jun 2022 23:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C934C3411A;
 Sat, 18 Jun 2022 23:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655595691;
 bh=paQ+Ly47Tz9ZFtuaCL5XL4sYfUaEf4roC7s+sfbJKlc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AdVMiEI3GlHtnk2pMlVsNz0mCsnI3/VkgFzbMBPgMoz6pTHE0PwvdOqOZShXOkRSg
 htWdla+rRtCR3r7Hz3gGDfqd3jBxPccXbzFXiMg+cDvFYF+wwxZxMYI9EI0L8C0Wwa
 8B+zpqqu7EmhiShWHg+IHc6Nku+ZDazcyLtuM3EFSOlCAOKV31zSztgAZF8XOYHxbi
 BID2pxCWyzFw5ehQEmQ8WU0luisL7bWzkk9jui1cgscMCAfCcfFTfkPTjEYIJGmead
 K7LF2tqBbLB58MidECRgKuCRoxGURw0KowpwxJ4QAH5kGQI056ZR+Sw5EXffrlMmh8
 sZDkL1dsR4MTA==
Message-ID: <0bf9bc18-99a9-e0a0-bb4c-dc398361c23d@kernel.org>
Date: Sun, 19 Jun 2022 07:41:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220614231724.776264-1-bvanassche@acm.org>
 <20220614231724.776264-2-bvanassche@acm.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220614231724.776264-2-bvanassche@acm.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/15 7:17,
 Bart Van Assche wrote: > Fix the f2fs-tools
 build on systems for which PAGE_SIZE != 4096. > > Cc: Peter Collingbourne
 <pcc@google.com> > Reported-by: Peter Collingbourne <pcc@google [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o2i4Q-0007Zc-C8
Subject: Re: [f2fs-dev] [PATCH 1/3] Fix the struct f2fs_dentry_block size
 check
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
Cc: Peter Collingbourne <pcc@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/6/15 7:17, Bart Van Assche wrote:
> Fix the f2fs-tools build on systems for which PAGE_SIZE != 4096.
> 
> Cc: Peter Collingbourne <pcc@google.com>
> Reported-by: Peter Collingbourne <pcc@google.com>
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
