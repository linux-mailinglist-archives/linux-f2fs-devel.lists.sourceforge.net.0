Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8340F3DE3FA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Aug 2021 03:29:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mAjFg-0002p1-1R; Tue, 03 Aug 2021 01:29:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mAjFf-0002ov-8e
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Aug 2021 01:29:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z8TLFJRF4vFbiKrZ/TkQ5tKb+Ht5RhoFlQlNsi5TSpU=; b=e6UTw45TzjzgI7GL7hs1dRSAlB
 va7Kx8/Py89zq1Bo42cTHsJd4WpDgxio5ok7PeKAZXGwclusL7vHpuGrrpSJXhdpslvqkHCRTOczy
 D5U8Vl1gy07OX+EFRguuBKfYz7sYH75DS2pdDSwyQDRfBJs3akxsPacX/ESSd1UbwzNc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z8TLFJRF4vFbiKrZ/TkQ5tKb+Ht5RhoFlQlNsi5TSpU=; b=fLf0nQGcFIna1ZdY4ZDdeGWIzu
 vsCe0Kn4IJS3IfnxfQ1rEQDWPM5iy0d8SF8xwGmZvVnDLc19GbpVM1RrtETPwuiGtUpC+Tn1tgwJE
 Lzl02/6nomrUa0DB3GLLLOyx79RjAZv0Aep8GojU5ocPbxAoaAuDT2hZs7HuulB6QvgU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mAjFY-0002vQ-Vu
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Aug 2021 01:29:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D8D3260FC4;
 Tue,  3 Aug 2021 01:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627954174;
 bh=Z4zj/Wb3RgzHIm3MYrz04fRNx1w1p3GirfhhiOyAru8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RS7LyTBIo9E5HN0gl5zfHa23PZfGl3djZT2jwhNdhfl/Vi8B+LnIjRo8tHMwftVaP
 ZCEWxE2t91WRQNDsMgCByL8srq0+R18/SwJ23VOa0xYrKlzHbJNt18bVx3KreEuZg+
 vQLUR4cK/Qf8jjD6dcoEUeNcnPPaxk8XWFXtZ+wn4Ria0XpyvHLbYGiAUAzNpLxXqg
 5ccWWevOdr+CgpUIU47LfgEl9oJu9E+JiInlokFkNLCNmEVZjbCnGnZ6+sqXizxCtm
 orYQNIRdorsIxeKb5YZVuP3jXmWyKPCCkRnysVVk+SbYWo+osgLAIASXMoMjOOsVxl
 OTlOS9/so8Nuw==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210707015815.1978-1-chao@kernel.org>
 <YQRQ4kHvdRTBnb10@google.com>
 <51565c85-a475-bcb8-bbb2-e3125c5223a3@kernel.org>
 <YQgziuikMr0fvlT7@google.com>
 <3256dc39-2a82-cb60-038b-69e262c32d18@kernel.org>
 <YQia9FBvQIRgr6cm@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <a8291159-f625-c2a0-da73-7c30172f3d9a@kernel.org>
Date: Tue, 3 Aug 2021 09:29:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQia9FBvQIRgr6cm@google.com>
Content-Language: en-US
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mAjFY-0002vQ-Vu
Subject: Re: [f2fs-dev] [RFC NO MERGE] f2fs: extent cache: support unaligned
 extent
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/3 9:25, Jaegeuk Kim wrote:
> On 08/03, Chao Yu wrote:
>> On 2021/8/3 2:03, Jaegeuk Kim wrote:
>>> On 08/01, Chao Yu wrote:
>>>> On 2021/7/31 3:20, Jaegeuk Kim wrote:
>>>>> On 07/07, Chao Yu wrote:
>>>>>> Currently, it only works in readonly format f2fs image.
>>>>
>>>> There wouldn't be any race condition because unaligned extent only works
>>>> for ro feature now?
>>>
>>> Isn't your patch proposing on writable partition?
>>
>> Please check description in patch message, now it was designed only for
>                                                   --
>                                                   what do you refer "it"?
> 
>> compression case w/ ro feature, let's check and support rw partition later.
> 
> Quite confused the patch description and code changes as well. You added some
> change with this as well which is for RW.
> 
> +       if (is_inode_flag_set(dn->inode, FI_COMPRESSED_FILE) &&
> +                       !f2fs_sb_has_readonly(sbi)) {

My bad, I've updated in my dev branch, but forgot to resend it...:

https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=dev&id=c3a40f6a186ba064f95432b308173d0a8fe375dc

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>>>
>>>>> Is there any race condition between the address in extent_cache and the one in
>>>>> dnode? I feel that we could synchronize it by locking its dnode block.
>>>>
>>>> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
