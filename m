Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B193212FBA9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Jan 2020 18:35:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1inQrb-000887-KM; Fri, 03 Jan 2020 17:35:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1inQrZ-00087z-Fz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jan 2020 17:35:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ImEa30GCPKX56yDZfABGjgMIvTfgBS7CVBGtA4kTYWc=; b=ZKXC+vdGxA2EhfKiwAKZjTpJK6
 gNXFG9h52LJniF5AKOkXjoOqKV0xu7ZfITie5/2KB8uQIEQm1gmbRffZ9VDixyh26cw89B/jnvRnk
 eQWMzkSfJctLGEj+qkeVLu13I9LIKWMrv4Gb9dXaGUA3koAEkHlLpdEDp0ZvWnK03eeo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ImEa30GCPKX56yDZfABGjgMIvTfgBS7CVBGtA4kTYWc=; b=l+if5L+m6rSkWaGrIQ1QBwWU7V
 xTnUtmSHpRlqFa/AsCMyWMvAxglKuUF0MEK1e/WcwhDxIF200mNTqs2FImmPPbgkBiInnORmEda06
 J5WqYAEaViIpz+KxbvvJhQiw+jX9MxLZ6CRCUhUd2XW+tsyx7EbzMbOPfzndRoNP3ewE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1inQrB-008kk9-PO
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jan 2020 17:35:53 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1B499217F4;
 Fri,  3 Jan 2020 17:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578072924;
 bh=YPOVWlNg1Mm2LkFxPVnpRf9ztE7zvWVFSV3EoWOsIp8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u5kWv97f6FKwrivzQjjraIZEQplJ8USTjHMkRGTHDmupkUUmrPLLojQiAFeRWAL72
 HfNtC+UKJb5IDmt8wTa8OTwQU69jmWbp1Re2qBNMRCm9PS/AMVH1N6go31IbG2pnqA
 Xlk/HqGWoXZQz/Mw9ZEkDxM7iPAf/SrZcdRp4Ois=
Date: Fri, 3 Jan 2020 09:35:23 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200103173523.GA6541@jaegeuk-macbookpro.roam.corp.google.com>
References: <20191210164715.28281-1-jaegeuk@kernel.org>
 <d9526a75-3399-2c5f-9e91-1f704ce2af56@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d9526a75-3399-2c5f-9e91-1f704ce2af56@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1inQrB-008kk9-PO
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: do not access nat etnries in ckpt
 before initialization
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/03, Chao Yu wrote:
> On 2019/12/11 0:47, Jaegeuk Kim wrote:
> > ckpt->entries is initialized by fsck_init(), but we tried to access it during
> > f2fs_do_mount().
> > 
> > The call sequence is:
> >  - f2fs_do_mount
> >   - record_fsync_data
> >     - traverse_dnodes
> >      - do_record_fsync_data
> >       - ADDRS_PER_PAGE
> >        - get_node_info
> >         - node_info_from_raw_nat(fsck->entries[nid])
> >  - do_fsck
> >   - fsck_init
> >    - build_nat_area_bitmap
> >     - fsck->entries = calloc(fsck->nr_nat_entries);
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>

Sorry, merged in master before.

> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
