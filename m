Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPVPO8kJomngyQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 22:16:57 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8811BE207
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 22:16:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsdbDCIDVJD0qC9MXZOqLQnXe4gLg8aD4qGFUU7szLg=; b=V6IssbgVFZjQO+Tn/gntDn1aw3
	38YP4HNfh/l/3/DFniQ9MtxNpKy+oVtJl2HtjpERphiQoCs8e8QujAmr5Z/Vewmr9924bIxHSsqjb
	PeG9TAsW9PBKQj/hdMv+1tD7Ynd6N0U7oTX6f73kfUA76trUddV9/L45KZKWECzN+8vM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vw5Cb-0001RB-9Q;
	Fri, 27 Feb 2026 21:16:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vw5Ca-0001R4-Mi
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 21:16:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zXVfmxf4g/bnN/LYPTymK0sWVKMq8DJB0yar+wfUCgo=; b=a9j9C0LsaM+IfdmVlddT7/iQim
 rZMfRs/GYxC6064YPZHnHgFwSFn4z0wmYI8SpFXJbu1q8d9bkcOj/OUfwmWNZ9z19q/OONMXtuSEg
 Cwhky94lCyseS9/RTIKW8sWs7Sxim85hwNMS09ck6dNRzzY1v5CyvDaNJmkbean3EbQ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zXVfmxf4g/bnN/LYPTymK0sWVKMq8DJB0yar+wfUCgo=; b=cmXFgdKhG/eQ2m9wQUfGpofcS7
 sM0alZnJ9p6qQi+kM1Ki8unf9hUh3IWuu6zSVZlMEQOnKLJdd5rZfmWL6DvrQiEHg2x/A9sgGDjpt
 W6g36XdkCsgBJdOk/uHUvnvxt7V1z2TulcW7aa95zSg4uAOqZb410H6huNpydHYOVGrw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vw5Ca-0005aq-AV for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 21:16:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0B1AD4363F;
 Fri, 27 Feb 2026 21:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4098C116C6;
 Fri, 27 Feb 2026 21:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772227002;
 bh=IYVWg1WHxAiTLvaxqvVywcr6KglLqSKrG5o1wA/srJs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n9Y/HrUWuZUg8+lNeTyzL6gTo253Vmxl1ioHnAfR/Aw49uUiAtNG2CfzgiUzkQPnv
 i5wHzU2ZHD3Itr0lRNfzL2rLy5lO4IAwdYXDiLa1avnHMcu5omFm/imvcMJTEbprOA
 65ZHdkbBbAdcqTPhW5d0hEmXXfLDwogzOWPs1j1DOIbIfzXmKLD1iMbzOj6DPgQWRj
 rokEjrjD8NyzHqZEf5OuPk7Q304WhRVSDKrP/ARW4BrDkqJA1RMQvdyQARjpohDELu
 zp7/mVlTgNARTjjmcQHQqvohZsVLz6Jq8iLNo4HPMcWhjMjRDViVvw8N3gWX2YYMam
 Us/UIEQtE2HHA==
Date: Fri, 27 Feb 2026 13:16:39 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260227211639.GA2659@quark>
References: <20260226144954.142278-1-hch@lst.de>
 <20260226144954.142278-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260226144954.142278-2-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Feb 26, 2026 at 06:49:21AM -0800, Christoph Hellwig
 wrote: > Make io_submit_init_bio complete by also initializing the write
 hint. > > Signed-off-by: Christoph Hellwig <hch@lst.de> > --- > fs/ [...] 
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
X-Headers-End: 1vw5Ca-0005aq-AV
Subject: Re: [f2fs-dev] [PATCH 01/14] ext4: initialize the write hint in
 io_submit_init_bio
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:adilger.kernel@dilger.ca,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lst.de:email]
X-Rspamd-Queue-Id: 9F8811BE207
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 06:49:21AM -0800, Christoph Hellwig wrote:
> Make io_submit_init_bio complete by also initializing the write hint.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/ext4/page-io.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
> index a8c95eee91b7..a3644d6cb65f 100644
> --- a/fs/ext4/page-io.c
> +++ b/fs/ext4/page-io.c
> @@ -416,6 +416,7 @@ void ext4_io_submit_init(struct ext4_io_submit *io,
>  }
>  
>  static void io_submit_init_bio(struct ext4_io_submit *io,
> +			       struct inode *inode,
>  			       struct buffer_head *bh)
>  {
>  	struct bio *bio;
> @@ -430,6 +431,7 @@ static void io_submit_init_bio(struct ext4_io_submit *io,
>  	bio->bi_end_io = ext4_end_bio;
>  	bio->bi_private = ext4_get_io_end(io->io_end);
>  	io->io_bio = bio;
> +	io->io_bio->bi_write_hint = inode->i_write_hint;
>  	io->io_next_block = bh->b_blocknr;
>  	wbc_init_bio(io->io_wbc, bio);
>  }

Maybe make this consistent with the other initializations by moving it
up a line and doing:

        bio->bi_write_hint = inode->i_write_hint;

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
