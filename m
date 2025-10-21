Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3CBBF5077
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Oct 2025 09:44:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezL05VGKZVn3e947QqpFAOfj4ule4GA12gEsEPlnjDE=; b=cz+ZxLSMa6dsg0kYMR5AiV3HKT
	HL/Ivaf6RStJaIkynrSet+pR5xuJcY4e38N2HvYGa7ZnTZcT1WR1pbga2DEIx/8zuIqsFVWBlEgz/
	seHvPNu2Wbm4Fj5xhu7JG71bVRMyt7g/VM8d0Dd/YLpl2ohx7rdoUo9uCUdwV+QzZ17E=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vB72T-0002no-P7;
	Tue, 21 Oct 2025 07:44:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1vB72S-0002nf-KM
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 07:44:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hupht6IsYglzIwM6DM/LX/W9GWhT6SbnOPZZmh93+TE=; b=fhz9Hea5Bpv1pho6HT8qGA7dmU
 FnFjY5jzq733fDGuCm/u7Lux+tB/1B327N8hnJ7U1QPQp8iqrZO9KKATdWt1/H6CBoEvuzgOttrdS
 JK5JRw0VKXI18wzFE6k1wdMrW+tmGyDUC5R+c6EeCdse1YDCIVtsBgcPvUMxbN2yQRgg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Hupht6IsYglzIwM6DM/LX/W9GWhT6SbnOPZZmh93+TE=; b=hjDPCbb4XTqH9jG6LXxAN5o4pL
 7qZpz4uEL43R5bh6wHetiE+3i6w+0fiP0n41QdSTl69YNX1TngsOWN5ohYL2umTSazXxmZjtSoGTN
 j063bmCk1Vqo1V/OIIQH4nENCc+YdWI4lhCIi+WLm37VripGrwjiPsJgt72CCW8lOKHQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vB72S-000096-1B for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 07:44:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4295E622CA;
 Tue, 21 Oct 2025 07:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0AFC4CEF1;
 Tue, 21 Oct 2025 07:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1761032645;
 bh=VMczXjHiMMFNXVkIShw8MPqNOsA6McDHZHBD6eVjJ38=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SbYLDsBCBxsgUOUSyOPz/19YEgyKAEWJEhKLS8zz7V8RujDKoQ1fbU/eYkXT2qoKd
 snPOb3GiGXtM3//fVhez2HesiI7yRXP+/zPpdvKhwVZKpTOQIBblWnE5lcTMQvcSIv
 sKm81tO8YLRs+1kjZ7J+IWfPX+KquM808y2vyexE=
Date: Tue, 21 Oct 2025 09:43:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mahmoud Nagy Adam <mngyadam@amazon.de>
Message-ID: <2025102111-stoppage-clergyman-f425@gregkh>
References: <20251021070353.96705-2-mngyadam@amazon.de>
 <2025102128-agent-handheld-30a6@gregkh>
 <lrkyqms5klnri.fsf@dev-dsk-mngyadam-1c-cb3f7548.eu-west-1.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <lrkyqms5klnri.fsf@dev-dsk-mngyadam-1c-cb3f7548.eu-west-1.amazon.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Oct 21, 2025 at 09:25:37AM +0200, Mahmoud Nagy Adam
 wrote: > Greg KH <gregkh@linuxfoundation.org> writes: > > > > > > > On Tue,
 Oct 21, 2025 at 09:03:35AM +0200, Mahmoud Adam wrote: > >> This [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vB72S-000096-1B
Subject: Re: [f2fs-dev] [PATCH 6.1 0/8] Backporting CVE-2025-38073 fix patch
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, nagy@khwaternagy.com,
 linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-nilfs@vger.kernel.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Christoph Hellwig <hch@infradead.org>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Oct 21, 2025 at 09:25:37AM +0200, Mahmoud Nagy Adam wrote:
> Greg KH <gregkh@linuxfoundation.org> writes:
> 
> >
> >
> > On Tue, Oct 21, 2025 at 09:03:35AM +0200, Mahmoud Adam wrote:
> >> This series aims to fix the CVE-2025-38073 for 6.1 LTS.
> >
> > That's not going to work until there is a fix in the 6.6.y tree first.
> > You all know this quite well :(
> >
> > Please work on that tree first, and then move to older ones.
> >
> 
> Yup, I've already sent a series for 6.6 yesterday:
> https://lore.kernel.org/stable/20251020122541.7227-1-mngyadam@amazon.de/

Ah, totally missed that as it was "just" a single backport, my fault.

Thanks for this, I'll review this when I get a chance.  How was this
tested?

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
