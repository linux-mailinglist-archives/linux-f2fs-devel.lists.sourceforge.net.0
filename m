Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 866BBB2458E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Aug 2025 11:38:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Cc:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:
	Message-Id:Date:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jtjvm/RtQKItTsBXF2ZMsWqZoy1J+kf1tKr5Ne4ymbY=; b=Eq/x27c3tq21s5pcYBndpW1ItJ
	0T7+ChAgVkZi3XRcsT5Ype0r61nGRIqfWydh4b8sUwySsczpdRuP6N8qJQfgkEG8YDygmv+T8MjYt
	j89rGGUwwD5WsXgX6jS+lYppRGddF7OdDV6l5y8SzowNCy8BIRc0pYFfWcqGJtU0mHQI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1um7wV-00044z-D2;
	Wed, 13 Aug 2025 09:38:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1um7wU-00044o-E7
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Aug 2025 09:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QwdKSo3YK0esWLMX0A++CG41fz927dLcjOBFe+UWw9c=; b=HfD5zW0HXqEL+zd2QK/RCMoqNG
 kZnmEWXi0RjvMvbztf8C9HXWZbrB4MZeRa31dWHpab5YpbwCvIaQKMIgqpFwsiQ5RwCJuFaDy3KBJ
 8GZ530PdgcwAUm3AwhUXnUCkRxjM37UWDKqYQlZqnYZx5qHtETpm5vLNfTTBFu4u+LjI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QwdKSo3YK0esWLMX0A++CG41fz927dLcjOBFe+UWw9c=; b=U
 kqQh0vGHcIwnj/uoEB+xseSD+0ATYaq/GNvRtirjkB0C8xfhkm5gXk/MREpzZwpPm75Djz831ctFU
 364nKjDGDyqn0uXZlnl84+k6ZejgfVOiqYv/zMm3oLBWFfM2wbbK6AGVFsxOmXsD7DHotnmUyzwbU
 JexBvJ1yWYzsDfcA=;
Received: from m16.mail.126.com ([220.197.31.7])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1um7wT-0004Ue-Uz for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Aug 2025 09:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
 Content-Type; bh=QwdKSo3YK0esWLMX0A++CG41fz927dLcjOBFe+UWw9c=;
 b=DNAea/8TLFIG7NkeiHI0hALSRJueZrU9EacU2792bTf+OJeaMGWVYB6QcGdUxN
 vEXrafT8qzHemdxhe++0VoPP/cohWwC1PHORVy7gehZieGRI4PhiMR50mzhGnkK9
 3IVKym73xPF9qJese67gBI5qsCwFCAHDHfqw2zLGdK03M=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wD3tyv8XJxo_MzyBQ--.54250S2; 
 Wed, 13 Aug 2025 17:38:16 +0800 (CST)
From: Nanzhe Zhao <nzzhao@126.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org
Date: Wed, 13 Aug 2025 17:37:46 +0800
Message-Id: <20250813093755.47599-1-nzzhao@126.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wD3tyv8XJxo_MzyBQ--.54250S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUO6pPDUUUU
X-Originating-IP: [58.240.165.118]
X-CM-SenderInfo: xq22xtbr6rjloofrz/1tbiFg+oz2icTc3h1wAAs8
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Resend: original patch was misspelling the
 linux-f2fs-devel@lists.sourceforge.net
 address. No code changes. This RFC series enable buffered read/write paths
 large folio support with F2FS-specific extended iomap, combined with some
 other preparation work for large folio integration. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [220.197.31.7 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1um7wT-0004Ue-Uz
Subject: [f2fs-dev] [RESEND RFC PATCH 0/9] f2fs: Enable buffered read/write
 large folios support with extended iomap
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
Cc: Nanzhe Zhao <nzzhao@126.com>, Barry Song <21cnbao@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Yi Zhang <yi.zhang@huawei.com>
Content-Type: multipart/mixed; boundary="===============1352238858601975141=="
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

--===============1352238858601975141==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Resend: original patch was misspelling
the linux-f2fs-devel@lists.sourceforge.net address.
No code changes.

This RFC series enable buffered read/write paths large folio support
with F2FS-specific extended iomap, combined with some other preparation
work for large folio integration.

Because this is my first time to send a patch series to the kernel
mailing list,
I might have missed some conventions.
The patch passes checkpatch.pl with no errors,
but a few warnings remain.
I wasn't sure about the best way to address them,
so I would appreciate your guidance.
I am happy to fix them if needed.

Motivations:

* **Why iomap**:
  * F2FS couples pages directly to BIOs without a per-block tracking
    struct like buffer-head or sub-page.
    A naive large-folio port would cause:
    * Write-amplification.
    * Premature folio_end_read() / folio_end_writeback()
      when multi sub-ranges of a large folio are in io concurrently.
    Above issues has already been handled cleanly by iomap_folio_state.

  * Original buffered write path unlocks a folio halfway,causes status
    recheck for large folios carried with iomap_folio_state
    or partially trucnated folio tricky.iomap handles all locking
    unlocking operations automatically.

* **Why extends iomap**
  * F2FS stores its flags in the folio's private field,
    which conflicts with iomap_folio_state.
  * To resolve this, we designed f2fs_iomap_folio_state,
    compatible with iomap_folio_state's layout while extending
    its flexible state array for F2FS private flags.
  * We store a magic number in read_bytes_pending to distinguish
    whether a folio uses the original or F2FS's iomap_folio_state.
    It's chosen because it remains 0 after readahead completes.

Implementation notes:

* New Kconfig: `CONFIG_F2FS_IOMAP_FOLIO_STATE`; when off,falls back
  to the legacy buffered io path.

Limitations

* Don't support BLOCK_SIZE > PAGE_SIZE now.
* Don't support large folios for encrypted and fsverity files.
* Page writeback and compressed files large folios support is still WIP.

Why RFC:

* Need review and potential improvement on
 `f2fs_iomap_folio_state` design and implementation.
* Limited test coverage so far.Any extra testing is highly appreciated.
* Two runtime issues remain (see below).

Performance Testing:

* Platform: x86-64 laptop (PCIe 4.0 NVMe) -> qemu-arm64 VM, 4 GiB RAM
* Kernel: gcc-13.2, defconfig + `CONFIG_F2FS_IOMAP_FOLIO_STATE=y`
fio 3.35, `ioengine=psync`, `size=1G`, `numjobs=1`

Read throughput (MiB/s):

--- Kernel: iomap_v1 file type: normal ---
Block Size (bs)      | Avg. Bandwidth (MiB/s)       | Avg. IOPS
---------------------+------------------------------+-----------------
100M                 | 2809.60                      | 27.50
10M                  | 3184.60                      | 317.90
128k                 | 1376.20                      | 11000.80
1G                   | 1954.70                      | 1.20
1M                   | 2717.00                      | 2716.70
4k                   | 616.50                       | 157800.00

--- Kernel: vanilla  file type: normal ---
Block Size (bs)      | Avg. Bandwidth (MiB/s)       | Avg. IOPS
---------------------+------------------------------+-----------------
100M                 | 994.60                       | 9.60
10M                  | 986.50                       | 98.10
128k                 | 693.80                       | 5550.90
1G                   | 816.90                       | 0.00
1M                   | 968.90                       | 968.40
4k                   | 429.80                       | 109990.00
--- Kernel: iomap_v1 file type: hole ---
Block Size (bs)      | Avg. Bandwidth (MiB/s)       | Avg. IOPS
---------------------+------------------------------+-----------------
100M                 | 1825.60                      | 17.70
10M                  | 1989.24                      | 198.42
1G                   | 1312.80                      | 0.90
1M                   | 2326.02                      | 2325.42
4k                   | 799.40                       | 204700.00

--- Kernel: vanilla file type: hole ---
Block Size (bs)      | Avg. Bandwidth (MiB/s)       | Avg. IOPS
---------------------+------------------------------+-----------------
100M                 | 708.90                       | 6.50
10M                  | 735.00                       | 73.10
128k                 | 786.70                       | 6292.20
1G                   | 613.20                       | 0.00
1M                   | 764.50                       | 764.25
4k                   | 478.80                       | 122400.00

Sparse-file numbers on qemu look skewed; further bare-metal tests planned.

Write benchmarks are currently blocked by the issues below.

Known issues (help appreciated)

**Write throttling stalls**
  ```sh
  dd if=/dev/zero of=test.img bs=1G count=1 conv=fsync
  ```
  Write speed decays; task spins in `iomap_write_iter`
  ->`balance_dirty_pages_ratelimited_flags`.

**fsync dead-lock**
  ```sh
  fio --rw=write --bs=4K --fsync=1 --size=1G --ioengine=psync …
  ```
  Task Hangs in `f2fs_issue_flush`->'submit_bio_wait'

Full traces will be posted in a follow-up.

Nanzhe Zhao (9):
  f2fs: Introduce f2fs_iomap_folio_state
  f2fs: Integrate f2fs_iomap_folio_state into f2fs page private helpers
  f2fs: Using `folio_detach_f2fs_private` in invalidate and release
    folio
  f2fs: Convert outplace write path page private funcions to folio
    private functions.
  f2fs:Refactor `f2fs_is_compressed_page` to `f2fs_is_compressed_folio`
  f2fs: Extend f2fs_io_info to support sub-folio ranges
  f2fs:Make GC aware of large folios
  f2fs: Introduce F2FS_GET_BLOCK_IOMAP and map_blocks he lpers
  f2fs: Enable buffered read/write path large folios support for normal
    and atomic file with iomap

 fs/f2fs/Kconfig    |  10 ++
 fs/f2fs/Makefile   |   1 +
 fs/f2fs/compress.c |  11 +-
 fs/f2fs/data.c     | 389 ++++++++++++++++++++++++++++++++++++------
 fs/f2fs/f2fs.h     | 412 ++++++++++++++++++++++++++++++++++-----------
 fs/f2fs/f2fs_ifs.c | 221 ++++++++++++++++++++++++
 fs/f2fs/f2fs_ifs.h |  79 +++++++++
 fs/f2fs/file.c     |  33 +++-
 fs/f2fs/gc.c       |  37 ++--
 fs/f2fs/inline.c   |  15 +-
 fs/f2fs/inode.c    |  27 +++
 fs/f2fs/namei.c    |   7 +
 fs/f2fs/segment.c  |   2 +-
 fs/f2fs/super.c    |   3 +
 14 files changed, 1082 insertions(+), 165 deletions(-)
 create mode 100644 fs/f2fs/f2fs_ifs.c
 create mode 100644 fs/f2fs/f2fs_ifs.h


base-commit: b45116aef78ff0059abf563b339e62a734487a50
--
2.34.1



--===============1352238858601975141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============1352238858601975141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

--===============1352238858601975141==--
