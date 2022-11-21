Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B338632D34
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Nov 2022 20:47:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxCkv-0004uv-9K;
	Mon, 21 Nov 2022 19:47:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oxCkt-0004uh-9H
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Nov 2022 19:46:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mrUeBzbBPktCj/0CXhmCr7HlBcwPe5CR0Yh38FsMH1k=; b=PIyIKYk1PWygueV/43g2L4d80b
 yZa37NgpZeCYj6FwfxbJzj4z1Q2F9SMJkGq++hFCD9rqbELmD5wTerF6V09sJ7a1eEGRF8AWVX4e5
 E2yxSWoCCsYXEIOnFloLIzDtlSrv185HsO77k3x5ZuwBc4ysnSFMutXcgrfQ7YvO6Ej0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mrUeBzbBPktCj/0CXhmCr7HlBcwPe5CR0Yh38FsMH1k=; b=CiKW2Wgvc/nv87fQ5S94OJktR8
 oTypUbFrY127mi6D4iTJIAAk98HplZ7owhBhV3Qq/EWR7oM/8MjTdu4X01tMiuMDTQrt7pZ6T1o4G
 TtNmED7HOuIkYndUT5V7mkeJZZMBk0qeurktZWnFa+bh0FTHM7RgKBdshnqK7fd4zlqQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oxCkp-008nTa-0S for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Nov 2022 19:46:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 93B2C61146;
 Mon, 21 Nov 2022 19:46:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36061C4347C;
 Mon, 21 Nov 2022 19:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669060009;
 bh=pHzctSC+3S79oH24mEHkCYNAjNLCVnOPYHO4iVExqp8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gu4ApRO7ShKYUQt/o5rHuO7/e7edxcAQL2sz08D3vSZo4B4Yk7qIg2vN3+Vq3zb0+
 Znpn4doRVYY6VPlWQoh0Ki+1FycncWJEWYrgpqSxcxLrGTrUT1KzhrLmH0QIH+WGGj
 kbpFVJ/bYVorYvawbiwdS8l/ZzBij6GvGFI/CdCUsg6olmZxihCSuvgv3LaAYT0/7+
 TvDA9gIAJkZJCq0ErkkUytJZssk6IIHLmwxHEAxykGzz/dfMEiK9/q/3cZw4EHXrxq
 Ifz0K/JPBw7GfKC1syS2sIBKVLiEYwTrzvlu5GZqxy0pUPLAeBf3gY4OKNS1eYWpm/
 4m6ENAR20nqXg==
Date: Mon, 21 Nov 2022 19:46:47 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Alexander Potapenko <glider@google.com>
Message-ID: <Y3vVp/2A9nao8HZ2@gmail.com>
References: <20221121112134.407362-1-glider@google.com>
 <20221121112134.407362-2-glider@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221121112134.407362-2-glider@google.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 21, 2022 at 12:21:31PM +0100, Alexander Potapenko
 wrote: > When aops->write_begin() does not initialize fsdata, KMSAN may report
 > an error passing the latter to aops->write_end(). > > Fix [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oxCkp-008nTa-0S
Subject: Re: [f2fs-dev] [PATCH 2/5] fs: affs: initialize fsdata in
 affs_truncate()
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
Cc: tytso@mit.edu, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 21, 2022 at 12:21:31PM +0100, Alexander Potapenko wrote:
> When aops->write_begin() does not initialize fsdata, KMSAN may report
> an error passing the latter to aops->write_end().
> 
> Fix this by unconditionally initializing fsdata.
> 
> Suggested-by: Eric Biggers <ebiggers@kernel.org>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

Are you sure that is the correct Fixes commit?  What about commit f2b6a16eb8f5
("fs: affs convert to new aops")?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
