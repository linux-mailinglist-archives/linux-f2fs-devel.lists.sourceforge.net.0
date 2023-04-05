Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C6B6D83A7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 18:27:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pk5z5-0007at-7S;
	Wed, 05 Apr 2023 16:27:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1pk5z3-0007an-Rl
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 16:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xpkEDS6jt39qufg3GMcbXZKRt5qOSbn/1OJhbiuzI9E=; b=QDbHBZOb2jXJ6CehltZuEkVQGB
 3caYPEPXm0KuIaLJbzayFpk3w6h4vSDKXKex5f3IkqE9QKFepqXJcnD+MhImgzUod4yCxdO6h38rT
 GCwIVS0RnKb035b0q0orsyN7WPnAi8rlZI5cmqv5i9AeMJDVs0SYmG40Z/vdSsythFSY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xpkEDS6jt39qufg3GMcbXZKRt5qOSbn/1OJhbiuzI9E=; b=WkQzJNCovlKEOqHWpvXP8qX2Oz
 9AKnH5F7B3abZEgVnbTJCbxxTOTxUGxOpUQ+JMnXu8EscKofv4odZS9RnNm/VQrgkxLtu1tC5Gza6
 7s3WJALqOW6geskjeGPPiLioMv+NvSNNMNZ3Ji3th385g6FtjmNMa539wqbqt0wmvP3A=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pk5z1-00G8j7-4O for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 16:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680712053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xpkEDS6jt39qufg3GMcbXZKRt5qOSbn/1OJhbiuzI9E=;
 b=IofOlEqACMOcCzuQ8zDo5dyqBOLvXdb0QvuYAKZrtfen6rJemfyHcn0NzhYfrMe90AlLgw
 sCXlDbXL5AfxkB8L5tN7WQZjNBjcTD4zvgK1uGeauIk2xCLMzXyltZzqAigdMU2MFWboC3
 kBA0yYlZD3JoeCQK1YgJw9KbBIxHoOc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-4gpl-oLyOhebpPvoJSCraw-1; Wed, 05 Apr 2023 12:27:32 -0400
X-MC-Unique: 4gpl-oLyOhebpPvoJSCraw-1
Received: by mail-qt1-f197.google.com with SMTP id
 u1-20020a05622a198100b003e12a0467easo24628635qtc.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Apr 2023 09:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680712051;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xpkEDS6jt39qufg3GMcbXZKRt5qOSbn/1OJhbiuzI9E=;
 b=1NSzFHajd0SIHyyCch90HXNvaEppvA1pF202iAJsjxMvbIIgwGrIjte3YYzlAcgmjc
 okNyPmywbZu+bTWSG/nHl6kvEo/pT7PTkh62hJkiNX6wE6dok040+9Zg1zkRqOf3PSKK
 gXWD/aR+ngS+I0lcKDNAgh8/21l4p2gBXTehcq+flH8czwWOo7O4cVUfIWl3XIBV2sI4
 OzS90DKzlQBQb5eS25jtT/pdKASHPVOKILsgacVYQjEmMZsCEtj8T8oz3yiz+17UtknK
 599OwP7lTdP1FWUi80o8qDsXE/ofWJD18DhB46Omfk5JxZ+qpbqsPm1pytAew/Ysj9B3
 bTMw==
X-Gm-Message-State: AAQBX9cRivhTWeow53HR46GCooTZogzFB26dIqinF1oKGFaV5xcCbb78
 poUU8WkhrL0YW7BqLyyN3Uz75Rgn5XQTxbuePl5jAMgQunesXDMW7/a/ifUdSbHAhKCAUezF2uq
 e4JVP9CRycpRse9gesI/nO35LGFV665gdSe+2
X-Received: by 2002:a05:6214:1c8d:b0:5bb:eefc:1624 with SMTP id
 ib13-20020a0562141c8d00b005bbeefc1624mr9853058qvb.27.1680712051494; 
 Wed, 05 Apr 2023 09:27:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZZl4q26mcUoNHuCokraSI3hi88peqAYHPpgY7Wvk0Gvn/BxgeqpN4NaYegoUGQwHkcsJ0yow==
X-Received: by 2002:a05:6214:1c8d:b0:5bb:eefc:1624 with SMTP id
 ib13-20020a0562141c8d00b005bbeefc1624mr9853021qvb.27.1680712051206; 
 Wed, 05 Apr 2023 09:27:31 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 r206-20020a3744d7000000b0074a0051fcd4sm4559684qka.88.2023.04.05.09.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 09:27:30 -0700 (PDT)
Date: Wed, 5 Apr 2023 18:27:26 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20230405162726.4d7bu3uz63w4cdkz@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404163942.GD109974@frogsfrogsfrogs>
MIME-Version: 1.0
In-Reply-To: <20230404163942.GD109974@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Darrick, On Tue, Apr 04, 2023 at 09:39:42AM -0700, Darrick
 J. Wong wrote: > On Tue, Apr 04, 2023 at 04:52:56PM +0200, Andrey Albershteyn
 wrote: > > Hi all, > > > > This is V2 of fs-verity support in XFS. In th
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pk5z1-00G8j7-4O
Subject: Re: [f2fs-dev] [PATCH v2 00/23] fs-verity support for XFS
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
Cc: fsverity@lists.linux.dev, hch@infradead.org, linux-ext4@vger.kernel.org,
 agruenba@redhat.com, damien.lemoal@opensource.wdc.com,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 cluster-devel@redhat.com, dchinner@redhat.com, rpeterso@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Darrick,

On Tue, Apr 04, 2023 at 09:39:42AM -0700, Darrick J. Wong wrote:
> On Tue, Apr 04, 2023 at 04:52:56PM +0200, Andrey Albershteyn wrote:
> > Hi all,
> > 
> > This is V2 of fs-verity support in XFS. In this series I did
> > numerous changes from V1 which are described below.
> > 
> > This patchset introduces fs-verity [5] support for XFS. This
> > implementation utilizes extended attributes to store fs-verity
> > metadata. The Merkle tree blocks are stored in the remote extended
> > attributes.
> > 
> > A few key points:
> > - fs-verity metadata is stored in extended attributes
> > - Direct path and DAX are disabled for inodes with fs-verity
> > - Pages are verified in iomap's read IO path (offloaded to
> >   workqueue)
> > - New workqueue for verification processing
> > - New ro-compat flag
> > - Inodes with fs-verity have new on-disk diflag
> > - xfs_attr_get() can return buffer with the attribute
> > 
> > The patchset is tested with xfstests -g auto on xfs_1k, xfs_4k,
> > xfs_1k_quota, and xfs_4k_quota. Haven't found any major failures.
> > 
> > Patches [6/23] and [7/23] touch ext4, f2fs, btrfs, and patch [8/23]
> > touches erofs, gfs2, and zonefs.
> > 
> > The patchset consist of four parts:
> > - [1..4]: Patches from Parent Pointer patchset which add binary
> >           xattr names with a few deps
> > - [5..7]: Improvements to core fs-verity
> > - [8..9]: Add read path verification to iomap
> > - [10..23]: Integration of fs-verity to xfs
> > 
> > Changes from V1:
> > - Added parent pointer patches for easier testing
> > - Many issues and refactoring points fixed from the V1 review
> > - Adjusted for recent changes in fs-verity core (folios, non-4k)
> > - Dropped disabling of large folios
> > - Completely new fsverity patches (fix, callout, log_blocksize)
> > - Change approach to verification in iomap to the same one as in
> >   write path. Callouts to fs instead of direct fs-verity use.
> > - New XFS workqueue for post read folio verification
> > - xfs_attr_get() can return underlying xfs_buf
> > - xfs_bufs are marked with XBF_VERITY_CHECKED to track verified
> >   blocks
> > 
> > kernel:
> > [1]: https://github.com/alberand/linux/tree/xfs-verity-v2
> > 
> > xfsprogs:
> > [2]: https://github.com/alberand/xfsprogs/tree/fsverity-v2
> 
> Will there any means for xfs_repair to check the merkle tree contents?
> Should it clear the ondisk inode flag if it decides to trash the xattr
> structure, or is it ok to let the kernel deal with flag set and no
> verity data?

The fsverity-util can calculate merkle tree offline, so, it's
possible for xfs_repair to do the same and compare, also it can
check that all merkle tree blocks are there. The flag without tree
is probably bad as all reading ops will fail and it won't be
possible to regenerate the tree (enable also checks for flag).

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
