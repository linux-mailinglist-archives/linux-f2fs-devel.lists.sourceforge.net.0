Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC2A687645
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Feb 2023 08:11:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNTkr-0003zi-I2;
	Thu, 02 Feb 2023 07:11:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pNTkp-0003zc-Qn
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 07:11:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZQGyD6JHYX4XSUIMVvXrV4AuNMMy6b/FLEoOZhmVIBQ=; b=NgnbMnRh11ivtfLcE2F92/9tkR
 256BUaLSpjnLU/ePARdhDlvF5UbXIxaVcq+d9Ar+wSoO3LNSrVpMJGgW0igKrBmxC1MF7aNCL3fG/
 zBKSbO/T+Ld/cQombo3RDF6Fevlco2tgU3yzuqU9Z0Qu4QeHHP+6Ec2Sb338OR7Cm7pY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZQGyD6JHYX4XSUIMVvXrV4AuNMMy6b/FLEoOZhmVIBQ=; b=aiSgOSuxsxBBZFwGP3tNwuN9JI
 vsoB9MSCrikb3pWzdkYkI5DKBt0nZ/vQvt/IwJUWP59n04VtugIB3bKYJ5ALFSXUjHIWwZ85sLLYk
 afNvZJyoAIYxS+m3tMT7wja0NU8eHMik/TsHP6sIr0PHDWiRDkrP4XoX/pklYu2Jyt3E=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNTkn-0000Y6-Ih for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 07:11:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0B79FB82372;
 Thu,  2 Feb 2023 07:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852A2C4339B;
 Thu,  2 Feb 2023 07:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675321882;
 bh=gfS7S4W2HkaLaI++1EN/mssAKz2M7IN90iHqH4OBoY0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ScMauiOUiUlUWfVref7DNRefq7GQ+/PNaBdNUP99U4EHXTZXqS8L63Oj8pajaNmwh
 sl26i+XurUNUo6FbB8QRh8qXE31dwwSppi/mfOd2SRpsc9GgYo3nHcmTyAWN0Pmh8v
 Ux7GjQj2QBWr43Wx710NGbIpuupIY0Ucz47guTQAos0U40MJrvcv7m3buostOZE2lC
 YJuhmt7HBnvCGf4Pt6KyAOZ2CMtvp+t5dKbRr8ILE46PeMydzRIb+79ZKam2op5HEB
 eRvmSqnmTzV/pPRXJq3E1UALzBG4laJd1o6GgDjMO7mEFB+J67H4OYe6ehl/PDB8dZ
 CUcppGV414n+A==
Message-ID: <e4dec7de-40d8-5e66-2e83-17e1540042ff@kernel.org>
Date: Thu, 2 Feb 2023 15:11:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
References: <20230201-f2fs-fix-single-length-bitfields-v1-1-e386f7916b94@kernel.org>
 <64d1f9d3-12d8-cc7a-501e-5c0286b0cfa1@kernel.org>
 <Y9tU+woHY23zHpmv@dev-arch.thelio-3990X>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y9tU+woHY23zHpmv@dev-arch.thelio-3990X>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/2/2 14:15, Nathan Chancellor wrote: > On Thu, Feb
 02, 2023 at 02:13:18PM +0800, Chao Yu wrote: >> On 2023/2/2 0:40,
 Nathan Chancellor
 wrote: >>> Clang warns: >>> >>> ../fs/f2fs/data.c:995:17: [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pNTkn-0000Y6-Ih
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix type of single bit bitfield in
 f2fs_io_info
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
Cc: kernel test robot <lkp@intel.com>, trix@redhat.com, llvm@lists.linux.dev,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, patches@lists.linux.dev,
 jaegeuk@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/2/2 14:15, Nathan Chancellor wrote:
> On Thu, Feb 02, 2023 at 02:13:18PM +0800, Chao Yu wrote:
>> On 2023/2/2 0:40, Nathan Chancellor wrote:
>>> Clang warns:
>>>
>>>     ../fs/f2fs/data.c:995:17: error: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Werror,-Wsingle-bit-bitfield-constant-conversion]
>>>             fio->submitted = 1;
>>>                            ^ ~
>>>     ../fs/f2fs/data.c:1011:15: error: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Werror,-Wsingle-bit-bitfield-constant-conversion]
>>>                             fio->retry = 1;
>>>                                        ^ ~
>>>
>>>     ../fs/f2fs/segment.c:3320:16: error: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Werror,-Wsingle-bit-bitfield-constant-conversion]
>>>                     fio->in_list = 1;
>>>                                  ^ ~
>>>
>>> There is not a bug here because the value of these fields is never
>>> explicitly compared against (just whether it is zero or non-zero) but
>>> it is easy to silence the warning by using an unsigned type to allow
>>> an assignment of 0 or 1 without implicit conversion.
>>
>> Nathan, thanks a lot for catching this, do you mind letting I merge this fix
>> into original patch? as the original patch has not been upstreamed yet.
> 
> No worries, do whatever you need to! I just care that the problem gets
> resolved one way or another :)

Thank you! Updated a v3 patch. :)

Thanks,

> 
> Cheers,
> Nathan


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
