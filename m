Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24483B3B09B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Aug 2025 03:50:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0CK/683tNdmOf1/fRl0DGJB7Vb537jb/tWcd+EAx+w=; b=jh21PPR4amCw+ReTtdgcM9fjET
	TK3uwy27rJ6T5ovnazrRDzVRs8LYpWaaw5a83gRPUhlfNBKZmFbUlOMOW7s42lBKcow+0QQXOGcxw
	7FWyJShr7NKwey5vDfeDhJbM2VcRSRKwAjX6JF/boK56FWc4lhxJPeaRQh0Yj6pgufy0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uroFW-0000T9-FR;
	Fri, 29 Aug 2025 01:49:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uroFV-0000Sw-Eb
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Aug 2025 01:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hWXcIrklRFVZXxi331EGkfeMu1Ckn7G5H8lF4hU7UBo=; b=NGWH+6X2p28HcaIzK0H6SbRuLo
 aNyclBFBcaekTLoOuwR8yX+POPGLyaIsQNaWYqco1+7sM0fCvSpVPBp9XOWEoNQcI46DhNOr9XQyL
 2fSDDZP9A1Ak20N0lNWGqWwzSEzYzqI00VaR1avBS8phQQh/dhxd+WEfiTg0rf1w5FEI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hWXcIrklRFVZXxi331EGkfeMu1Ckn7G5H8lF4hU7UBo=; b=J+qm/4nK0jnaQ7gluEkOPmXvM7
 ySQmOUxt/7B5Dt0R8A94HvRcKRnp37qagVHoH0Q7sW0PlHqNAQsMATHGmyOHz5jhudDNB0avv6aSi
 hW40Xplk6gA7a6NAggwqUSHIeKIsdPUl8bPNwfXB9pvZU13PKt3n0JVzI3xhEnwuXajY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uroFV-0007pv-R3 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Aug 2025 01:49:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 77C714520D;
 Fri, 29 Aug 2025 01:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDAEC4CEEB;
 Fri, 29 Aug 2025 01:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756432188;
 bh=Eu1BSwSInxMgvQoeohi3KMf0iLlpoKYw/iZCtLnN0fQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=OAsm3wprq3omOxrJZfjxcvqLvc5ivyHGY6oxuHg3iDzSBWJ3Gcfyj2Z5CNqahMhMV
 NNAhKLQg7QlydoisOlNFDMwSOdU1tee0Y2Cbv3mdQ/D+zK4dEPOV9kvvsHzsSeQFUF
 OXOdcDtzs0PfsFcSrsbOCoJ8EtkqVpWY9CDc/T7Yer7D46pXN8TpFGTECKA80XrtwN
 oKuhf8InNVb1d8YSk/mGx4v562SKlEW7VQNfXRDveFAZHZBKhk4RpMmRct5/zahWSS
 g3lYbk7I5WNllQktvZyC/025jUci0qiI2eQ1iN2ikKo6z8LxAxN59fpLHPAkJ9ysm3
 mRM0Thrk886OA==
Message-ID: <3a821b08-4fc1-4dbf-b3e5-d142e61d307e@kernel.org>
Date: Fri, 29 Aug 2025 09:49:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Liao Yuanhong <liaoyuanhong@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 open list <linux-kernel@vger.kernel.org>
References: <20250828081130.392736-1-liaoyuanhong@vivo.com>
Content-Language: en-US
In-Reply-To: <20250828081130.392736-1-liaoyuanhong@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/28/2025 4:11 PM, Liao Yuanhong wrote: > Introduces two
 new sys nodes: allocate_section_hint and > allocate_section_policy. The
 allocate_section_hint
 identifies the boundary > between devices, mea [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uroFV-0007pv-R3
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: Use allocate_section_policy to
 control write priority in multi-devices setups
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/28/2025 4:11 PM, Liao Yuanhong wrote:
> Introduces two new sys nodes: allocate_section_hint and
> allocate_section_policy. The allocate_section_hint identifies the boundary
> between devices, measured in sections; it defaults to the end of the device
> for single storage setups, and the end of the first device for multiple
> storage setups. The allocate_section_policy determines the write strategy,
> with a default value of 0 for normal sequential write strategy. A value of
> 1 prioritizes writes before the allocate_section_hint, while a value of 2
> prioritizes writes after it.
> 
> This strategy addresses the issue where, despite F2FS supporting multiple
> devices, SOC vendors lack multi-devices support (currently only supporting
> zoned devices). As a workaround, multiple storage devices are mapped to a
> single dm device. Both this workaround and the F2FS multi-devices solution
> may require prioritizing writing to certain devices, such as a device with
> better performance or when switching is needed due to performance
> degradation near a device's end. For scenarios with more than two devices,
> sort them at mount time to utilize this feature.
> 
> When using this feature with a single storage device, it has almost no
> impact. However, for configurations where multiple storage devices are
> mapped to the same dm device using F2FS, utilizing this feature can provide
> some optimization benefits. Therefore, I believe it should not be limited
> to just multi-devices usage.
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
