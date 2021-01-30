Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB2E3091C0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 Jan 2021 04:57:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l5hO4-0003KX-68; Sat, 30 Jan 2021 03:57:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1l5hO3-0003KR-Oa
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Jan 2021 03:57:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DenP85I1Njjb0sm/Pv5awH6u78JiwmjeMN74Dl7XDmA=; b=mdF7og4mgblGRylmCO0fupqgZC
 EbkCBiehINk4iqohmP+sB3PPZI8JTPyv6nkdabxCk674I9ousqD+dHJXPp+0pZaUbHQFUUe6ioMhu
 KYFH+Ia/wNyBJKuaM8H+wb16vn6PHIoY6ye1/oIwaanFLQ8LRd1/zidnO9PMJKQ4iHAM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DenP85I1Njjb0sm/Pv5awH6u78JiwmjeMN74Dl7XDmA=; b=eDWvsCD8Tg2ZtZBybdpnxl2yPa
 UUu3tKA7oxVr0BTRcFJwFufZmJKPz9amP7OHTUnY8sJ84LymKjO0Gnkj0NjSxlFPb9B4NlUMq9cwb
 LsLttdBhPcMY5a7SH4Nke46Fi7HuB+NhcWiMXddzF9DRUvmPEK07FKjlt0nj4sjzbIIs=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1l5hNo-00015E-He
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Jan 2021 03:57:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=DenP85I1Njjb0sm/Pv5awH6u78JiwmjeMN74Dl7XDmA=; b=H8SDl3brId4iyEQMOwW4BfEUQ2
 Xy9mZcqFmFvcWvR6dxLgQ3QUwF+RwC9GNnBM28jr+2J7JQ5Bm8pWtzkJy9Bu5683unOHOgLMv+gFM
 jYIfOM6Ao2NNEjEzqoWU83ro0i2k1QtT++2jpOr8mpPL1+MxGJTvy2GRgyUg+z6xssmGMSAnWY2zd
 lqlVaZEtkQfNNrYTdAkx5Dh4tKL60XSKbWMPsTXg7ShS8Q1MALyQ1L4XvADIPpEa3DQT7A35auYCK
 RYKeUzMDMR7ROqaOWCMHMSpzECR3dkUR8mtXMmO0lgMzXZcgza2tXYiFwaZvQ9UvVr3UoISIOLjsY
 syMo01WQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l5hNO-00Afhm-T1; Sat, 30 Jan 2021 03:56:47 +0000
Date: Sat, 30 Jan 2021 03:56:46 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210130035646.GH308988@casper.infradead.org>
References: <20210126145247.1964410-1-hch@lst.de>
 <20210126145247.1964410-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126145247.1964410-5-hch@lst.de>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l5hNo-00015E-He
Subject: Re: [f2fs-dev] [PATCH 04/17] block: split bio_kmalloc from
 bio_alloc_bioset
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
Cc: Mike Snitzer <snitzer@redhat.com>, Song Liu <song@kernel.org>,
 dm-devel@redhat.com, drbd-dev@lists.linbit.com,
 Naohiro Aota <naohiro.aota@wdc.com>, linux-nilfs@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 Philipp Reisner <philipp.reisner@linbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Lars Ellenberg <lars.ellenberg@linbit.com>, linux-nfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jan 26, 2021 at 03:52:34PM +0100, Christoph Hellwig wrote:
> bio_kmalloc shares almost no logic with the bio_set based fast path
> in bio_alloc_bioset.  Split it into an entirely separate implementation.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/bio.c         | 167 ++++++++++++++++++++++----------------------
>  include/linux/bio.h |   6 +-
>  2 files changed, 86 insertions(+), 87 deletions(-)

This patch causes current linux-next to OOM for me when running xfstests
after about ten minutes.  Haven't looked into why yet, this is just the
results of a git bisect.

The qemu command line is:

qemu-system-x86_64 -nodefaults -nographic -cpu host -machine accel=kvm,nvdimm -m 2G,slots=8,maxmem=1T -smp 6 -kernel /home/willy/kernel/folio/.build_test_kernel-x86_64/kpgk/vmlinuz -append console=hvc0 root=/dev/sda rw log_buf_len=8M ktest.dir=/home/willy/kernel/ktest ktest.env=/tmp/build-test-kernel-nJO6QgxOmo/env quiet systemd.show_status=0 systemd.log-target=journal crashkernel=128M no_console_suspend -device virtio-serial -chardev stdio,id=console -device virtconsole,chardev=console -serial unix:/tmp/build-test-kernel-nJO6QgxOmo/vm-kgdb,server,nowait -monitor unix:/tmp/build-test-kernel-nJO6QgxOmo/vm-mon,server,nowait -gdb unix:/tmp/build-test-kernel-nJO6QgxOmo/vm-gdb,server,nowait -device virtio-rng-pci -virtfs local,path=/,mount_tag=host,security_model=none -device virtio-scsi-pci,id=hba -nic user,model=virtio,hostfwd=tcp:127.0.0.1:24674-:22 -drive if=none,format=raw,id=disk0,file=/var/lib/ktest/root.amd64,snapshot=on -device scsi-hd,bus=hba.0,drive=disk0 -drive if=none,format=raw,id=disk1,file=/tmp/build-test-kernel-nJO6QgxOmo/dev-1,cache=unsafe -device scsi-hd,bus=hba.0,drive=disk1 -drive if=none,format=raw,id=disk2,file=/tmp/build-test-kernel-nJO6QgxOmo/dev-2,cache=unsafe -device scsi-hd,bus=hba.0,drive=disk2 -drive if=none,format=raw,id=disk3,file=/tmp/build-test-kernel-nJO6QgxOmo/dev-3,cache=unsafe -device scsi-hd,bus=hba.0,drive=disk3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
