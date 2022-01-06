Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AC54866DD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jan 2022 16:42:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n5Uug-0000tg-Be; Thu, 06 Jan 2022 15:42:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1n5Uuf-0000ta-64
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 Jan 2022 15:42:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7crqQWVaJFu2L5sI5DG7Ux+t5EHHdyWZyi7LCtahFWk=; b=OfCndcArHxCkWm+LV1AkwjvmsX
 EovD8HoGO8C5TqaT7Kqsxkj8bz3lZOqTEnMc7Oy3YVT0GjYqAxnlaMKDTW3xIcBZo2ugtfNCumoA2
 ND6qQMywqku8Tw74ve12xLHSz/FuIaa0s4NQHEZ0MveIhV1hSGDFDuLcR2AiD1CsP9Mg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7crqQWVaJFu2L5sI5DG7Ux+t5EHHdyWZyi7LCtahFWk=; b=m0tW8+wzZzd2P9RmxvVF7DVk5r
 gfVQtesqS/KG/+1RQhXRg5LawLmsmoJE/PyUtJabFJB6aixxZpUdfWe13/PxqXgvDZZ4QQvii4NU8
 jhhBNR40TVawD/7RxSdsOKluHvUwSTiCYflrtRDO1J0X3vNnUWJihzj1HJNlM4YNK9iU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n5UuZ-00043v-G6
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 Jan 2022 15:42:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7155FB82202;
 Thu,  6 Jan 2022 15:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFE4C36AE3;
 Thu,  6 Jan 2022 15:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641483751;
 bh=Yx1Tdx3GjpOCtEuzbsCaY/8gZMww/y9Hen/oPFQqUSw=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=YNqD42JUn6gOs0pTe+iZ3sk0Nwb8ZvNXyXw2qg9t42BRDF1V5QkFFDu1tduefl2Zr
 7f78zJltqV3yPIrnDUpZvAwvjd4U4QCB628KH64zScZjeNaAb/tnjTro6xr7xiBMq5
 Qgr3ci7rtamvzEfOVOTJ9kwUCPBzq9DH+MnBlyJZsPUrwtBPZzYfsVhcOYZ5w5NFe1
 HXsDqffQ57T+YQvoFvMw79EUTMrCPPXyzmU2QlgS0ClzKFpHLylLUuUnmz7Y1wTo/d
 V7ZgT3TirkaMtHzc0emeokVhfLkl8tiv83la86tjlRLdZTwUoB0Zv3bP0wSMIh4beR
 gtz7KdzEyFy1A==
Message-ID: <c22ac22e-f545-1c2b-0479-34d32b3c960a@kernel.org>
Date: Thu, 6 Jan 2022 23:42:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Antoine Viallon <antoine@lesviallon.fr>,
 Antoine Viallon via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
References: <a6ee8d0b-1d67-0bcb-ba8c-06b0d691bb17@kernel.org>
 <20211230002942.298407-1-antoine@lesviallon.fr>
 <e8b0f25177675008c0eb234220ceb31f@lesviallon.fr>
 <085f5193dc533d787545456dfadcbe55@lesviallon.fr>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <085f5193dc533d787545456dfadcbe55@lesviallon.fr>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/1/6 23:33, Antoine Viallon wrote: > Thank you for
 your reply. > >> How about showing this message in debug mode? may be under
 level one? > >> Thanks, > > > The debug output is extremely verbos [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1n5UuZ-00043v-G6
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: Add progression feedback
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/1/6 23:33, Antoine Viallon wrote:
> Thank you for your reply.
> 
>> How about showing this message in debug mode? may be under level one?
> 
>> Thanks,
> 
> 
> The debug output is extremely verbose, even at level one (I measured hundreds of messages per SECOND on a SATA SSD).
> If we print the progress in this output, it would be completely drawn in the other messages, therefore making it useless.

Yup, :-p

> 
> Thus, we should either decrease the debug 1 verbosity (hard), or add a new, independent flag (or way) to control it.

Maybe -v?

Thanks,

> 
> What do you think?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
