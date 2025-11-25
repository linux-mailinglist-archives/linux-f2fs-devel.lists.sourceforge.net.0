Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD906C82F9D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Nov 2025 02:06:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TbbEnlGgR9Wu7mdkHoHRZvWgwa7fMkApw7cXumZRQvk=; b=ihK8gKtoUnJlGegmBhYIdANL+X
	KiUUa19JnX5OnmCRebQykjaKt/2cSEXNPZew3W0ddtJTR/oL7dhgfFmSHQhOQM/ZNFKZYOOC5GKBx
	AZtn0CdgiqO+PcBklkkK6gpSROofScEpMx1RYVsxX9SmxMHQgHruFaeD/RbWuhC0eEBw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNhVH-0000OM-II;
	Tue, 25 Nov 2025 01:05:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vNhVG-0000Nu-2r
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 01:05:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WYLhVzrbULNIbOSW2NTr6vn2qVie9fORLjYqWGY5zPY=; b=K0+04rKXjLBWJSOx8pemckAp1l
 BQhhb97SZRAGu2mzyb692VN7MeOKuQfW2bDc6ktt01bbDOt/wQr5QZI7yfusvnmd94dmh2YIPXsPF
 R23f4iZPe5nD5teMQ+IQRd+UZNlFJ3jPXU4b//j8TWzm26l8jOMl89MpHsFIdv6wlqvA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WYLhVzrbULNIbOSW2NTr6vn2qVie9fORLjYqWGY5zPY=; b=CGjXoFW+F0KIzYxKcoTXlPYxyD
 S2jRNe87A5kfneWeBZNS0+tjXiOnCPRZsqijAt7X+UPrpuASsuXPQoXGSOa2lvxEaVP1H5n3ooy19
 9wxdmw82VTUYFrBHw2h66b+G08neMKCGo+txYo9hReANN6r8IO+3m8OTwV9V+K4J32cA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNhUs-0001Cv-Ig for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 01:05:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 730DC60010;
 Tue, 25 Nov 2025 01:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27EBC4CEF1;
 Tue, 25 Nov 2025 01:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764032723;
 bh=qX1hrnikcomg+Gbe1irQFQRy/Tp1hwIBg3e9+aqI12c=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Xgw5ul0KCpym7tOoOBwjNCmh6nfR0/XjpOfcS3KthC0/NoaycrUTjhxkQ0dUJI3Sn
 G9jRwajb1gNP5XmsVfQhylL1czLUcgwIh5lbF45tZQmOLO76QLoFzs/YsOIPdAofHY
 wnhjpYmYb1S5u3kbFYmaDtttDEzfif75ZUixIi8XH7UsjMKc538h1bf2KrsjueOk3m
 x7CffXFicIvNzG84j3mBUSzjpqrKWK56hNnbmpWouYZZHWTQJR0z5G3XKWHcngp0cj
 k4+rA+Vupgl0FqAK6+UGBjAhpkGI2uoeSagueoq5eHnB8QTnojLepLlTVxFj8hawvg
 gabg9U//9AqKA==
Message-ID: <a845718c-32e9-4e1c-8225-d38f670417e1@kernel.org>
Date: Tue, 25 Nov 2025 09:05:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xiaole He <hexiaole1994@126.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20251121021342.28133-1-hexiaole1994@126.com>
 <20251121024220.29307-1-hexiaole1994@126.com>
Content-Language: en-US
In-Reply-To: <20251121024220.29307-1-hexiaole1994@126.com>
X-Spam-Score: 0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/21/2025 10:42 AM, Xiaole He wrote: > 1. Fix typo in
 HAVE_PREAD macro check (lib/libf2fs_io.c:403): > - Change HAVE_RPEAD ->
 HAVE_PREAD
 > - The misspelled macro caused pread() optimization to nev [...] 
 Content analysis details:   (0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [172.105.4.254 listed in dnsbl-2.uceprotect.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vNhUs-0001Cv-Ig
Subject: Re: [f2fs-dev] [PATCH v2] f2fs-tools: fix typo of HAVE_PREAD macro
 and remove duplicate semicolons
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
Cc: jaegeuk@kernel.org, shengyong1@xiaomi.com, daehojeong@google.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/21/2025 10:42 AM, Xiaole He wrote:
> 1. Fix typo in HAVE_PREAD macro check (lib/libf2fs_io.c:403):
>     - Change HAVE_RPEAD -> HAVE_PREAD
>     - The misspelled macro caused pread() optimization to never be used,
>       forcing the code to always use the slower lseek() + read() path
>       instead of the atomic pread() call.
> 
> 2. Remove duplicate semicolons:
>     - mkfs/f2fs_format.c:211: Remove extra semicolon in hot_ext_count assignment
>     - fsck/dump.c:119: Remove extra semicolon in free_segs initialization
> 
> These are minor code quality fixes that don't change functionality but
> improve code correctness and enable the pread() optimization.
> 
> Fixes: 4b7e95300988 ("f2fs-tools: use pread and pwrite when they are available.")
> Signed-off-by: Xiaole He <hexiaole1994@126.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
