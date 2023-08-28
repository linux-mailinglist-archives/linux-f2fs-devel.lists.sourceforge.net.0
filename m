Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E794B78B043
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Aug 2023 14:30:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qabOI-00067u-DQ;
	Mon, 28 Aug 2023 12:30:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1qabOH-00067o-AY
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Aug 2023 12:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TLnvMQnkyoR7wwCry5GRCKzwjL5P4BV+bNSPRJ9AdUw=; b=F7iH7H3Iy87nMeggjwj7w2bLMx
 zOvpnaF8mVeDpbltu17WXN3A7ZBDuivY/Yiy6rDIHd8nNOMiZTJ6RzpFnCN7hMT5YZUz/DmojO4KB
 xUTFXTQEa64ukxHnWeBVMExFNMZ27t09A6LodHL7+U50c8YJiPUcJFpfyoMKkN75SLU0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TLnvMQnkyoR7wwCry5GRCKzwjL5P4BV+bNSPRJ9AdUw=; b=T7jIGhi6fSHeVUckTtTvUgkhsv
 2EE550bLK0FyIgs+COWsFcyBE0RYB2BB8KcWZOU9yHSXetoJY+N5lSQS0zS9Y8YtH4AvEgWdVXlBJ
 TeLL5RmAGbiLuxW5drrqLaPv62wGLjAMatMns5pyuZ6Xrj4DbDg3MBUSZ1nzYbeWgSvI=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qabOC-0008FX-No for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Aug 2023 12:30:46 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 981DA68D05; Mon, 28 Aug 2023 14:30:25 +0200 (CEST)
Date: Mon, 28 Aug 2023 14:30:23 +0200
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20230828123023.GA11084@lst.de>
References: <20230601145904.1385409-1-hch@lst.de>
 <20230601145904.1385409-4-hch@lst.de> <20230827194122.GA325446@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827194122.GA325446@ZenIV>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Aug 27, 2023 at 08:41:22PM +0100, Al Viro wrote: >
 That part is somewhat fishy - there's a case where you return a positive
 value > and advance ->ki_pos by more than that amount. I really wond [...]
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1qabOC-0008FX-No
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

On Sun, Aug 27, 2023 at 08:41:22PM +0100, Al Viro wrote:
> That part is somewhat fishy - there's a case where you return a positive value
> and advance ->ki_pos by more than that amount.  I really wonder if all callers
> of ->write_iter() are OK with that.  Consider e.g. this:

This should not exist in the latest version merged by Jens.  Can you
check if you still  see issues in the version in the block tree or
linux-next.

> Suppose ->write_iter() ends up doing returning a positive value smaller than
> the increment of kiocb.ki_pos.  What do we get?  ret is positive, so
> kiocb.ki_pos gets copied into *ppos, which is ksys_write's pos and there
> we copy it into file->f_pos.
> 
> Is it really OK to have write() return 4096 and advance the file position
> by 16K?  AFAICS, userland wouldn't get any indication of something
> odd going on - just a short write to a regular file, with followup write
> of remaining 12K getting quietly written in the range 16K..28K.
> 
> I don't remember what POSIX says about that, but it would qualify as
> nasty surprise for any userland program - sure, one can check fsync()
> results before closing the sucker and see if everything looks fine,
> but the way it's usually discussed could easily lead to assumption that
> (synchronous) O_DIRECT writes would not be affected by anything of that
> sort.

ki_pos should always be updated by the write return value.  Everything
else is a bug.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
