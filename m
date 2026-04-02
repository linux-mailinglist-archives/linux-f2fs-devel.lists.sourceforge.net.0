Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCRWNqKBzmkqoAYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Apr 2026 16:48:02 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D65038ACAD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Apr 2026 16:48:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUOkhmHjOaEDiYE/aTiQCVq1KIwvJdZrG09Yg0HdIC0=; b=NUP/0pzgPRsAootxnmGNflltr9
	DqzoMscUC+08+0hLz+dQ0MiHnYngJdp0MdTEn6iDNTpkQhZc8Kq239pxTD7H1x2+Qw/ZkHUCSlh77
	BL0bzxr3oD8KkBYRUXy3SN+Q13UdGmB4/Af9FxNe4dhFpXPhA3LPTSWdD4oEBTWwdQRg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w8JKo-0006hm-DD;
	Thu, 02 Apr 2026 14:47:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1w8JKn-0006hb-7i
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Apr 2026 14:47:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1BejI4IFPYpJVG1OzBmEzwBIMK85H2fS4YLiIwk6ibs=; b=WaCWDrtFQbTFJ07chut5sHRAgh
 C+f61Df+gtu30D7SW8oP/iQeTgeJeaxdHD5E0Nd+zusorRB1ki0ipPg2bebabTdi8uX/2txtswwQ+
 TQy1+OZibsPDNowRHCSxfidd9GKEks9zVhgNz7kV2i4+gXHffsY+2KewdjL0obHlBCpA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1BejI4IFPYpJVG1OzBmEzwBIMK85H2fS4YLiIwk6ibs=; b=V6SHgYT9kd1EGDZfZX1h1jXWtj
 crX/v8cmTJq1X/xyVM1KTnF9s9ebJuEG6EBVCoY+G/SQioqpDXhpWXLFpNgYvp8qAKrDxwuJLPVsS
 hMz0lusRDqjoXdUH6KtElEkDllp85x/4mrf9YSWjVsKC08heFNJuH83MildyjtEMvNts=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w8JKn-0004fD-Du for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Apr 2026 14:47:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1775141258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1BejI4IFPYpJVG1OzBmEzwBIMK85H2fS4YLiIwk6ibs=;
 b=WH3gkPAAR1OoViRH9k8Tgcpg5SR7Wce9poeJyr/BrxKo6uDJCFobNW+GYf0aeX3whU9xOw
 d4lXZLXIgdQDAegpU7HzBHqx30Lz0bsxOO0YnXMjqo3xyIPKwDC38Y6da923RkrX+lr1Vk
 kWIJHpDPXPwy9wK75T70t1GcCbzMOWE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-zyTiyK93P_e9FkeuUd5zvQ-1; Thu, 02 Apr 2026 10:47:37 -0400
X-MC-Unique: zyTiyK93P_e9FkeuUd5zvQ-1
X-Mimecast-MFC-AGG-ID: zyTiyK93P_e9FkeuUd5zvQ_1775141256
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-66aab34ff9cso1206083a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 02 Apr 2026 07:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775141256; x=1775746056;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1BejI4IFPYpJVG1OzBmEzwBIMK85H2fS4YLiIwk6ibs=;
 b=qTtsyhmCASO/eZuwwDLnkA5sX+OqMe6LcZBf1ExyddO1TKbryVOJ/E5maF/CtGDnEW
 gXcXvQtdOaTg3TNvefnDYUGyfa45bYBSFBNfNQ/IbcjvHJbmW8D0obZJWuRF3h2aVR/7
 d9x+4zJmUr5kcOHVsz3P0PzKV2jMVnJTySFY7oh0h7dS8YS1dqO8oy9nRsbQxa9KbUUo
 Rlt2I1QJDgfKgX4B3427KZ0bmnpKggnfrubk7Z5uiM12S2GpDn7hO7uqOAh4//5CUNWa
 Ber1Oe69/JhKlzVNwQ1ZA+6CCB5CJM/YCGaTw4nE5GzB4Ro98QvYXrJAdw2jv85gEvJV
 jNQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXosFgXmo1ht5ThSJC/qjflMcOMTkSkWV8losrQ02GcKsHsly7LmN80ghU9Lz7dfUXIboUgZwFm1pEHxoPbTuxJ@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx99ZM2l3M+YIiWnl729sFZO4zlP/UXYFZ33r2ONCeJwb/ZcQWD
 z2Y2CCcp5TGHH9wHj2ZugqBd681YKWnQR5t6QnXdbkH5JJCoRSozmLIsx0kHjrDQblPdTqWTkJD
 7UiGXvWch8DH1Is9i+F+GHa5nE4IlHSoTBw1dzHz3j2rn3Vo2c97crgbu/YatlWdnMNPZ1GDPKw
 cMYA==
X-Gm-Gg: AeBDiesTNAL4WWBLWxB3xVsExPzKxEo0UvaPzwuNyfhiEvv8pYK8EFY/J8pvZYPwRXN
 58HfUoOeEnQun4BjDzyPLFWOoXYpW9NBUeAbCCqWlzQxC84vlc1dDrcaPVC7xsm3BJE5PhD47jQ
 3z1+hcrHVM+GYiBvypMXKDlN0f+qnjZGeaG0wJ7sIIy6a/5nwOF1jeUcNOSjT7yujOWXZu+OgC9
 +i85aN5FyorFqLb6f4Abtdo2cnmO4Nwpu9z3Cmnx6F5qcf+fEYzJEhG0AWWbMc6AQapwYiOrlJ6
 Rsgfax4DLEUiiiu9TAyaKVSoDk3WiU0IbDOAUT6qPupl+qcI8XRviKRilPZhe2tZ9OYLb0kI54n
 8hyNMW4rY7ycyFQ==
X-Received: by 2002:a05:6402:4349:b0:66e:3754:618a with SMTP id
 4fb4d7f45d1cf-66e3754684dmr8248a12.22.1775141255728; 
 Thu, 02 Apr 2026 07:47:35 -0700 (PDT)
X-Received: by 2002:a05:6402:4349:b0:66e:3754:618a with SMTP id
 4fb4d7f45d1cf-66e3754684dmr8227a12.22.1775141255235; 
 Thu, 02 Apr 2026 07:47:35 -0700 (PDT)
Received: from thinky ([91.245.205.131]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-66e033b9df1sm812760a12.21.2026.04.02.07.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 07:47:34 -0700 (PDT)
Date: Thu, 2 Apr 2026 16:47:33 +0200
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <cw2kmcrrd6a3rsk37jnchxxom565nzn64f6u7h56dozqa42z6e@zrxdtpdg25ie>
References: <20260331212827.2631020-1-aalbersh@kernel.org>
 <20260331212827.2631020-4-aalbersh@kernel.org>
 <20260401222717.GH2466@quark>
MIME-Version: 1.0
In-Reply-To: <20260401222717.GH2466@quark>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TsT5EN-fRY1bg1A9cH7fkpGmQOdi2pE1COM3gBgAXqQ_1775141256
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-04-01 15:27:17, Eric Biggers wrote: > On Tue, Mar
 31, 2026 at 11:28:04PM +0200, Andrey Albershteyn wrote: > > Compute the hash
 of one filesystem block's worth of zeros. A filesystem > > implem [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w8JKn-0004fD-Du
Subject: Re: [f2fs-dev] [PATCH v6 03/22] fsverity: generate and store
 zero-block hash
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
From: Andrey Albershteyn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: fsverity@lists.linux.dev, Andrey Albershteyn <aalbersh@kernel.org>,
 djwong@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, hch@lst.de, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:aalbersh@kernel.org,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,redhat.com:-];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[aalbersh@redhat.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 2D65038ACAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-01 15:27:17, Eric Biggers wrote:
> On Tue, Mar 31, 2026 at 11:28:04PM +0200, Andrey Albershteyn wrote:
> > Compute the hash of one filesystem block's worth of zeros. A filesystem
> > implementation can decide to elide merkle tree blocks containing only
> > this hash and synthesize the contents at read time.
> > 
> > Let's pretend that there's a file containing six data blocks and whose
> > merkle tree looks roughly like this:
> > 
> > root
> >  +--leaf0
> >  |   +--data0
> >  |   +--data1
> >  |   `--data2
> >  `--leaf1
> >      +--data3
> >      +--data4
> >      `--data5
> > 
> > If data[0-2] are sparse holes, then leaf0 will contain a repeating
> > sequence of @zero_digest.  Therefore, leaf0 need not be written to disk
> > because its contents can be synthesized.
> > 
> > A subsequent xfs patch will use this to reduce the size of the merkle
> > tree when dealing with sparse gold master disk images and the like.
> > 
> > Add a helper to pre-fill folio with hashes of empty blocks. This will be
> > used by iomap to synthesize blocks full of zero hashes on the fly.
> > 
> > Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > ---
> >  fs/verity/fsverity_private.h |  3 +++
> >  fs/verity/open.c             |  3 +++
> >  fs/verity/pagecache.c        | 22 ++++++++++++++++++++++
> >  include/linux/fsverity.h     |  8 ++++++++
> >  4 files changed, 36 insertions(+)
> 
> Acked-by: Eric Biggers <ebiggers@kernel.org>
> 
> The example given in the commit message is a bit misleading, though.
> Usually there are actually 128 hashes per block, and a block of hashes
> covers 512 KiB.  So this optimization applies only where there is a hole
> in the file's data of size (at least) 512 KiB, aligned to the same
> amount.
> 
> It's also worth noting that this optimization is being done only for the
> first level.  The levels above that are still being stored.  So, this
> doesn't really enable e.g. exabyte sized sparse regions, as a block will
> still be stored for each 64 MiB (instead of every 512 KiB).
> 
> I'm okay with this if you want to do this, but I just want to make sure
> its limitations are well-understood.

Sure, I will fix the example and add a note that this is only for
data level. 

I think for higher levels it could be later added transparently.
Old tree blocks will be read by iomap if exist, and for new format
block will be generated.

-- 
- Andrey

> 
> > +	/* the hash of a merkle block-sized buffer of zeroes */
> > +	u8 zero_digest[FS_VERITY_MAX_DIGEST_SIZE];
> 
> "the hash of an all-zeroes block" would be clearer.  This is the hash
> from fsverity_hash_block() which includes the optional salt, not the
> hash from fsverity_hash_buffer() which does not include the salt.
> 
> > +/**
> > + * fsverity_fill_zerohash() - fill folio with hashes of zero data block
> > + * @folio:	folio to fill
> > + * @poff:	offset in the folio to start
> > + * @plen:	length of the range to fill with hashes
> 
> Maybe go with (len, offset) for consistency with
> fsverity_verify_blocks().  (I assume the "p" prefix stands for "page",
> which is misleading since this works with a folio.)
> 
> > +void fsverity_fill_zerohash(struct folio *folio, size_t poff, size_t plen,
> > +			      struct fsverity_info *vi)
> > +{
> > +	size_t offset = poff;
> > +
> > +	WARN_ON_ONCE(!IS_ALIGNED(poff, vi->tree_params.digest_size));
> > +	WARN_ON_ONCE(!IS_ALIGNED(plen, vi->tree_params.digest_size));
> > +
> > +	for (; offset < (poff + plen); offset += vi->tree_params.digest_size)
> > +		memcpy_to_folio(folio, offset, vi->tree_params.zero_digest,
> > +				vi->tree_params.digest_size);
> 
> This could be done more efficiently, especially on HIGHMEM.  Probably
> fine for now though, especially since the intersection of anyone wanting
> XFS && fsverity && HIGHMEM is likely to be extremely small.
> 
> - Eric
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
