Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EADA654A3C9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jun 2022 03:48:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o0vfc-0006P4-JB; Tue, 14 Jun 2022 01:48:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1o0vfb-0006Oy-7K
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 01:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xf+/n9vT6+MKNw73lExmYQadHeGPi85xzUBytnjIu10=; b=VbOPnZ/caV2bNSNbdb0SJ0GoEz
 cPrY1zhq6EOHsSBEq4jQ3Z+0v8dqWhX6nKYrbF5q8pzZI02VVoyiHDePL/Yox0x6ClYnhfKhMEPGp
 0V43E9WzoIyIfQQflsW/UlUqiGz1QE52rdHtsE4+EXOMLyIreLv0aFNeztC2GdxJwaV0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xf+/n9vT6+MKNw73lExmYQadHeGPi85xzUBytnjIu10=; b=ArjJynOWYYBvmJNgzQ6jk350M9
 0hSAZ08kFl9+3JPdKgm2y+qWCEPmFr7GzeF4aNLyZem+EIpooEFUlSJbOubi3wyGalzV4w5EuEqxD
 uWLIDlaI/EbTTW8As7m9+fYeZjbIvQ6SBVlrdUHaJz+yov16NogfOHgCucV9hPJBBDbk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o0vfZ-000isb-5q
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 01:48:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C6ABB61614;
 Tue, 14 Jun 2022 01:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C7EC3411E;
 Tue, 14 Jun 2022 01:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655171303;
 bh=kHVpMpq++uoILG8nEpsnJIRDObfNN0ura8aEr/40J5g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PHLniVGe96eCVgQd6i8SCb2VQ8SV2TbyBAvvsjPqz+jBf0JxbnHKYBXaBJgAin57x
 l23HXLkgQiLI1XRR9uTlcpitTheTlSWA01VSo/6F8MU/7SbitF6DvTOJW16KsjlUZr
 L2SATQZ6jbpEzm53tWAXBk48vhfthzhWfSfQiubKyxynPTycF5CwGEZyuQYSHlh+dY
 dpfuZXLECuvU6XTTZPJvUW/SZxr96ZaNDzeDzRdEB/iANHSDdEnoj8RljdoauDMEe6
 Vxzdc+FvG3dCMN9lcfhmc5tXsxxJzw++7El1+Vbm4pv3JmQKOAg/Y5xkMOzskV7SuF
 yaZRfrhieTW3Q==
Message-ID: <1544ed72-0865-6cff-e9fa-02a1eb1ed50d@kernel.org>
Date: Tue, 14 Jun 2022 09:48:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, Chao Liu <chaoliu719@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
References: <20220613020800.3379482-1-chaoliu719@gmail.com>
 <Yqaw3VTD46PAMN8O@casper.infradead.org> <Yqbu+BArbUNGvft9@liuchao-VM>
 <87czfc1nr8.fsf@meer.lwn.net>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <87czfc1nr8.fsf@meer.lwn.net>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/14 1:23,
 Jonathan Corbet wrote: > Chao Liu <chaoliu719@gmail.com>
 writes: > >> On Mon, Jun 13, 2022 at 04:37:01AM +0100, Matthew Wilcox wrote:
 >>> On Mon, Jun 13, 2022 at 10:08:00AM +0800, C [...] 
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
 high trust [139.178.84.217 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o0vfZ-000isb-5q
Subject: Re: [f2fs-dev] [PATCH v2] docs: filesystems: f2fs: fix description
 about compress ioctl
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
Cc: linux-doc@vger.kernel.org, Chao Liu <liuchao@coolpad.com>,
 linux-kernel@vger.kernel.org, Wayne Zhang <zhangwen@coolpad.com>,
 Yue Hu <huyue2@coolpad.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/6/14 1:23, Jonathan Corbet wrote:
> Chao Liu <chaoliu719@gmail.com> writes:
> 
>> On Mon, Jun 13, 2022 at 04:37:01AM +0100, Matthew Wilcox wrote:
>>> On Mon, Jun 13, 2022 at 10:08:00AM +0800, Chao Liu wrote:
>>>> v2:
>>>> - s/file size/filesize/
>>>
>>> Why would you change it to be wrong?
>>>
>>
>> This is a suggestion from Chao Yu. Maybe he has some other considerations.
> 
> Sorry, I should have replied to that.  I disagree with that suggestion.
> "Filesize" is not an English word, and there doesn't seem to be any
> reason to use it in our docs.

My bad, out of mind at that time, sorry for my wrong suggestion...

> 
> <checks>
> 
> We have to occurrences now - one already in the f2fs docs.  I think we
> shouldn't add more.  So my plan is to apply the first version of this
> patch.  Chao Liu: is there a reason why you didn't add the Reviewed-by
> from Chao Yu in the second version?  Chao Yu: is that tag still
> applicable even without the "filesize" change?

Yes.

Thanks,

> 
> Thanks,
> 
> jon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
