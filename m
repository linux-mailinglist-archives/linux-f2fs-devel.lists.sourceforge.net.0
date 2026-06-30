Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YBEeCcagQ2rldgoAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2026 12:56:06 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7946E3306
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2026 12:56:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=QbaB7MMN;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Rky7fPYu;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=RQaJDoQT;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=NbF3gsTl;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qo6OW0w+C7qRBlKofkVBwWMBMkUTbCdUqDIBmdO3Lc=; b=QbaB7MMNT1utbswFZpaGJQyYb2
	mf+StXzj+udMjslkvRg5ytauL2oHsiqZcQYskETuiK2Zfdo5GcXMDxPXPMB5qvg+XVEjPTvJ1XT6U
	0aIqwqKh+ITZyuN06xDqojKGI4M8SAuBUbZe5VxEcI5gg9CKzH7wyqbPq1wubOnwMXac=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1weW8G-00072j-Te;
	Tue, 30 Jun 2026 10:55:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1weW8F-00072c-75
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jun 2026 10:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0ey8b/L92o5zy9KlFQMm/3L9mSdMZ5wzovUEyXt142g=; b=Rky7fPYuAgkvO1MMyYAPQv3obY
 pfl5CftSYBku+3yN7F82+UPqxfErAisyhHzCtFZAyIlV6+IK8YyWiKDe/V6zScGcpySksl54HVvCf
 GkVuFk9eObnW0xKJ9nWhhcC/JGVbTNyWzwvQn0Xvw0B4vVQRPh2/X3ccX8Nr29bpaeX8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0ey8b/L92o5zy9KlFQMm/3L9mSdMZ5wzovUEyXt142g=; b=RQaJDoQTbhwbvchzHAciQxwW+4
 QpJU6GQgDChGlZU7fRNLkB6V6Ple1rytZ3PMnXZfSRzmyUw6FGB4fnB4LunVYSJjtDuivS3FzZc6d
 bAjUMZ43IdwpGnOtJw8rgZsfXf+tKFrtbMzulAgbqTdBbA1oGaJ6N0UP1h4BBCyJ5Idc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1weW8B-0008V4-5I for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jun 2026 10:55:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5112B4028E;
 Tue, 30 Jun 2026 10:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE69C1F000E9;
 Tue, 30 Jun 2026 10:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782816945;
 bh=0ey8b/L92o5zy9KlFQMm/3L9mSdMZ5wzovUEyXt142g=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=NbF3gsTlRWxKkbw91ByC2+GEjU6nuKbYFfqTQzQCmxGag0ViyyiDm45tS7Zctg8Uo
 oIJH88JHLkT1UFXMN7ZMmKQHpEsRjjvdlixHUINHC+lMQraGnHPwprurK8uWXJQ7yd
 hlD4nYYND53fwVXdtvDHVEJ5vPwOigh5xXoxEiFHkFrRV/fFGniOKdoC06X30xxt4l
 yEl3FQc5nR83DZpZK1sYI9PO39bzkD0TkgIn2Sc+SY8EN68ar0MLQ1D6uMM0pqaOnw
 NGrhWEXqCN6wYJZ9nX/xn1Mf+8SQlWNYxrcKIRtpUoqNWf3hGsWaYPuYTSmfYg1rQ0
 1WNR5MzHpHqtA==
Message-ID: <64ce7a28-992d-4d20-bbb1-b76943911ab4@kernel.org>
Date: Tue, 30 Jun 2026 18:55:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20260612080334.70657-1-zhaonanzhe@xiaomi.com>
 <20260612080334.70657-4-zhaonanzhe@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20260612080334.70657-4-zhaonanzhe@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/12/26 16:03,
 Nanzhe Zhao wrote: > From: Nanzhe <zhaonanzhe@xiaomi.com>
 > > To avoid the complexity of unlocking a large folio in write_begin, >
 preallocate partial blocks for inodes that can use [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1weW8B-0008V4-5I
Subject: Re: [f2fs-dev] [RFC PATCH 3/9] f2fs: support regular file buffered
 writes on large folios
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
Cc: Barry Song <baohua@kernel.org>, Ryan Roberts <Ryan.Roberts@arm.com>,
 Juan Yescas <jyescas@google.com>, Dev Jain <Dev.Jain@arm.com>,
 David Hildenbrand <David.Hildenbrand@arm.com>,
 Pengfei Li <lipengfei28@xiaomi.com>, Bo Zhang <zhangbo56@xiaomi.com>,
 Kalesh Singh <kaleshsingh@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhaonanzhe@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,m:baohua@kernel.org,m:Ryan.Roberts@arm.com,m:jyescas@google.com,m:Dev.Jain@arm.com,m:David.Hildenbrand@arm.com,m:lipengfei28@xiaomi.com,m:zhangbo56@xiaomi.com,m:kaleshsingh@google.com,m:jaegeuk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F7946E3306

On 6/12/26 16:03, Nanzhe Zhao wrote:
> From: Nanzhe <zhaonanzhe@xiaomi.com>
> 
> To avoid the complexity of unlocking a large folio in write_begin,
> preallocate partial blocks for inodes that can use large folios.
> During write_begin, read only the partial head and tail 4K subpages
> that need read-before-write, and skip read I/O for the full middle
> subpages covered by the write.
> 
> Signed-off-by: Nanzhe <zhaonanzhe@xiaomi.com>
> ---
>  fs/f2fs/data.c | 215 ++++++++++++++++++++++++++++++++++++++++++++++---
>  fs/f2fs/f2fs.h |   2 +
>  fs/f2fs/file.c |  17 +++-
>  3 files changed, 222 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 904cfaee139e..f5b4974e6b3c 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2548,6 +2548,187 @@ static void ffs_detach_free(struct folio *folio)
>  	kfree(ffs);
>  }
>  
> +bool ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index)

If the function is global, it needs to add f2fs_ prefix, otherwise it will
pollute global namespace.

> +{
> +	struct f2fs_folio_state *ffs;
> +	size_t offset;
> +	unsigned int idx;
> +
> +	if (!folio_has_ffs(folio))
> +		return folio_test_uptodate(folio);
> +
> +	ffs = folio->private;
> +	offset = offset_in_folio(folio, (loff_t)index << PAGE_SHIFT);

Can we add sanity check here to detect any overflow or downflow? in case
index is not in the range of folio.

> +	idx = offset >> PAGE_SHIFT;
> +	return test_bit(idx, ffs->state);
> +}
> +
> +void ffs_mark_subrange_uptodate(struct folio *folio, size_t offset, size_t len)
> +{
> +	struct f2fs_folio_state *ffs;
> +	unsigned int nr_subpages, start, end;
> +
> +	if (!folio_has_ffs(folio)) {
> +		folio_mark_uptodate(folio);
> +		return;
> +	}

Add a sanity check on offset, len w/ folio size?

> +
> +	ffs = folio->private;
> +	nr_subpages = folio_nr_pages(folio);
> +	start = offset >> PAGE_SHIFT;
> +	end = (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> +	end = min(end, nr_subpages);
> +
> +	bitmap_set(ffs->state, start, end - start);
> +	if (bitmap_full(ffs->state, nr_subpages))
> +		folio_mark_uptodate(folio);
> +}
> +
> +static void ffs_mark_subrange_dirty(struct folio *folio,
> +				    size_t offset, size_t len)
> +{
> +	struct f2fs_folio_state *ffs;
> +	unsigned int nr_subpages, start, end;
> +	unsigned long flags;
> +
> +	if (!folio_has_ffs(folio))
> +		return;

Ditto, sanity check here.

> +
> +	ffs = folio->private;
> +	nr_subpages = folio_nr_pages(folio);
> +	start = offset >> PAGE_SHIFT;
> +	end = (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> +	end = min(end, nr_subpages);
> +
> +	spin_lock_irqsave(&ffs->state_lock, flags);
> +	bitmap_set(ffs->state, nr_subpages + start, end - start);
> +	spin_unlock_irqrestore(&ffs->state_lock, flags);
> +}
> +
> +static bool f2fs_find_next_need_read_block(const struct folio *folio,

Since it's static, we can get rid of f2fs_ prefix,

find_next_invalid_block() will be better? not sure.

> +					  size_t orig_off, size_t *need_off,
> +					  size_t len)
> +{
> +	size_t start = orig_off;
> +	size_t end = start + len;
> +	size_t head, tail;
> +	pgoff_t index;
> +
> +	if (start & (PAGE_SIZE - 1)) {
> +		head = round_down(start, PAGE_SIZE);
> +		index = folio->index + (head >> PAGE_SHIFT);
> +		if (!ffs_test_blk_uptodate(folio, index)) {
> +			*need_off = head;
> +			return true;
> +		}
> +	}
> +
> +	if (end & (PAGE_SIZE - 1)) {
> +		tail = round_down(end - 1, PAGE_SIZE);
> +		index = folio->index + (tail >> PAGE_SHIFT);
> +		if (!ffs_test_blk_uptodate(folio, index)) {
> +			*need_off = tail;
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
> +static int prepare_large_folio_write_begin(struct inode *inode,
> +					  struct address_space *mapping,
> +					  struct folio *folio, loff_t pos,
> +					  unsigned int len)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct dnode_of_data dn;
> +	size_t ori_off = offset_in_folio(folio, pos);
> +	size_t need_off = ori_off;
> +	pgoff_t index;
> +	bool get_dn;
> +	int err = 0;
> +	sector_t sector;
> +	struct block_device *bdev;
> +	struct bio *bio;
> +
> +	len = min_t(unsigned int, len, folio_size(folio) - ori_off);
> +	if (folio_test_uptodate(folio) || len == folio_size(folio))
> +		return err;
> +
> +	ffs_find_or_alloc(folio);
> +
> +	/* Inline data must have been converted before reaching here. */
> +	if (WARN_ON_ONCE(f2fs_has_inline_data(inode)))

Can this really happen? can we change it to f2fs_bug_on()?

> +		return -EINVAL;
> +
> +	while (f2fs_find_next_need_read_block(folio, ori_off, &need_off, len)) {
> +		size_t off;
> +
> +		index = folio->index + (need_off >> PAGE_SHIFT);
> +		get_dn = false;
> +
> +		if (!f2fs_lookup_read_extent_cache_block(inode, index,
> +						 &dn.data_blkaddr)) {
> +			if (IS_DEVICE_ALIASING(inode))
> +				return -ENODATA;
> +
> +			set_new_dnode(&dn, inode, NULL, NULL, 0);
> +			err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
> +			get_dn = true;
> +			if (err)
> +				goto out;

Missed to call f2fs_put_dnode(&dn) in the loop?

> +		}
> +
> +		if (dn.data_blkaddr == NULL_ADDR) {

It's not needed, as below f2fs_is_valid_blkaddr() can cover this case.

> +			err = -EFSCORRUPTED;
> +			goto out;
> +		}
> +
> +		off = offset_in_folio(folio, index << PAGE_SHIFT);
> +
> +		if (dn.data_blkaddr == NEW_ADDR) {
> +			folio_zero_segment(folio, off, off + PAGE_SIZE);
> +			ffs_mark_subrange_uptodate(folio, off, PAGE_SIZE);
> +			continue;
> +		}
> +
> +		if (!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
> +				DATA_GENERIC_ENHANCE_READ)) {
> +			err = -EFSCORRUPTED;
> +			goto out;
> +		}

I think we can only check dn.data_blkaddr for f2fs_get_dnode_of_data() path.

> +
> +		/* Submit a synchronous read for this 4K subpage. */
> +		f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
> +		bdev = f2fs_target_device(sbi, dn.data_blkaddr, &sector);
> +
> +		bio = bio_alloc_bioset(bdev, 1, REQ_OP_READ | REQ_SYNC,
> +				       GFP_NOIO, &f2fs_bioset);
> +		bio->bi_iter.bi_sector = sector;
> +		f2fs_set_bio_crypt_ctx(bio, inode, index, NULL, GFP_NOFS);
> +
> +		if (!bio_add_folio(bio, folio, PAGE_SIZE, off)) {
> +			bio_put(bio);
> +			err = -EIO;
> +			goto out;
> +		}
> +
> +		err = submit_bio_wait(bio);

If we didn't call f2fs_submit_read_bio(), we may miss to handle tracepoint,
iostat and blk_crypto stuff?

Thanks,


> +		bio_put(bio);
> +		if (err)
> +			goto out;
> +
> +		ffs_mark_subrange_uptodate(folio, off, PAGE_SIZE);
> +
> +	}
> +
> +out:
> +		if (get_dn)
> +			f2fs_put_dnode(&dn);
> +
> +		return err;
> +}
> +
>  static int f2fs_read_data_large_folio(struct inode *inode,
>  		struct fsverity_info *vi,
>  		struct readahead_control *rac, struct folio *folio)
> @@ -3940,6 +4121,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>  	bool need_balance = false;
>  	bool use_cow = false;
>  	block_t blkaddr = NULL_ADDR;
> +	fgf_t fgp = FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_NOFS;
>  	int err = 0;
>  
>  	trace_f2fs_write_begin(inode, pos, len);
> @@ -3987,9 +4169,9 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>  	 * Do not use FGP_STABLE to avoid deadlock.
>  	 * Will wait that below with our IO control.
>  	 */
> -	folio = f2fs_filemap_get_folio(mapping, index,
> -				FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_NOFS,
> -				mapping_gfp_mask(mapping));
> +	fgp |= fgf_set_order(len);
> +	folio = __filemap_get_folio(mapping, index, fgp,
> +				    mapping_gfp_mask(mapping));
>  	if (IS_ERR(folio)) {
>  		err = PTR_ERR(folio);
>  		goto fail;
> @@ -4002,7 +4184,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>  	if (f2fs_is_atomic_file(inode))
>  		err = prepare_atomic_write_begin(sbi, folio, pos, len,
>  					&blkaddr, &need_balance, &use_cow);
> -	else
> +	else if (!folio_test_large(folio))
>  		err = prepare_write_begin(sbi, folio, pos, len,
>  					&blkaddr, &need_balance);
>  	if (err)
> @@ -4023,6 +4205,14 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>  
>  	f2fs_folio_wait_writeback(folio, DATA, false, true);
>  
> +	if (folio_test_large(folio)) {
> +		err = prepare_large_folio_write_begin(inode, mapping, folio,
> +					pos, len);
> +		if (!err)
> +			return 0;
> +		goto put_folio;
> +	}
> +
>  	if (len == folio_size(folio) || folio_test_uptodate(folio))
>  		return 0;
>  
> @@ -4076,15 +4266,19 @@ static int f2fs_write_end(const struct kiocb *iocb,
>  	trace_f2fs_write_end(inode, pos, len, copied);
>  
>  	/*
> -	 * This should be come from len == PAGE_SIZE, and we expect copied
> -	 * should be PAGE_SIZE. Otherwise, we treat it with zero copied and
> -	 * let generic_perform_write() try to copy data again through copied=0.
> +	 * If a short copy happens on a folio that isn't uptodate, we treat
> +	 * it with zero copied and let generic_perform_write() try to copy
> +	 * data again through copied=0.
>  	 */
>  	if (!folio_test_uptodate(folio)) {
> -		if (unlikely(copied != len))
> +		if (unlikely(copied != len)) {
>  			copied = 0;
> -		else
> +		} else if (folio_test_large(folio)) {
> +			ffs_mark_subrange_uptodate(folio,
> +					offset_in_folio(folio, pos), len);
> +		} else {
>  			folio_mark_uptodate(folio);
> +		}
>  	}
>  
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
> @@ -4103,6 +4297,9 @@ static int f2fs_write_end(const struct kiocb *iocb,
>  	if (!copied)
>  		goto unlock_out;
>  
> +	if (folio_test_large(folio))
> +		ffs_mark_subrange_dirty(folio, offset_in_folio(folio, pos),
> +					copied);
>  	folio_mark_dirty(folio);
>  
>  	if (f2fs_is_atomic_file(inode))
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index dd262eb41777..ac71d0d22a81 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4253,6 +4253,8 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
>  				struct writeback_control *wbc,
>  				enum iostat_type io_type,
>  				int compr_blocks, bool allow_balance);
> +bool ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index);
> +void ffs_mark_subrange_uptodate(struct folio *folio, size_t offset, size_t len);
>  void f2fs_write_failed(struct inode *inode, loff_t to);
>  void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
>  bool f2fs_release_folio(struct folio *folio, gfp_t wait);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 633e9ade654f..eb8e237f3dad 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -5048,9 +5048,20 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
>  			return ret;
>  	}
>  
> -	/* Do not preallocate blocks that will be written partially in 4KB. */
> -	map.m_lblk = F2FS_BLK_ALIGN(pos);
> -	map.m_len = F2FS_BYTES_TO_BLK(pos + count);
> +	if (mapping_large_folio_support(inode->i_mapping)) {
> +		/*
> +		 * Preallocate all blocks touched by a large-folio buffered write so
> +		 * the regular write_begin path does not need to unlock the folio for
> +		 * f2fs_balance_fs().  Rechecking large-folio state after unlock is
> +		 * unreliable since partial truncation can split the folio.
> +		 */
> +		map.m_lblk = F2FS_BYTES_TO_BLK(pos);
> +		map.m_len = F2FS_BLK_ALIGN(pos + count);
> +	} else {> +		/* Do not preallocate blocks that will be written partially in 4KB. */
> +		map.m_lblk = F2FS_BLK_ALIGN(pos);
> +		map.m_len = F2FS_BYTES_TO_BLK(pos + count);
> +	}
>  	if (map.m_len > map.m_lblk)
>  		map.m_len -= map.m_lblk;
>  	else



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
