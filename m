Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKbbMwnxdmmcZQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:43:53 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A04B83EFF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:43:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yk/Q9+np7TS4US9g8qFKu7ZPHizPQrM9y/6BZtiOJs8=; b=BGxDlQ/H925c5Qn0pWqS8TCmyo
	xe8Ot0iVo8I2hJ1rmamuedw4LVnE0xLry/yqJ91z6TlKKbwSzemnEdeFQ7W5a+0pxY9vhbEwiO4mU
	rXXuhmV9i4sUEKiCCwkfzcGqt37bYkdqwNTe/GGPvYjuX5mnFKQ6YOsW+wW+k99Mw96w=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkES3-0001c2-OB;
	Mon, 26 Jan 2026 04:43:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vkES2-0001bv-Lm
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:43:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YZVqsb2Gp776bzJOjjC5rEG5Ale6hdukmyaDkJMapzc=; b=SPcDMgiTPG2Spzer8lmeUIzuGt
 6GgjPOl1jXiNShiXc8upGwwmoo0uTl/KM+MctzO2k8GfIkygtsH79MXiKREdhlnx6MDRIJReVw922
 rXoqhAW/180fwMBlRNF6zC6e+h9uQJ3fz5RCpLlw6NcXKU1YQ3aHe1LCDscQnHHCzMPI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YZVqsb2Gp776bzJOjjC5rEG5Ale6hdukmyaDkJMapzc=; b=f9NarVs5wOmtJGAhrmxCrJuQKO
 R10gVX/6dx88z9795MnFQI6GVJtgMWXhCC/8hijfNdmCnu5pkP8GbOw01932mMt25O/uf30Q/TKoD
 khrzwyAXATJq/YqYKgdyrkdrcH5VnLMgwajiB57SOH/xYyS5JgWmq089sjGNBiunwa0w=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkES2-0001U0-6c for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:43:46 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 938F3227A88; Mon, 26 Jan 2026 05:43:33 +0100 (CET)
Date: Mon, 26 Jan 2026 05:43:33 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20260126044333.GD30803@lst.de>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-12-hch@lst.de> <20260125013104.GA2255@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260125013104.GA2255@sol>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Jan 24, 2026 at 05:31:04PM -0800, Eric Biggers wrote:
 > > + found = rhashtable_lookup_get_insert_fast(&fsverity_info_hash, > >
 + &vi->rhash_head, fsverity_info_hash_params); > > + if (found) { [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vkES2-0001U0-6c
Subject: Re: [f2fs-dev] [PATCH 11/11] fsverity: use a hashtable to find the
 fsverity_info
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
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>,
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
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6A04B83EFF
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 05:31:04PM -0800, Eric Biggers wrote:
> > +	found = rhashtable_lookup_get_insert_fast(&fsverity_info_hash,
> > +			&vi->rhash_head, fsverity_info_hash_params);
> > +	if (found) {
> > +		fsverity_free_info(vi);
> > +		if (IS_ERR(found))
> > +			err = PTR_ERR(found);
> > +	}
> 
> Is there any explanation for why it's safe to use the *_fast variants of
> these functions?

_fast is the default mode of operation of rhashtable, I have no idea
why the authors came up with the naming.  The _fast postfixed versions
just add the required RCU critical sections over ther otherwise fully
internally locked rhashtable operations.  I've expanded the commit
message a bit to make this hopefully more clear.

> This looks incorrect.  The memory barrier is needed after reading the
> flag, not before.  (See how smp_load_acquire() works.)
> 
> Also, it's needed only for verity inodes.
> 
> Maybe do:
> 
> 	if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode)) {
> 		/*
>                  * This pairs with the try_cmpxchg in set_mask_bits()
>                  * used to set the S_VERITY bit in i_flags.
> 		 */
> 		smp_mb();
> 		return true;
> 	}
> 	return false;

Thanks, I've fixed this up.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
