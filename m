Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70851B220A5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Aug 2025 10:23:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEa0U0gIv8u6/vjMFLu24VZ0hBfs72xjkpbLcJHNEO8=; b=c09qAyjG0B94oCaJ9sWFvWWnDg
	lcv4sLcaVXS+nqSfK7hwzdzzThyTKzYhKFsGIZoKzM++y6kv7rn/XMoeiozOb2Hb7YMYVCuY+MqOj
	7OgyzQRgCH/ZkRhMOgNAWsey4Un2BuvWIbPKGVcDAeJ1WgmFQyY4nBXQUJchs1TQHxnc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ulkHg-0000zy-FL;
	Tue, 12 Aug 2025 08:23:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ulkHc-0000yH-Ek
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Aug 2025 08:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PEzC0JsOQgHTRn1udthgMhTBu1dJKJ1JYWatB9X+5c0=; b=VxOlS15OcoBZSPHAaXOTtPrzbr
 uB2sdZZ8aweiaBl2s41A5cJ/edmFWQ0pEth0Z45UpI1KJkU7UwllzZ+Ce45zoIdPJkbe3yawUWbbk
 HnZ4zC7mlqPMB3bMt2b0bCU+xM9vhD21CupVTt/CZWkeVXAbVZn2Gm28Gopebu9cy0VE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PEzC0JsOQgHTRn1udthgMhTBu1dJKJ1JYWatB9X+5c0=; b=RfpfVRYpYkNeC6QJXWSlV1ng/R
 ppdhWycDKEZjt3eB3O/n+oSoxIVsITiIVT3UUhOom3/yuO5QazESrU0WKNuz7J4qqgmdhvqNvhm6w
 2zUgBRfSejIckj2wMkIiqdTANOXuwDuWZVJxF4sB7Z7K8BoEWCn4uji18tFkzzKAVTHs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ulkHc-0006fP-2Q for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Aug 2025 08:23:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5F17B60206;
 Tue, 12 Aug 2025 08:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B7BC4CEF0;
 Tue, 12 Aug 2025 08:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754986969;
 bh=SOEUCvkrPLt2cHYTej/oN0PrHTSMKACUoX3UK91QOnc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=DmuKztNSYXOf9162p+KgvmQJqJ7Lo2pii4ZU6f4YPV/QG3AgElpCsFbknaVQXDrgi
 jBXA/1r1k2vKNTTYj4RyHwDBMLN/FV68Xzr5p13a7pZtXFhvnJeYMhrSNPKJE3Vzyv
 DoxyxCPRfXoOIvpwrsjrHdytr2EFvVz07mqFe+K6FwvIadT5wxHkSnaPs9u4Cuc2GE
 6mOcqTi4++iVqHu/KeNhZN3hOjqDdHIlle/vy8d+dbGc0+2YMpYGbJOVcECjAhFGg+
 +P0C6dNHxCaP7gQu4C8VNM8Z2Z3U6pwurWGjnZUKTwguhA6pimV0t3vPVfrd17CzAj
 5i2xWUqPfA1Eg==
Message-ID: <16753b65-326d-48ba-90d2-476380455199@kernel.org>
Date: Tue, 12 Aug 2025 16:22:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christoph Hellwig <hch@infradead.org>
References: <20250807034838.3829794-1-chao@kernel.org>
 <aJnLXmepVBD4V2QH@infradead.org>
 <c5195d5c-5f71-4057-9522-228b48e4cd90@kernel.org>
 <aJruCTOjcj1nEk-S@infradead.org>
 <dec5b832-53f1-4274-902c-418f01df9458@kernel.org>
 <aJr0Tk36ZNiCg8mQ@infradead.org>
Content-Language: en-US
In-Reply-To: <aJr0Tk36ZNiCg8mQ@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/12/25 15:59, Christoph Hellwig wrote: > On Tue, Aug 12, 
 2025 at 03:53:54PM +0800, Chao Yu wrote: >>> What did you use before? At
 least for older qemu the default was >>> buffered I/O, which can l [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ulkHc-0006fP-2Q
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

On 8/12/25 15:59, Christoph Hellwig wrote:
> On Tue, Aug 12, 2025 at 03:53:54PM +0800, Chao Yu wrote:
>>> What did you use before?  At least for older qemu the default was
>>> buffered I/O, which can lead to very expensive fua or flush calls.
>>
>> Previously, I didn't use any cache= option, as manual described, it
>> should equal to cache=wrteback.
> 
> Modern qemu actually split the cache option.  You absolute want
> cache.direct=on.  If you don't do simulated power fail testing by

Yes,

> killing qemu (or run real workloads for the matter, but who does that
> :)) it might make sense to just ignore the flushes with cache.no-flush=on

Yes, I don't care whether data can be persisted to host devices or not,
nor killing qemu for test, so cache.no-flush=on looks good to me as well.

> as well, which is what I do for my test VMs on the laptop.

Thanks for sharing this, it helps. :)

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
