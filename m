Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1465C47035F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Dec 2021 16:00:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mvhNR-0005Yi-1z; Fri, 10 Dec 2021 15:00:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mvhNP-0005Yc-Ch
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Dec 2021 14:59:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cvTezRuWua0J0rF6cdDR0KmEAscIr3w008OxOrzmm14=; b=flQaJIfauQqr4sp0uqC82PVUgq
 9S/R1JqMvpyjcjRmI5oHt4mqVioUYz72AXRwlqx1ki480/f8PpK48ed1SAXpqaJlf5n1IO22mezYH
 0lSaEpvOdOIzC1rK8Vd7jmTNjWmtIJCVPbAjtSblhpiVWo9nDg0vMVFq7G/ZMX26x82s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cvTezRuWua0J0rF6cdDR0KmEAscIr3w008OxOrzmm14=; b=QDdbf4PDnVJEG19ivK7jwNoj8P
 Evm94hpCnZmFyxLlaV2HrQRauq4hWBXG3p2ufsAfZPc2add8frSVYObdcUSQFxcObx8ug1VTj2Nfb
 nZU71O2SJGzTNMaD2W9VnRlJ9CR77pJBVl4TTExmJ/s0UWaeAbEJx0cFuikhd/hejgMU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mvhNN-00BDGi-O6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Dec 2021 14:59:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7CAFFB82873;
 Fri, 10 Dec 2021 14:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6210CC00446;
 Fri, 10 Dec 2021 14:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639148382;
 bh=PdbfVC9mP6F4V4P5AhVme4cHoFX8hGaC2COLxZT+mek=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pbCIj0pVv7KJ4MtXlVCG0xTc5YEHB4HRRTIsiN5hMHDtq+Vp5Kp9QxArEAAU4f8zW
 nnpeiBbnZl6Mi7zBlTlVZx+FbAm5ghKAQuDCK8McngaMoMc80RWe3T7wvhO1fSzb/J
 5w+rnJvVfR9B3f2VfkATqGXNQ4YnVqzyp5IEKSjhjgu7TeP9IVwnde7dIGItVVThCI
 UBQOdc48Y5sLxs5z+cjN8uIHY9SOXZhQ6Ym1glDDIFOvEtBlZ/Cpg5Sg4YX+yeynOi
 b/GBga8Ngu6vZLz7gl+6DPf0a8XhqsNqGm5ZtDH/FJMCuqb+x4Xn3TSKjdOK9RykoB
 J/GK/XjGQBzQQ==
Message-ID: <139522fa-ad23-ccce-52cb-e7fa9caf2394@kernel.org>
Date: Fri, 10 Dec 2021 22:59:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Hyeong-Jun Kim <hj514.kim@samsung.com>,
 Fengnan Chang <changfengnan@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <CGME20211210043017epcas1p38cc53389a50e33752e97618498b18f33@epcas1p3.samsung.com>
 <20211210043012.180588-1-hj514.kim@samsung.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211210043012.180588-1-hj514.kim@samsung.com>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/12/10 12:30,
 Hyeong-Jun Kim wrote: > There is a potential
 deadlock between writeback process and a process > performing write_begin()
 or write_cache_pages() while trying to write > same compre [...] 
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
X-Headers-End: 1mvhNN-00BDGi-O6
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: fix potential deadlock of
 compress file
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
Cc: Sungjong Seo <sj1557.seo@samsung.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/12/10 12:30, Hyeong-Jun Kim wrote:
> There is a potential deadlock between writeback process and a process
> performing write_begin() or write_cache_pages() while trying to write
> same compress file, but not compressable, as below:
> 
> [Process A] - doing checkpoint
> [Process B]                     [Process C]
> f2fs_write_cache_pages()
> - lock_page() [all pages in cluster, 0-31]
> - f2fs_write_multi_pages()
>   - f2fs_write_raw_pages()
>    - f2fs_write_single_data_page()
>     - f2fs_do_write_data_page()
>       - return -EAGAIN [f2fs_trylock_op() failed]
>     - unlock_page(page) [e.g., page 0]
>                                  - generic_perform_write()
>                                   - f2fs_write_begin()
>                                    - f2fs_prepare_compress_overwrite()
>                                     - prepare_compress_overwrite()
>                                      - lock_page() [e.g., page 0]
>                                      - lock_page() [e.g., page 1]
>     - lock_page(page) [e.g., page 0]
> 
> Since there is no compress process, it is no longer necessary to hold
> locks on every pages in cluster within f2fs_write_raw_pages().
> 
> This patch changes f2fs_write_raw_pages() to release all locks first
> and then perform write same as the non-compress file in
> f2fs_write_cache_pages().
> 
> Fixes: 4c8ff7095bef ("f2fs: support data compression")
> Signed-off-by: Hyeong-Jun Kim <hj514.kim@samsung.com>
> Signed-off-by: Sungjong Seo <sj1557.seo@samsung.com>
> Signed-off-by: Youngjin Gil <youngjin.gil@samsung.com>

Looks good to me, thanks for Fengnan and Hyeong-Jun's report and Hyeong-Jun's
fixing. :)

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
