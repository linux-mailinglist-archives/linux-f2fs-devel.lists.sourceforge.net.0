Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B352AD6491
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jun 2025 02:39:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vsAYqE9lHLTIZVcLVl7Nlh6/3xi9se3iH3xGo2GmZaE=; b=g78M5K14q6T6r+v+VNv1NvuSZB
	HjFLaIkeQwV5xqGIV+d8EcESrSfvPOwej+RaqnPKu7PHUihSsUzszNSzXReVT3Sd0NxWYFaqzsn2v
	G0UE3BSJwuoD7ZwpdjoC5Lq/LHOYGc5jylNfJb4eXnog80yst1OOgzsSs2T3LvUkf6Ro=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPVy7-00089U-UH;
	Thu, 12 Jun 2025 00:38:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Simon.Richter@hogyros.de>) id 1uPVy5-00089N-HT
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 00:38:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rHb51+B4XIz92PrLpHboKc35VHlaIbhcQ3UJLkZ34Q8=; b=BJVQdzvUdmsdvh/8NFAnOlSchY
 0mqVIT0daAaAKcKKWPWZOg1PGs1w0KbevaNNYNi/12YXNBZe/lHXjxduITbrZofLIDt/+pr2nu4Tn
 EDLh/8hgrznELmniusxARjiZjkK8YSiaQAA5te07sMA0h8quNQHnsYOW9Ad7JPlIweUE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rHb51+B4XIz92PrLpHboKc35VHlaIbhcQ3UJLkZ34Q8=; b=NXP5zsdwcCAAQ9U3Y+qtUlpwVr
 59P64MtNCKFEu6j6zXzpyK/JA1gEtzmRLSdXspJ7xkREwfHCpuwXJpKKKb7jqe9qWf8EoSOVkKWRE
 yxXqaWxtWslEze3Cq/32ElfmXeVcN+Lc/k2czVs7rclquCJ72aL0+nDKSj9J/YEbWzlg=;
Received: from psionic.psi5.com ([185.187.169.70])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPVy4-0006zX-KZ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 00:38:57 +0000
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown
 [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 6EA343F1E0;
 Thu, 12 Jun 2025 02:21:29 +0200 (CEST)
Message-ID: <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
Date: Thu, 12 Jun 2025 09:21:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org
References: <20250611205859.80819-1-ebiggers@kernel.org>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20250611205859.80819-1-ebiggers@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On 6/12/25 05:58, Eric Biggers wrote: > But > otherwise
 this style of hardware offload is basically obsolete and has > been superseded
 by hardware-accelerated crypto instructions directly on > the CPU as well
 as inline storage encryption [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1uPVy4-0006zX-KZ
Subject: Re: [f2fs-dev] [PATCH] fscrypt: don't use hardware offload Crypto
 API drivers
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

On 6/12/25 05:58, Eric Biggers wrote:

> But
> otherwise this style of hardware offload is basically obsolete and has
> been superseded by hardware-accelerated crypto instructions directly on
> the CPU as well as inline storage encryption (UFS/eMMC).

For desktop, yes, but embedded still has quite a few of these, for 
example the STM32 crypto offload engine, and I expect quite a few FPGA 
based implementations exist, so this would require vendors to maintain a 
fork to keep their out-of-tree drivers functional when updating the kernel.

POWER also has an asynchronous offload engine with AES, SHA and gzip 
support, these are significantly faster than the CPU.

If a buggy engine passes self-test, can this simply be fixed by adding 
more tests? :>

    Simon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
