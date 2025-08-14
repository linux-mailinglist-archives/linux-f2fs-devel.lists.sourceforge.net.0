Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBB9B25876
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Aug 2025 02:40:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:Message-ID:MIME-Version:References:In-Reply-To:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjMkssTGAE7noPhQJcm7H93KybZ/aTJvYV0YB2e2Rxw=; b=O4Fxu9gwfdvfbPkBgFJKcTGDcG
	EvUysj/JiMNDT7pIzrC91WV6pPeTJxvxdOnVC+0VEkNahnLCyUehvTa7koAykaCHvnzdhF9H5q8Jr
	O93XgKhQNus7QR/LF93kTsO2VXQ7CGXXMCXVZL4P5FCaTvMuJW1paFRULFwL/Cy188/k=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umM0k-00012Q-T9;
	Thu, 14 Aug 2025 00:40:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1umM0j-00012K-2Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Aug 2025 00:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S2F1KYFdj08kbSGD3imelw94uIcPpeMQDGDSL0wXGKc=; b=AOX+jbrkalHERpq+7GYJeukFHl
 iV9LS1xT5zPtWSw3k+lSjWFvkj135R3O/f1IDnuhT6gXe86QAhj1qWwgT/M3aLuZanWcDDRCrGSky
 HvwQzB+bE6dyelr9/cGVfSyLUG5RHjrmOtmwqFEvM6RynrT6O9jVQpz6iLzd+5A5MRaE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:References
 :In-Reply-To:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S2F1KYFdj08kbSGD3imelw94uIcPpeMQDGDSL0wXGKc=; b=kATbDO1NjQqqwDwz7ZdwUarc5b
 DVIEdAyYKxHHpEyPOLNz015Vzube0WGSWLMM4T9yEXFuvMgsy5LK6fHasin9Z0RyKYitCkTxTQolV
 N7FCIAh6RSm8WPl1ldRHnJYCtlYakG5ksAIcsjlUyYNd38rTVouVUFQ6gaKNW+SudxNU=;
Received: from m16.mail.126.com ([117.135.210.7])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umM0h-00084K-V9 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Aug 2025 00:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=S2F1KYFdj08kbSGD3imelw94uIcPpeMQDGDSL0wXGKc=; b=O
 b4yuPz99DZ29Sfb9Yp/DMQgWkAO2v0QzaFvlRxFrvu1P7xd57/SsPsdU+NDLoe+b
 QQFLSrbikwcBbnqlARHjCL8HlTI6GL4pJsjG/hAKUmOvMnJ20KgglCsj4FbIsIhQ
 +pAIoR36p/gZ/vL1cKTL61mYTdEUeeLdgXBwOvWTRI=
Received: from nzzhao$126.com ( [112.86.116.50] ) by
 ajax-webmail-wmsvr-41-116 (Coremail) ; Thu, 14 Aug 2025 08:39:31 +0800
 (CST)
X-Originating-IP: [112.86.116.50]
Date: Thu, 14 Aug 2025 08:39:31 +0800 (CST)
From: =?GBK?B?1dTEz9XcIA==?= <nzzhao@126.com>
To: "Christoph Hellwig" <hch@infradead.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 126com
In-Reply-To: <aJytvfsMcR2hzWKI@infradead.org>
References: <20250813092131.44762-1-nzzhao@126.com>
 <aJytvfsMcR2hzWKI@infradead.org>
X-NTES-SC: AL_Qu2eB/2YvkEs5yKYbOkfmUgRgOw3XMSyu/oi2o9UO5FwjA3j9SoPcGJeMmTT3OSSIi+qiiq1dj9e8PZgd6hBdqgZCTA8v9ofc8iQhGls/sROAA==
MIME-Version: 1.0
Message-ID: <e81c31e.56a.198a604868e.Coremail.nzzhao@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: dCkvCgDn1y9DMJ1oOMAZAA--.15410W
X-CM-SenderInfo: xq22xtbr6rjloofrz/1tbiEwWoz2icl9vu0AAGsx
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Mr.Christoph,
 Thanks for the quick feedback! > That's pretty
 ugly. What additional flags do you need? 
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
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [117.135.210.7 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1umM0h-00084K-V9
Subject: Re: [f2fs-dev] [RFC PATCH 0/9] f2fs: Enable buffered read/write
 large folios support with extended iomap
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
Cc: Yi Zhang <yi.zhang@huawei.com>, "Darrick J. Wong" <djwong@kernel.org>,
 Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Mr.Christoph,

Thanks for the quick feedback!

> That's pretty ugly.  What additional flags do you need?  

F2FS can utilize the folio's private field in a non-pointer mode to store its extra flags, which indicate the folio's additional status. 
Please take a look at the f2fs.h file from PAGE_PRIVATE_GET_FUNC to the end of clear_page_private_all().

These flags persist throughout the entire lifetime of a folio, which conflicts with the iomap_folio_state pointer.
Currently, the private fields of iomap's existing data structures,namely struct iomap's private, struct iomap_iter's private, 
and struct iomap_ioend's io_private,are either allocated locally on the stack or have a lifecycle on the heap that only exists 
for the duration of the I/O routine. This cannot meet F2FS's requirements.

> We should  try to figure out if there is a sensible way to support the needs
> with a single codebase and data structure.

As far as I know, only F2FS has this requirement, while other file systems do not. 
Therefore, my initial thought was to avoid directly modifying the generic logic in fs/iomap. Instead, I propose designing 
a wrapper structure for iomap_folio_state specifically for F2FS to satisfy both iomap's and F2FS's own needs.

Another issue is the handling of order-0 folios. Since the iomap framework does not allocate an iomap_folio_state for these folios, 
F2FS will always stores its private flags in the folio->private field. Then iomap framework would mistakenly interpret these flags as a pointer. 

If we are to solve this issue in generic iomap layer, a minimal changes method to iomap framework I suppose is to let iomap logic can
both distinguish pointer and non pointer mode of folio->private. We should also add a private field to iomap_folio_state , or extend he state 
flexible array to store the extra infomation. If iomap detects a order>0 folio's folio->private is used in non pointer mode, then it store the flags in a newly 
allocted iomap_folio_state first , clear the private field and then store's its address in it.

P.S.  I just noticed you didn't reply via my resend patch. I misspelled f2fs's subsytem mail address in the original patch and I sincerely apologize for that.
I already re-sent the series as  
 "[f2fs-dev] [RESEND RFC PATCH 0/9] f2fs: Enable buffered read/write large folios support with extended iomap"
Could we continue the discussion on that thread so the right list gets the
full context?  Thanks!

Best regards,
Nanzhe Zhao

At 2025-08-13 23:22:37, "Christoph Hellwig" <hch@infradead.org> wrote:
>On Wed, Aug 13, 2025 at 05:21:22PM +0800, Nanzhe Zhao wrote:
>> * **Why extends iomap**
>>   * F2FS stores its flags in the folio's private field,
>>     which conflicts with iomap_folio_state.
>>   * To resolve this, we designed f2fs_iomap_folio_state,
>>     compatible with iomap_folio_state's layout while extending
>>     its flexible state array for F2FS private flags.
>>   * We store a magic number in read_bytes_pending to distinguish
>>     whether a folio uses the original or F2FS's iomap_folio_state.
>>     It's chosen because it remains 0 after readahead completes.
>
>That's pretty ugly.  What additionals flags do you need?  We should
>try to figure out if there is a sensible way to support the needs
>with a single codebase and data structure if that the requirements
>are sensible.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
