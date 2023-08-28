Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9112478B067
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Aug 2023 14:33:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qabQd-0005yw-Uq;
	Mon, 28 Aug 2023 12:33:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1qabQd-0005yp-1F
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Aug 2023 12:33:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AFgAO5uGx+/8pExT6wW8lT/FnP0yLewZIEyGH7Av2K0=; b=Hj3llzQWkFBsha70wO77PtFP6v
 ghtrVrvl+qw4EPmm8BuwSQ6Cp/kG8+ktFSjFmdBaZrlCATmPvxB50MPYoxPtklwg8uerQ4c/Xh6mV
 Kr87Df+fynKZX36/f6eSS1cSuQSk2Gv2GtVYlsPvNivb9w/I3lADCc4/u/Rso41YhPhs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AFgAO5uGx+/8pExT6wW8lT/FnP0yLewZIEyGH7Av2K0=; b=CQhIzi7JUlSG3JYic6txN+yfLo
 ZYoU37Hcoh37bOYZz8E4fIH+3n9Tqd2Hpugiu8ybakMMeEme+UNVv2JGx+8p5mkghdxA6A1tuSuDi
 QCga57W/+ivuB0dSQn5UvkF+irzeZgugaDbLuydOqQLwz8drjdlXqe9T/4q+ZC4/NSGY=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qabQc-000jna-E4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Aug 2023 12:33:10 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 580D668AA6; Mon, 28 Aug 2023 14:33:00 +0200 (CEST)
Date: Mon, 28 Aug 2023 14:32:59 +0200
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20230828123259.GB11084@lst.de>
References: <20230601145904.1385409-1-hch@lst.de>
 <20230601145904.1385409-4-hch@lst.de> <20230827194122.GA325446@ZenIV>
 <20230827214518.GU3390869@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827214518.GU3390869@ZenIV>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Aug 27, 2023 at 10:45:18PM +0100, Al Viro wrote: >
 IOW, I suspect that the right thing to do would be something along the lines
 > of The idea looks sensible to me, but we'll also need to do it for the
 filemap_write_and_wait_range failure case. 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1qabQc-000jna-E4
Subject: Re: [f2fs-dev] [PATCH 03/12] filemap: update ki_pos in
 generic_perform_write
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
 Christoph Hellwig <hch@lst.de>, Andreas Gruenbacher <agruenba@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Hannes Reinecke <hare@suse.de>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Aug 27, 2023 at 10:45:18PM +0100, Al Viro wrote:
> IOW, I suspect that the right thing to do would be something along the lines
> of

The idea looks sensible to me, but we'll also need to do it for the
filemap_write_and_wait_range failure case.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
