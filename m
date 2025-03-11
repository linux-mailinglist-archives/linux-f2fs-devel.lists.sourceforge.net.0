Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23623A5BFBA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Mar 2025 12:49:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1try76-0001Fj-FL;
	Tue, 11 Mar 2025 11:49:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1try74-0001FW-OY
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 11:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R8Q9TUFUcmUCmJa8fuQjdoN8lxpUwl7YK8Kj11w5jfs=; b=PZaMKngFBEe/bK7ddirLiaEVeW
 823LXV7fWgfQwZxQECJav/y8TRdoPeUFlcMiflp4kfdg38mlxkZGokQVbHt05uRq7kNAigo4z+2bF
 i6+vqYiTcnjRc3qZPhvmo9qF9Q045KgFW65Xr+vGlHpOwxWGIowRUAWWiQfm1CtS3KG8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R8Q9TUFUcmUCmJa8fuQjdoN8lxpUwl7YK8Kj11w5jfs=; b=Fc0UcSdoHhrcTZZlvFYDuq1y4Y
 4qlpQK1+V6pGvXSOVZ4H4ZcB8ZNp5XtTJmY4GOBGUju2zeVsZ91gExoszF/gMJOhTFlO41bTsGHmo
 GkUTu6cKeddE/X0LySyuIF3+hBePekFUeFykW8EulpcT+hW2NmQzeIJok2ADyyRQajws=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1try74-0003Y7-E0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 11:49:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4715E5C5D87;
 Tue, 11 Mar 2025 11:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D4AC4CEEC;
 Tue, 11 Mar 2025 11:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741693763;
 bh=RtjSiZtx5omuFVg3avMcut1p0gnfZssAhseajHHPr5c=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=chWHYSeoYN7DxCjeFmSNIxTZyecfSPiPv1WZ1L46vIVia4h6q/c7NUp+RzR2ej/z2
 q80vj4HBsRTxrF4C10sZMZY6RrMWg+KTxQLdmfd3zFO3LFjaAVWlNlIpZYkKVMr7Aq
 zAVaotKqssGj4PcJrkATS+Ci/2B3wE29k4APunWMeZjf6uFosxrce7MyDpElbQOYeC
 PS9fE1g9b6Uj7hMJzUAhjswjuU3iNxcLIuKCoVFy8B0UiVAAp3RSDU4XSalAlNVitX
 18qK/ndr4AmkSsqBD13fv7ezf70avEWxMPImoYgaR9PlPFkLM/kddLedXBxtnm0AqU
 TThGUwWj965ng==
Message-ID: <254201ba-fd55-428f-9bdd-431f51e3aca4@kernel.org>
Date: Tue, 11 Mar 2025 19:49:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250307182151.3397003-1-willy@infradead.org>
 <20250307182151.3397003-5-willy@infradead.org>
Content-Language: en-US
In-Reply-To: <20250307182151.3397003-5-willy@infradead.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/8/25 02:21, Matthew Wilcox (Oracle) wrote: > Mappings
 which implement writepages should not implement writepage > as it can only
 harm writeback patterns. > > Signed-off-by: Matthew Wilcox (Oracle [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1try74-0003Y7-E0
Subject: Re: [f2fs-dev] [PATCH 4/4] f2fs: Remove f2fs_write_node_page()
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
Cc: linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/8/25 02:21, Matthew Wilcox (Oracle) wrote:
> Mappings which implement writepages should not implement writepage
> as it can only harm writeback patterns.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
