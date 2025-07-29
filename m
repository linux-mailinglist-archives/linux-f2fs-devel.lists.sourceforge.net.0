Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 088F9B1469D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Jul 2025 05:08:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eeK4xXJ1HOsFCyPwwiXcXc9ksOwX2ZVfGRDxpZ47r1M=; b=RDaFMhlded0HNwsnf/myV9xakF
	T386acLzsajpFdfIgTbqa+LLimGcxh9vYPz1HMWwMX41e4RXSvw1UKh/IbS4VciKjIwj7vRsw4MTw
	SN+e7NVmAS/tha/5c/qdtEM3TrXCxoKaI9Pqzw3yjiTvqbTWV2GCwcHHVNCZs8nl01y8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugahB-00058a-RC;
	Tue, 29 Jul 2025 03:08:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ugahA-00058T-JS
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Jul 2025 03:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tr/FZoJY9Et0RL+y4LY0V6/YV2k/A3OTRfhifBJFB7o=; b=gHQBszgRcQypirzHgi0Zk5OpqY
 Mv8Nn8pl6FrnBIoLk3W3udAr232DBOEWATuDhYANjPoj3noqKhc1Qsvfzus2k0DXvfwXyUWTr388Q
 URqpmvgohKyZTKnQwd6HGmzCVmaYAA6zmJSzvjyF2lQG7OlJzyO8QgUQYwO19NVSoNHA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tr/FZoJY9Et0RL+y4LY0V6/YV2k/A3OTRfhifBJFB7o=; b=HVU7MtAUr3GRyAeGXlOmCitB0P
 9oqjdpPPNBJb/KyIO1fGMBT79vtMwDIxw2/c1+W9QUdvMEmYlg3hvnZ9Ze4bRlbx3/nXl0Cz0S3Js
 KgsVm5HitZaD2+NaKHRD9QnXn6ymGU3r4k481rKB5mkPsvdywhC8PFNGQiqIRNL8yp/8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ugahA-0003Qb-5A for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Jul 2025 03:08:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C8FB541948;
 Tue, 29 Jul 2025 03:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A7FC4CEE7;
 Tue, 29 Jul 2025 03:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753758473;
 bh=xcALEbgUz/7qIDmcQiH+whC1AnTY3y4+NqQZh7ygwpU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=XUoJmJPCfxyfq6qh/SeuQbJ8fMqWcKlUwrZ8D+V1VaIGTI6W3z9T8EeX+GNtF7fUg
 vuWyZ5S7ZPJ5zhRjt1If5zbmNj/97rONZsvdwX7PfYJ9LiTzboh1T1BEbJOz6TC6BX
 9qdl0UMb53/0bDvgQBDBE3/oqrLILiTTr/LYfDELyGqTAOYA/DkVclMasV6kDznE84
 q3LN9kKz6oMXUc+Eu7fQu1gweLAC/SvH41os2g3YFWN8/rKx6GM5jNPRoKiDKebzPm
 EGZfZ8U38asGgQZjHLhXm0ryH1TSiJPqfYuEw8iHWFiffx84wjo+G0V9meIvzj+pIw
 R68ILSH7pt6dA==
Message-ID: <10a7334c-29be-4f04-8e4f-746491959ef1@kernel.org>
Date: Tue, 29 Jul 2025 11:07:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250728170430.1060976-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20250728170430.1060976-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/29/25 01:04,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > Add this to control GC algorithm for boost GC. > > Signed-off-by: Daeho
 Jeong <daehojeong@google.com> Reviewed-by: Chao Yu <chao@kernel.org> 
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
X-Headers-End: 1ugahA-0003Qb-5A
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add gc_boost_gc_greedy sysfs node
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/29/25 01:04, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Add this to control GC algorithm for boost GC.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
