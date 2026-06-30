Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +ckhM92AQ2qxZQoAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2026 10:39:57 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDB76E1BB3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2026 10:39:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=m8PWgmxB;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Qj+OZgWV;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=P0ArbRt3;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=YRn3jMfh;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vf+MK6brtWYdq42NWaNawvVKZMMKIzysYgtnGuzkUzs=; b=m8PWgmxBUhcrSKL0gFQ3H74/JJ
	cNIu6vTz0hX6BWkUbQ4LbrMtYs9cUIT1brv2TrR9oPkMK1RWYeJ6ug2Dble0xRs54th7ERBYsQ837
	4nh5FyXbTFhg3AXWXhTejZaMO1I4H0tmucB/s0tnU6+HG2MP+aIZeyabmHskr284GraU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1weU0N-0004it-Ln;
	Tue, 30 Jun 2026 08:39:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1weU06-0004g7-QZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jun 2026 08:39:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6s71emuTHT6HBeMcxZq4xEqeVZdW3tSJGiMZGO1k7OI=; b=Qj+OZgWVP8gdq3cEN8adI6qlJi
 EwVghmCQ6y3wRs9uwYnA0whIrVQ85SReL6NzHNZ502tq01anudQclWzhGEvgT3X8GG1qclZSJhxre
 ESbki7iT3MbKAdODe2Iil9oCittms/UKKaXRqSUtHoy+HTy2/HiT6bI0FhxTd37UBju8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6s71emuTHT6HBeMcxZq4xEqeVZdW3tSJGiMZGO1k7OI=; b=P0ArbRt3jHiELmGtQRsJtG68tn
 p2J66AOmTXJRGmoVtfr7dIx7VJgxjGwwBOI/luEXsXqwnBjRKZM5bHAnlk5wGbWpQ+K1G/gVHa7vq
 gI9J00f4ZO3bM0/U4vOgLpCk++vGB9pYClidbFKc5odZ/rVt62r8edfKFM8kUEvzcnK8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1weTzt-0004A4-NQ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jun 2026 08:39:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 650AB600DA;
 Tue, 30 Jun 2026 08:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B169A1F00A3F;
 Tue, 30 Jun 2026 08:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782808743;
 bh=6s71emuTHT6HBeMcxZq4xEqeVZdW3tSJGiMZGO1k7OI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=YRn3jMfhOtPp+kQ2fTc8VRJczrlwgZptzdLZ2nG97ptOSeRz5J7tq6Emeg0j3F9DI
 +LKf+aGWtPay3+kKwpt5cJyLYh2+u6sUsucuoRoTgTXN0wwKujyz5L/PnTb84LfLbv
 YzYTN/Czllsk51x3NLpTB+pxAafbcrU/wk2uohPx9cWZnp5BoozmaG20Za8Ug74nEz
 +w1uiMHoN2lEqVP7z/Yt1x/rbH3PfyCmB1gaszxhW0hRjzp4OS1E5jP8qmsYPihyUD
 Jyv8J/oU93PV9qO5JpGLWdWUgs5LGdcNp5jsCwkaxtncq8WO8N7zs00YBRNaLRBWFU
 f/q8DMZoWJbVA==
Message-ID: <bc4b29f0-8309-4a36-bdbe-b5f375aec31a@kernel.org>
Date: Tue, 30 Jun 2026 16:38:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20260622160830.324455-1-zhaonanzhe@xiaomi.com>
 <20260622160830.324455-3-zhaonanzhe@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20260622160830.324455-3-zhaonanzhe@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/23/26 00:08,
 Nanzhe Zhao wrote: > Large folio write paths
 need to submit I/O for a range inside a > folio instead of always submitting
 the whole folio from offset zero. > Add idx and cnt to f2fs_ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1weTzt-0004A4-NQ
Subject: Re: [f2fs-dev] [RFC PATCH v2 02/10] f2fs: carry subpage offset and
 count in write IO
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
Cc: Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>,
 Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org,
 David Hildenbrand <David.Hildenbrand@arm.com>, Bo Zhang <zhangbo56@xiaomi.com>,
 Kalesh Singh <kaleshsingh@google.com>, Ryan Roberts <Ryan.Roberts@arm.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Pengfei Li <lipengfei28@xiaomi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS(0.00)[m:zhaonanzhe@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,m:baohua@kernel.org,m:jyescas@google.com,m:Dev.Jain@arm.com,m:linux-kernel@vger.kernel.org,m:David.Hildenbrand@arm.com,m:zhangbo56@xiaomi.com,m:kaleshsingh@google.com,m:Ryan.Roberts@arm.com,m:jaegeuk@kernel.org,m:lipengfei28@xiaomi.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BDB76E1BB3

On 6/23/26 00:08, Nanzhe Zhao wrote:
> Large folio write paths need to submit I/O for a range inside a
> folio instead of always submitting the whole folio from offset zero.
> Add idx and cnt to f2fs_io_info to describe the block offset inside
> the folio and the number of contiguous blocks covered by the I/O.
> 
> Apply the new fields to the bio submit paths that need the subpage
> offset or contiguous block count.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>  fs/f2fs/data.c    | 58 ++++++++++++++++++++++++++++++++---------------
>  fs/f2fs/f2fs.h    |  2 ++
>  fs/f2fs/segment.c |  4 ++--
>  3 files changed, 44 insertions(+), 20 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 23758c00758d..9a2bb6d982df 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -779,6 +779,8 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
>  	struct folio *fio_folio = fio->folio;
>  	struct folio *data_folio = fio->encrypted_page ?
>  			page_folio(fio->encrypted_page) : fio_folio;
> +	pgoff_t fio_lblk = fio_folio->index + fio->idx;
> +	unsigned int fio_cnt = fio->cnt ? fio->cnt : 1;

How about cleaning up w/ below macros?

#define F2FS_FOLIO_INDEX(folio, fio)	(folio->index + fio->folio_offset)
#define F2FS_FOLIO_BLKCNT(fio)		(fio->folio_blkcnt ? fio->folio_blkcnt : 1)

>  
>  	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
>  			fio->is_por ? META_POR : (__is_meta_io(fio) ?
> @@ -791,11 +793,13 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
>  	bio = __bio_alloc(fio, 1);
>  
>  	f2fs_set_bio_crypt_ctx(bio, fio_folio->mapping->host,
> -			fio_folio->index, fio, GFP_NOIO);
> -	bio_add_folio_nofail(bio, data_folio, folio_size(data_folio), 0);
> +			fio_lblk, fio, GFP_NOIO);
> +	bio_add_folio_nofail(bio, data_folio,
> +			F2FS_BLK_TO_BYTES(fio_cnt), fio->idx << PAGE_SHIFT);
>  
>  	if (fio->io_wbc && !is_read_io(fio->op))
> -		wbc_account_cgroup_owner(fio->io_wbc, fio_folio, PAGE_SIZE);
> +		wbc_account_cgroup_owner(fio->io_wbc, fio_folio,
> +				F2FS_BLK_TO_BYTES(fio_cnt));
>  
>  	inc_page_count(fio->sbi, is_read_io(fio->op) ?
>  			__read_io_type(data_folio) : WB_DATA_TYPE(fio->folio, false));
> @@ -840,7 +844,8 @@ static bool io_is_mergeable(struct f2fs_sb_info *sbi, struct bio *bio,
>  }
>  
>  static void add_bio_entry(struct f2fs_sb_info *sbi, struct bio *bio,
> -				struct folio *folio, enum temp_type temp)
> +				struct folio *folio, size_t len, size_t offset,
> +				enum temp_type temp)
>  {
>  	struct f2fs_bio_info *io = sbi->write_io[DATA] + temp;
>  	struct bio_entry *be;
> @@ -849,7 +854,7 @@ static void add_bio_entry(struct f2fs_sb_info *sbi, struct bio *bio,
>  	be->bio = bio;
>  	bio_get(bio);
>  
> -	bio_add_folio_nofail(bio, folio, folio_size(folio), 0);
> +	bio_add_folio_nofail(bio, folio, len, offset);
>  
>  	f2fs_down_write(&io->bio_list_lock);
>  	list_add_tail(&be->list, &io->bio_list);
> @@ -866,6 +871,8 @@ static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
>  							struct folio *folio)
>  {
>  	struct folio *fio_folio = fio->folio;
> +	pgoff_t fio_lblk = fio_folio->index + fio->idx;
> +	unsigned int fio_cnt = fio->cnt ? fio->cnt : 1;
>  	struct f2fs_sb_info *sbi = fio->sbi;
>  	enum temp_type temp;
>  	bool found = false;
> @@ -888,8 +895,10 @@ static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
>  							    fio->new_blkaddr));
>  			if (f2fs_crypt_mergeable_bio(*bio,
>  					fio_folio->mapping->host,
> -					fio_folio->index, fio) &&
> -			    bio_add_folio(*bio, folio, folio_size(folio), 0)) {
> +					fio_lblk, fio) &&
> +			    bio_add_folio(*bio, folio,
> +					F2FS_BLK_TO_BYTES(fio_cnt),
> +					fio->idx << PAGE_SHIFT)) {
>  				ret = 0;
>  				break;
>  			}
> @@ -1003,6 +1012,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>  	struct folio *data_folio = fio->encrypted_page ?
>  			page_folio(fio->encrypted_page) : fio->folio;
>  	struct folio *folio = fio->folio;
> +	pgoff_t fio_lblk = folio->index + fio->idx;
>  
>  	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
>  			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC))
> @@ -1017,9 +1027,11 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>  	if (!bio) {
>  		bio = __bio_alloc(fio, BIO_MAX_VECS);
>  		f2fs_set_bio_crypt_ctx(bio, folio->mapping->host,
> -				folio->index, fio, GFP_NOIO);
> +				fio_lblk, fio, GFP_NOIO);
>  
> -		add_bio_entry(fio->sbi, bio, data_folio, fio->temp);
> +		add_bio_entry(fio->sbi, bio, data_folio,
> +				F2FS_BLK_TO_BYTES(fio->cnt ? fio->cnt : 1),
> +				fio->idx << PAGE_SHIFT, fio->temp);
>  	} else {
>  		if (add_ipu_page(fio, &bio, data_folio))
>  			goto alloc_new;
> @@ -1030,7 +1042,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>  
>  	inc_page_count(fio->sbi, WB_DATA_TYPE(folio, false));
>  
> -	*fio->last_block = fio->new_blkaddr;
> +	*fio->last_block = fio->new_blkaddr + (fio->cnt ? fio->cnt - 1 : 0);
>  	*fio->bio = bio;
>  
>  	return 0;
> @@ -1066,6 +1078,10 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>  	struct folio *bio_folio;
>  	struct f2fs_lock_context lc;
>  	enum count_type type;
> +	pgoff_t fio_lblk;
> +	unsigned int fio_cnt;
> +	size_t bio_offset;
> +	size_t bio_len;
>  
>  	f2fs_bug_on(sbi, is_read_io(fio->op));
>  
> @@ -1104,6 +1120,9 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>  	/* set submitted = true as a return value */
>  	fio->submitted = 1;
>  
> +	fio_lblk = fio->folio->index + fio->idx;
> +	fio_cnt = fio->cnt ? fio->cnt : 1;
> +
>  	type = WB_DATA_TYPE(bio_folio, fio->compressed_page);
>  	inc_page_count(sbi, type);
>  
> @@ -1111,26 +1130,29 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>  	    (!io_is_mergeable(sbi, io->bio, io, fio, io->last_block_in_bio,
>  			      fio->new_blkaddr) ||
>  	     !f2fs_crypt_mergeable_bio(io->bio, fio_inode(fio),
> -				bio_folio->index, fio)))
> +				fio_lblk, fio)))
>  		__submit_merged_bio(io);
>  alloc_new:
>  	if (io->bio == NULL) {
>  		io->bio = __bio_alloc(fio, BIO_MAX_VECS);
>  		f2fs_set_bio_crypt_ctx(io->bio, fio_inode(fio),
> -				bio_folio->index, fio, GFP_NOIO);
> +				fio_lblk, fio, GFP_NOIO);
>  		io->fio = *fio;
>  	}
>  
> -	if (!bio_add_folio(io->bio, bio_folio, folio_size(bio_folio), 0)) {
> +	bio_offset = fio->idx << PAGE_SHIFT;
> +	bio_len = F2FS_BLK_TO_BYTES(fio_cnt);
> +
> +	if (!bio_add_folio(io->bio, bio_folio, bio_len, bio_offset)) {
>  		__submit_merged_bio(io);
>  		goto alloc_new;
>  	}
>  
>  	if (fio->io_wbc)
>  		wbc_account_cgroup_owner(fio->io_wbc, fio->folio,
> -				folio_size(fio->folio));
> +				F2FS_BLK_TO_BYTES(fio_cnt));

bio_len));

>  
> -	io->last_block_in_bio = fio->new_blkaddr;
> +	io->last_block_in_bio = fio->new_blkaddr + fio_cnt - 1;
>  
>  	trace_f2fs_submit_folio_write(fio->folio, fio);
>  #ifdef CONFIG_BLK_DEV_ZONED
> @@ -2992,7 +3014,7 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
>  		return true;
>  
>  	if (fio) {
> -		if (page_private_gcing(fio->page))
> +		if (folio_test_f2fs_gcing(fio->folio))

Should this change belong to patch 1?

>  			return true;
>  		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
>  			f2fs_is_checkpointed_data(sbi, fio->old_blkaddr)))
> @@ -3031,7 +3053,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  		set_new_dnode(&dn, inode, NULL, NULL, 0);
>  
>  	if (need_inplace_update(fio) &&
> -	    f2fs_lookup_read_extent_cache_block(inode, folio->index,
> +	    f2fs_lookup_read_extent_cache_block(inode, folio->index + fio->idx,
>  						&fio->old_blkaddr)) {
>  		if (!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
>  						DATA_GENERIC_ENHANCE))
> @@ -3050,7 +3072,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>  	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi, &lc))
>  		return -EAGAIN;
>  
> -	err = f2fs_get_dnode_of_data(&dn, folio->index, LOOKUP_NODE);
> +	err = f2fs_get_dnode_of_data(&dn, folio->index + fio->idx, LOOKUP_NODE);
>  	if (err)
>  		goto out;
>  
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e4778c17394e..4c2902abe499 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1351,6 +1351,8 @@ struct f2fs_io_info {
>  	blk_opf_t op_flags;	/* req_flag_bits */
>  	block_t new_blkaddr;	/* new block address to be written */
>  	block_t old_blkaddr;	/* old block address before Cow */
> +	pgoff_t idx;		/* start block offset in the folio */

How about

pgoff_t folio_offset;		/* offset in large folio */

> +	unsigned int cnt;	/* block count in the folio */

unsigned int folio_blkcnt;	/* block count in large folio */

>  	union {
>  		struct page *page;	/* page to be written */
>  		struct folio *folio;
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index d71ddb3ee918..43d41bb3b4b1 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3686,7 +3686,7 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>  		if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
>  			return CURSEG_COLD_DATA_PINNED;
>  
> -		if (page_private_gcing(fio->page)) {
> +		if (folio_test_f2fs_gcing(fio->folio)) {

Should this change belong to patch 1?

Thanks,

>  			if (fio->sbi->am.atgc_enabled &&
>  				(fio->io_type == FS_DATA_IO) &&
>  				(fio->sbi->gc_mode != GC_URGENT_HIGH) &&
> @@ -3699,7 +3699,7 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>  		if (file_is_cold(inode) || f2fs_need_compress_data(inode))
>  			return CURSEG_COLD_DATA;
>  
> -		type = __get_age_segment_type(inode, fio->folio->index);
> +		type = __get_age_segment_type(inode, fio->folio->index + fio->idx);
>  		if (type != NO_CHECK_TYPE)
>  			return type;
>  



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
