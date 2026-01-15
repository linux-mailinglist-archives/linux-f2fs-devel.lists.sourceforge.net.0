Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA61DD249B1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 13:49:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dvo5zz0JIVvYaHlEngANgwBTjm/9t4BAEJ6isAB33/0=; b=XOa5rcozOIRNDTOKKlNXRUHITk
	jqy33qvGf5k/fc665bbUojUYx3841wkL5CBJ1dnooyRMSsxTgaQMJWR2tbbPv+ePI7AxQSy+BfWhS
	xVDZ6R6Cuy/S00+/pu8pHjpjFGLSRrKWxr/vFrPRpzteX2wFEhZaR1ouc5yWDiOllY10=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgMn2-0003FI-My;
	Thu, 15 Jan 2026 12:49:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1vgMn1-0003FB-Aa
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 12:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5eCVinJm+L7ouQItCXmIzH+u40QbG89UJd41OTXBx9A=; b=E2lHl+4sEfaFPuKMIkLUA3njR6
 1Fv2geOyyYC428WXSQRVLKogXd3KCdZLKjW6HsNRjkC8XKX3An998revG9Ehvll5FQwWUlsXApbW9
 g0XFz1nz1+w+SCI7FwMSQBEKaw6cw0y0NhE88vSXTBZdgWFFnM1GYOSa55TtCpvehenM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5eCVinJm+L7ouQItCXmIzH+u40QbG89UJd41OTXBx9A=; b=FEb8DN7HPNgJFy4F8cLx9V/ca0
 0TJtj1Smlo+Ql77KJYckDSQ2XvXq8OId3qFJlr+Z44SfRqIrts9Ynfi7xZCin2YyR+62RLe/aVB2M
 Co8tPGXa7AabYNTP+DKbmnNOWPmhyW5gTOfmASZJO1pMqKelqbxOVIEFztsOx1X73SsA=;
Received: from m16.mail.126.com ([117.135.210.9])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgMn0-0005rL-Ec for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 12:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
 Content-Type; bh=5eCVinJm+L7ouQItCXmIzH+u40QbG89UJd41OTXBx9A=;
 b=VALYQ5KZHkUTQ8R6Wf7LC7HCBFPT6Ah3QlChd36Tf2xnkRxMGajS6iUmpjVyJX
 75gXbrt1wgpMoBeV3HcEGOx3nK5LWAOlqYOBtlOdfW3749Igqa8Tgl9Ta5Gy5Ne3
 xFqn1tq2ukqQsKVeGWlafiNX0qigPY4jvyBBjdf0uIuBc=
Received: from [IPV6:2409:8a20:4df2:4050:39de:fd86:6396:5263] (unknown [])
 by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id
 _____wDnb0c34mhpoW_QBg--.14999S2; 
 Thu, 15 Jan 2026 20:48:56 +0800 (CST)
Message-ID: <5e888451-228e-41e5-ada7-a22a61cb84dd@126.com>
Date: Thu, 15 Jan 2026 20:48:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>
References: <20260112013320.8028-1-chao@kernel.org>
Content-Language: en-US
From: Nanzhe Zhao <nzzhao@126.com>
In-Reply-To: <20260112013320.8028-1-chao@kernel.org>
X-CM-TRANSID: _____wDnb0c34mhpoW_QBg--.14999S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF15Wr1fZw17AryxtFW3Awb_yoWrJFy3pF
 yUtFy3uF45GryIvFsag3WDZF1S934Utayj9wsag343Jwn8tr1SvF92ga43u3W5KF48Zr1U
 XF45Ja48Wa1YyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UG9aPUUUUU=
X-Originating-IP: [2409:8a20:4df2:4050:39de:fd86:6396:5263]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsBk7C2lo4jnULwAA34
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao: On 2026/1/12 09:33, Chao Yu via Linux-f2fs-devel
 wrote: > For consecutive large hole mapping across {d, id, did}nodes , we don't
 > need to call f2fs_map_blocks() to check one hole block per one time, >
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [117.135.210.9 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vgMn0-0005rL-Ec
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid f2fs_map_blocks() for
 consecutive holes in readpages
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao:

On 2026/1/12 09:33, Chao Yu via Linux-f2fs-devel wrote:
> For consecutive large hole mapping across {d,id,did}nodes , we don't
> need to call f2fs_map_blocks() to check one hole block per one time,
> instead, we can use map.m_next_pgofs as a hint of next potential valid
> block, so that we can skip calling f2fs_map_blocks the range of
> [cur_pgofs + 1, .m_next_pgofs).
> 
> 1) regular case
> 
> touch /mnt/f2fs/file
> truncate -s $((1024*1024*1024)) /mnt/f2fs/file
> time dd if=/mnt/f2fs/file of=/dev/null bs=1M count=1024
> 
> Before:
> real    0m0.706s
> user    0m0.000s
> sys     0m0.706s
> 
> After:
> real    0m0.620s
> user    0m0.008s
> sys     0m0.611s
> 
> 2) large folio case
> 
> touch /mnt/f2fs/file
> truncate -s $((1024*1024*1024)) /mnt/f2fs/file
> f2fs_io setflags immutable /mnt/f2fs/file
> sync
> echo 3 > /proc/sys/vm/drop_caches
> time dd if=/mnt/f2fs/file of=/dev/null bs=1M count=1024
> 
> Before:
> real    0m0.438s
> user    0m0.004s
> sys     0m0.433s
> 
> After:
> real    0m0.368s
> user    0m0.004s
> sys     0m0.364s
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>   fs/f2fs/data.c | 21 +++++++++++++++------
>   1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index a2c4769d0ae1..5b0642cd27ff 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2176,10 +2176,13 @@ static int f2fs_read_single_page(struct inode *inode, struct folio *folio,
>   	/*
>   	 * Map blocks using the previous result first.
>   	 */
> -	if ((map->m_flags & F2FS_MAP_MAPPED) &&
> -			block_in_file > map->m_lblk &&
> +	if (map->m_flags & F2FS_MAP_MAPPED) {
> +		if (block_in_file > map->m_lblk &&
>   			block_in_file < (map->m_lblk + map->m_len))
> +			goto got_it;
> +	} else if (block_in_file < *map->m_next_pgofs) {
>   		goto got_it;
> +	}
>   
>   	/*
>   	 * Then do more f2fs_map_blocks() calls until we are
> @@ -2454,7 +2457,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>   	struct bio *bio = NULL;
>   	sector_t last_block_in_bio = 0;
>   	struct f2fs_map_blocks map = {0, };
> -	pgoff_t index, offset;
> +	pgoff_t index, offset, next_pgofs = 0;
>   	unsigned max_nr_pages = rac ? readahead_count(rac) :
>   				folio_nr_pages(folio);
>   	unsigned nrpages;
> @@ -2487,16 +2490,21 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>   		/*
>   		 * Map blocks using the previous result first.
>   		 */
> -		if ((map.m_flags & F2FS_MAP_MAPPED) &&
> -				index > map.m_lblk &&
> +		if (map.m_flags & F2FS_MAP_MAPPED) {
> +			if (index > map.m_lblk &&
>   				index < (map.m_lblk + map.m_len))
> +				goto got_it;
> +		} else if (index < next_pgofs) {
> +			/* hole case */
>   			goto got_it;
> +		}
>   
>   		/*
>   		 * Then do more f2fs_map_blocks() calls until we are
>   		 * done with this page.
>   		 */
>   		memset(&map, 0, sizeof(map));
> +		map.m_next_pgofs = &next_pgofs;
>   		map.m_seg_type = NO_CHECK_TYPE;
>   		map.m_lblk = index;
>   		map.m_len = max_nr_pages;
> @@ -2617,6 +2625,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>   	pgoff_t nc_cluster_idx = NULL_CLUSTER;
>   	pgoff_t index;
>   #endif
> +	pgoff_t next_pgofs = 0;
>   	unsigned nr_pages = rac ? readahead_count(rac) : 1;
>   	struct address_space *mapping = rac ? rac->mapping : folio->mapping;
>   	unsigned max_nr_pages = nr_pages;
> @@ -2637,7 +2646,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>   	map.m_lblk = 0;
>   	map.m_len = 0;
>   	map.m_flags = 0;
> -	map.m_next_pgofs = NULL;
> +	map.m_next_pgofs = &next_pgofs;
>   	map.m_next_extent = NULL;
>   	map.m_seg_type = NO_CHECK_TYPE;
>   	map.m_may_create = false;

Do we have plans to also support reducing f2fs_map_blocks() calls for 
consectives holes in logical file postion with dnode have already been
allocated in buffered large folio read?
Such as consective NULL_ADDR or NEW_ADDR?

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
