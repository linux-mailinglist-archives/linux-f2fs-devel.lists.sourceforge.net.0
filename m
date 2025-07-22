Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ADDB0D03D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Jul 2025 05:23:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ti/Im59Ory4lM7oCvypyWPm3jByE1GnrFfG+c7aVnfE=; b=PI5FssUkaYxxBW8lo97nZNi44d
	4n38o9PaC6huEy2rPSFCIh4j2YoD8UX33p7udpMrpXbU2ewoer5MdoF+8m01NneZNKo5Z56hVGUVM
	oRs8d3Ll/s81VwVbP0u+rsUBy/n+3MvOCGzyi0kSarl/RLco1G8wgLDcr+IvOPaQmgQY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ue3bB-0000RN-Vo;
	Tue, 22 Jul 2025 03:23:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ue3bA-0000RH-US
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 03:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uSFWTEOFTfnJ257zvh9/Z93fpAWpriccw3iifXJPm9A=; b=U96NIOhCD8/JoVqG/ZlLNgjLNZ
 yoPhPM3wyzI2BQyGhZOF8yry6G9DMr0GWngJ585mPKz577eX9Xtv6UmRjv7DDDUvQ2L5ggp6X6qVQ
 pWqoGrXaaAbFt2F3OHWyageMZMETcyzN8Cp3Xylxlm/620l68+UOW+QuSWK6LHqYdqDw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uSFWTEOFTfnJ257zvh9/Z93fpAWpriccw3iifXJPm9A=; b=f8RJwa6McHvYuJc/iZQJEUerDz
 99ocV0jj5SJiw+EGpAPksbTor4/Df0eGv6+7Fzj9oLBc60+X4FKTqVc4nS/NHEldpjDyaltdfmXgM
 NvKDhWutBxjl52XHxDOzjPYyRykO8PDf6cXxcMAXGu9VxWXP4zSuZUxJ6v2bffuFJI8M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ue3bA-00046n-JQ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 03:23:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 361D85C45B5;
 Tue, 22 Jul 2025 03:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB8BC4CEF5;
 Tue, 22 Jul 2025 03:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753154593;
 bh=rasbSCtf3ZnDTfKVaTPFITyxJrXdlKaNEMhjk6bM/Bo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ZvHfKaRF327jY+GY+8E8JrQIm4ANh6EA4Ke3TDOEpfXJ1p9WJvODo02AxdQBfugr2
 reCND3Z/PLkuqh4t4rkwV4P+42fb2/bCwLutvjrsLrX5eXBkcPI3kG/52HZJo4ALaL
 yaVtW59xs2ClckU4Jg44O2Riy0nIdqfT8g79sr0CMvntk9ACJJ6/JlA+frzPCHkVHJ
 JtYmaYRGoPgjtnAZUm4wPl0/cQc2eQIWD5xtYCbejZWq0oWciKoK48VkrRY6jYbBYA
 m6PUdbvv/gKklVWDQGz3VXFiNXScoNJgGYwzrS4tytDYja3kQgpp+8Vd+nka2TvwlA
 ugHlv6Fsz6trQ==
Message-ID: <0aef4840-702c-40ba-a6ac-c3a745501323@kernel.org>
Date: Tue, 22 Jul 2025 11:23:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250718214014.2277307-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20250718214014.2277307-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/19/25 05:40,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > Add a sysfs knob to set a multiplier for the background GC migration
 > window when F2FS Garbage Collection is boost [...] 
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
X-Headers-End: 1ue3bA-00046n-JQ
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add gc_boost_gc_multiple sysfs node
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

On 7/19/25 05:40, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Add a sysfs knob to set a multiplier for the background GC migration
> window when F2FS Garbage Collection is boosted.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
