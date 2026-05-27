Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIvgBoz5FmrUywcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 May 2026 16:02:52 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 308EA5E57F4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 May 2026 16:02:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GyzmN37LciitmknuQh9AzCDqmauMejGVod4oOzP9gNc=; b=Gv2BX3tl7I1LiV2vMtwwIr4xjk
	qTItcGlcI11GlbIF/aokjyvzgXZTva145uM64/OdbfKtebqUH69N1qa/NOaaF21TkJepX0M1P/2+x
	fnqhXWOcTL5Un68y4Xw7aF/Nl03nFlazbEZaoMzAgcdRu3S7FwfOGVnXRCpX7iuLrkeA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSEqB-0007Rm-8O;
	Wed, 27 May 2026 14:02:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1wSEpt-0007RT-Gj
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 May 2026 14:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gZ2cZAa3qsYv2bi3Gm/IDhB9pcQHr57/fM8cDrL7NEs=; b=ifEvjJccpBVKfwRnvVktBzJDit
 MrlKSVzZleCh7j2qrco3OUCFKCF4md523qvJu6APYEz4LemuVRLnvasj46AVDkU0hWX2cfuw89wKO
 TgwP/3MQUCczHUMqKPnHodcF/g8TEzGhyLgGRlvrLIudT6sLCgm2HndvXNI/Z2mYnguA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gZ2cZAa3qsYv2bi3Gm/IDhB9pcQHr57/fM8cDrL7NEs=; b=BAAq5Hux/S5b1y1CehutXNDLyV
 MlNrBMTGwuFvHNv4LZeEDNbi7SQZTjcmyum01iDKMUGCYPZU+BNAngtx+psabQg+tNL8ct6scdIkk
 3sKi390W6TopDVO6xlbIOvjlk8S2sabP7yVyrv9bV7Yr9neJVd5qd92AetI0g9FRwsOk=;
Received: from smtp153-165.sina.com.cn ([61.135.153.165])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wSEpr-0003Ds-N7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 May 2026 14:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1779890536; bh=gZ2cZAa3qsYv2bi3Gm/IDhB9pcQHr57/fM8cDrL7NEs=;
 h=Message-ID:Date:Subject:From;
 b=zE9z/iB7xGtALuVcFxmAYlGBjUs1zTMUFeQJj5EhSWxpEPfz7A+um65I+jxSC79AW
 ECfNBPBZP6CO9RjjLI8h8g1PoqFQoPIQthIfb9BO/g8vAtQt+dZ76log+vL4HtLO6S
 gUOmSJ8n4P/dzJBJQ2piRLbE3jhtAgekhP6deEmE=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.32) with ESMTP
 id 6A16F95C000051AE; Wed, 27 May 2026 22:02:06 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 9131724456643
X-SMAIL-UIID: 94FBB82B6B4A4BD4B0BE192E748C5013-20260527-220206-1
Message-ID: <e5f8972c-0a34-49ce-9d85-0a63af487599@sina.com>
Date: Wed, 27 May 2026 22:02:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260522082013.3716237-2-monty_pavel@sina.com>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <20260522082013.3716237-2-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/22/26 16:20, Yongpeng Yang wrote: > From: Yongpeng Yang
 > > The following scenario can cause fiemap to report incorrect extents:
 > > $ mkfs.f2fs /dev/vdb -f > $ mount -o mode=lfs /dev/vdb /mnt/ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1wSEpr-0003Ds-N7
Subject: Re: [f2fs-dev] [PATCH 1/5] f2fs: fix extent merge failure when
 largest extent is not in rb-tree
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
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email]
X-Rspamd-Queue-Id: 308EA5E57F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 16:20, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> The following scenario can cause fiemap to report incorrect extents:
> 
> $ mkfs.f2fs /dev/vdb -f
> $ mount -o mode=lfs /dev/vdb /mnt/f2fs/
> $ dd if=/dev/urandom of=data bs=4K count=874 conv=notrunc
> $ f2fs_io fiemap 0 1000000 data 1
> $ shrink all extent
> $ dd if=/dev/urandom of=data bs=4K count=150 seek=874 conv=notrunc
> $ f2fs_io fiemap 0 1000000 data 1
> Fiemap: offset = 0 len = 1000000
>         logical addr.    physical addr.   length           flags
> 0       0000000000000000 00000002868d4000 000000000036a000 00001000
> 1       000000000036a000 0000000286c3e000 0000000000096000 00001001
> 
> The root cause is that when the largest extent is not in the extent
> tree, mergeable extents are not merged, causing f2fs_map_blocks to
> misjudge and output an incorrect extent list.
> 
> Fix this by allowing the extent being inserted to merge with the largest
> extent. When updating the extent tree range, if the new extent can be
> front-merged or back-merged with the largest extent and the largest
> extent is not in the rb-tree, merge them before the normal lookup.
> 
> Fixes: 429511cdf8b3 ("f2fs: add core functions for rb-tree extent cache")
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>  fs/f2fs/extent_cache.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index 61f6b9714366..aa368a01b035 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -702,6 +702,27 @@ static void __update_extent_tree_range(struct inode *inode,
>  		__drop_largest_extent(et, fofs, len);
>  	}
>  
> +	if (et->largest.len != 0 &&
> +			(__is_front_mergeable(tei, &et->largest, type) ||
> +			 __is_back_mergeable(tei, &et->largest, type))) {
> +		/* 0. try to merge with largest extent. */
> +		en = __lookup_extent_node_ret(&et->root,
> +				et->cached_en, et->largest.fofs,
> +				&prev_en, &next_en,
> +				&insert_p, &insert_parent,
> +				&leftmost);
> +		if (!en) {
> +			if (__is_back_mergeable(tei, &et->largest, type)) {
> +				tei->fofs = et->largest.fofs;
> +				tei->blk = et->largest.blk;
> +				fofs = tei->fofs;
> +			}
> +			tei->len += et->largest.len;
> +			len = tei->len;
> +			end = fofs + len;
> +		}
> +	}
> +
>  	/* 1. lookup first extent node in range [fofs, fofs + len - 1] */
>  	en = __lookup_extent_node_ret(&et->root,
>  					et->cached_en, fofs,

ping



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
