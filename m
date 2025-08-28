Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D798CB3923A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Aug 2025 05:31:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjWhd11ElGyGG2CAoWIMhYTLxHqCzTo/UAfoNuEiZec=; b=mQ+/jPB4uCD+SNF6UshAVECgAE
	o4SI8tU5ccfrgSWawbLFulQjeqIsW+qso++NOYEg6zsYPlm07gSi9LPv9y5gQjtAab1yXmBSQY8rR
	pz455R1xEVt29tKcTuReSLqKsHdjh76+2x1CRNVuLoRQlBmOuI2SpQP1n5rA7/dmsUh8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1urTMd-00031Y-0x;
	Thu, 28 Aug 2025 03:31:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1urTMc-00031P-Fx
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Aug 2025 03:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WZsmG2FaXMKy0XH/8wB2xfmUoQhcWycJ5ebMVewMZbI=; b=Aj6quS0T8Bi40VAKgML6O6Jl3e
 V4MYbiEGnbJlZ1arIO0ailPPuDsoQKqL7cC4hEgOX4mQ/IOJZEuKpsMIIYGsd4trycVv9sO8DeSMa
 vBCVe9z4l0TNouS+12XeCp6+faL/itETo6nqx9K7f5x9DXcdZe6A9Onh6AKIxPCfeYkw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WZsmG2FaXMKy0XH/8wB2xfmUoQhcWycJ5ebMVewMZbI=; b=j1Mhz1S1y4vy6JninZOWzXs+Iz
 vHuBaTH3ww9oHuXPw38Ai+6vf2Mnci/sguWAoiFGfn0zc6LlQt+42/MSucHukl5X9/HjMXvUnExqr
 77l7qV0r2h4/tBW9ooJ5NojLsTCoKhcH322keTuQOjzZwn61vRRIKLaXbXfBiqB7fl/w=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1urTMc-0005pw-Ur for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Aug 2025 03:31:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 957F74470E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 Aug 2025 03:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB26C4CEEB;
 Thu, 28 Aug 2025 03:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756351900;
 bh=eYE4YCC+62NgocceA6DStyJGNAxd9Czbqyz9l9H8fPI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=GTWNkWeSX8cuirS/frmngcfncIZSlAu+Qqk7hpzkFsg+OmZuJgVQ558/KyJHml/nX
 U+rBjZWqWMKjkKJmFgL5kRNbaJE89+ZaVGuL59tbMkkx9ZT/fgVSds00uih6H67JSc
 vN3VpUARgf9biQ/Omemn1VYmblRWqAppZJkKBOCFsuGcH0a1kfb6oi4CGgttEgbt08
 kz1y8J0E9czEwnO1ERzOagvmjzw5u1ccbQJZHFgjjGGb6shIIrP+jd13arjV7Jcb7b
 Giy/qI5eNsb3/o/co1PXsnuAG1ymbfkRT4rBnhskOvScSzcnlUC3Fws3NBToCe7uE8
 RChmDh4MVgzuA==
Message-ID: <bfbd5db4-c103-4a08-8568-1d27c8eba676@kernel.org>
Date: Thu, 28 Aug 2025 11:31:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250827215222.1615844-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250827215222.1615844-1-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/28/25 05:52, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > Let's split IPU writes in hot data area to improve the GC efficiency. I
 didn't get it, IPU may be not friendly for migrating data along w/ write in
 hot area? 
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
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1urTMc-0005pw-Ur
Subject: Re: [f2fs-dev] [PATCH] f2fs: allocate HOT_DATA for IPU writes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/28/25 05:52, Jaegeuk Kim via Linux-f2fs-devel wrote:
> Let's split IPU writes in hot data area to improve the GC efficiency.

I didn't get it, IPU may be not friendly for migrating data along w/ write in
hot area?

Thanks,

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/segment.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index e0f6589c6a1c..bb79dad55ac9 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3688,7 +3688,8 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>  
>  		if (file_is_hot(inode) ||
>  				is_inode_flag_set(inode, FI_HOT_DATA) ||
> -				f2fs_is_cow_file(inode))
> +				f2fs_is_cow_file(inode) ||
> +				is_inode_flag_set(inode, FI_NEED_IPU))
>  			return CURSEG_HOT_DATA;
>  		return f2fs_rw_hint_to_seg_type(F2FS_I_SB(inode),
>  						inode->i_write_hint);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
