Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CED2D1A87
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 21:32:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmNAo-0006Eg-0z; Mon, 07 Dec 2020 20:31:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kmNAk-0006ET-0o
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 20:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jvOAvT1hEG8URL9trHCM5aA8bIaJ1mGS41UKuT+Yzug=; b=Hb1A0cI1XsO2lEV3gKoK03/Mfy
 2HzYzmzXDwo6GkvKDXsZJws9hQzb9KThtq0AGgPS5XRCUCSdgmaYc1mvIu1ncuopoPf67nGv24r4E
 IjmpBOgSiIOU/qV0xtidQBb76opgod1jmnltYHXeCdmW8qdKb2GlIMBdaqYhpjhU1AOU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jvOAvT1hEG8URL9trHCM5aA8bIaJ1mGS41UKuT+Yzug=; b=JU3em/zbrqSstllnVOrHjjVoKg
 eF6QhbYdUV6j+lJdO98BIt2J/0ufUG1D2qNUVkvt4pGC9nrTKGQKyUYLy0cp3fIy6BH3fBoIS6VER
 TWVUsFhju7I4oy662IDPSlPpfhpPQh4jPemP9QUDR09xcTYZkF9AKy95F9ESLxOFds+Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmNAf-005lEQ-W5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 20:31:49 +0000
Date: Mon, 7 Dec 2020 12:31:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607373095;
 bh=dhTYw5ud5BHG353VDU98B6oku7U8oYVLLb0qfO+807U=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=quqI6HvAxjJmHmIGWgnOEhVqCKxsw2nK1FZAzQbWE3iZbYr1DtYpN4kqYqU0j6K7u
 EQwBC2bJUgkZMkIwwTXJLHfJpYu9oQ0QtIYsG4hfYDP6yeN3swQXd1dnanC92DmmDC
 zTU+NpydZswxnwwRiSRSXnBBBXABXnmrpHneONDrtQe7/nKtF2vfR2HRndFEh6EXuY
 vm0612R4OkJuXEuphzN6Zt74JZ3yxt1g0dm2iue1VQuZ5attVzegJRp+X5NOoMIktI
 JPG0GF7atd7fwxZd8SRSc9hF6RhFXR1xy3aM1KyR6GFzjX3nDA8Qjk1g2MCiKg7Iro
 ZQ20RwLhUq9Xw==
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <X86RJdLhOVRm28Eu@gmail.com>
References: <20201205042626.1113600-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201205042626.1113600-1-daeho43@gmail.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kmNAf-005lEQ-W5
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix race of pending_pages in
 decompression
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Dec 05, 2020 at 01:26:26PM +0900, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> I found out f2fs_free_dic() is invoked in a wrong timing, but
> f2fs_verify_bio() still needed the dic info and it triggered the
> below kernel panic. It has been caused by the race condition of
> pending_pages value between decompression and verity logic, when
> the same compression cluster had been split in different bios.
> By split bios, f2fs_verify_bio() ended up with decreasing
> pending_pages value before it is reset to nr_cpages by
> f2fs_decompress_pages() and caused the kernel panic.
> 
> [ 4416.564763] Unable to handle kernel NULL pointer dereference
>                at virtual address 0000000000000000
> ...
> [ 4416.896016] Workqueue: fsverity_read_queue f2fs_verity_work
> [ 4416.908515] pc : fsverity_verify_page+0x20/0x78
> [ 4416.913721] lr : f2fs_verify_bio+0x11c/0x29c
> [ 4416.913722] sp : ffffffc019533cd0
> [ 4416.913723] x29: ffffffc019533cd0 x28: 0000000000000402
> [ 4416.913724] x27: 0000000000000001 x26: 0000000000000100
> [ 4416.913726] x25: 0000000000000001 x24: 0000000000000004
> [ 4416.913727] x23: 0000000000001000 x22: 0000000000000000
> [ 4416.913728] x21: 0000000000000000 x20: ffffffff2076f9c0
> [ 4416.913729] x19: ffffffff2076f9c0 x18: ffffff8a32380c30
> [ 4416.913731] x17: ffffffc01f966d97 x16: 0000000000000298
> [ 4416.913732] x15: 0000000000000000 x14: 0000000000000000
> [ 4416.913733] x13: f074faec89ffffff x12: 0000000000000000
> [ 4416.913734] x11: 0000000000001000 x10: 0000000000001000
> [ 4416.929176] x9 : ffffffff20d1f5c7 x8 : 0000000000000000
> [ 4416.929178] x7 : 626d7464ff286b6b x6 : ffffffc019533ade
> [ 4416.929179] x5 : 000000008049000e x4 : ffffffff2793e9e0
> [ 4416.929180] x3 : 000000008049000e x2 : ffffff89ecfa74d0
> [ 4416.929181] x1 : 0000000000000c40 x0 : ffffffff2076f9c0
> [ 4416.929184] Call trace:
> [ 4416.929187]  fsverity_verify_page+0x20/0x78
> [ 4416.929189]  f2fs_verify_bio+0x11c/0x29c
> [ 4416.929192]  f2fs_verity_work+0x58/0x84
> [ 4417.050667]  process_one_work+0x270/0x47c
> [ 4417.055354]  worker_thread+0x27c/0x4d8
> [ 4417.059784]  kthread+0x13c/0x320
> [ 4417.063693]  ret_from_fork+0x10/0x18
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
> v3: back to v1 and enabled verity in a unit of cluster
> v2: merged verity_pages with pending_pages, and increased the
>     pending_pages count only if STEP_VERITY is set on bio

I am trying to review this but it is very hard, as the f2fs compression code is
very hard to understand.

It looks like a 'struct decompress_io_ctx' represents the work to decompress a
particular cluster.  Since the compressed data of the cluster can be read using
multiple bios, there is a reference count of how many pages are remaining to be
read before all the cluster's pages have been read and decompression can start.

What I don't understand is why that reference counting needs to work differently
depending on whether verity is enabled or not.  Shouldn't it be exactly the
same?

There also seems to be some confusion about the scope of STEP_VERITY.  Before
f2fs compression was added, it was a per-bio thing.  But now in a compressed
file, it's really a per-cluster thing, since all decompressed pages in a
compressed cluster are verified (or not verified) at once.

Wouldn't it make a lot more sense to, when a cluster needs both compression and
verity, *not* set STEP_VERITY on the bios, but rather set a similar flag in the
decompress_io_ctx?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
