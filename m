Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9575CAABDBE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 May 2025 10:50:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6eGQ887bvixMDHM0KfDGHcisuMjAm8bAtKLapI7gGLs=; b=A7CD/E3khBehTMl42bA5bIZXGm
	YuLHS1YoxL4oPjP+hepwTboogNtY/1t8lCvXpSnthex6NtGrLB9AKGFo0sOnRsLVDUvjUCQLtInJD
	a32pVxSm0OzUGDauvIz4C7aI4Q39EY6BEsEg/aDLtuCu1F8/D92jTFS6XMHwn2O5Sa4M=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCE0H-00050p-D4;
	Tue, 06 May 2025 08:50:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCE0F-0004zN-4Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 08:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GGY46gj1Tbb8b2/oSyAipIPZ0XFiOcb9yeHRU43KL0o=; b=GtxjY4G/vztHQx3bqrro2Qnm1N
 l0KdFqsUWxM4+i4GE+pO5fncn+374LK1evfraSoxV6H/H+8ulTsPWeczXy1PT1mECqdk3Bg73QRNS
 Uu7W9JzIYE6wdoDspV/vR7lyjz9JXpmzmpQyKxXMuAyGnKRw72GKWaPYN4mQ543M6SJs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GGY46gj1Tbb8b2/oSyAipIPZ0XFiOcb9yeHRU43KL0o=; b=erfb0+3JMsQnWUXxeQ/LoqYQGF
 ZBTWmu3h4FHHhOcmKn2dfnNgJuxyIv7wcWn5cJRH3JrgkOPAshmL6lYOEMyNm03aCYlHGjW/rCbyu
 WlKZ0U4IUnVznwtl7+uZT+ibujEbRPKDkFgTLE+O99bQpyGZeIsJsZtVLqLsh0e4JcyA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCDzz-0004pw-Kg for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 08:50:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BF81E6115E;
 Tue,  6 May 2025 08:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C005C4CEED;
 Tue,  6 May 2025 08:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746521388;
 bh=IkiVXT+PKsh4llC2LahuhaCyBWw4ngnV5q8E2WfJgNk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=t7TA1r1eekcd4AQUTFcIYbnAof8tnisy+NVn6hS2z0jBl9iSKZfdYtJUQ5P06BQEb
 grmXkBwPOfgtj+bQp2ntSwbIU4vfGRKcR8r9Oud16BqipjOSr8+iJTxIjzUQyh82CP
 RxhL8VFHoXELpVV1VTDQo9vohCCuvsiAwzrymewqW35nFu2/IEDbn0xD26GwMFRIDM
 20vSvdnl6l6RHDomCJJth11nQj2x8JsYjKWubCKEac5Q9wS80KP6G67s5TuW0JJPwe
 ZjvsOm8A1l4ehn7qsdVIsXBWqFOMJbHZvQi72BS+2mep106XFSoLztEoEWXuaXGjK9
 4G/Ku4VKDn7Ig==
Message-ID: <45f54805-b357-4391-8a43-5825e8dcbd56@kernel.org>
Date: Tue, 6 May 2025 16:49:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
References: <20250430181052.55698-1-ryncsn@gmail.com>
 <20250430181052.55698-4-ryncsn@gmail.com>
Content-Language: en-US
In-Reply-To: <20250430181052.55698-4-ryncsn@gmail.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/5/1 2:10,
 Kairui Song wrote: > From: Kairui Song <kasong@tencent.com>
 > > folio_index is only needed for mixed usage of page cache and swap > cache, 
 for pure page cache usage, the caller can j [...] 
 Content analysis details:   (-0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCDzz-0004pw-Kg
Subject: Re: [f2fs-dev] [PATCH v3 3/6] f2fs: drop usage of folio_index
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
Cc: Nhat Pham <nphamcs@gmail.com>, David Hildenbrand <david@redhat.com>,
 Chris Li <chrisl@kernel.org>, Hugh Dickins <hughd@google.com>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Yosry Ahmed <yosryahmed@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, "Huang,
 Ying" <ying.huang@linux.alibaba.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/5/1 2:10, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> folio_index is only needed for mixed usage of page cache and swap
> cache, for pure page cache usage, the caller can just use
> folio->index instead.
> 
> It can't be a swap cache folio here.  Swap mapping may only call into fs
> through `swap_rw` but f2fs does not use that method for swap.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Cc: Jaegeuk Kim <jaegeuk@kernel.org> (maintainer:F2FS FILE SYSTEM)
> Cc: Chao Yu <chao@kernel.org> (maintainer:F2FS FILE SYSTEM)
> Cc: linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM)
> Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
