Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F75DACC090
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Jun 2025 08:58:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmOVXFwp3LyAr2aI4dgnPmdt2FsR8q8/FoHHetWtR2c=; b=mbbdYajcLFegm9xAEw8izWks83
	t8KNiotMNuucCkIkjn1nM6BKXf/CSMD9KFRC16IgOWwJDIEGh0kH3IC8nEJ/6YlEAdCvGcFnBMYVp
	Sh7+skc4324hAsb+ULvyPXxJCuLY6BRHPqG3C7fQNBBy/Ty4XrIyyjLLXQ240jV+KDR0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMLbI-0005AW-Ak;
	Tue, 03 Jun 2025 06:58:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uMLbG-0005AO-CB
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jun 2025 06:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xWmflv5+6woLi7/ToKoaDfzZzHUZ3qEAW0udeca1q2Q=; b=cvFFDk/cZQYhP81ML9iwFrP1Yi
 Npm+3H3+8KPi0dN0Urc3akdyz4WHDI9d+nFUqR3rTuomsXp/0Hxq4OHexIUXiTWoosGumCBFYGKJG
 F1jb9V9xK88yb3YAfZhdrzx2VeT6IKYMN1UmBO0uckZ7Ksh1rYPJJo4/QFkA78tucFAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xWmflv5+6woLi7/ToKoaDfzZzHUZ3qEAW0udeca1q2Q=; b=KbrNuaAt01h+uHstrpMejsLaX7
 Pzmlb04iqE/+yfzsXkQ+CpU1Tf5V8LybfBUacgdB6s01mbzb4/oEOFGwSF7sf1gDgqKEybIR/MQjq
 IJGCOv8G6ykGfdlzw8R794Vmy9ACEocDKknizeKRYTwxcRxIdlm8pIGxG7sz2zbMyRVs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uMLbF-0001oL-PW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jun 2025 06:58:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 19E30614AC;
 Tue,  3 Jun 2025 06:58:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738DDC4CEED;
 Tue,  3 Jun 2025 06:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748933891;
 bh=EhXzen7gV3hUWh7pSnmCfc7yCVQh8WtqFqB2lUlXPZg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=e1AV42oKNVrAL1QDD9G7cYMRRHNLgJkIK13uwugGpv6JWWOdhDPpZ+FWb86V5AOp7
 5k8hMPEKLNqcyrh6c7r1BM7AhUf7ulGWNeHY0CKIefj910ibEwqHLsV7U4KdF4JWkB
 e/FL9RTYcj87Qb5jcnS9GqbvxsakMeQXe9ssHWU2c6ulud35jML3wrHrmRm8Ua6+W5
 5PkbEY7AuqcJSrTQHvzNQy+pL2KiJG5V6Z4P7RC4Xyq7ijkWAIXaF8+4UfATND/eYE
 7CDJHqPAm9Rnuf8mezKlIqRPZiIe8RDRbCsODxq6VybefAFAqCQMvLMI6R08+qX2cy
 +SFcgvWB4p/mA==
Message-ID: <1691f701-0d52-4dae-b709-02ce7182a920@kernel.org>
Date: Tue, 3 Jun 2025 14:58:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250529222532.1088106-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20250529222532.1088106-1-daeho43@gmail.com>
X-Headers-End: 1uMLbF-0001oL-PW
Subject: Re: [f2fs-dev] [PATCH] f2fs: make sure zoned device GC to use FG_GC
 in shortage of free section
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/5/30 6:25, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> We already use FG_GC when we have free sections under
> gc_boost_zoned_gc_percent. So, let's make it consistent.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
