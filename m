Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CBE9B9EE8
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  2 Nov 2024 11:28:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t7BMI-0008P2-KR;
	Sat, 02 Nov 2024 10:27:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <herbert@gondor.apana.org.au>) id 1t7BMH-0008Ou-4i
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Nov 2024 10:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jpcaovD1uzHZkdDMg5tZvb0Z9OfX74OLNrLMh/vslrg=; b=VD+BOSDjTPjjR8xd2hy7FrfEKd
 FYX22I/gUAjClIhxaDRbrs2lt40xdzN3fJmjSZA7nbcojSpBQ4+EclWSDTKyO4X+52d+FzOn36+zI
 Hw5yrFNgvKsBWjPew+/NYjODmvI1kXtsA6aD9kQTB1OIcv1FGHliN9QK6sXcs+SO/ihw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jpcaovD1uzHZkdDMg5tZvb0Z9OfX74OLNrLMh/vslrg=; b=P
 ZeLi6IuhgcfqUzS/N/Fs9XLPEyEwQLxqCd9bhH5Zn1bFZwEaBCiFPtGVFTnxfYUW8rJ89WdNtWUdT
 iQk1fe+2mXt5H0tAPFQtAdVhJbt3Vt1FaoQHuchEeWVtdzezgvifLpY7Tp975EhP10BVizRJUaOun
 QlQm2oso4ku2dtYg=;
Received: from abb.hmeau.com ([144.6.53.87])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t7BMH-0005Vl-5G for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Nov 2024 10:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com; 
 s=formenos;
 h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jpcaovD1uzHZkdDMg5tZvb0Z9OfX74OLNrLMh/vslrg=; b=Q5MjntzpHzBvczROcNsYoj+25t
 CTplAOz4OXNjmKbeHRPSkC2PF8/2CQ+S9+BpzdDOraNgbvJHl1b2XbDV1IX3zldrAMVgbCnIPBjj6
 0IWTAu3B1HtaRzbcItOeEI76Vhr65Zdrv6Hj7PnTJ9akLQTMtM7LE6EHbcKkj/xmU2QzOxWp4th0u
 J1y5NQ3M1+7fbEZEPyWTXBC1K0HGtCKB8/SuT1fdvssCL8+XduxOZjD+6GgoigCaoEwTAJWXor6+8
 4zJNFOI8kfLHoCcjY0lPk4C6G5wnEcy3WATqplhANsESpNXFLLJLZUN4OEO8S1bcBapdvZR08K4kj
 Lwh8InsQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1t7AhE-00Dxdz-0Y; Sat, 02 Nov 2024 17:45:29 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Sat, 02 Nov 2024 17:45:28 +0800
Date: Sat, 2 Nov 2024 17:45:28 +0800
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241026040958.GA34351@sol.localdomain>
X-Newsgroups: apana.lists.os.linux.cryptoapi, apana.lists.os.linux.kernel,
 apana.lists.os.linux.scsi
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Eric Biggers <ebiggers@kernel.org> wrote: > > While testing
 this patchset I notice that none of the crypto API drivers for > crc32 or
 crc32c even need to be loaded on my system anymore, as everything [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1t7BMH-0005Vl-5G
Subject: Re: [f2fs-dev] [PATCH v2 04/18] crypto: crc32 - don't unnecessarily
 register arch algorithms
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
From: Herbert Xu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-mips@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, ardb@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> wrote:
>
> While testing this patchset I notice that none of the crypto API drivers for
> crc32 or crc32c even need to be loaded on my system anymore, as everything on my
> system that uses those algorithms (such as ext4) just uses the library APIs now.
> That makes the "check /proc/crypto" trick stop working anyway.

What's stopping us from removing them altogether?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
