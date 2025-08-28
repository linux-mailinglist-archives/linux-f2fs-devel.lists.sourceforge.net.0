Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4005B39224
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Aug 2025 05:19:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fFYurbwfwVBQ5uW8Xs/hIsmtCunp9H1ZsLwwdkZuhY=; b=MliEu7vaA8W/cFUUNkBwVDChj6
	RtBbNLpvTIvnhuH1Cq2z9TXndZwotCXMUAnDv9POVJVFavNdvqzOJNV4fZ+O+dFb731KUF83rKtJV
	oxxXdLzrvcEN5mgGAiain+59bjdVic0MjNBrTmjY0zUjpbY/v5vetu/zMugR5M321B18=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1urTAU-00075J-CE;
	Thu, 28 Aug 2025 03:19:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1urTAT-00075C-80
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Aug 2025 03:19:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rQuB3SaprI6uaRfQeEtl8sPTp3QINzUHmIy4iyLV2xs=; b=gqn5eKGSavaWxJ98XOyl7tOgeK
 flISVRJjRmNbqfAMxiN/ejnMH3emYzHVsXlVjZqSeMB4SxSzF0EjLX8ubObwJrpq9ePR3dN5+92nU
 Z716o/08jJrLzeB92uZM0EDdZyzQ5Fd+vCMo8iSiVTmUeaxTjcJ7m4UMz7sGsJYQK37I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rQuB3SaprI6uaRfQeEtl8sPTp3QINzUHmIy4iyLV2xs=; b=ZZPn7cC04RyzOpLe+QFLl21PJP
 AaYuCRGAzUOozZQMajCCk8dewsPL/kGwxWxIsHuVMq25RaX9S4WWx14SMnlMjMs7BKCAZ0KvgUAcj
 G4KiCJiL8rnLuzaXSCKqOd7yyF1ndkUIwEx5BeFvJVqmj5o+bulNerzoG3EFJdF5ypLA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1urTAS-0004xO-9g for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Aug 2025 03:19:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 78818601D3;
 Thu, 28 Aug 2025 03:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB26DC4CEEB;
 Thu, 28 Aug 2025 03:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756351144;
 bh=rQuB3SaprI6uaRfQeEtl8sPTp3QINzUHmIy4iyLV2xs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=gRz3iurl7RyBHKWuK5jzv2kRkwKoH1OOVyaIOCY+e8cqj6vfuaJK20JPSb3tykf+n
 oOmQMNeJUOqh1PdufC8VhrNBUxC3mKcBqlHQuVZ6jttN2y3EOSlgMFBgJIIDqPBszp
 fNvqv6WYlprfLzdeu5NiSi407UB8OaAfZoAkhqRJu+mAZeNRsgJtI3oHmXuVR0IoiQ
 O8fx/6N809D3YlamVsd562D1wiy96qch3ETpsc4AQdv+2oo4tI80XKVt6xJ520bUEJ
 UldGS60oZSsDyVbHatKgRNyNRa9NjqVUwfN18e3D/S3As/vChmZuw/Aw0A3lUepa06
 rB45BVaAe+g8g==
Message-ID: <2cdf3112-36ee-47a6-94d9-9a007f1e2e47@kernel.org>
Date: Thu, 28 Aug 2025 11:19:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yangyang Zang <zangyangyang66@gmail.com>, jaegeuk@kernel.org
References: <20250827061507.1340092-1-zangyangyang1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20250827061507.1340092-1-zangyangyang1@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/27/25 14:15,
 Yangyang Zang wrote: > Signed-off-by: Yangyang
 Zang <zangyangyang1@xiaomi.com> Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1urTAS-0004xO-9g
Subject: Re: [f2fs-dev] [PATCH] resize.f2fs: print resize size
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
Cc: Yangyang Zang <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/27/25 14:15, Yangyang Zang wrote:
> Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
