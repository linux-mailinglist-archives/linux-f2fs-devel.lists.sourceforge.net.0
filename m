Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB192893C7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Oct 2020 21:53:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQyS4-0001f5-KF; Fri, 09 Oct 2020 19:53:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>)
 id 1kQyS2-0001de-67; Fri, 09 Oct 2020 19:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c39ZoYF8cJvmaRq6EtNlpv+U38JK28bYyww8yBaKZ2g=; b=TutZreABGVpmGKKjMU9ypkQJN1
 yF1ernauGdS6ZU0NygRlR3TdRNxwhGIfnc05gAushgQCY/sTasXvKAo/PE6eVRQ35ZHuZ2/DGCxzU
 tpWvPa79MizLqi2iN5MKSmjdfW0xQmZlJfFXDQLyxMQtmBTen2MEbrZrAMGjXGOqFMBU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c39ZoYF8cJvmaRq6EtNlpv+U38JK28bYyww8yBaKZ2g=; b=YyeoN2azpI8P3jiHj4oh/SVWo1
 I/z7UpkhpoW2XGP95DXBKzK4ubl3bV3ozx7k/QFlMA0ermtSbSDK+rb5mLEUyanQnc3cG2fGdMWV6
 54n9q1OPk3LFFKmn0BuLNMkADzobecVFfVThG3hGpp/KuxZKJb7CvsSpzcc/iOz+Dz2c=;
Received: from mga01.intel.com ([192.55.52.88])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQyRw-008rzS-4K; Fri, 09 Oct 2020 19:53:14 +0000
IronPort-SDR: nrTwBYJeZWxSW3dw9FICiviBW/XQOtMPm2t63cecOQ5HkWg2ob5U270mxqAzONSByqPBU+Xrm0
 J6hXBBm+Aveg==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="182976354"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="182976354"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:52:55 -0700
IronPort-SDR: TN82OMSOJnR+1dzdu/wtYu+HarPMiqU5tCJLq9k+HDWuiKzSJliaVoZHfBedXzzykRk72guGi9
 gJFQG6Pg4N1Q==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="529053748"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:52:54 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:50:10 -0700
Message-Id: <20201009195033.3208459-36-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.org.uk]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [192.55.52.88 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kQyRw-008rzS-4K
Subject: [f2fs-dev] [PATCH RFC PKS/PMEM 35/58] fs: Utilize new kmap_thread()
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
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kselftest@vger.kernel.org,
 samba-technical@lists.samba.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, linux-afs@lists.infradead.org,
 cluster-devel@redhat.com, linux-cachefs@redhat.com,
 intel-wired-lan@lists.osuosl.org, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Ira Weiny <ira.weiny@intel.com>

These kmap() calls are localized to a single thread.  To avoid the over
head of global PKRS updates use the new kmap_thread() call.

Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/aio.c              |  4 ++--
 fs/binfmt_elf.c       |  4 ++--
 fs/binfmt_elf_fdpic.c |  4 ++--
 fs/exec.c             | 10 +++++-----
 fs/io_uring.c         |  4 ++--
 fs/splice.c           |  4 ++--
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/fs/aio.c b/fs/aio.c
index d5ec30385566..27f95996d25f 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -1223,10 +1223,10 @@ static long aio_read_events_ring(struct kioctx *ctx,
 		avail = min(avail, nr - ret);
 		avail = min_t(long, avail, AIO_EVENTS_PER_PAGE - pos);
 
-		ev = kmap(page);
+		ev = kmap_thread(page);
 		copy_ret = copy_to_user(event + ret, ev + pos,
 					sizeof(*ev) * avail);
-		kunmap(page);
+		kunmap_thread(page);
 
 		if (unlikely(copy_ret)) {
 			ret = -EFAULT;
diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 13d053982dd7..1a332ef1ae03 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -2430,9 +2430,9 @@ static int elf_core_dump(struct coredump_params *cprm)
 
 			page = get_dump_page(addr);
 			if (page) {
-				void *kaddr = kmap(page);
+				void *kaddr = kmap_thread(page);
 				stop = !dump_emit(cprm, kaddr, PAGE_SIZE);
-				kunmap(page);
+				kunmap_thread(page);
 				put_page(page);
 			} else
 				stop = !dump_skip(cprm, PAGE_SIZE);
diff --git a/fs/binfmt_elf_fdpic.c b/fs/binfmt_elf_fdpic.c
index 50f845702b92..8fbe188e0fdd 100644
--- a/fs/binfmt_elf_fdpic.c
+++ b/fs/binfmt_elf_fdpic.c
@@ -1542,9 +1542,9 @@ static bool elf_fdpic_dump_segments(struct coredump_params *cprm)
 			bool res;
 			struct page *page = get_dump_page(addr);
 			if (page) {
-				void *kaddr = kmap(page);
+				void *kaddr = kmap_thread(page);
 				res = dump_emit(cprm, kaddr, PAGE_SIZE);
-				kunmap(page);
+				kunmap_thread(page);
 				put_page(page);
 			} else {
 				res = dump_skip(cprm, PAGE_SIZE);
diff --git a/fs/exec.c b/fs/exec.c
index a91003e28eaa..3948b8511e3a 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -575,11 +575,11 @@ static int copy_strings(int argc, struct user_arg_ptr argv,
 
 				if (kmapped_page) {
 					flush_kernel_dcache_page(kmapped_page);
-					kunmap(kmapped_page);
+					kunmap_thread(kmapped_page);
 					put_arg_page(kmapped_page);
 				}
 				kmapped_page = page;
-				kaddr = kmap(kmapped_page);
+				kaddr = kmap_thread(kmapped_page);
 				kpos = pos & PAGE_MASK;
 				flush_arg_page(bprm, kpos, kmapped_page);
 			}
@@ -593,7 +593,7 @@ static int copy_strings(int argc, struct user_arg_ptr argv,
 out:
 	if (kmapped_page) {
 		flush_kernel_dcache_page(kmapped_page);
-		kunmap(kmapped_page);
+		kunmap_thread(kmapped_page);
 		put_arg_page(kmapped_page);
 	}
 	return ret;
@@ -871,11 +871,11 @@ int transfer_args_to_stack(struct linux_binprm *bprm,
 
 	for (index = MAX_ARG_PAGES - 1; index >= stop; index--) {
 		unsigned int offset = index == stop ? bprm->p & ~PAGE_MASK : 0;
-		char *src = kmap(bprm->page[index]) + offset;
+		char *src = kmap_thread(bprm->page[index]) + offset;
 		sp -= PAGE_SIZE - offset;
 		if (copy_to_user((void *) sp, src, PAGE_SIZE - offset) != 0)
 			ret = -EFAULT;
-		kunmap(bprm->page[index]);
+		kunmap_thread(bprm->page[index]);
 		if (ret)
 			goto out;
 	}
diff --git a/fs/io_uring.c b/fs/io_uring.c
index aae0ef2ec34d..f59bb079822d 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -2903,7 +2903,7 @@ static ssize_t loop_rw_iter(int rw, struct file *file, struct kiocb *kiocb,
 			iovec = iov_iter_iovec(iter);
 		} else {
 			/* fixed buffers import bvec */
-			iovec.iov_base = kmap(iter->bvec->bv_page)
+			iovec.iov_base = kmap_thread(iter->bvec->bv_page)
 						+ iter->iov_offset;
 			iovec.iov_len = min(iter->count,
 					iter->bvec->bv_len - iter->iov_offset);
@@ -2918,7 +2918,7 @@ static ssize_t loop_rw_iter(int rw, struct file *file, struct kiocb *kiocb,
 		}
 
 		if (iov_iter_is_bvec(iter))
-			kunmap(iter->bvec->bv_page);
+			kunmap_thread(iter->bvec->bv_page);
 
 		if (nr < 0) {
 			if (!ret)
diff --git a/fs/splice.c b/fs/splice.c
index ce75aec52274..190c4d218c30 100644
--- a/fs/splice.c
+++ b/fs/splice.c
@@ -815,9 +815,9 @@ static int write_pipe_buf(struct pipe_inode_info *pipe, struct pipe_buffer *buf,
 	void *data;
 	loff_t tmp = sd->pos;
 
-	data = kmap(buf->page);
+	data = kmap_thread(buf->page);
 	ret = __kernel_write(sd->u.file, data + buf->offset, sd->len, &tmp);
-	kunmap(buf->page);
+	kunmap_thread(buf->page);
 
 	return ret;
 }
-- 
2.28.0.rc0.12.gb6a658bd00c9



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
