Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34841AB31C2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 May 2025 10:33:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SA/anpYl4bLvT9ofUe7spOwsx+G1Mp8GGNQV1X5dlaI=; b=dgrmcFxKNyEu3Ffvl8ABzUHueC
	EMMOq+Me35jxmLv2/wYRkyDouUmTou3P/m0Q+CceQztMwfTPnv18wCtVR5Xd3zPTdky1UOi4UvY/u
	OlyNpdy3ZX9jlSHXzdmXrott2pdudw9yoLdbvwNFEbiXqiiTek/0WqqOy3mI8w3ZpW7A=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEObR-00037q-CL;
	Mon, 12 May 2025 08:33:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uEObQ-00037f-8A
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 08:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/5uksM4q4xMAWezn0yFV8U+zpb/7Eo7ftBs334/3ZUE=; b=FWw2MQvcNlqlNYZ+ji1W+BFnPb
 bpgCRZ5wjMFla9HLinZbxlXtydVFJFVeq64YmesZ8JGPeqaz1GUJO7UONc8bvOw7fGN2d/ve0AM1i
 5UsUzLcARqc8GKhSDVvto2Q7juhWQVaDU1PjpkjEDAvIqtMqDkXRll84ERVWdhW2HpDk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/5uksM4q4xMAWezn0yFV8U+zpb/7Eo7ftBs334/3ZUE=; b=XKPJPuOKEvDJF3b1VsUVf9DKoO
 O5HvOWtOIyWRDvmCaFBKr/l/gHlsKFonn0E5qZ5Wx9gR99Uc8NtiDWELOhS2VBClUQwV7zLQxon8p
 I1BS3GlV+mzuz/dPjJhWSPpUv6BhTq1IGrGBlGQ3yXSwoxGz7YQxRiuVtadY2LYfPtY8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEObL-0007Me-Ku for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 08:33:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E85FA61127;
 Mon, 12 May 2025 08:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337F3C4CEE7;
 Mon, 12 May 2025 08:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747038805;
 bh=nd5duePhvVCM8OdU6yge1gCN+fxPPRrIUgs4u3xivPE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Cts/VSrejSbRfItH6vXzHbogmV1M99xLr/djEvLIA8a8tmlcvEqV8QXJV1ptNsoSC
 Q5Wwpy2WU0wzlmCuK2ss1R5GxDY7/84YvOq1DxbEFt/A9aC0qEu8NTvqg/VBHvElIe
 1MGtiYdv5JKCh8GrmlTiFLGhJDlM0M9FcarBw+I+MJTIJKreHlKs7a4sNkMTctnf/U
 3nxDntcG2ntkPvTwP0Z6uihDRIEZxOZnELOD6EWbR/PfW1hp0WWOn4yhydGk8unxQb
 DSLA1tlmo/DC/LAjsczqn/m1+wnUfcH+GL4hlH20JzidqqtHJ5wx1uyjjBYCmoEFDb
 8D16MvNWfppOQ==
Message-ID: <f5c3fe27-78af-45f4-b76f-458dbcbbb0fe@kernel.org>
Date: Mon, 12 May 2025 16:33:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org,
 daehojeong@google.com
References: <20250512073611.718-1-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250512073611.718-1-yohan.joung@sk.com>
X-Spam-Score: -1.8 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/12/25 15:36, yohan.joung wrote: > In LFS mode,
 the previous segment cannot use invalid blocks,
 > so the remaining blocks from the next_blkoff
 of the current segment > to the end of the section ar [...] 
 Content analysis details:   (-1.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uEObL-0007Me-Ku
Subject: Re: [f2fs-dev] [PATCH v5 1/2] f2fs: add a method for calculating
 the remaining blocks in the current segment in LFS mode.
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
Cc: pilhyun.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/12/25 15:36, yohan.joung wrote:
> In LFS mode, the previous segment cannot use invalid blocks,
> so the remaining blocks from the next_blkoff of the current segment
> to the end of the section are calculated.
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
