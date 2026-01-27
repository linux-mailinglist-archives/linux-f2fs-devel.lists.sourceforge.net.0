Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOE3O6hUeGn2pQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Jan 2026 07:01:12 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 725A59036F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Jan 2026 07:01:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLOE11yi+RGbRNRmNnTCbdEQmADKxpdIdC9afv4Sjns=; b=N+Dh/EidDgBVJRKsaLLrQKPsTi
	tgG0nCxPuAjWsuWeONINQ4jSzOqomhlULO77B3a9u5cZv5vTeWVwKbhhKiW6jxb04SWggbYhG7w9t
	MS+zNymDULULK2z/r1tcizC627IdYS4bBsfDrIlAQznvW9nvVV2CMAG7zJ5nOsl7NvDk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkc8H-0007Sb-7d;
	Tue, 27 Jan 2026 06:00:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vkc8E-0007SS-UE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Jan 2026 06:00:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pq2GAnj+R+VopKYNG1HcP8+Dw2iFR6lf4LD1E7BEA98=; b=ixKIaGl8eL18t6mbL1HUoAeTni
 PK3EFN4q0WWspzfHFG88448gOUJJhKRmKRW071PSacYgERoQrVNe4JDA6QNiMGkQ4WcFwz7xUq3w7
 xqCigHOWgK1g+E2fsCTH45hz2vnLptfIz9JPoiL0ZLlbdFCrk+7yAi5Etkl95CmpUuC0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pq2GAnj+R+VopKYNG1HcP8+Dw2iFR6lf4LD1E7BEA98=; b=DKRW93TZI+r+PgD9LwMDqUHSFo
 C9ouoqj345/SDYyCQwg8d+StCWEWSwXO6YKMYD5/QcsT6wO3ImR4GQ/a957KkpaL81EeHq2HAqLYJ
 yvBu2LDQMnu9eJO9wwsg2W7WHZP9+VUCQvOQHRb5oJAxhEFtUpm9JQmFMtagBLskkKac=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkc8E-0000vT-9F for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Jan 2026 06:00:54 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id CEE5D227AAE; Tue, 27 Jan 2026 07:00:39 +0100 (CET)
Date: Tue, 27 Jan 2026 07:00:39 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20260127060039.GA25321@lst.de>
References: <20260126045212.1381843-1-hch@lst.de>
 <20260126045212.1381843-8-hch@lst.de> <20260126191102.GO5910@frogsfrogsfrogs>
 <20260126205301.GD30838@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260126205301.GD30838@quark>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 26, 2026 at 12:53:01PM -0800, Eric Biggers wrote:
 > Then for the final version in generic_readahead_merkle_tree(), one > option
 would be: > > struct folio *folio; > > folio = __filemap_get [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vkc8E-0000vT-9F
Subject: Re: [f2fs-dev] [PATCH 07/16] fsverity: don't issue readahead for
 non-ENOENT errors from __filemap_get_folio
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
 Andrey Albershteyn <aalbersh@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:djwong@kernel.org,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RWL_MAILSPIKE_POSSIBLE(0.00)[216.105.38.7:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 725A59036F
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 12:53:01PM -0800, Eric Biggers wrote:
> Then for the final version in generic_readahead_merkle_tree(), one
> option would be:
> 
> 	struct folio *folio;
> 
> 	folio = __filemap_get_folio(inode->i_mapping, index, FGP_ACCESSED, 0);
> 	if (folio == ERR_PTR(-ENOENT) ||
> 	    (!IS_ERR(folio) && !folio_test_uptodate(folio))) {
> 		DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, index);
> 
> 		page_cache_ra_unbounded(&ractl, nr_pages, 0);
> 	}
> 	if (!IS_ERR(folio))
> 		folio_put(folio);
> 
> Or as a diff from this series:

I ended up doing the second version (which is what I intended to do
anyway, but messed up the brace placement) in this patch.  It then
automatically carries over to the readahead split.

> 
> -	if (PTR_ERR(folio) == -ENOENT ||
> -	    !(IS_ERR(folio) && !folio_test_uptodate(folio))) {
> +	if (folio == ERR_PTR(-ENOENT) ||
> +	    (!IS_ERR(folio) && !folio_test_uptodate(folio))) {
> 
> (Note that PTR_ERR() shouldn't be used before it's known that the
> pointer is an error pointer.)

That's new to me, and I can't find anything in the documentation or
implementation suggesting that.  Your example code above also does
this as does plenty of code in the kernel elsewhere.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
