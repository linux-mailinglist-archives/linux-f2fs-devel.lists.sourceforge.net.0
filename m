Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BA265CD99
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 08:25:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pCy9R-0004my-W4;
	Wed, 04 Jan 2023 07:25:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pCy9Q-0004mn-Ir
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 07:25:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cceV+AtJ9MtZMomS+IjwOz6z8srT60OwVpOFRGB8GZM=; b=EmpTCJjX1F7Jn3jHnKc3uRN+yr
 o9syHlEnMG4yQdJyOSYqQYwYTplPGMS95zIpDzRByB9WD6FyY8AHX2/AmUiBS7/ga7Xht0wy+AR6i
 ArrO25sbgCC/RwR/GzeTZLPhlnz+ndGgw8vaEGsiEdeHkegDkZCvucJsr4utsYYBuz9I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cceV+AtJ9MtZMomS+IjwOz6z8srT60OwVpOFRGB8GZM=; b=mdD4eaCsKt4baLta+iQTi1jYFJ
 I6rX+1QxdVcCMOmheLAFfDMzLKx6VESBUiG2bcP9pHLfx2AUVAk6DJoS/TJ3FjIlFLL4Z1l8AccKt
 qxMq1cEhLrsrLTuq7yJv9ysuujW2lD18XYZaNM+NamonaV1uubjbzsRMsf89HBTanIHg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pCy9P-00080W-T1 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 07:25:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9EA78B8119A;
 Wed,  4 Jan 2023 07:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFCBC433D2;
 Wed,  4 Jan 2023 07:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672817120;
 bh=EY0QIS6ah2VRlLsuBHHzFqCxhBDp5eEMXYtwzaAjNBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y8eevhPlbLQQByJxtZSN0ftIYXlnqoyA5BJUM6AP5KbL8Hdw0HMg2nuBQ5sdlamXc
 LExL2VFObRchVEVgRsCm15mnz4C6rXRbtTsMN2cr4b6oRiHMmmABbSNflU3EWaJhst
 5J1PEpb3DqjERtGwRqlzrEMz3WeV19T0b43MtEWOjh9knfnp7tviL6qmTp7aHZSXLT
 IEN/P6uhszJ2K9eZEk+XPP3yijgHtnJlqNNbbV7wSwv2r5oqXKVzoj6Y3IR7JL9E+a
 vEiPUYFi+z+qSUbJ0/w3bVi8IcSNUBhhDXmmHc9rII8AQDlMi9JWlYLQi6CtdvuVhT
 N9g/5kMqBLp7w==
Date: Tue, 3 Jan 2023 23:25:18 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Ojaswin Mujoo <ojaswin@linux.ibm.com>
Message-ID: <Y7Up3kpGcJr0FCgq@sol.localdomain>
References: <20221223203638.41293-1-ebiggers@kernel.org>
 <Y7UeuYVkyy2/fWF1@li-bb2b2a4c-3307-11b2-a85c-8fa5c3a69313.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y7UeuYVkyy2/fWF1@li-bb2b2a4c-3307-11b2-a85c-8fa5c3a69313.ibm.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 04, 2023 at 12:08:09PM +0530,
 Ojaswin Mujoo wrote:
 > Hi Eric, > > I have roughly gone through the series and run the (patched)
 xfstests on > this patchset on a powerpc machine with 64k pag [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pCy9P-00080W-T1
Subject: Re: [f2fs-dev] [PATCH v2 00/11] fsverity: support for non-4K pages
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
Cc: Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jan 04, 2023 at 12:08:09PM +0530, Ojaswin Mujoo wrote:
> Hi Eric,
> 
> I have roughly gone through the series and run the (patched) xfstests on
> this patchset on a powerpc machine with 64k pagesize and 64k,4k and 1k
> merkle tree size on EXT4 and everything seems to work correctly. 
> 
> Just for records, test generic/692 takes a lot of time to complete with
> 64k merkel tree size due to the calculations assuming it to be 4k,
> however I was able to manually test that particular scenario. (I'll try
> to send a patch to fix the fstest later).
> 
> Anyways, feel free to add:
> 
> Tested-by: Ojaswin Mujoo <ojaswin@linux.ibm.com>
> 
> Since I was not very familiar with the fsverty codebase, I'll try to
> take some more time to review the code and get back with any
> comments/RVBs.
> 
> Regards,
> ojaswin

Thanks Ojaswin!  That's a good point about generic/692.  The right fix for it is
to make it use $FSV_BLOCK_SIZE instead of 4K in its calculations.

I suppose you saw that issue by running the test on ext4 with fs_block_size ==
page_size == 64K, causing xfstests to use merkle_tree_block_size == 64K by
default.  Thanks for doing that; that's something I haven't been able to test
yet.  My focus has been on merkle_tree_block_size < page_size.
merkle_tree_block_size > 4K should just work, though, assuming
merkle_tree_block_size <= min(fs_block_size, page_size).  (Or
merkle_tree_block_size == fs_block_size == page_size before this patch series.)

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
