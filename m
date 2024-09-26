Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD479987775
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Sep 2024 18:19:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1strDP-0000EJ-94;
	Thu, 26 Sep 2024 16:19:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tj@kernel.org>) id 1strDM-0000Dz-R3
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Sep 2024 16:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NOLDUUFWKE/+snd4o6Oden2JZ1u76LI3qPAUO+yFJgw=; b=T7zzqS7T4wAgSGwpk/0DZt3SGv
 wLE27IYwUj5gr1buMNePa2SAXW6BvBGud8IrMMvk0Z4b+32R9DLDpDv3jK+BT5tl7KWZmVok4o001
 Ow7ensHYnOxGt6vw+JkKCwKY+Qapft7dZYrul5K7Q3Wrz1n0Q7f/3E7SSjjNAb3h3pIA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NOLDUUFWKE/+snd4o6Oden2JZ1u76LI3qPAUO+yFJgw=; b=eZmSoz+N5rWNiTSM/mINeHxgoS
 KG2PR9yLek35PzIml21fh4964LI/9UwVa6vRZp7lT7CQJ/tEe4r9Yi45W3cWyPWusMIotCmUKbLad
 cgXJIq9pfDDHGbAc+b5JGMvXZuizsB0Ad8J+QLXXww3bisy3Hw+x3p3TTvLgF+zvGD8o=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1strDM-0007Kj-4o for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Sep 2024 16:19:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 22DB8A40F94;
 Thu, 26 Sep 2024 16:19:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD817C4CEC5;
 Thu, 26 Sep 2024 16:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727367564;
 bh=lqXmhMEXuZKcNpBi/56TghcTSSMM2Wi1sUMY+o2nTWs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BtcMOiNb/9SmfFSSi/zUiW/TWgAPJ3p6Us5pPzmDB0PGq6xxSKB82IIHHbnFIFE6L
 xWmHcSFWdTxpmSYgzhjgK1Q9juzsfMnqicS31CNyR7eJolSZCElsQ05PiCPmW0mlOY
 I12iukt5rTiHGJZgUqzQeljNJORYRJ8nm15fgLyuo+iM5fRD/Gebl41T47t1aoxBtM
 FIg49JKG71a6fLQONoo5jfcuu493Edjp7UVvBI3lPAHEU5fDk8AcDO9AOuqAUncX1K
 mdhk8p+G3EjlGTzBn8A1yhDbs82Z6qma2s22OYIKBJG+bfKVfwv6ISbxlOjf5D1qCL
 UJGSe2etyLwMw==
Date: Thu, 26 Sep 2024 06:19:23 -1000
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
Message-ID: <ZvWJiyEREyfZN-NW@slm.duckdns.org>
References: <20240926140121.203821-1-kernel@pankajraghav.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240926140121.203821-1-kernel@pankajraghav.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Sep 26, 2024 at 04:01:21PM +0200,
 Pankaj Raghav (Samsung)
 wrote: > From: Pankaj Raghav <p.raghav@samsung.com> > > Most of the callers
 of wbc_account_cgroup_owner() are converting a folio > to [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1strDM-0007Kj-4o
Subject: Re: [f2fs-dev] [PATCH] fs/writeback: convert
 wbc_account_cgroup_owner to take a folio
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
From: Tejun Heo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Tejun Heo <tj@kernel.org>
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org,
 "Darrick J . Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Zefan Li <lizefan.x@bytedance.com>,
 cgroups@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 gost.dev@samsung.com, willy@infradead.org, linux-ext4@vger.kernel.org,
 Pankaj Raghav <p.raghav@samsung.com>, Josef Bacik <josef@toxicpanda.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 mcgrof@kernel.org, Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Sep 26, 2024 at 04:01:21PM +0200, Pankaj Raghav (Samsung) wrote:
> From: Pankaj Raghav <p.raghav@samsung.com>
> 
> Most of the callers of wbc_account_cgroup_owner() are converting a folio
> to page before calling the function. wbc_account_cgroup_owner() is
> converting the page back to a folio to call mem_cgroup_css_from_folio().
> 
> Convert wbc_account_cgroup_owner() to take a folio instead of a page,
> and convert all callers to pass a folio directly except f2fs.
> 
> Convert the page to folio for all the callers from f2fs as they were the
> only callers calling wbc_account_cgroup_owner() with a page. As f2fs is
> already in the process of converting to folios, these call sites might
> also soon be calling wbc_account_cgroup_owner() with a folio directly in
> the future.
> 
> No functional changes. Only compile tested.
> 
> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>

From cgroup writeback POV:

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
