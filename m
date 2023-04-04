Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC326D5DE9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 12:48:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjeD4-0004bI-VI;
	Tue, 04 Apr 2023 10:48:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pjeD3-0004az-1Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 10:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WzC6479M0Mn7+VA9ksLc3VFQGjPqxcuBdifmm5b3nKg=; b=UndrCUu0Bty8Pof5LVN8/Rrfrw
 J4DnyEN7q4z1JJderyY5wh2AJVAWgXguDPLnywEOSRwivsxwxLI65IxsLmenfWhuHrWcMtrcXlf59
 UfJI1SsoT1CdG/GwVTgb23eA3coE5U9zIsNVIEo7jrTu2kt3DSmlpiU3fL5p6rMaO8LQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WzC6479M0Mn7+VA9ksLc3VFQGjPqxcuBdifmm5b3nKg=; b=LRVj8szQBgeuS+ZHBSnr2PvSmz
 x6Dlp//f5Z121zz47D3hnXr4448MpGxUBlssqU8NNS0XedwljZs31oBDy+om6Nrwx7/lkIkIbOhsl
 w0cJDvGm7sR+IziwDxwjB85tv9wpXrB8ee1G69DPCMJW2ezMB+h7Ed5kXmcsZmqIdzvM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjeD0-00065y-JE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 10:48:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 31F6163167;
 Tue,  4 Apr 2023 10:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94DD8C433EF;
 Tue,  4 Apr 2023 10:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680605288;
 bh=5m+oqv+VG4vlFEAz1qs/LGut7wc74gTjeaa4PysObi4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Hc1x1Pbis7mqXeu8Cv9dHaLD4Rj1AXAYEybuq5NAf6ZbBa0dR27od/rXDYDBcJbiD
 H06f0TQQk0+kRvEmeTjcjFASsw0/RruC/rqZ7i4RpUxsvDZ4TjQGfIPOe/5ECyQaaR
 lmVUiDD7lFJTMOhJw5gXA6HD5vfWgfYSvEHU8Gc6kQfS7Pn8jX98DJlXS5JK58X75q
 n43loDc4AOtfEJWydPWV172r9O5ekkCz0yqwOsUCpYKu+etWU3KUmb4hEYfMUbuJuy
 1J9puP/WIciJ0i4CeIA+0E1jpmw1JW2AtU3SRMzGDsYGvfYoJjQYPL4mb1/YlHHpLG
 ytbCe1ug+v3hQ==
Message-ID: <4ffab766-c1ff-e009-f6e4-a602c4a0db79@kernel.org>
Date: Tue, 4 Apr 2023 18:48:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230404040051.50726-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230404040051.50726-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/4 12:00, Yangtao Li wrote: > There is only single
 instance of these ops, and Jaegeuk point out that: > > Originally this was
 intended to give a chance to provide other > allocation option. A [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjeD0-00065y-JE
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: remove struct victim_selection
 default_v_ops
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/4/4 12:00, Yangtao Li wrote:
> There is only single instance of these ops, and Jaegeuk point out that:
> 
>      Originally this was intended to give a chance to provide other
>      allocation option. Anyway, it seems quit hard to do it anymore.
> 
> So remove the indirection and call f2fs_get_victim() directly.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
