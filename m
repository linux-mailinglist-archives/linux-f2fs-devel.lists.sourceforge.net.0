Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EPAH6c2sWmesgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 10:32:23 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 764772608F1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 10:32:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEv8Tq1gnCRTMvMcHS3mh1Zuidyf1BUO42nYR6lwO6w=; b=jXFyi0hi33giGetfsmEDwcNrxX
	5In712qBqzaN4MMcRHuH9ZZH6vCTzWemAQ/raK1zxv4wDpE1iSjMYSPXm/QVi7HAfL6tICWRej5wC
	9VhfI1XnCQqYzKQsO7PMpZNuitcShmGIiOL8NUJ3M49f6qJp55nOYJXQdGRqf3vBljXM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0FvS-0003vg-4o;
	Wed, 11 Mar 2026 09:32:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w0FvR-0003va-5j
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 09:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xh+ycFv9DxRBHT4++BI3T+7DFWdfTTBRZTKi2Br5LZk=; b=WxnYVcAfz/ziJVWc1C5Bqi/ec8
 /WGDpV7QxOl4CRI5MfLLFrOPDB2pUzyRru7/n1ml52qF0ZWPP6DaeZDxfopuXVjU+xdEL0G0vqxJm
 Ilj7wemb38i8sXF7huzz+AcXA+s5XPAEtHz2yHak6qlQvEKqz1nyobdFEnB9L6Ie547w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xh+ycFv9DxRBHT4++BI3T+7DFWdfTTBRZTKi2Br5LZk=; b=khrO+eNiZ74AYSxoFFlC4/JBol
 s1Khts9/AkhwgkjFobw+qdrg6VI2whHBXs0wrDqxpJ6pMoXrpDlPNHUxmKshwPceCvT67g/Z18jeZ
 z7TnkoHfSSfrXPY54JRUNGTrwCEIu9ZNOyKfZmRguRS5zzcYpCaK9+/3k57HCGVMg0pg=;
Received: from smtp153-168.sina.com.cn ([61.135.153.168])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0FvP-0000jo-GG for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 09:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773221539; bh=Xh+ycFv9DxRBHT4++BI3T+7DFWdfTTBRZTKi2Br5LZk=;
 h=Message-ID:Date:Subject:From;
 b=hzAeWGIQjb0A407qji01CLhoa8qngtn6LNlc0PgRIe6zz4MHbD6pP6oyWXVQE1NHR
 E1Hn0+jzYw6G9/PtjQB0Nrt5m2QVdpHs19Di8R5XMCOQzb5urRZe+cTm0Z19XvwSgh
 6wjwZeHlp0JNPKli9E0YhBQijfREZCR+b1fy2fnY=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.33) with ESMTP
 id 69B13693000010AA; Wed, 11 Mar 2026 17:32:05 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 1107336685175
X-SMAIL-UIID: 91B9A1370F75469CB266D35AA4F42758-20260311-173205-1
Message-ID: <00bb5093-2c6d-42fd-bb86-ccddb1e8af9c@sina.com>
Date: Wed, 11 Mar 2026 17:32:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260216112841.67508-2-monty_pavel@sina.com>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <20260216112841.67508-2-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/16/26 19:28, Yongpeng Yang wrote: > From: Yongpeng Yang
 > > After the device is mounted, f2fs updates on-disk metadata without >
 updating the block device page cache. As a result, f2fs-tools ma [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1w0FvP-0000jo-GG
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: invalidate block device page
 cache before reading metadata
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 764772608F1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,sina.com:mid,xiaomi.com:email]
X-Rspamd-Action: no action

On 2/16/26 19:28, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> After the device is mounted, f2fs updates on-disk metadata without
> updating the block device page cache. As a result, f2fs-tools may read
> stale metadata from the page cache.
> 
> For example:
> mount /dev/vdb /mnt/f2fs
> touch mx // ino = 4
> sync
> dump.f2fs -i 4 /dev/vdb
> touch mx2 // ino = 5
> sync
> dump.f2fs -i 5 /dev/vdb // block addr is 0
> 
> Since `dump.f2fs -i 4 /dev/vdb` has already populated the metadata area
> into the block device page cache, the cached pages remain resident in
> memory. After creating mx2, the page cache is not updated accordingly.
> Therefore, `dump.f2fs -i 5 /dev/vdb` reads stale metadata, and the
> physical block address of inode 5 is incorrectly reported as 0.
> 
> This patch issues a BLKFLSBUF ioctl to the block device before reading
> metadata. The kernel then invalidates the block device page cache,
> ensuring that subsequent reads fetch uptodate metadata from disk.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>  lib/libf2fs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> index 1a496b7..31b5924 100644
> --- a/lib/libf2fs.c
> +++ b/lib/libf2fs.c
> @@ -1027,6 +1027,7 @@ int get_device_info(int i)
>  	}
>  
>  	dev->fd = fd;
> +	ioctl(fd, BLKFLSBUF);
>  
>  	if (c.sparse_mode && i == 0) {
>  		if (f2fs_init_sparse_file()) {

ping

Thanks
Yongpeng,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
