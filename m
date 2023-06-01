Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0F771918F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 06:06:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4ZZT-0001PI-OL;
	Thu, 01 Jun 2023 04:05:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1q4ZZS-0001PC-8p
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 04:05:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mIavo5j4+6St+xYcUc/m3FtaH+qhMLsBPwolTHZN5go=; b=kwT81NmHi58yFjyyCdo0E6Ob4d
 plZhvchyCnuFs7BHbfYnN2Pa79hPQHiJcJAjwz15AtUJMPu/V6NLrDR8dfFVOFO2Ltz6QNQKn2zF/
 RcfQDWPbtbR0yOksLSz8hTdjV4zttjrRhy8O8nq50r+aJQmO6CjrFFwZsM6M6jdHKG9E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mIavo5j4+6St+xYcUc/m3FtaH+qhMLsBPwolTHZN5go=; b=DgVsQUUcQnvCEjwxaDoq3elJ5L
 RZC5WAWBezxRtHaKbVyn18zW4WoXC6OO6tlO5EmbYzS5hIDjNFbxIOtBq1WH2woEwqziSKO/Sgstt
 ePSd7cV+lDtvgzPjYxPCeqwb1sKSrqDXdBkhFCRFk0dqWqjmk2v7HmoW+3Ul0dfu7UW0=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4ZZO-0001Se-NX for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 04:05:54 +0000
Received: from cwcc.thunk.org (pool-173-48-119-27.bstnma.fios.verizon.net
 [173.48.119.27]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 35144uJl025934
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Jun 2023 00:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1685592303; bh=mIavo5j4+6St+xYcUc/m3FtaH+qhMLsBPwolTHZN5go=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=nJgLIM8bsghBqgoXKZjgAIvBsl1fN8A71/4BAhNIH12Mc4kaX0scpDkCoBhixBbTZ
 gW9wJbEuch5eyPKGIWPjUMuWYynPCinG2gNgtfUuJrUWbrQOIB1/daL+AtTGrscc0g
 fXlPmr5nR3b26+X2puSMJFG8wjxOOpXpEgrs4hC7JxLTQWWTeGcDvap8QDXckRZXNF
 k7FAnsbKeVvtL8unzzJONnG5qW8XPIo7C4llJN6UaCMVsMnQmm5/uChVkKfw85MPhX
 KpKei7rQwD+KqaqOdYkfi5taGJngIgiMPrCZzkOvzWlsLIJw75OrFU22cuYv40BzcH
 3fVMgSgTtY6jg==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id D1FCB15C02EE; Thu,  1 Jun 2023 00:04:56 -0400 (EDT)
Date: Thu, 1 Jun 2023 00:04:56 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230601040456.GA896851@mit.edu>
References: <20230531075026.480237-1-hch@lst.de>
 <20230531075026.480237-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230531075026.480237-2-hch@lst.de>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 31, 2023 at 09:50:15AM +0200, Christoph Hellwig
 wrote: > The last user of current->backing_dev_info disappeared in commit
 > b9b1335e6403 ("remove bdi_congested() and wb_congested() and rel [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [18.9.28.11 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1q4ZZO-0001Se-NX
Subject: Re: [f2fs-dev] [PATCH 01/12] backing_dev: remove
 current->backing_dev_info
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
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 31, 2023 at 09:50:15AM +0200, Christoph Hellwig wrote:
> The last user of current->backing_dev_info disappeared in commit
> b9b1335e6403 ("remove bdi_congested() and wb_congested() and related
> functions").  Remove the field and all assignments to it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>

Acked-by: Theodore Ts'o <tytso@mit.edu>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
