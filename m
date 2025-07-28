Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF996B135CC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Jul 2025 09:39:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itG++RsxyaDFwpJJninpgeAsHh+W4hLlWNifOJVvIMA=; b=fzygSvHYvnDa98gFWHMr+gIfzE
	aufgPycyfPJd//hLnm3yNqYBMXUCBeZlCgqgTAcOQdnWHl9YDMS35AN20z9tVrHip2j+4L/kuuuV9
	t5P5LtlpbT7s7BMLuONEIUr7hbkLek2VHCNE9iEbOcDLNvDw3WOlbNu/nlnps0RqoXwo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugISf-0003ch-C9;
	Mon, 28 Jul 2025 07:39:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ugISe-0003cW-Ev
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 07:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VHO2K1smNpCr0QRLKiEO0UJWkXgXXhvkml3oDD8qdv0=; b=A3eeB6zgfgPT62wBhKFCto5Kjg
 VYyYH0QwEKPbsW1FB/Wkugv8CBYoHf9sehWkia0WISkib91XVfv6Fxa9K9zgdWS4xVxwI/0SpY1+N
 fsNqQ5P7uC3g06AVwE15pX0jgTy6Pjg81AcyJA/QLN44BKV3fPxEd5ciiNgzm/TiNdkQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VHO2K1smNpCr0QRLKiEO0UJWkXgXXhvkml3oDD8qdv0=; b=jJBO0Yz2gsP/neoF9aodNXkfAB
 Ruaoq2Q9oG0maI6GKoUdIPuFfjftkdq0Oxn1Sth4cjG8UxpjXJDId9qBTL5vKl+A0rynVTwpnyPvT
 lhflvXbKVELLLUjymDMCF+7cLJ6lsb9BuUzQJxNgYJAKQImo2PNz0gEhJSHAc1yZhvHo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ugISe-0003lN-PT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 07:39:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1F095601E9;
 Mon, 28 Jul 2025 07:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B437DC4CEE7;
 Mon, 28 Jul 2025 07:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753688381;
 bh=xTEiG0sZVynldS/rvbgyjN1VXfeNS4PT9v90gfxqMJQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=GIkgLdttgxAO2HtwdcLhUal/VtWkP8SjHgHU7YI/2Lr8bWjiTw2mrhBj+WCAvWmJa
 dNqY1492XTVBcyTEzIrQBqW0l2NY+ah/gWf0gsCK1rp6Be9rSpZuTgogaHWwA1wUus
 TWyaWMG9NJbRn7qeJqAdz9tgUNEGnvZu6kpiWQWlOT5ZMgGKajSSqtC+Ms+LVYJAfs
 cvfX5oQ1FBa/RnCPTLFkANYxXBcc7Ga/KgXQpnkue+ZSGsAhqWyK/YKKYs3DC1zJb2
 NZjwLf/4a0UBw2WyVgklM2eYH/72wA6PqpKd057fl9rpMV2ceHqlMSE6K3Ivu2FBI3
 2Z1fhl5iHImGg==
Message-ID: <426e38c2-17bd-4461-a4e2-79368ede6daa@kernel.org>
Date: Mon, 28 Jul 2025 15:39:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20250728050237.1563560-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250728050237.1563560-1-wangzijie1@honor.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/28/25 13:02,
 wangzijie wrote: > __lookup_nat_cache follows
 LRU manner to move clean nat entry, when nat > entries are going to be dirty, 
 no need to move them to tail of lru list. > Introduce a pa [...] 
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
X-Headers-End: 1ugISe-0003lN-PT
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: avoid redundant clean nat entry
 move in lru list
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
Cc: linux-kernel@vger.kernel.org, feng.han@honor.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/28/25 13:02, wangzijie wrote:
> __lookup_nat_cache follows LRU manner to move clean nat entry, when nat
> entries are going to be dirty, no need to move them to tail of lru list.
> Introduce a parameter 'for_dirty' to avoid it.
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
