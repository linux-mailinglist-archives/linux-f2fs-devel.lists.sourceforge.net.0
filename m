Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F92E6D7A92
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 13:01:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pk0tW-0006ig-Ob;
	Wed, 05 Apr 2023 11:01:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1pk0tV-0006iQ-D4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 11:01:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BoHgQZFE6GmfSeys+DR2W7oxw4hgWtoFTpySQ2VkKFk=; b=M+oly2OCYTWaZOeh4/++qktd7h
 H+/UCsTWNVryUxjAlvPHxkUYRWHtUhiRU6epf40b2nUZDshdaP6h1qKS+Y8ukdG1H/3K1w0qsbIEF
 cDn58ydughW1WlNyvVIB0VVIPd0CIivsibVz7bQSRou4Obx7Pi3lSZKlErPj/4ouILI0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BoHgQZFE6GmfSeys+DR2W7oxw4hgWtoFTpySQ2VkKFk=; b=UXmoh84XwEEaYNZAfpHB3vH7a/
 JpjdN53vylAeIh5hdIr8d/apoIJzP0jWbG/9Ff/j44e4dvr2UAm6uX99fGgqd//9imp2/MwsLTtCd
 DRwXXWViequx86PPm3n/1IAyMZJYiWJYgIQaQvv13WdcHBW8IWv7UY3ZbkwiDVyiZ92k=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pk0tQ-00Fw6x-Dy for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 11:01:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680692486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BoHgQZFE6GmfSeys+DR2W7oxw4hgWtoFTpySQ2VkKFk=;
 b=V0YFHs3q1dLyZp4PMwJNCCZ33lAFL3XbzLK2np25QTW7So8YIDuXIa+RO/8Dnu2ClfuhnK
 ZPRWi7QRhYts68A5SRVeptxYKJ77Lv9cKPElSU901ixPibk7i2+Ak241hDyVxHeAUytT9c
 dncUlvYXYDjomzIs6g84eq76rx7baj8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-Vr5VyvzMOGmxZhKhk6oujw-1; Wed, 05 Apr 2023 07:01:24 -0400
X-MC-Unique: Vr5VyvzMOGmxZhKhk6oujw-1
Received: by mail-qk1-f197.google.com with SMTP id
 v5-20020a379305000000b0074a37810157so4446048qkd.21
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Apr 2023 04:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680692482;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BoHgQZFE6GmfSeys+DR2W7oxw4hgWtoFTpySQ2VkKFk=;
 b=CSM8rIyP9Uw8Pklpk+ZmaYVtNhWjtWuIascmu9Hi27WUz399nk161Wx9Ol+eS1q83g
 03ZBNOMNaApnSDbK3qxvvvP5dk9CJYOxiudWzNQEClWk5ichkxdks9w3ZVfXR2NpQTMK
 zSSVk7hNi4Qc0WbV5iMCkKgyQ2k5c67rCUm8VBX0NybI/lw9Hb+GxBnwhE54z1C9nFIJ
 8pIZjqgKwUFGxB2H6sCEkjEekaJ3eoUaydcCgRYZEf/MW5qf9zZ25TQDbvFxAJwlRzCj
 mPbTKMVXWdfoTN7wBoLsICmy/UK8wAbG2+BCDgbsHr2WmuWFUUMu6rxbQgNRLSzfhaBe
 1ONw==
X-Gm-Message-State: AAQBX9frtqk31fnkQm/05aZ1TfQJZNVE4TnUmVf4THiw9L3I7KU9uoS1
 peSvSumSFAsf88n3/Q1HwzOrXLEOwy7OigGyvp63A+wtE318Ny9y5ZjrnRAWt/Ihaz7LDI1sLeA
 wE3o3Rp/T3JiVdmRjqKP3tozn4M065vbmOj73
X-Received: by 2002:a05:6214:4001:b0:5ca:f6dd:f3b6 with SMTP id
 kd1-20020a056214400100b005caf6ddf3b6mr8310657qvb.16.1680692482362; 
 Wed, 05 Apr 2023 04:01:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZN5rxyt4g78lpjs6te5NjsBmYN83L29u8HXb3VRNmLRZGiyzEv7hgqJmGPE20fJY6cuY/SPQ==
X-Received: by 2002:a05:6214:4001:b0:5ca:f6dd:f3b6 with SMTP id
 kd1-20020a056214400100b005caf6ddf3b6mr8310617qvb.16.1680692482068; 
 Wed, 05 Apr 2023 04:01:22 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 om30-20020a0562143d9e00b005dd8b934576sm4136208qvb.14.2023.04.05.04.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 04:01:21 -0700 (PDT)
Date: Wed, 5 Apr 2023 13:01:16 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20230405110116.ia5wv3qxbnpdciui@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-10-aalbersh@redhat.com>
 <ZCxEHkWayQyGqnxL@infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZCxEHkWayQyGqnxL@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Christoph, On Tue, Apr 04, 2023 at 08:37:02AM -0700,
 Christoph Hellwig wrote: > > if (iomap_block_needs_zeroing(iter,
 pos)) { > > folio_zero_range(folio, 
 poff, plen); > > + if (iomap->flags & IOMAP_F_READ_VERITY [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pk0tQ-00Fw6x-Dy
Subject: Re: [f2fs-dev] [PATCH v2 09/23] iomap: allow filesystem to
 implement read path verification
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
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, agruenba@redhat.com, djwong@kernel.org,
 damien.lemoal@opensource.wdc.com, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, cluster-devel@redhat.com, dchinner@redhat.com,
 rpeterso@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Christoph,

On Tue, Apr 04, 2023 at 08:37:02AM -0700, Christoph Hellwig wrote:
> >  	if (iomap_block_needs_zeroing(iter, pos)) {
> >  		folio_zero_range(folio, poff, plen);
> > +		if (iomap->flags & IOMAP_F_READ_VERITY) {
> 
> Wju do we need the new flag vs just testing that folio_ops and
> folio_ops->verify_folio is non-NULL?

Yes, it can be just test, haven't noticed that it's used only here,
initially I used it in several places.

> 
> > -		ctx->bio = bio_alloc(iomap->bdev, bio_max_segs(nr_vecs),
> > -				     REQ_OP_READ, gfp);
> > +		ctx->bio = bio_alloc_bioset(iomap->bdev, bio_max_segs(nr_vecs),
> > +				REQ_OP_READ, GFP_NOFS, &iomap_read_ioend_bioset);
> 
> All other callers don't really need the larger bioset, so I'd avoid
> the unconditional allocation here, but more on that later.

Ok, make sense.

> 
> > +		ioend = container_of(ctx->bio, struct iomap_read_ioend,
> > +				read_inline_bio);
> > +		ioend->io_inode = iter->inode;
> > +		if (ctx->ops && ctx->ops->prepare_ioend)
> > +			ctx->ops->prepare_ioend(ioend);
> > +
> 
> So what we're doing in writeback and direct I/O, is to:
> 
>  a) have a submit_bio hook
>  b) allow the file system to then hook the bi_end_io caller
>  c) (only in direct O/O for now) allow the file system to provide
>     a bio_set to allocate from

I see.

> 
> I wonder if that also makes sense and keep all the deferral in the
> file system.  We'll need that for the btrfs iomap conversion anyway,
> and it seems more flexible.  The ioend processing would then move into
> XFS.
> 

Not sure what you mean here.

> > @@ -156,6 +160,11 @@ struct iomap_folio_ops {
> >  	 * locked by the iomap code.
> >  	 */
> >  	bool (*iomap_valid)(struct inode *inode, const struct iomap *iomap);
> > +
> > +	/*
> > +	 * Verify folio when successfully read
> > +	 */
> > +	bool (*verify_folio)(struct folio *folio, loff_t pos, unsigned int len);
> 
> Why isn't this in iomap_readpage_ops?
> 

Yes, it can be. But it appears to me to be more relevant to
_folio_ops, any particular reason to move it there? Don't mind
moving it to iomap_readpage_ops.

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
