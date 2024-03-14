Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B88287BB76
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Mar 2024 11:40:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rkiVa-0005So-PR;
	Thu, 14 Mar 2024 10:40:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rkiVZ-0005Se-C0
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Mar 2024 10:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s+flQKqZdkl7ncVdTsyDYkHNPMCGi8yAmeAgPG8I6XU=; b=FKfk2PuLqoC+Bevi/+9MvnXscJ
 VrWWodThw6f0ko5+lFg37ntgOGcqCsMWlLOgc9Btk5Ru/aYL8iewFuBo3TdjR0myo1mpYFmTbq6YI
 CA0H0XQxfLTT0gJsCVsBaD7IjGSjtr9Otw7GpOXR89yyhpQgb/rZaW4u3WAw9NKWj1tE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s+flQKqZdkl7ncVdTsyDYkHNPMCGi8yAmeAgPG8I6XU=; b=Fq/CwBOec1HJ/c9ZeZvM/VnbMD
 iKmuUx1CzuQyYJLg70X2ygZd9LeQCIwrOdvJ1VNr87SgG+cdnNC/NDnTeyn9TsOH64CSRYjQUIqh6
 Ohy2jDMCHDyBBzAlQcVE+ZfIRz4TXCePzH7at/LnFi9dAZA7jcSotkvCRlzvKl5WKH+0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rkiVO-0004gp-Ez for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Mar 2024 10:40:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B62D1CE1BB5;
 Thu, 14 Mar 2024 10:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D7CC43399;
 Thu, 14 Mar 2024 10:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710412809;
 bh=c4J7TAHcx++DxMeKEfMzpwWlcM8HgZRjo1aIWTMX0T8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=H648jIk3Ql7cXi/pjB0JMa/jLn7TkBiUqTvdQ623gjNtaz9sC7anE41WVWe6Jx+bB
 r+Y2MdID87ILDP91BvGCUnnGDvU7oPrfIy0w8HMNsmSXkBZ2MKBoKbCapAXbUX0Ke5
 eT1WUMZDPPrRa/Mvn9XA1B6Zf2paPSmHoX3zpXx/pKQSDnD27SZyU0yiRguncpCjUT
 TwxrkbL3gns50MSsjPDOxQurs+gpGctcw8Gy0YGnWqxiCaQ33S2lA/BUcaUqB6aseQ
 UJFcdvTBTJPWW6lJcgpxSTHU9NWKjBBW+9QvYXSDmKT74cUdGFP4sZ0jZQ+lgMEusi
 pkphCrAn8MdAQ==
Message-ID: <cd8ffd86-841d-4b1e-9067-c5f0bc3d9244@kernel.org>
Date: Thu, 14 Mar 2024 18:39:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Sunmin Jeong <s_min.jeong@samsung.com>, jaegeuk@kernel.org,
 daehojeong@google.com
References: <20240313112620.1061463-1-s_min.jeong@samsung.com>
 <CGME20240313112706epcas1p2ee50d07f603422b0193f0b71bf1a75e6@epcas1p2.samsung.com>
 <20240313112620.1061463-2-s_min.jeong@samsung.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240313112620.1061463-2-s_min.jeong@samsung.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/13 19:26,
 Sunmin Jeong wrote: > In f2fs_do_write_data_page, 
 FI_ATOMIC_FILE flag selects the target inode > between the original inode
 and COW inode. When aborting atomic write and > writebac [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rkiVO-0004gp-Ez
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: truncate page cache before
 clearing flags when aborting atomic write
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
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/3/13 19:26, Sunmin Jeong wrote:
> In f2fs_do_write_data_page, FI_ATOMIC_FILE flag selects the target inode
> between the original inode and COW inode. When aborting atomic write and
> writeback occur simultaneously, invalid data can be written to original
> inode if the FI_ATOMIC_FILE flag is cleared meanwhile.
> 
> To prevent the problem, let's truncate all pages before clearing the flag
> 
> Atomic write thread              Writeback thread
>    f2fs_abort_atomic_write
>      clear_inode_flag(inode, FI_ATOMIC_FILE)
>                                    __writeback_single_inode
>                                      do_writepages
>                                        f2fs_do_write_data_page
>                                          - use dn of original inode
>      truncate_inode_pages_final
> 
> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
> Cc: stable@vger.kernel.org #v5.19+
> Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
> Reviewed-by: Yeongjin Gil <youngjin.gil@samsung.com>
> Signed-off-by: Sunmin Jeong <s_min.jeong@samsung.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
