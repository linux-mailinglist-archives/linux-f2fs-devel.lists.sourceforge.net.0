Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFdeJun3p2l2nAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 10:14:17 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C501FD616
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 10:14:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgoq/U80s9ZJ+DlIW3j4qrutQICDEGbFUsK2pEU3h14=; b=criuM7UMqZRh5HvPT7TQFWnHrl
	ANWoUNVNEcIOAPEX/Hc6xcLbvseGzgFbOJ83J+oi3Woun3fv+mmzLHUI2833BSpTwy1E2dPPEvZdv
	W0NFY1H49zT2XosGDIp82ublsEbOJsze2byCzZbuFPqpke3bnIJMne4ZE+4R3tZ0PKrM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxiIy-0008NA-5n;
	Wed, 04 Mar 2026 09:14:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vxiIw-0008N2-Ck
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 09:14:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bMd2rDPzPxQKP1PglKErO6tkr5uwVEizC71JRqfHk3o=; b=DP7FBjCEtGklhBAMapbWkcON5h
 G72cyzyuccnK//pucpN0Zf72INUzv1zHa87B8tkzFnSiYqOuhDnu+2o3XwrDC6Q7shb9mFZPx0DcA
 Ex2QilUeLpFoQUOvILfuGNx7Cw05Uzz78jqHI1XG9L4R4Pn3JSmZIsUyRDkMAOoWmT+s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bMd2rDPzPxQKP1PglKErO6tkr5uwVEizC71JRqfHk3o=; b=XAd0HirXagKlszNbE4xo6sEvi/
 0KxBRmcJU+KkDotmBU6C6e/ZXyv24pnDiqM52EAf7+TckZU9Y4TXrcUs8i+wHDFp4ZRfIMf+Fb1WL
 3Orkw02zoIPYEg+kFTFQMeiLQS6DyyoiditUgpQKUbk97FPGGR3p+hW4yeaL/qKDqTIc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxiIv-0006na-Gi for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 09:14:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 02EC7440B4;
 Wed,  4 Mar 2026 09:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64F3C19423;
 Wed,  4 Mar 2026 09:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772615639;
 bh=JGRz1qrwNgOWoVf0XhdUHdQxE1z+p/a+/oxvAun0b+E=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=iEqk+zcEf3Hsf3nPoaX8ws5W1QVAgJGgAQzPf0WjKP1OMlZK4vzWroTwUDvRqMuf2
 RV/bzlwa1274+SzCMDzmnn/PkHv7jxISwFBla+oOYYlqwvE/DK8sEIYGGwRLaMGdQq
 exRghQDnjDmSwJw379xMgfNtXTYEmsR2KRlaYPSjtSOAdtprA8vpo2tIKg98RcrAdU
 mjU6sCo551OEyxxLmZFG0FlE3c9k2uXOyTGaAMMYUXKPIT/0YZIoveLWU9TLzs3iSI
 7wGRxWDa42eTq8V2SedajTM6dPU+oSG6SiooVr71B4lIxYwfL40tqaNpZzyAbcG4b2
 G/65xN88xs9cw==
Message-ID: <df7554b5-b69d-42d7-aabc-148c882de82d@kernel.org>
Date: Wed, 4 Mar 2026 17:13:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260203133635.3942502-2-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260203133635.3942502-2-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  FYI, there is a similar proposal previously:
 https://lore.kernel.org/linux-f2fs-devel/20230410020724.1817150-1-chao@kernel.org
 On 2026/2/3 21:36,
 Yongpeng Yang wrote: > From: Yongpeng Yang <yangyongpeng@xiaomi.com>
 > > When the file block's address is mapped to NEW_ADDR, the extent is >
 currently marked with the FIEMAP_EXTENT [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxiIv-0006na-Gi
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: fix incorrect extent flag when
 physical addr is NEW_ADDR in f2fs_fiemap
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 49C501FD616
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email]
X-Rspamd-Action: no action

FYI, there is a similar proposal previously:

https://lore.kernel.org/linux-f2fs-devel/20230410020724.1817150-1-chao@kernel.org

On 2026/2/3 21:36, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> When the file block's address is mapped to NEW_ADDR, the extent is
> currently marked with the FIEMAP_EXTENT_UNWRITTEN flag in f2fs_fiemap().
> This flag indicates that the block has been allocated but not yet
> written to. However, NEW_ADDR indicates delayed writing, meaning the
> block has not been allocated yet. Therefore, this should be modified
> such that when a file block's address is mapped to NEW_ADDR, the extent
> is marked with the FIEMAP_EXTENT_DELALLOC flags instead.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>   fs/f2fs/data.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 84746a06cd58..42f15fd9c68e 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2102,7 +2102,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>   				size += F2FS_BLKSIZE;
>   			}
>   		} else if (map.m_flags & F2FS_MAP_DELALLOC) {
> -			flags = FIEMAP_EXTENT_UNWRITTEN;
> +			flags = FIEMAP_EXTENT_DELALLOC;
>   		}
>   
>   		start_blk += F2FS_BYTES_TO_BLK(size);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
