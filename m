Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1736770B22C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 May 2023 01:46:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q0sl6-0002st-SY;
	Sun, 21 May 2023 23:46:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1q0sl5-0002sn-Me
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 21 May 2023 23:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=svR4CGbLoubugTN02ryln1ioX3ZuUS3kSS0+XT+/Kao=; b=XF+UO9HsPLtFiNirHvKRjaBtTA
 0GxMPk1j7LtFISfeRYgfGnaHqs1urCB8ne8U00s2R9pOfzPAtlUuaziJKJIxjmSj9JnoX6sVc59+d
 EorGzg3InyaffpjxmLT5pxErKK+aNgI+wJSK/3sUE+z17HieT72n2pDPZg2GD+MeLT2w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=svR4CGbLoubugTN02ryln1ioX3ZuUS3kSS0+XT+/Kao=; b=ThR27CRLlExRIgHOOQSPcupD1+
 X1o69I6o9n+XyM2N+guQEepFU0x/OJz6N/ChgKdJyLM/Sc9HpCJ6986NzX82GFbhaXRBFXPKu8LbP
 7s60fkpQl0Y0KMl741rhXajzHqJIKHcP5xHjLdvmImDwe+CDTV6cd1178zrICGeU0oCQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q0sl4-0004YQ-Rk for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 21 May 2023 23:46:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 60C4F614C9;
 Sun, 21 May 2023 23:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27EE9C433EF;
 Sun, 21 May 2023 23:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684712792;
 bh=+3vgUoVh3E2C8WDPRGjzO+A3o+qnpoprdCEFxdJkTLI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BIn76l0KCnY6smusBdh+vTTvqCJeSHoDSZWVwVokpqk5tbVTiA8juu+BfUQhrzAMs
 znwe1JVC3xj96/ulcXd+sUKy9Doh1RQAoAsdpMaUteZ3WJeS5HvhuArO2b5VpXBnVk
 fc0Mf0My5pVW24z8zqjHqnt/jYvbsneDzyl+GHbIA5vF+qqO++QVv/aUQCl0xFd+7k
 UsQjhZZzY0WmAk5wmoSSXHrSWbULgAB3giSFZE6ozuC71FlePdzn2gYPlair4pOqNG
 dd3GECOXwZC8uOPKEWKgOBI2PYI6ohzoB4ZbzAXkgTHZK6Y26798PxrGET5g5QDjTe
 PIYzIF4neBHIg==
Message-ID: <b0693906-8ed4-78be-7b74-509532c1c365@kernel.org>
Date: Mon, 22 May 2023 08:46:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>
References: <20230519093521.133226-1-hch@lst.de>
 <20230519093521.133226-5-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20230519093521.133226-5-hch@lst.de>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/19/23 18:35, Christoph Hellwig wrote: > Factor out a
 helper that does filemap_write_and_wait_range for a the for a the -> for the
 > range covered by a read kiocb, or returns -EAGAIN if the kiocb > is marked
 as nowait and there would be pages to write. > > Signed-off-by: Christoph
 Hellwig <hch@lst.de> 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q0sl4-0004YQ-Rk
Subject: Re: [f2fs-dev] [PATCH 04/13] filemap: add a kiocb_write_and_wait
 helper
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/19/23 18:35, Christoph Hellwig wrote:
> Factor out a helper that does filemap_write_and_wait_range for a the

for a the -> for the

> range covered by a read kiocb, or returns -EAGAIN if the kiocb
> is marked as nowait and there would be pages to write.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
