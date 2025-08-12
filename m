Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3670FB21E4E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Aug 2025 08:29:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Du7XPmUlhhK0K7+AxbKYut+Oxuh1HVOmrk5Wx5bQZu4=; b=X+0Dvyy/0XLCu4UFYOxhqXtgpz
	TBsJSLO15iGSJEZzD1qD2Ei7uXych2oR4TIy7yAkmkMrQWO92lkNWgVuwM12vEin5kTEAKYLEUQpz
	3DWY11/X50GdQHMrP3050oXkc/JTK1rWr968ZXsZWHRqiyZgHKr4hPdBsAB3d7E/X9IE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uliVM-0003t0-0R;
	Tue, 12 Aug 2025 06:29:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uliVK-0003sj-7Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Aug 2025 06:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yec45R1gCu2xMez1+4c6I/2deO++u/uRzQG5gjRZkyw=; b=meObIDPgW2k0GUrb/quM06NkX3
 sAZse02AfHLclg8SrQv0Wx7M8Y6E0ciOxQttGRepgMGQpAUSG09BsHSchrHB5z97vyTCDzy2AoxNU
 S73nLezv5pFyqtZhYb22zaP/1ion8+z8hHVcEPFQieK5nQlG/UOJZp4ZyJv3MZ4eiSgU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yec45R1gCu2xMez1+4c6I/2deO++u/uRzQG5gjRZkyw=; b=ZYdoSew/mfxb9s119QJSKFDCdT
 yBxr3ewwG2bQOREz78JBPYPz4DdNaz44MVzt/1lmllCSjJgYIxvT/tQ+BbUGVhc1IVI9xWc4Ertxz
 g/oaQsKktOuhdAxjdD2dpWzT8qd5TZKDf3Zm02rxa0zAJSn4X2a3hvp1m0/n+//51o4w=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uliVK-00051N-JJ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Aug 2025 06:29:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D9EE660206;
 Tue, 12 Aug 2025 06:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6BDC4CEF5;
 Tue, 12 Aug 2025 06:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754980131;
 bh=La7H9eByYagCohgqxw2G3+7zgFCfw7Yo597djXDnUI8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=a1k9fuZqk/kOMkIEp11qlXl3Qx+u0W/KFGDziAfY78Q72ClFmLm+POlw50Vfogvg8
 OhOItv0BpS/V/TYbh8m0oYOUIpkD9iIDYOyZ3/dCbdRg08xd5GnUZkwP+7dwQZKZ4e
 ZvjubE22oGFfuVufiZx1AYnla3xjP5RTk1fAhNNgx2MyBvtULuXgp3pQ5kP1SKyP/I
 spePuE4VbfxV41b4eGC2cNvgP+gl8RI1sWVm8e93WjJ2zYXwQV4F6Vl+Df2snQKwPo
 4q7JXvVCL70drl/JoFl9KiLHO8R+ZnYn/zjESEsscFgi9Bt6w68NPO0ZUlkRoJtURr
 RwNEAlbN4FNRg==
Message-ID: <c5195d5c-5f71-4057-9522-228b48e4cd90@kernel.org>
Date: Tue, 12 Aug 2025 14:28:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christoph Hellwig <hch@infradead.org>
References: <20250807034838.3829794-1-chao@kernel.org>
 <aJnLXmepVBD4V2QH@infradead.org>
Content-Language: en-US
In-Reply-To: <aJnLXmepVBD4V2QH@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/11/25 18:52, Christoph Hellwig wrote: > On Thu, Aug 07, 
 2025 at 11:48:38AM +0800, Chao Yu wrote: >> This patch introduces a new sysfs
 entry /sys/fs/f2fs/<disk>/flush_policy >> in order to tune pe [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uliVK-00051N-JJ
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: introduce flush_policy sysfs entry
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-block@vger.kernel.org, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/11/25 18:52, Christoph Hellwig wrote:
> On Thu, Aug 07, 2025 at 11:48:38AM +0800, Chao Yu wrote:
>> This patch introduces a new sysfs entry /sys/fs/f2fs/<disk>/flush_policy
>> in order to tune performance of f2fs data flush flow.
>>
>> For example, checkpoint will use REQ_FUA to persist CP metadata, however,
>> some kind device has bad performance on REQ_FUA command, result in that
>> checkpoint being blocked for long time, w/ this sysfs entry, we can give
>> an option to use REQ_PREFLUSH command instead of REQ_FUA during checkpoint,
>> it can help to mitigate long latency of checkpoint.
> 
> That's and odd place to deal with this.  If that's a real issue it
> should be a block layer tweak to disable FUA, potentially with a quirk
> entry in the driver to disable it rather than having to touch a file
> system sysfs attribute.

Okay, it makes sense to control how FUA be handled inside block layer, so
let's drop this patch.

BTW, I suffered extremely long latency of checkpoint which may block every
update operations when testing generic/299 w/ mode=lfs mount option in qemu,
then I propose to use PREFLUSH instead of FUA to resolve this issue.

"F2FS-fs (vdc): checkpoint was blocked for 24495 ms"

I just realize that using cache=directsync option in qemu can avoid FUA hang
issue, anyway, let me test more w/ this option.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
