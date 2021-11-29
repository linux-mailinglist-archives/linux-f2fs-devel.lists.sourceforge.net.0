Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 552E4460CA1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Nov 2021 03:24:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mrWL3-0002vL-Ln; Mon, 29 Nov 2021 02:24:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mrWL2-0002vF-KQ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Nov 2021 02:24:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T1rQJBqwnNHisMlYR4fHGALen8+ysX8QIhFoOZUiZgI=; b=dz6P5KAhZslgjoCYHkYJHxwnIk
 A30YJLLE3PErk+8T5Q90PliSKuLVXxz+Kcm+gNAsbhj++PbG1PE4T6Yj2fhR0jBLNELyqLQtRJrU5
 Z8ksAowCL1dJkH0r1wezRHTxJD7uJ7PrjhPwPsK3SVHOU+asXM9A+HvKHUD5QsgywHW8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T1rQJBqwnNHisMlYR4fHGALen8+ysX8QIhFoOZUiZgI=; b=OFuGd8Gwx5UULogiP6m5RkZcfP
 ogCsXruM1LWU3SCrVqWTHirzyR1+uoyaiG4zFj/keSLDnr4cp4nthntuPlhrNa8t6Fp/immRuNgf5
 kds2cuoVz/mrs4wCZ282EeKNg8CRAZ5PuEOMqcqeOG/rzb16zc8lc0Bjech45jJtsI1k=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mrWL0-00DKjz-VX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Nov 2021 02:24:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 50D54B80DCD;
 Mon, 29 Nov 2021 02:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22524C004E1;
 Mon, 29 Nov 2021 02:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638152642;
 bh=r8EFCgvSDzTmaOCHs3N1UDePob9MIZN0fkgeAg3x39c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kyup6A/K2eWSe44XuGbb8mAIvAtSZvNUzMFBNJ6Sv+C6eoC7tln/TWwcMk+32SIgM
 +6UAUzZPKBS4tUUTXFFYdSFlG4mPJUPNCPiAMjueSaUAsKTBOPmmVM8hkDXOpB03AF
 DiWMNP+dhcDgoJz3+aleWrpkUAC95kdS4THSW/MoEWymfh/7x5UoKC0ienum2HjKKC
 0Z6C1npJvfrWOuSSJaxXrKA6L1/AA6xdLAYEXKw+lfFF18eGU3prdKdQszfkArSs2O
 HZKnM/QCbCx9p95H2wr+OQjtw/EhFLeiyn5Kitpe2mILOrxvSVlSEBE+yquMzzeBQ5
 09MRrBsX81meA==
Message-ID: <3b6217af-f4b1-a3e7-e855-6f22da94f005@kernel.org>
Date: Mon, 29 Nov 2021 10:23:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org
References: <20211129021341.162422-1-changfengnan@vivo.com>
 <20211129021341.162422-2-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211129021341.162422-2-changfengnan@vivo.com>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/11/29 10:13, Fengnan Chang wrote: > Previously,
 compressed
 page cache drop when clean page cache, but > POSIX_FADV_DONTNEED can't clean
 compressed page cache because raw page > don't have priv [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mrWL0-00DKjz-VX
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs: support POSIX_FADV_DONTNEED
 drop compressed page cache
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/11/29 10:13, Fengnan Chang wrote:
> Previously, compressed page cache drop when clean page cache, but
> POSIX_FADV_DONTNEED can't clean compressed page cache because raw page
> don't have private data, and won't call f2fs_invalidate_compress_pages.
> This commit call f2fs_invalidate_compress_pages() directly in
> f2fs_file_fadvise() for POSIX_FADV_DONTNEED case.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
