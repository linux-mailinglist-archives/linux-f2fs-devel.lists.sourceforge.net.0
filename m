Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE97A2F2104
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Jan 2021 21:45:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kz43k-0001yS-1v; Mon, 11 Jan 2021 20:45:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kz43h-0001y8-Vz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 20:45:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z6isE+TAK8zzYjTpLOsSAFZnpq0rQzZjm2i7saeOLGQ=; b=jH8Il7mvqm5UGCRdq+mcubJFXZ
 ulzOyZ+xJz/Ddsk+Eaot5ltAmg0g/HLsooAIYaJpF/drbcZBcJW2KzLoUy0gvhv+ixqOTvtnOivCh
 BOHOZza1e69ZPmM1bPL+0QznIcVyXzevZQlhJSA254gf+QvFLKW2aifj5eYubaaz05kQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z6isE+TAK8zzYjTpLOsSAFZnpq0rQzZjm2i7saeOLGQ=; b=ay3V7Rxml0Twc8LQ5RFHwpwA8g
 LseHLYHYg7fTEslB9x66NWn7fd6higN5PYyjWsJDCTGzf8YKguGIRSkipj0/rtqa1AnM4lphJ6l3Q
 L8+acm+OANt5Azz9q3L2Q7K/DV/HdKbnl4yWFRWjyJVtKQZbQ6DOxXiSyiLUNqTsxT7M=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kz43b-00AP1g-1z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 20:45:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0922F222B6;
 Mon, 11 Jan 2021 20:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610397877;
 bh=M1OSN1vteho8Huw58TPHtw4Wnq7VMtKCfQ1CREQhDR0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g6E1CBBApgNQRIvnyUYpczU4snTK3TxTIWiGp2D7l9axmxnf6NKFoHnat6vVu4e2x
 I9XIFx85m+OaASnJa35GO1Lnq6n9jCT+wDbjGwYs6QheK3MCRNoAdJlZfYYodREnYB
 o+3ziJVlenNjdNHZNq3EDaRlJJAlbS6mK1P7kvZryDnMiAPy1kFnfILWddwBcW6wxu
 SELSewJq8rbzB/ndE+t+XbX/vEKHxLvi2jQezrrvts8jJ1y/+Ad2x5xKCgaHtetEX3
 OZcpXXl3Hsh8sIV0cn0ov2lVF0/F8gETBM8QdHmHtC59U75feIsb+nL+o6/OlT3c++
 dyjRmmLboidRg==
Date: Mon, 11 Jan 2021 12:44:35 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <X/y4s12YrXiUwWfN@sol.localdomain>
References: <20210109075903.208222-1-ebiggers@kernel.org>
 <20210111151517.GK18475@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210111151517.GK18475@quack2.suse.cz>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kz43b-00AP1g-1z
Subject: Re: [f2fs-dev] [PATCH v2 00/12] lazytime fix and cleanups
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 11, 2021 at 04:15:17PM +0100, Jan Kara wrote:
> Hi!
> 
> On Fri 08-01-21 23:58:51, Eric Biggers wrote:
> > Hello,
> > 
> > Patch 1 fixes a bug in how __writeback_single_inode() handles lazytime
> > expirations.  I originally reported this last year
> > (https://lore.kernel.org/r/20200306004555.GB225345@gmail.com) because it
> > causes the FS_IOC_REMOVE_ENCRYPTION_KEY ioctl to not work properly, as
> > the bug causes inodes to remain dirty after a sync.
> > 
> > It also turns out that lazytime on XFS is partially broken because it
> > doesn't actually write timestamps to disk after a sync() or after
> > dirtytime_expire_interval.  This is fixed by the same fix.
> > 
> > This supersedes previously proposed fixes, including
> > https://lore.kernel.org/r/20200307020043.60118-1-tytso@mit.edu and
> > https://lore.kernel.org/r/20200325122825.1086872-3-hch@lst.de from last
> > year (which had some issues and didn't fix the XFS bug), and v1 of this
> > patchset which took a different approach
> > (https://lore.kernel.org/r/20210105005452.92521-1-ebiggers@kernel.org).
> > 
> > Patches 2-12 then clean up various things related to lazytime and
> > writeback, such as clarifying the semantics of ->dirty_inode() and the
> > inode dirty flags, and improving comments.  Most of these patches could
> > be applied independently if needed.
> > 
> > This patchset applies to v5.11-rc2.
> 
> The series look good to me. How do you plan to merge it (after resolving
> Christoph's remarks)? I guess either Ted can take it through the ext4 tree
> or I can take it through my tree...
> 

I think taking it through your tree would be best, unless Al or Ted wants to
take it.

I'll probably separate out
"xfs: remove a stale comment from xfs_file_aio_write_checks()",
since it isn't really related anymore and could go in through the XFS tree.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
