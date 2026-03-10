Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNNNA1E4sGlZhQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 16:27:13 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9E7253609
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 16:27:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=245jH7GGXSI6uB3OHJlxUHuQT/3ynPJGhusAxhNqB/E=; b=KnWXalXdRtrrHM6gjHY0s/RUN6
	R4H0ArD7hjKQjr7QXUdRsbG79jRVodWm6hpLppHk0554Tv/PkLLPUTiYioT4l8Xrt/AJDmn2K4WzD
	pXcb6o04yoJEIk3qSpEJnrGJP+KNkGYMcEAVIwIPRcKg2JkcibRnOQJ/tos8iCVbUbpk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzyyz-0001B8-MH;
	Tue, 10 Mar 2026 15:26:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1vzyyy-0001Az-7x
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 15:26:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x1gPBnL3nFJNBIyIa1yav05jeafDePL0up3MPLKVYLI=; b=Az34b5XOqwUMuucQ5rxvAIK0qs
 XZJ0tJ60YgtqrPZq5MuLNPeEskt+4f3Rqa0P4uZ92jx/zgdRhNiJ2WlRYHESCd25qYfX0H6jkQRq/
 9ezZQlh7IbqdBap27voUymA/aWz8izR3N567u51Tr7Ugg17ejzfNhR1WNrjKPSad3xUE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x1gPBnL3nFJNBIyIa1yav05jeafDePL0up3MPLKVYLI=; b=GzwG1oIXufclZSQihXfv9+ISRe
 ZaKMNP1TZ1vc5fHyTaFk0TtV8xk42R0HgUoSS8NedzJpCu95Y44M4xCzu4yAL5mUvZmY0Z7lnv0AO
 xzxgk3dlHxSbNdQHSjCFebSqe80RnHb3AjgUsBouRHD+o7BJeTJPboCWeM9SgeInT8eQ=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzyyx-0004I0-Ga for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 15:26:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773156405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x1gPBnL3nFJNBIyIa1yav05jeafDePL0up3MPLKVYLI=;
 b=a/LMcL23Po8bwC6vocNuIls3kl97sFLFfnI7bdvdjSqdJizYROxCqCzOOVkx89sKu4tmpb
 5+rPZskYeEx/BS8XftSwHwSVS+VqFVJgBzesQplq3Pm0iHSnjobzmb5oHulmQwUoGH0j5C
 QX5d9Xmu2gtRazkbuflyeg60cMuzR4g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496--zX6Z5F8MamPUVlVENJ6Dg-1; Tue, 10 Mar 2026 11:26:44 -0400
X-MC-Unique: -zX6Z5F8MamPUVlVENJ6Dg-1
X-Mimecast-MFC-AGG-ID: -zX6Z5F8MamPUVlVENJ6Dg_1773156403
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4837b6f6b93so103398545e9.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Mar 2026 08:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773156403; x=1773761203;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x1gPBnL3nFJNBIyIa1yav05jeafDePL0up3MPLKVYLI=;
 b=q3FzFDyi+3KSRW/m5xnXoa92H8YsZ1teObvji1rXDRzL8zEMQjFTj9xTdiq5RS+UEp
 KvhIp4FjiORK8yH4cAtyZW77MxfEHeQNFsZNl+evE3uJ6cqvnjYBra879pQF8s1hPIdc
 poltTpNn49E0dGtBirWP2bEcOsbuMp1CFvvxV/edtJ4Vpb53pJ0Eo0fid6xllp+RBZZS
 q6p+Sb+MQON8Dn8SLlHH0T3rjd9oj/GPTs44lm6wUB/QYept5zNOz6lzEYN3YvBW+2N4
 DPbKuCc9/IwoLio9vE6kEyfVbRf43t2QvKuCF5Xdy/umG6vbDx6rAAdKWlLxQ+DWc1jy
 aLAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKVdsxHY34pTUv8u+VjlX1sY7QZL3neykyP73UAa3ZvG50ZBKiGoj9RWkXspbWIpFH5E2QcNpS8VlQNXPyLVsG@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzmUIUe1L7g1TrNwB4VksvSrlIU/RDqu+OEi2F4mp4sHlJ75SqW
 NW6lX1ZLc4/oVmsMePwnJu8/Yo3AdXTiuhfHGNHwaNPqpISRMUFXIEzFYPiwgMECMlfmmKxCWIA
 UiInQIu/Dm9opgre4UdPlmz3GFfW4yLkMlRwikkbvs9W4wdjhP+zNu+qJsvs9f5jcE8uylvr6Yr
 8NSg==
X-Gm-Gg: ATEYQzw65zqx8jGaLaKlHltn1AZ1ZRcHhtOwZ/D7pzXjDi7YHiQZR7pK+H1fXttHUjx
 TaHDDOIDmeGz5DOYFdsA7taV/HPlRzoVcqrPMcRhU+FSHeRh5knM18rW7xoi1Ek/trytIZquJhl
 aTldlFIZ8Jnwxrvp/yBHmXEGhkYH4Ro9E5XkJpqDTU33rGSMJ2AWqaRZ5mqLSZEqdxL7ctvNppx
 vZBq+gx5s0b922glAWHOWruX1EHSLQ+AHiq1ri9yth5ADQYycS7UqF+INxV7KaNBzzV2zCDSdSc
 S+AW9Tx1tXmCvYP8pSx/NW+YkOxXIerpbc+rb4rOktqPm2DSE5AI4ChCmhllT62KAPty60/4wT/
 aDOrh44nCihs=
X-Received: by 2002:a05:600c:3f19:b0:485:3e6c:aabc with SMTP id
 5b1f17b1804b1-4853e6caf6emr96414905e9.19.1773156402815; 
 Tue, 10 Mar 2026 08:26:42 -0700 (PDT)
X-Received: by 2002:a05:600c:3f19:b0:485:3e6c:aabc with SMTP id
 5b1f17b1804b1-4853e6caf6emr96414285e9.19.1773156402225; 
 Tue, 10 Mar 2026 08:26:42 -0700 (PDT)
Received: from thinky ([217.30.74.39]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4853ebab1a2sm153169175e9.1.2026.03.10.08.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 08:26:41 -0700 (PDT)
Date: Tue, 10 Mar 2026 16:26:41 +0100
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <njszph4g2g63ijfyatukmgmfyafrhsrtja526gz4pjgn2edymh@l7aq2rpxnold>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-19-aalbersh@kernel.org>
 <20260310012658.GF1105363@frogsfrogsfrogs>
MIME-Version: 1.0
In-Reply-To: <20260310012658.GF1105363@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j-x_pH5NJ7V-NeYYV0p_RAenEWRxZKRKjLwWKLhhb-g_1773156403
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-03-09 18:26:58, Darrick J. Wong wrote: > > +/* > >
 + * Retrieve the verity descriptor. > > + */ > > +static int > >
 +xfs_fsverity_get_descriptor(
 > > + struct inode *inode, > > + void *buf, > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vzyyx-0004I0-Ga
Subject: Re: [f2fs-dev] [PATCH v4 18/25] xfs: add fs-verity support
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
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org,
 Andrey Albershteyn <aalbersh@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 2F9E7253609
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
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:djwong@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,redhat.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[aalbersh@redhat.com]
X-Rspamd-Action: no action

On 2026-03-09 18:26:58, Darrick J. Wong wrote:
> > +/*
> > + * Retrieve the verity descriptor.
> > + */
> > +static int
> > +xfs_fsverity_get_descriptor(
> > +	struct inode		*inode,
> > +	void			*buf,
> > +	size_t			buf_size)
> > +{
> > +	struct xfs_inode	*ip = XFS_I(inode);
> > +	struct xfs_mount	*mp = ip->i_mount;
> > +	__be32			d_desc_size;
> > +	u32			desc_size;
> > +	u64			desc_size_pos;
> > +	int			error;
> > +	u64			desc_pos;
> > +	struct xfs_bmbt_irec	rec;
> > +	int			is_empty;
> > +	uint32_t		blocksize = i_blocksize(VFS_I(ip));
> > +	xfs_fileoff_t		last_block_offset;
> > +
> > +	ASSERT(inode->i_flags & S_VERITY);
> > +	error = xfs_bmap_last_extent(NULL, ip, XFS_DATA_FORK, &rec, &is_empty);
> > +	if (error)
> > +		return error;
> > +
> > +	if (is_empty)
> > +		return -ENODATA;
> > +
> > +	last_block_offset =
> > +		XFS_FSB_TO_B(mp, rec.br_startoff + rec.br_blockcount);
> > +	if (last_block_offset < xfs_fsverity_metadata_offset(ip))
> > +		return -ENODATA;
> > +
> > +	desc_size_pos = last_block_offset - sizeof(__be32);
> > +	error = fsverity_pagecache_read(inode, (char *)&d_desc_size,
> > +				  sizeof(d_desc_size), desc_size_pos);
> > +	if (error)
> > +		return error;
> > +
> > +	desc_size = be32_to_cpu(d_desc_size);
> > +	if (XFS_IS_CORRUPT(mp, desc_size > FS_VERITY_MAX_DESCRIPTOR_SIZE))
> > +		return -ERANGE;
> > +	if (XFS_IS_CORRUPT(mp, desc_size > desc_size_pos))
> > +		return -ERANGE;
> > +
> > +	if (!buf_size)
> > +		return desc_size;
> > +
> > +	if (XFS_IS_CORRUPT(mp, desc_size > buf_size))
> > +		return -ERANGE;
> > +
> > +	desc_pos = round_down(desc_size_pos - desc_size, blocksize);
> > +	error = fsverity_pagecache_read(inode, buf, desc_size, desc_pos);
> 
> Hmm so at this point ... the very last u32 mapped in the data fork
> contains the size of the fsverity descriptor; and the descriptor itself
> is in the bytes just before that u32 size field?

Yes. In common case this would be single block. But if descriptor
has signature it could be up to 16k over a few blocks. The u32 size
would be still the last mapped u32 of the data fork.

> 
> The merkle tree itself is in the bytes between
> xfs_fsverity_metadata_offset() and the block(s) consumed by the
> descriptor, right?

Yes. And there is space between merkle tree end and descriptor. The
descriptor is placed in the next 64k aligned block after last merkle
tree block (the same way merkle tree is spaced from the data). This
is different from ext4/f2fs.

This is done for merkle tree and descriptor to always get into
different pages. This requirement is due to merkle tree block
synthesis (iomap needs descriptor to synthesize these).

If iomap would read page with descriptor and merkle tree blocks
requiring to be synthesized but iomap is reading this page to get
fsverity descriptor, iomap don't know how to handle these blocks. It
can just skip/zero these blocks and continue. But then when fsverity
will want to read these blocks they are already uptodate (with
zeroes/random). This was solved by invalidating the page with
descriptor in v3. In this rev fsverity is limited by 64k page size
so if descriptor is far enough this won't be the case.

> 
> Eventually it'd be awful nice to see an update to the ondisk format
> docs, though it's probably more useful to have me guess at the format
> and have you confirm that I got the details right; then at least two
> people will know what the ondisk format is for fsverity stuff. :)
> 
> > +	if (error)
> > +		return error;
> > +
> > +	return desc_size;
> > +}
> > +
> > +static int
> > +xfs_fsverity_write_descriptor(
> > +	struct file		*file,
> > +	const void		*desc,
> > +	u32			desc_size,
> > +	u64			merkle_tree_size)
> > +{
> > +	int			error;
> > +	struct inode		*inode = file_inode(file);
> > +	struct xfs_inode	*ip = XFS_I(inode);
> > +	unsigned int		blksize = ip->i_mount->m_attr_geo->blksize;
> > +	u64			tree_last_block =
> > +		xfs_fsverity_metadata_offset(ip) + merkle_tree_size;
> > +	u64			desc_pos = round_up(tree_last_block, 65536);
> > +	u64			desc_end = desc_pos + desc_size;
> > +	__be32			desc_size_disk = cpu_to_be32(desc_size);
> > +	u64			desc_size_pos =
> > +			round_up(desc_end + sizeof(desc_size_disk), blksize) -
> > +			sizeof(desc_size_disk);
> > +
> > +	error = iomap_fsverity_write(file, desc_size_pos, sizeof(__be32),
> > +				     (const void *)&desc_size_disk,
> > +				     &xfs_buffered_write_iomap_ops,
> > +				     &xfs_iomap_write_ops);
> > +	if (error)
> > +		return error;
> > +
> > +	error = iomap_fsverity_write(file, desc_pos, desc_size, desc,
> > +				     &xfs_buffered_write_iomap_ops,
> > +				     &xfs_iomap_write_ops);
> > +
> > +	return error;
> 
> This could turn into the shorter "return iomap_fsverity_write()"

sure, thanks!

> I don't see anything objectionable here, but I would like confirmation
> that I've sniffed out the ondisk format correctly.

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
