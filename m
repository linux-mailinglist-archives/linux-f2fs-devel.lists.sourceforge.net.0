Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5D3AC7D6A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 May 2025 13:50:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=GuxWD0WYxz/QaZkFn5L1cscFXQKQUGkDeb7ah6WihM4=; b=J44c7hAUIknOy5Ysg0kmctYzQ4
	iFf507RRf7sH7mJRSKTAHqLWdULX+QBXgGmBmkRAMQHhmeXxGRFj6UZXGHUfPxJSNDIl44vwdHnHo
	RWE2BotMsUC3jlju+S1rwcYls5ppAFXfTOENinKMcSIpcQSUi67Yv9WLjDwqSq3flHRQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKblp-0001MT-Hy;
	Thu, 29 May 2025 11:50:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1uKblm-0001M4-RV
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0BBOPh/1Je3me0LukkKrHkNdCa1/chw529Mw+ILY7AM=; b=C8sXCaiaekbU5bV+nMpoNKzrY5
 bSMf2bS03UQGhtGL2teKs44/OmtDKM8ItTtJbNYwS3jedNvZiJbTQPtqzcXXsALU8QaOYsZFYmMc4
 8e8gIw5snfici35lM9/r05ACvonc03pCWPAKgZL5+Rg5AMpI6wYfcSQ1Ce8nb/qt/buQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0BBOPh/1Je3me0LukkKrHkNdCa1/chw529Mw+ILY7AM=; b=S
 4qx6qYB5ljEdP9/DXGfBTFvSOwplAqKBBX5ymtkI/pHhKXn0kA9XJ1eXHVais1Ayw3hvFEIfaIeks
 I56KHAq+3XZrBNKEerOXSx8GDwPxamEzJXLqMHzB/zvrESQxISH7geBbFHm8hywuOhJEQaV2/FQWk
 4xyZbphCiCsOgSxM=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uKblm-0000yk-Ds for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:49:58 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250529113326epoutp03f901f2863c6196fb26e8f54d01d8489b~D-Dn5bLv00848708487epoutp036
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 May 2025 11:33:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250529113326epoutp03f901f2863c6196fb26e8f54d01d8489b~D-Dn5bLv00848708487epoutp036
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1748518406;
 bh=0BBOPh/1Je3me0LukkKrHkNdCa1/chw529Mw+ILY7AM=;
 h=From:To:Cc:Subject:Date:References:From;
 b=IWzvH78SF7qzQn/pWr7KEbtYNBmiy9GCBm4F1TQntNi3tDSGz1/QFS7nZLrLipOpN
 gJkLbItfAm9glffjxkV/yI0O5X7sKV5fD6n4e2lbrAbO8TMKBdDC+lC0H/0aLaAAx2
 chuMjm3PlDX4QuNwpszIJBdLE8HxNmyoqGAonJu4=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
 20250529113325epcas5p3830c2f39e388a74a690d47b523499383~D-Dm0q5r70040000400epcas5p3P;
 Thu, 29 May 2025 11:33:25 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.182]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4b7PPv4tyMz2SSKX; Thu, 29 May
 2025 11:33:23 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20250529113215epcas5p2edd67e7b129621f386be005fdba53378~D-Cl_h9Q22517425174epcas5p2v;
 Thu, 29 May 2025 11:32:15 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250529113215epsmtrp24d38e9c495ac3d242ed907100353fa8f~D-Cl8Jy3Y3146431464epsmtrp2c;
 Thu, 29 May 2025 11:32:15 +0000 (GMT)
X-AuditID: b6c32a28-460ee70000001e8a-e5-683845bf1925
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B0.41.07818.FB548386; Thu, 29 May 2025 20:32:15 +0900 (KST)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250529113211epsmtip2df4f1dfd18c671ff59a420a522ae4244~D-CiJOJGk2207922079epsmtip2Z;
 Thu, 29 May 2025 11:32:11 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, p.raghav@samsung.com,
 da.gomez@samsung.com
Date: Thu, 29 May 2025 16:44:51 +0530
Message-Id: <20250529111504.89912-1-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRmVeSWpSXmKPExsWy7bCSvO5+V4sMg2WbRCy2rdvNbjFn/Ro2
 iwvrVjNatO78z2Kx+m4/m8Xrw58YLU5PPctkseWSvcX7y9uYLFbfXMNoseXYPUaLy0/4LHZP
 /8dqcfPATiaLlauPMlnMnt7MZPFk/Sxmi61fvrJaXFrkbrFn70kWi3tr/rNaXDhwmtXixoSn
 jBbPdm9ktvi8tIXd4uCpDnaLT3OBhpz/e5zV4vePOWwOsh6nFkl47Jx1l91j8wotj8tnSz02
 repk89j0aRK7x4kZv1k8Xmyeyeixe8FnJo/dNxvYPM5drPB4v+8qm0ffllWMHlNn13ucWXCE
 3WPFtItMAUJRXDYpqTmZZalF+nYJXBnH+/ayFNxSreh8uIq5gXGpbBcjB4eEgInErBOKXYxc
 HEICuxklJk6Yxd7FyAkUl5HYfXcnK4QtLLHy33N2iKKPjBLfn+xjAWlmE9CV+NEUChIXEbjJ
 LHHu7BlWEIdZ4CajxJzNq8EmCQtYSkxc8BpsEouAqsTbL69YQGxeAVuJBS+OMUNskJeYeek7
 O0RcUOLkzCdgNcxA8eats5knMPLNQpKahSS1gJFpFaNkakFxbnpusmGBYV5quV5xYm5xaV66
 XnJ+7iZGcIxraexgfPetSf8QIxMH4yFGCQ5mJRHeJnuzDCHelMTKqtSi/Pii0pzU4kOM0hws
 SuK8Kw0j0oUE0hNLUrNTUwtSi2CyTBycUg1MPSVnXuydV7xnYaZRrR/b/N9OS/jErxavbJy6
 iXOe0TWriZU5hQzi0l9kdhk4JPF7Xag8u/HlbwMXbk3fzQFf/0u8u2VTY1C9guMig37EvMzG
 E9sPHrsqsJZRWfqkQYTxrsV/Lj+Y2ffu6xyJhQKRq08GrK2/rZXO+LBjd8YUj0LndfeeuAkE
 iG3UviXQes2H30x0khvXgzrDzfc5S22PSSktnvpw6Z3ZT3j55SLXmorN2RVzOf6Zi45k2L+l
 b6qVDO6sym5co6C1R+KMxWEHp+22NglPhO40lGT9cQi8+mvFinuWZ1dadFiGGdnWPD4X5134
 Oy6lfPVuP+kZnd47Tx8/tWKCdNUd5pOBZwr8lViKMxINtZiLihMBvytCF2ADAAA=
X-CMS-MailID: 20250529113215epcas5p2edd67e7b129621f386be005fdba53378
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529113215epcas5p2edd67e7b129621f386be005fdba53378
References: <CGME20250529113215epcas5p2edd67e7b129621f386be005fdba53378@epcas5p2.samsung.com>
X-Headers-End: 1uKblm-0000yk-Ds
Subject: [f2fs-dev] [PATCH 00/13] Parallelizing filesystem writeback
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
Cc: linux-nfs@vger.kernel.org, gost.dev@samsung.com,
 linux-f2fs-devel@lists.sourceforge.net, gfs2@lists.linux.dev,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Kundan Kumar <kundan.kumar@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Currently, pagecache writeback is performed by a single thread. Inodes
are added to a dirty list, and delayed writeback is triggered. The single
writeback thread then iterates through the dirty inode list, and executes
the writeback.

This series parallelizes the writeback by allowing multiple writeback
contexts per backing device (bdi). These writebacks contexts are executed
as separate, independent threads, improving overall parallelism.

Would love to hear feedback in-order to move this effort forward.

Design Overview
================
Following Jan Kara's suggestion [1], we have introduced a new bdi
writeback context within the backing_dev_info structure. Specifically,
we have created a new structure, bdi_writeback_context, which contains
its own set of members for each writeback context.

struct bdi_writeback_ctx {
        struct bdi_writeback wb;
        struct list_head wb_list; /* list of all wbs */
        struct radix_tree_root cgwb_tree;
        struct rw_semaphore wb_switch_rwsem;
        wait_queue_head_t wb_waitq;
};

There can be multiple writeback contexts in a bdi, which helps in
achieving writeback parallelism.

struct backing_dev_info {
...
        int nr_wb_ctx;
        struct bdi_writeback_ctx **wb_ctx_arr;
...
};

FS geometry and filesystem fragmentation
========================================
The community was concerned that parallelizing writeback would impact
delayed allocation and increase filesystem fragmentation.
Our analysis of XFS delayed allocation behavior showed that merging of
extents occurs within a specific inode. Earlier experiments with multiple
writeback contexts [2] resulted in increased fragmentation due to the
same inode being processed by different threads.

To address this, we now affine an inode to a specific writeback context
ensuring that delayed allocation works effectively.

Number of writeback contexts
===========================
The plan is to keep the nr_wb_ctx as 1, ensuring default single threaded
behavior. However, we set the number of writeback contexts equal to
number of CPUs in the current version. Later we will make it configurable
using a mount option, allowing filesystems to choose the optimal number
of writeback contexts.

IOPS and throughput
===================
We see significant improvement in IOPS across several filesystem on both
PMEM and NVMe devices.

Performance gains:
  - On PMEM:
	Base XFS		: 544 MiB/s
	Parallel Writeback XFS	: 1015 MiB/s  (+86%)
	Base EXT4		: 536 MiB/s
	Parallel Writeback EXT4	: 1047 MiB/s  (+95%)

  - On NVMe:
	Base XFS		: 651 MiB/s
	Parallel Writeback XFS	: 808 MiB/s  (+24%)
	Base EXT4		: 494 MiB/s
	Parallel Writeback EXT4	: 797 MiB/s  (+61%)

We also see that there is no increase in filesystem fragmentation
# of extents:
  - On XFS (on PMEM):
	Base XFS		: 1964
	Parallel Writeback XFS	: 1384

  - On EXT4 (on PMEM):
	Base EXT4		: 21
	Parallel Writeback EXT4	: 11

[1] Jan Kara suggestion :
https://lore.kernel.org/all/gamxtewl5yzg4xwu7lpp7obhp44xh344swvvf7tmbiknvbd3ww@jowphz4h4zmb/
[2] Writeback using unaffined N (# of CPUs) threads :
https://lore.kernel.org/all/20250414102824.9901-1-kundan.kumar@samsung.com/

Kundan Kumar (13):
  writeback: add infra for parallel writeback
  writeback: add support to initialize and free multiple writeback ctxs
  writeback: link bdi_writeback to its corresponding bdi_writeback_ctx
  writeback: affine inode to a writeback ctx within a bdi
  writeback: modify bdi_writeback search logic to search across all wb
    ctxs
  writeback: invoke all writeback contexts for flusher and dirtytime
    writeback
  writeback: modify sync related functions to iterate over all writeback
    contexts
  writeback: add support to collect stats for all writeback ctxs
  f2fs: add support in f2fs to handle multiple writeback contexts
  fuse: add support for multiple writeback contexts in fuse
  gfs2: add support in gfs2 to handle multiple writeback contexts
  nfs: add support in nfs to handle multiple writeback contexts
  writeback: set the num of writeback contexts to number of online cpus

 fs/f2fs/node.c                   |  11 +-
 fs/f2fs/segment.h                |   7 +-
 fs/fs-writeback.c                | 146 +++++++++++++-------
 fs/fuse/file.c                   |   9 +-
 fs/gfs2/super.c                  |  11 +-
 fs/nfs/internal.h                |   4 +-
 fs/nfs/write.c                   |   5 +-
 include/linux/backing-dev-defs.h |  32 +++--
 include/linux/backing-dev.h      |  45 +++++--
 include/linux/fs.h               |   1 -
 mm/backing-dev.c                 | 225 ++++++++++++++++++++-----------
 mm/page-writeback.c              |   5 +-
 12 files changed, 333 insertions(+), 168 deletions(-)

-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
