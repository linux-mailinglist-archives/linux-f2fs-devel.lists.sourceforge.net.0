Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C456D827D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 17:48:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pk5NF-0006IU-HR;
	Wed, 05 Apr 2023 15:48:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+46b8a92f13ae362fdcdf+7164+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pk5ND-0006IM-Jn for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 15:48:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0N3bnEoqyxD9JBa9a3Jw/h398bdzAlmE4MCZrbnnAyo=; b=h4anCvhwHTHgx7gEra1ZRz+L51
 Unj/+YFhI5eecr7SzZcDu0KWv2lCThOsz/7EkV8jC7isD+DMdnyu1Ut5dAe354c6GFJejx8+y6sd4
 kkjl8gIU+uQqz6Uxvvqaex52GeJCty4evc61lN/lKR45nUx/0tBxcEA9vo+/OVFzwoGk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0N3bnEoqyxD9JBa9a3Jw/h398bdzAlmE4MCZrbnnAyo=; b=cek8uIMmRkDCuazJ40jWKSrrzh
 6ubQ8SSvxIEt5F0GBn7Je1f0pnmhuBFJoplBmOj33Nrw3qcWzKXQOtOxPbY+oWaTYSb7VVSnEDH5l
 2S7uu3WfopKgPGxDYDBvzUWA1MSBxYBHgUe7NpOUt14jRnplYkkzyg6FHcrjzbXeDxFA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pk5ND-00G7AN-9g for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 15:48:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0N3bnEoqyxD9JBa9a3Jw/h398bdzAlmE4MCZrbnnAyo=; b=jOrY6DoC95aQn3Vv3VAZND7yl3
 m/hXKJSP8boSFOIai+u31LfUiKZoGUmX/xp4vPr2Sa4RL85kbsf6Lwnp3H3kLpt8V3g8BNHuYEXTQ
 wONj00nh8D1I8/iYMjQUF7yh8yBKD0gu19Rxi60u40GbOrJPRmpaFoCyRyO3aOYxAxoOytrqPRQb5
 99dNgh/6QHoQwvKeFp1L8sZLbahEtSmp0Wr0v0/2ug5W9kpxw2A9YkmVeQcxYuvP2zMfKAaisAzse
 ZbSboN0UYogpn15gaXKO0zCWpYuCPGAvWfMqKwR/k38KllD4rrVbRB9+Aidw4KtsBb8XxeGSYDpv4
 m6odhUjA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pk5Mv-004zVF-1j; Wed, 05 Apr 2023 15:48:17 +0000
Date: Wed, 5 Apr 2023 08:48:17 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <ZC2YQalRTGxzmNDK@infradead.org>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-10-aalbersh@redhat.com>
 <ZCxEHkWayQyGqnxL@infradead.org>
 <20230405110116.ia5wv3qxbnpdciui@aalbersh.remote.csb>
 <20230405150627.GC303486@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230405150627.GC303486@frogsfrogsfrogs>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 05, 2023 at 08:06:27AM -0700, Darrick J. Wong
 wrote: > > > I wonder if that also makes sense and keep all the deferral in
 the > > > file system. We'll need that for the btrfs iomap convers [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pk5ND-00G7AN-9g
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
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org, jth@kernel.org,
 agruenba@redhat.com, linux-ext4@vger.kernel.org,
 Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 cluster-devel@redhat.com, dchinner@redhat.com, rpeterso@redhat.com,
 xiang@kernel.org, damien.lemoal@opensource.wdc.com,
 linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 05, 2023 at 08:06:27AM -0700, Darrick J. Wong wrote:
> > > I wonder if that also makes sense and keep all the deferral in the
> > > file system.  We'll need that for the btrfs iomap conversion anyway,
> > > and it seems more flexible.  The ioend processing would then move into
> > > XFS.
> > > 
> > 
> > Not sure what you mean here.
> 
> I /think/ Christoph is talking about allowing callers of iomap pagecache
> operations to supply a custom submit_bio function and a bio_set so that
> filesystems can add in their own post-IO processing and appropriately
> sized (read: minimum you can get away with) bios.  I imagine btrfs has
> quite a lot of (read) ioend processing they need to do, as will xfs now
> that you're adding fsverity.

Exactly.

> I think the point is that this is a general "check what we just read"
> hook, so it could be in readpage_ops since we're never going to need to
> re-validate verity contents, right?  Hence it could be in readpage_ops
> instead of the general iomap_folio_ops.
> 
> <shrug> Is there a use case for ->verify_folio that isn't a read post-
> processing step?

Yes.  In fact I wonder if the verification might actually be done
in the per-bio end_io handler in the file system.  But I'll need
to find some more time to read through the XFS parts of series to
come up with a more intelligent suggestion on that.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
