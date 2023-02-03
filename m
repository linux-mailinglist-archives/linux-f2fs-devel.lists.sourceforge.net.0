Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF88968A520
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Feb 2023 23:01:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pO47Y-0000Ag-Kg;
	Fri, 03 Feb 2023 22:01:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pO47X-0000Aa-6p
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Feb 2023 22:01:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LqHS/Rjsc1CV+SrlvC6B1FmiKVbizNOG9aSHQ52Zcnw=; b=DYahm2ZQcHteKeD2qZPqXTv/WQ
 qXgnx0Afnp0PXrPaUNkZ9hsK/uhjM+C0Uu+Omaw7UuD467wSgNaIEPR5A40yYnXyLSv1UG8SKg1ej
 BDYliqMsC2baDiPVebRkyf4bf1mvMNsYQdtOGSRuXlfzsamCFeX0PtbgZqQ5j/09G+T4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LqHS/Rjsc1CV+SrlvC6B1FmiKVbizNOG9aSHQ52Zcnw=; b=ML8CUojq073dVv6QBH+XZBWQVm
 wuuVmSbDGFbdM1cWLqLd8JcOJKKm7GaX5KzO10UE3h7Sn0uCbDEIQMEPXNMcq7QIevbMOoFz6bgS4
 PXyYZa/hLLweDpoL1HCstHdYC2Z3OlnthInvgeDgxmqe9vOnC7rxCfTZiclzpkZJy5yo=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pO47T-0004ID-NS for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Feb 2023 22:01:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3FC76B82C1F;
 Fri,  3 Feb 2023 22:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBC5EC433EF;
 Fri,  3 Feb 2023 22:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675461672;
 bh=lJxffqdWzxp/gjecxBLsk6CKKLep4wnATuGV7wIwWXY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fSvDQVx4b8d/9omyX+q+Lkl27HbwdbA8fMo0tT6G7WLu6rxGtTrt4AV0NRvZUnLpe
 Ib82KlOwfRQRMaxdUymUnJrs1A+HbNA5YK1vneClFms3KaNbZBbtspyQF17ISFUGi4
 iLoqBpDOHm1T5xH1CHNe4U3neyHZ7f1Nk1wa0pYpR6YHIhRn4M4zNtEovCiXuCj1NH
 SB2Jhfc7SfQOIP+ltLZs4XVjrn0mnfJ9zzsPSzFs1HfbKuGRIpL+j/IUYWIJHdzM5v
 r5k2yJmMrpSpQzqg3L2DqKkWEO6P3AfJseQcA2Apa5Karc8KfqlrTYffJQc+sLkPqq
 r4E8FeRJkw7Ag==
Date: Fri, 3 Feb 2023 14:01:10 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Y92EJjAHpwmagmTb@sol.localdomain>
References: <20221223203638.41293-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221223203638.41293-1-ebiggers@kernel.org>
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Dec 23, 2022 at 12:36:27PM -0800, Eric Biggers wrote:
 > ext4: simplify ext4_readpage_limit() > f2fs: simplify f2fs_readpage_limit()
 > fs/buffer.c: support fsverity in block_read_full_folio() > [...] 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pO47T-0004ID-NS
Subject: Re: [f2fs-dev] [PATCH v2 00/11] fsverity: support for non-4K pages
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
Cc: linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, Andrey Albershteyn <aalbersh@redhat.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Dec 23, 2022 at 12:36:27PM -0800, Eric Biggers wrote:
>   ext4: simplify ext4_readpage_limit()
>   f2fs: simplify f2fs_readpage_limit()
>   fs/buffer.c: support fsverity in block_read_full_folio()
>   ext4: allow verity with fs block size < PAGE_SIZE

I'd still appreciate acks from the other ext4 and f2fs developers on these!

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
