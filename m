Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9466FAD87F4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Jun 2025 11:33:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AM3TJa9T3JKStN/Wu6+DodCnr7oplnfwpDBz4yRPGC8=; b=A0ICT2EqAsD1bGQHumUTTk2UVj
	Um5HRvgBH7WB5zpH5mY26Tl/Dxn9egM11NAy/rNJLaB1SyApbHM1xHxKjKHWyNkXzNKjDE0tSH4qY
	6ui+cOotNZOiPTR0Uusmzqe2+Kkv4cSxvPtpXIbZuUoAEXPtDiJWWUThOBNA6kCYWtY0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uQ0nC-0000UT-CE;
	Fri, 13 Jun 2025 09:33:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=8259af038e=maxime.mere@foss.st.com>)
 id 1uQ0my-0000Tc-Rd for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 09:33:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dhCZHLOoz/DA9KLk72kzXl6//47HjrLiscmsJROqQU4=; b=IrzxyOTy36fNtiMauvmKrrUTh+
 f5U4mTwPp5Qb3d1df4q6qst2KkfHLVz/klGHOsj+vk+bw6rWbx9Th0ZNHZg/1rikXIpwJci0Hm6m5
 qthCDq2MyoImrVcNfQwikg4hcWrIONkoFP3mfxkwr+OYSTyrJ2U2K0Pp8bxqOKxJ3MAk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dhCZHLOoz/DA9KLk72kzXl6//47HjrLiscmsJROqQU4=; b=hUNKl8INaYJXVnBq3pftoujQMJ
 pp8aHhvLzskLuouin+DM7B9NH+xR0PnQELsEXLiOw9TkHvyOaZ5IDOERmJk9caY2HsF8KLAve/xCS
 xPxTdexTxFi2Z33PM3Ts25Butj6ppX1c52STcXIV8dWmtwjZ66o9Q34O98TKdJGxzE+Y=;
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uQ0mx-00086z-KR for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 09:33:32 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D7x6wD001805;
 Fri, 13 Jun 2025 11:02:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 dhCZHLOoz/DA9KLk72kzXl6//47HjrLiscmsJROqQU4=; b=TJC+HIwQFnR8RuRE
 wppUKNBTKL3/NwpFH9nE0ngb/rqF9Lu/ileLRgMIYn9UyLjZyEKItkKvekDrpNco
 CH2Ar921nY18Xdl/0P13yXdoS1ZBzpkgQY+25liPF5pVzK8R6E9CTtow/QLDHGU6
 yPdG0oZwXpqhwfLaDOymuGleYwO6An1dIpbs9rOSkv8i7GQoffy8c3UWJ+uMlfvM
 tauK1RzCWrm/luM7ZBmnYOHOabBLRh89Nw6WHyd9Vc/fcI6/JJ5bdV1tgLduLKaj
 fzoB7FPeV6Etip+hdlvBfqPA2PiZJrvr7H+x16QQsMmf1UpyJFlDeSmTAZ3RplPw
 qdJ18Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474ajaktns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jun 2025 11:02:23 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8DF594005E;
 Fri, 13 Jun 2025 11:01:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DA3C7B9447F;
 Fri, 13 Jun 2025 11:01:04 +0200 (CEST)
Received: from [10.48.86.103] (10.48.86.103) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 11:01:04 +0200
Message-ID: <8f4c2f36-71af-4c84-bcee-2554cea991d0@foss.st.com>
Date: Fri, 13 Jun 2025 11:01:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Biggers <ebiggers@kernel.org>, <linux-fscrypt@vger.kernel.org>
References: <20250611205859.80819-1-ebiggers@kernel.org>
Content-Language: en-US
From: Maxime MERE <maxime.mere@foss.st.com>
In-Reply-To: <20250611205859.80819-1-ebiggers@kernel.org>
X-Originating-IP: [10.48.86.103]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, On 6/11/25 22:58, Eric Biggers wrote: > To protect
 users from these buggy and seemingly unhelpful drivers that I > have no way
 of testing, let's make fscrypt not use them. Unfortunately > there is no
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uQ0mx-00086z-KR
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

Hello,

On 6/11/25 22:58, Eric Biggers wrote:
> To protect users from these buggy and seemingly unhelpful drivers that I
> have no way of testing, let's make fscrypt not use them.  Unfortunately
> there is no direct support for doing so in the Crypto API, but we can
> achieve something very close to it by disallowing algorithms that have
> ASYNC, ALLOCATES_MEMORY, or KERN_DRIVER_ONLY set.

I agree that software drivers are more efficient and less prone to bugs 
than hardware drivers. However, I would like to highlight the fact that 
certain ST products (the STM32MP2x series) have features that allow the 
loading of a secret key via an internal bus from a Secure OS to the CRYP 
peripheral (usable by the kernel). This enables cryptographic operations 
to be delegated to the non-secure side (the kernel) without exposing the 
key.

If fscrypt no longer supports hardware drivers, then this type of 
functionality could not be used, which I find unfortunate because it is 
something that might interest users.


cheers,

Maxime


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
