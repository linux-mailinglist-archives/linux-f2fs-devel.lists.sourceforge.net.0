Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE975AE74B9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Jun 2025 04:20:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCf5l8oGClUnVFZG2pYmLHmUkqfG4qfUMqqel9XM19Q=; b=HJHfMBJwkT2kORUPndTdLAHkO/
	KIrjJbQ1W0rBCMYt3Xyzu3WIhqW2qdppVqYBTuMABs3oPSRXywkk4nigTaQcFFA2wLNz1BN8daX5J
	zfhZ3Qx1PxOyRZe14kfmuCwmNntH1vTqazO6UeX5juatI3UeyQYQs4qiVJDi3g9v5pCU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uUFkK-0004Zc-42;
	Wed, 25 Jun 2025 02:20:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uUFje-0004Vu-7A
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 02:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d4NYuXFDJX9D8gFK6d3Y7HIH7/1F6nQBMHASq0aDoK8=; b=Z9XM8V2PoVeMM/6OZRAEsi0Q8G
 0nNucBDz7VJ42KkNk/tg8VNK1iWcLkN7xkCAPAv+IuJwCt4n2DQwVmgT0Z0MPdAO/R+Fl03N0EgO8
 KQJQ6XnS4GzpnVNu9RM/0vqFGGWKBPihsfarBb4Cy8usGxV00t7ZqhylxR5Kk2caO5cs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d4NYuXFDJX9D8gFK6d3Y7HIH7/1F6nQBMHASq0aDoK8=; b=VCTzNFf4d/xjHvcOWdKJup11sB
 S62NF5NWqs4GrgvFMMMQ+goDTnM3mpwT0HSIRF/Liosuv3/6GI0TdV9cBUtFecgUFYOlrPiwzP7M9
 k9qYYWtw64N66pG+iCeXSK4oka6MydEURB8TvPSQ7NpFIAZC8qZnF0JNpjliiI4QT5kE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uUFjc-0001rV-Tr for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 02:19:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4568E60010;
 Wed, 25 Jun 2025 02:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7076DC4CEE3;
 Wed, 25 Jun 2025 02:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750817966;
 bh=eLSWsc8SCSNGTIFoRRKlzCezgqEA7Za59xcoybJc+TI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ZjY5qgZJVbM3eEGV4T3XRMR8Q9MJ+965a6ctIJYwxGTVtfCIEoNOu/X84Eqtfkw/F
 J1I2yAym+j9Tb1c0NZ6YOaBbDnrUbt6ca46ykHLXyK3ofmAgYvolhVucHcRqxu3naI
 aYwWq18A9F21lgRfzOGvx1+bZ+Dr0gyti9ALE7PcnqX2Vh15ZqbC1Rb4pW451v19b5
 h9PmwkZ7MHbQKeX3GUKCKFnLs3HU6etNWwNMlWfFli59aiGjWGumeS/4p8rWLmvlz9
 VYMHHxmVD1UTJMC/A7a3y2zm/d785Jy5LOsN+d+X6Fwqyxau/WJwXTeArkb6Z6AMHo
 LwEWJbBSDkUCQ==
Message-ID: <29dac4f4-3f46-49b6-8a9f-c26ffcde11d0@kernel.org>
Date: Wed, 25 Jun 2025 10:19:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Abinash Singh <abinashlalotra@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <1669c05c-7468-4347-a924-cfc4145c8c75@kernel.org>
 <20250624170948.59013-1-abinashsinghlalotra@gmail.com>
Content-Language: en-US
In-Reply-To: <20250624170948.59013-1-abinashsinghlalotra@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/25/25 01:09, Abinash Singh wrote: > KMSAN reported a
 use of uninitialized value in `__is_extent_mergeable()` > and
 `__is_back_mergeable()`
 via the read extent tree path. > > The root cause is tha [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uUFjc-0001rV-Tr
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix KMSAN uninit-value in
 extent_info usage
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 abinashsinghlalotra@gmail.com,
 syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/25/25 01:09, Abinash Singh wrote:
> KMSAN reported a use of uninitialized value in `__is_extent_mergeable()`
>  and `__is_back_mergeable()` via the read extent tree path.
> 
> The root cause is that `get_read_extent_info()` only initializes three
> fields (`fofs`, `blk`, `len`) of `struct extent_info`, leaving the
> remaining fields uninitialized. This leads to undefined behavior
> when those fields are accessed later, especially during 
> extent merging.
> 
> Fix it by zero-initializing the `extent_info` struct before population.
> 
> Reported-by: syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=b8c1d60e95df65e827d4
> Fixes: a28ef1f5aebe ("f2fs: maintain extent cache in separated file")

Should use this instead?

Fixes: 94afd6d6e525 ("f2fs: extent cache: support unaligned extent")

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
> ---
> v3 : Added Fixes and Closes tags
> ---
>  fs/f2fs/extent_cache.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index cfe925a3d555..4ce19a310f38 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -414,7 +414,7 @@ void f2fs_init_read_extent_tree(struct inode *inode, struct folio *ifolio)
>  	struct f2fs_extent *i_ext = &F2FS_INODE(&ifolio->page)->i_ext;
>  	struct extent_tree *et;
>  	struct extent_node *en;
> -	struct extent_info ei;
> +	struct extent_info ei = {0};
>  
>  	if (!__may_extent_tree(inode, EX_READ)) {
>  		/* drop largest read extent */



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
