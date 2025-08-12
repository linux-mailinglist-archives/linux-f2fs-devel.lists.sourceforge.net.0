Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8256B21FE9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Aug 2025 09:54:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WQi/sb8H8v1xI9VgbUlvzrkBpg8HJh/cs2nu67EA/4=; b=U4O/mBP4NxoBUe5ZOfDhtCuPpT
	SwKoUGebY4TnTGKGdJUyHvdtgKaOjlcLg4xWfGgYyUbmZjIGO8TYCMPU7enUMuyJmaidGyJO628ZW
	XnNsXKdwuf42JU/RMTUX6bDvcTl/hGAqggpLNVujKQ/X5uucd9ot/N/KEsI0a2apJ7PY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uljpi-0003m2-Gj;
	Tue, 12 Aug 2025 07:54:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uljph-0003lr-Nd
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Aug 2025 07:54:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=36dpMYT+aAQWV56M6hOiHcy4kl58MgfdAqjvh8WR2BE=; b=jDvlQaSkfO8pEBVpOEeBsLMQrQ
 QediWNI+2Rl8XFHCMr0itryC0DkM2OJqROVsb0zPULd7Vsc8pjmVsirbtR/+XGTw5Ttf3Ipui1TOc
 MA00dkO25PIA7Po81pwRVY9z9HY78l39bOuyKoyESP1vWTjy8pjwn9+8S3X2M+VWte6g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=36dpMYT+aAQWV56M6hOiHcy4kl58MgfdAqjvh8WR2BE=; b=V6fM2+8t/YjpYZ30FlUZI/5gAD
 zausB8XPemmUEOZTsq1VzvbYadI0tVYyplpTmKh14bxEU3ricfOzBGdMELKOyGD+nwtRUInGhOqCF
 QZspukODoI93/irYM2RlduG61QngtJ5qXzLyiMPQJDJWoVLLJ6pxYb9O3D6labYy6gGk=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uljph-0003Ux-WA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Aug 2025 07:54:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 619B5A56A53;
 Tue, 12 Aug 2025 07:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B358C4CEF0;
 Tue, 12 Aug 2025 07:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754985239;
 bh=sw8wLAIZdKxUOMDtddxEFYfkLyHWxf/hNcZfBt9jddc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=jh3uStF3r13oKRFs0sLYrM2446Mi+VB8hpHKE9Zh83l99O+usPogtPFDkMn9Q5GM1
 ulEPEVxJhe/iJdSxhpCcEs7THsZMAfxFmWt0cASdTay3BP6NgUC5bXq3e2Rj5NUrH3
 AGUweTGCW+hwhMuQ9gFmRjR9UW5kyJq9d1bhq5qBCtDVf150CeQW15gSD+CjZxwgWg
 U4heXQ0DgqonUyh78GfP/hhONpJOUWjPBxp1Gl0afR5DNOMx7QCTJT0ecG+2n5k9EB
 zJS5Y+vwsB//qSKw/W1Zb4OfmVnzGQiXWwtqp5AciGajSdR1iXRJwT6y+ZMP7hxh/Q
 DEBA8uRrQMeEQ==
Message-ID: <dec5b832-53f1-4274-902c-418f01df9458@kernel.org>
Date: Tue, 12 Aug 2025 15:53:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christoph Hellwig <hch@infradead.org>
References: <20250807034838.3829794-1-chao@kernel.org>
 <aJnLXmepVBD4V2QH@infradead.org>
 <c5195d5c-5f71-4057-9522-228b48e4cd90@kernel.org>
 <aJruCTOjcj1nEk-S@infradead.org>
Content-Language: en-US
In-Reply-To: <aJruCTOjcj1nEk-S@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/12/25 15:32, Christoph Hellwig wrote: > On Tue, Aug 12, 
 2025 at 02:28:46PM +0800, Chao Yu wrote: >> BTW, I suffered extremely long
 latency of checkpoint which may block every >> update operations [...] 
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
X-Headers-End: 1uljph-0003Ux-WA
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

On 8/12/25 15:32, Christoph Hellwig wrote:
> On Tue, Aug 12, 2025 at 02:28:46PM +0800, Chao Yu wrote:
>> BTW, I suffered extremely long latency of checkpoint which may block every
>> update operations when testing generic/299 w/ mode=lfs mount option in qemu,
>> then I propose to use PREFLUSH instead of FUA to resolve this issue.
>>
>> "F2FS-fs (vdc): checkpoint was blocked for 24495 ms"
>>
>> I just realize that using cache=directsync option in qemu can avoid FUA hang
>> issue, anyway, let me test more w/ this option.
> 
> Well, for decent qemu performance you always want to use DIRECT I/O.
> directsync is generally not a very good idea as it forces every write
> to be synchronous and will give you very bad performance.

Yeah, I think that may hurt the performance too, at least, I don't see
any obvious change for time cost of generic/299 testcases, but still I
need to run all my testcase to see what will happen. :)

generic/299 115s ...  113s

> 
> What did you use before?  At least for older qemu the default was
> buffered I/O, which can lead to very expensive fua or flush calls.

Previously, I didn't use any cache= option, as manual described, it
should equal to cache=wrteback.

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
