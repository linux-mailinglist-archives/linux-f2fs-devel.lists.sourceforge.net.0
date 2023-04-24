Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 018706EC514
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Apr 2023 07:49:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pqp5J-0004XJ-4f;
	Mon, 24 Apr 2023 05:49:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e16e2fc4419b117693a1+7183+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pqp5I-0004X5-0W for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 05:49:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rxuwauPRwLemTJXwY3VrKMRJhs+GgwhnyBD4s7nm7AY=; b=Fw/75qPPqahF17tKkcmmLjXL1f
 TzLZzEWyza1h09GysnBaGGYFFvx05O938NdDsrJ3RDFoVob7ib81R12tD6YhQhSQSrmopBIgNyJZj
 RH9M85zcDqM8ayUnT3j1x9UwUNI8SEDDqLbF3kUkhAc22s5Ih1Yi6e9Y1vMEcNK1nVzg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rxuwauPRwLemTJXwY3VrKMRJhs+GgwhnyBD4s7nm7AY=; b=G
 4WMUEdttOD9KzJI1xv/KwmXCHF2AU8CXNdvs0Lkb2TAwQj+DssyWcoQSRM5ALVodSXTpE6K6kTyul
 bYPmd5NkZ7QDQSpa/VZ84shLub8QxOBGotaxse63n6q/7PTBtSamihMWZ0d42Jpwq7CoheY3nt5ae
 6lDVnXqh2ekD2xPY=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pqp5E-0003Tn-ML for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 05:49:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=rxuwauPRwLemTJXwY3VrKMRJhs+GgwhnyBD4s7nm7AY=; b=3MpQEmnJ4id5J1jZ4YFohK5H8q
 bs7ciFKUIE9sA5F//wk8TThxaPzhLwI6FsUH1vKzNkmpHyq88uhXgF7wTEHMLlqIzGShUjm1tpoQ/
 V9Tji0dQSyZQM/K5ekDNoH5faw93KpoQQtAuWkTbvGbcl7apn0KwIYdsbsU9S2n8QH5hFEZJO4yZ5
 yp8GdzGRgc1AHk7t7DD60UmLFSqOCfsXJza1GpGtauNVHkVJvJiQUeDviaHbb72Zouz31uRXC/4XE
 B+bfmZC/bCU0vqPNw8dnGTB4G0skWpel5LUkS6Ua52Z/N1nKMNRb49n9vt5etsldL20AA2wC69Vmq
 TVA2auLw==;
Received: from [2001:4bb8:189:a74f:e8a5:5f73:6d2:23b8] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pqp4s-00FOtV-2G; Mon, 24 Apr 2023 05:49:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 24 Apr 2023 07:49:09 +0200
Message-Id: <20230424054926.26927-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all, after all the talk about removing buffer_heads, here
 is a series that shows how to build a kernel without buffer_heads. And how
 unrealistic it is to remove the entirely. Most of the series refactors some
 common code to make implementing direct I/O easier without use of the
 ->direct_IO
 method and the helpers based around it. It then switches buffered writes
 (but not wr [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pqp5E-0003Tn-ML
Subject: [f2fs-dev] RFC: allow building a kernel without buffer_heads
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
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
 cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi all,

after all the talk about removing buffer_heads, here is a series that
shows how to build a kernel without buffer_heads.  And how unrealistic
it is to remove the entirely.

Most of the series refactors some common code to make implementing direct
I/O easier without use of the ->direct_IO method and the helpers based
around it.  It then switches buffered writes (but not writeback) for
block devices to use iomap unconditionally, but still using buffer_heads.

The final patch then adds a CONFIG_BUFFER_HEAD selected by all file
systems that need it (which is most block based file systems), makes the
buffer_head support in iomap optional, and adds an alternative
implementation of the block device address_operations using iomap.

With this you can build a kernel with block device support, but without
buffer_heads.  This kernel supports xfs and btrfs as full blown block
based filesystems, and a bunch of read-only ones like cramfs, erofs and
squashfs.  Note that the md software raid drivers is also disabled as it
has some (rather questionable) buffer_head usage in the unconditionally
built bitmap code.

The series is based on Linux 6.3 and will need some rebasing before it
can be fed to the maintainers incrementally.  All but the last patch
definitively seem useful for me.  The last one I think is just to avoid
introducing new buffer_head dependencies, even if I suspect the real
life usefulness of a !CONFIG_BUFFER_HEAD kernel might be rather limited.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
