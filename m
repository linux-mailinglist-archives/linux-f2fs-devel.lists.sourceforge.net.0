Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3LgAAu0OPmpM/QgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jun 2026 07:32:29 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C596CA66D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jun 2026 07:32:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=RxlfChfU;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=MUEktW0j;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=FGp5qigr;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=lst.de (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5KHKJ4H8SLsHDaJnmjtokz/BXVJWPGaXBdGG2N6SWg=; b=RxlfChfU3NCyl66mp8WFrHv6oW
	jjTYT8Id8Y1nI6291lZOrBIQOA3BGRaAeth4LLv/yleELLHJYYg37RHnYh6NqBWiHtWNLMG3MH5sd
	nj5O99apakfROQZ6XpJ1mKiFWWREXgBb2T0x8WEXQWRCx62dsKC5pvcVW9uf5zNilFxo=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wczAu-0002R4-Oh;
	Fri, 26 Jun 2026 05:32:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1wczAu-0002Qy-3I
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jun 2026 05:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e0uct1L3IgAtqbOcFCvfL9SMtjjUEZsQND8tvgvJ9a0=; b=MUEktW0jMlBuHWQgrBaLUE2RWk
 EE45wj/mG0LKqiMHv9gUC+kGT5qkpL+SFwThiR1xs0horMNfdpjjBBgN8662BA39+YLRVcHi5qGsB
 Yd+c0BiT4qHbyoKxUMUrmdoC5Li7wsD94nNTMxwvXlDw/wTmbwbY1bUZP7dF+WByRAYg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e0uct1L3IgAtqbOcFCvfL9SMtjjUEZsQND8tvgvJ9a0=; b=FGp5qigrixR98DSEznt+dTFwAD
 5dIgAzNgbc0N/g6w5/aYXbAB8xgUZdwCHbviiMqE9YMQOa2UMiFK7KTta0Hr+oQDxXffqJXUpT6ZO
 TRB1sKFvewQbQXrXJtbRWL82fyf6hCMheCeYcGC6EStUuf/bCbNMVxMlp+MbH6s8EGws=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wczAr-0001Gh-US for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jun 2026 05:32:24 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7065F68B05; Fri, 26 Jun 2026 07:32:08 +0200 (CEST)
Date: Fri, 26 Jun 2026 07:32:07 +0200
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20260626053207.GN9043@lst.de>
References: <20260624050334.124606-1-ebiggers@kernel.org>
 <20260624050334.124606-16-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260624050334.124606-16-ebiggers@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 23, 2026 at 10:03:33PM -0700, Eric Biggers wrote:
 > Now that fscrypt always uses blk-crypto on block-based filesystems, > there's
 no meaningful difference between bio.c and inline_crypt.c. [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1wczAr-0001Gh-US
Subject: Re: [f2fs-dev] [PATCH 15/16] fscrypt: Merge bio.c and
 inline_crypt.c into block.c
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
Cc: Ritesh Harjani <ritesh.list@gmail.com>, Theodore Ts'o <tytso@mit.edu>,
 Zhang Yi <yi.zhang@huawei.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, Baokun Li <libaokun@linux.alibaba.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fsdevel@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:ritesh.list@gmail.com,m:tytso@mit.edu,m:yi.zhang@huawei.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:linux-fscrypt@vger.kernel.org,m:adilger.kernel@dilger.ca,m:ojaswin@linux.ibm.com,m:libaokun@linux.alibaba.com,m:jaegeuk@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:riteshlist@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[15];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,mit.edu,huawei.com,lists.sourceforge.net,vger.kernel.org,dilger.ca,linux.ibm.com,linux.alibaba.com,kernel.org,suse.cz,lst.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lst.de:mid,lst.de:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3C596CA66D

On Tue, Jun 23, 2026 at 10:03:33PM -0700, Eric Biggers wrote:
> Now that fscrypt always uses blk-crypto on block-based filesystems,
> there's no meaningful difference between bio.c and inline_crypt.c.
> Therefore merge the two files into one named block.c.
> 
> Note: I didn't carry over bio.c's "Copyright (C) 2015, Motorola
> Mobility", as none of the code that applied to remained.

Yeah the current from of the code is almost entirely mine,
with some slight traces of your earlier version.

> +struct fscrypt_zero_done {
> +	atomic_t		pending;
> +	blk_status_t		status;
> +	struct completion	done;
> +};
> +
> +static void fscrypt_zeroout_range_done(struct fscrypt_zero_done *done)
> +{
> +	if (atomic_dec_and_test(&done->pending))
> +		complete(&done->done);
> +}
> +
> +static void fscrypt_zeroout_range_end_io(struct bio *bio)
> +{
> +	struct fscrypt_zero_done *done = bio->bi_private;
> +
> +	if (bio->bi_status)
> +		cmpxchg(&done->status, 0, bio->bi_status);
> +	fscrypt_zeroout_range_done(done);
> +	bio_put(bio);
> +}
> +
> +/**
> + * fscrypt_zeroout_range() - zero out a range of blocks in an encrypted file
> + * @inode: the file's inode
> + * @pos: the first file position (in bytes) to zero out
> + * @sector: the first sector to zero out
> + * @len: bytes to zero out
> + *
> + * Zero out filesystem blocks in an encrypted regular file on-disk, i.e. write
> + * ciphertext blocks which decrypt to the all-zeroes block.  The blocks must be
> + * both logically and physically contiguous.  It's also assumed that the
> + * filesystem only uses a single block device, ->s_bdev.  @len must be a
> + * multiple of the file system logical block size.
> + *
> + * Note that since each block uses a different IV, this involves writing a
> + * different ciphertext to each block; we can't simply reuse the same one.
> + *
> + * Return: 0 on success; -errno on failure.
> + */
> +int fscrypt_zeroout_range(const struct inode *inode, loff_t pos,
> +			  sector_t sector, u64 len)

.. but I wonder if we should rename this and move it to libfs, as it
works just fine without encyption and file systems could call it
for the non-fscrypt case and consolidate on a single implementation.

But maybe some other time, no need to complicate this series.

Reviewed-by: Christoph Hellwig <hch@lst.de>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
