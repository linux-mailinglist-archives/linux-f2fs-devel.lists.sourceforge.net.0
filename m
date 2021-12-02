Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBC0465D44
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Dec 2021 05:16:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1msdW9-0007sR-Ui; Thu, 02 Dec 2021 04:16:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1msdW7-0007sL-Pm
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Dec 2021 04:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m3POHHfKUntdS4g9hW+9z+pjzfXrTT5CDr/ojksD0D8=; b=Luq6eR/rd9c04/YOYuHn63b6NZ
 gXYVWfwNathqR0EB0bJNGzZ4aTDzT0LBeQDVBBhhQlGzg/yMUNlh9FiFaxn2f+lzYKDRJsBhV2u92
 K8YHaEKnLVsjAcqdBFGf8rbfqG9i1e9KFDin6iMjvJSlLyEBc3cBX1eewIJ1LyQYELqk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m3POHHfKUntdS4g9hW+9z+pjzfXrTT5CDr/ojksD0D8=; b=l7kRVl8Wvtc562NcQCxxIhel9Z
 wHBF4dg49qTtKNF3ZYoRz5ag+xEpwMydiIC7asvzDiJFxrGyEXwvfBGFnnnVZ9Oj0CpK6hG0JcA2m
 qvrQEJml8FuAQ72WyDjKZ3ozgpOxx6CiOkYP49eEwsnNkZjyy53ZtaNi40m/X3Elsibw=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1msdW5-0000yd-JA
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Dec 2021 04:16:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D5DB0CE215F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Dec 2021 04:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69AEC00446;
 Thu,  2 Dec 2021 04:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638418561;
 bh=paG92azMggoOBcQsxOqm1iwPqph7TPj+xs+ewnCu9hA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VhfGN0DA8vkLCSjgnVubJ8il1lysCmX3T1aix510+rfnb/QL6bkKzyEmJx364F2FJ
 n47727jgAietHcH1t4Xc48VLXmFlcxP4bZJQnDZlQ7EOsiz/2np4REvDMIzpoZf057
 p8j2Bs4gCxgqRwCn5Q5obWESYSeW04LKUFwrMa0wyFF2RJPHxUbDXHAPdMzjEEkIXU
 CrPAmUbARR4EvsvNWT53lGYlltRtKhZxdC8ErF1kKkAKTzhTi2A39MeMdn3ZATgBqp
 Uzi3XNFAViXGQFdw9prgpr0Sm63N8dtPuCrH5JKy9dzUlPzaOn6vOZ8ocrG7TxcZNk
 fRyQGfyOK6eEg==
Date: Wed, 1 Dec 2021 20:15:59 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YahIf3UlhuxJT1O4@sol.localdomain>
References: <20211116214510.2934905-1-jaegeuk@kernel.org>
 <20211116214510.2934905-5-jaegeuk@kernel.org>
 <b36e2d44-4834-3931-6a32-4fa52d1d7785@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b36e2d44-4834-3931-6a32-4fa52d1d7785@kernel.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Dec 02, 2021 at 11:10:41AM +0800, Chao Yu wrote: >
 > +static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t
 length, > > + unsigned int flags, struct iomap *iomap, > > + struct [...]
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1msdW5-0000yd-JA
Subject: Re: [f2fs-dev] [PATCH 5/6] f2fs: implement iomap operations
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Dec 02, 2021 at 11:10:41AM +0800, Chao Yu wrote:
> > +static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
> > +			    unsigned int flags, struct iomap *iomap,
> > +			    struct iomap *srcmap)
> > +{
> > +	struct f2fs_map_blocks map = {};
> > +	pgoff_t next_pgofs = 0;
> > +	int err;
> > +
> > +	map.m_lblk = bytes_to_blks(inode, offset);
> > +	map.m_len = bytes_to_blks(inode, offset + length - 1) - map.m_lblk + 1;
> > +	map.m_next_pgofs = &next_pgofs;
> > +	map.m_seg_type = f2fs_rw_hint_to_seg_type(inode->i_write_hint);
> > +	if (flags & IOMAP_WRITE)
> > +		map.m_may_create = true;
> > +
> > +	err = f2fs_map_blocks(inode, &map, flags & IOMAP_WRITE,
> > +			      F2FS_GET_BLOCK_DIO);
> > +	if (err)
> > +		return err;
> > +
> > +	iomap->offset = blks_to_bytes(inode, map.m_lblk);
> > +
> > +	if (map.m_flags & (F2FS_MAP_MAPPED | F2FS_MAP_UNWRITTEN)) {
> > +		iomap->length = blks_to_bytes(inode, map.m_len);
> > +		if (map.m_flags & F2FS_MAP_MAPPED) {
> > +			iomap->type = IOMAP_MAPPED;
> > +			iomap->flags |= IOMAP_F_MERGED;
> > +		} else {
> > +			iomap->type = IOMAP_UNWRITTEN;
> > +		}
> > +		if (WARN_ON_ONCE(!__is_valid_data_blkaddr(map.m_pblk)))
> > +			return -EINVAL;
> > +		iomap->addr = blks_to_bytes(inode, map.m_pblk);
> > +
> > +		if (WARN_ON_ONCE(f2fs_is_multi_device(F2FS_I_SB(inode))))
> > +			return -EINVAL;
> 
> Why not relocating this check before f2fs_map_blocks()?
> 
> Thanks,
> 
> > +		iomap->bdev = inode->i_sb->s_bdev;

Are you talking about the check for !f2fs_is_multi_device()?  It could go in
either location, but I think it makes the most sense to have it right before the
line that uses 'inode->i_sb->s_bdev', since that is the place which makes the
assumption that the filesystem has only one block device.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
