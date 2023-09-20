Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E587A762B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Sep 2023 10:42:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qisn4-00006m-RP;
	Wed, 20 Sep 2023 08:42:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qisn3-00006g-VQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 08:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mwpy3yYeRsfNciNGira0rv3nRCtYKvHfx4gADjrco4M=; b=MR3glGgw8Yry2rRoGkMSBLUuu7
 fVPjK8miSkApS2riotY8nru7V3beL9SWZYD7Sj7fK16yFRPKtm9caYux0ZSdoLi1ry+dEB5Xy471M
 amiFKNS5fmIqfQm9Q4dv/phKFr3Od6078SGsMf1NYmZyvUzj0iC7G8jSHfdb56GxIrkg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mwpy3yYeRsfNciNGira0rv3nRCtYKvHfx4gADjrco4M=; b=k5NPFhdLTCqEXcldgs4x20T7E4
 TisBdNHOdj2GVlftLstP7qnX8YthkiipaYbX8XkUn6WdiAOCK3DxXIWF4r0ZEGTCovUq08yXf1NzN
 2+4F+mK1wcLsKoGAYaUiilNM/j/nJYEeRobRRzEQAABPGQXUTx03S7a97gnX/FahCQ68=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qisn1-00GNKW-Tm for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 08:42:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7A23D61AB3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Sep 2023 08:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C08C433C8;
 Wed, 20 Sep 2023 08:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695199345;
 bh=hEUuxuFh0kGe5BdlQv+cI5SNpDgSIM6ER49DT371oOo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=S311jB3Kt+8O6f5c17RXE3IYiB7Ag73NgmB4hz64Dqz4EwB376LIrd8JFmktzD4mp
 ap15DMpOvIGcloHuBk/lU4U1GYWEXT/03+c0wGwa5xd0j9c1b53beFg3peZ1wM6uDt
 PVwqLXNNQAGf6pNOJnhibS1ax2zNmRHuizngXgPCp1xgHPBNujrrIcNDZE8SpcY6WS
 s/Ftw/KfTfiuLu6REwTwPMmWu+vC77lIagD8+0Oo48cNY7z0V+qrwmco2be1bPJzoq
 2TSqntRl9WsTh2hbKVGFmCwhPKH0JKWo3TebB2GLlhPmnoFs9GelmAcqH5TQbpx9zZ
 W5J2Tcde7S1Tg==
Message-ID: <b86e4f39-efba-b396-d209-ba085c0f2415@kernel.org>
Date: Wed, 20 Sep 2023 16:42:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20230920004645.1462354-1-jaegeuk@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230920004645.1462354-1-jaegeuk@kernel.org>
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/9/20 8:46, Jaegeuk Kim wrote: > This patch tries to
 preload extent_cache given POSIX_FADV_WILLNEED, which is > more useful for
 generic usecases. > > Suggested-by: Eric Biggers <ebiggers@kernel [...] 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qisn1-00GNKW-Tm
Subject: Re: [f2fs-dev] [PATCH] f2fs: preload extent_cache for
 POSIX_FADV_WILLNEED
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
Cc: Eric Biggers <ebiggers@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/9/20 8:46, Jaegeuk Kim wrote:
> This patch tries to preload extent_cache given POSIX_FADV_WILLNEED, which is
> more useful for generic usecases.
> 
> Suggested-by: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
