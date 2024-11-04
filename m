Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC579BBCEB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Nov 2024 19:10:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t81XH-0004Rq-4D;
	Mon, 04 Nov 2024 18:10:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1t81X9-0004RZ-CI
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 18:10:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t29gOT00reR4nbxlcJY0aptmffhd2gSsC1GS8E2B4Hw=; b=h9iMu0xGGGwnXMX5d9B+xd8Zqk
 K7/ksb0LnbpQLzpeaUVL/RMlxSD+v8BQr4ZZLyD51EqsyGIgcYtmksk2vOpzlVWVNql5SLAGjurOI
 guWZHbNIfJkZBvBKjnVFYx8YVRX+uMeIFmP1Bh9QqkIvViZeMAXrZLB3tE/bynL0nZVg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t29gOT00reR4nbxlcJY0aptmffhd2gSsC1GS8E2B4Hw=; b=S691U5loKmmUl6CTEYwEVA5Ndr
 81MRJrj8qt/1vaubvUzSw++dqsC3mYCRNNQvOo2U4vEwand/zFe7c6j0F5tvMG5ZmT1w26b57YIik
 bblMv/lhUzEs46Nali9V04SczqqeOEiu4MTiK7cIfJCuUE9DGAYt4a2rfrL8U6vWne4A=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t81X8-000645-3Y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 18:10:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 46F89A4251E;
 Mon,  4 Nov 2024 18:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F8FC4CECE;
 Mon,  4 Nov 2024 18:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730743828;
 bh=A9QEobhM0Tk66PTKUxkoy2PH75AkXVl7kAtDO3RqV40=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OMfO1/O0f3WTFHcevl3ZKLDtacBxMdE3BT7RFEx/b3+uCvKbbdhBTvloMt0wa0OwX
 n90Z5gcaPjxU3VikQM87AaL+farAbSj6GceGjTrdFooAVP1M8KvLcXwQ38fUeWBv8N
 nSueT0gGDtEoY8EFJAIpvIVUUWXl5Q+eF6EU53irRc2UnkG16rz8Z0sqp62Nd22MA5
 VHQu3uGLJaQJEr8WHqAb0R2V4++l7ByYkHuVDtoe7B8G75lQBftyc2Y6tQRfZwmKhm
 h8Lgj1UBc9z/xdcPqGhAJ2c/yL+WIAA6KPIsfzCpa8AVQaSz9Mv0vPpuMxziyvvJML
 5V3YtcPfQjK/A==
Date: Mon, 4 Nov 2024 18:10:26 +0000
To: linux-kernel@vger.kernel.org
Message-ID: <20241104181026.GC1049313@google.com>
References: <20241103223154.136127-1-ebiggers@kernel.org>
 <20241103223154.136127-6-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241103223154.136127-6-ebiggers@kernel.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Nov 03, 2024 at 02:31:41PM -0800, Eric Biggers wrote:
 > -static int __init crc32_pmull_mod_init(void) > -{ > - if (elf_hwcap2 &
 HWCAP2_PMULL) { > - crc32_pmull_algs[0].update = crc32_pmull_upd [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t81X8-000645-3Y
Subject: Re: [f2fs-dev] [PATCH v3 05/18] arm/crc32: expose CRC32 functions
 through lib
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-ext4@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Nov 03, 2024 at 02:31:41PM -0800, Eric Biggers wrote:
> -static int __init crc32_pmull_mod_init(void)
> -{
> -	if (elf_hwcap2 & HWCAP2_PMULL) {
> -		crc32_pmull_algs[0].update = crc32_pmull_update;
> -		crc32_pmull_algs[1].update = crc32c_pmull_update;
> -
> -		if (elf_hwcap2 & HWCAP2_CRC32) {
> -			fallback_crc32 = crc32_armv8_le;
> -			fallback_crc32c = crc32c_armv8_le;
> -		} else {
> -			fallback_crc32 = crc32_le;
> -			fallback_crc32c = __crc32c_le;
> -		}
> -	} else if (!(elf_hwcap2 & HWCAP2_CRC32)) {
> -		return -ENODEV;
> -	}
[...]
> +static u32 crc32_le_scalar(u32 crc, const u8 *p, size_t len)
> +{
> +	if (static_branch_likely(&have_crc32))
> +		return crc32_armv8_le(crc, p, len);
> +	return crc32_le_base(crc, p, len);
> +}

kernel test robot reported a build error on this patch,
"undefined symbol: __kcfi_typeid_crc32_armv8_le".  It's because crc32-core.S
uses SYM_TYPED_FUNC_START(crc32_armv8_le), and this patch makes crc32_armv8_le
be called only via direct calls, not indirect calls as it was before.  I will
fix this by replacing SYM_TYPED_FUNC_START by SYM_FUNC_START.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
