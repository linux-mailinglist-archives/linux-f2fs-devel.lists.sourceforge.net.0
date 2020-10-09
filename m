Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6BF28946C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Oct 2020 21:54:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQySu-00029B-36; Fri, 09 Oct 2020 19:54:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>)
 id 1kQySs-00028q-EH; Fri, 09 Oct 2020 19:54:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VmM4ECMBjF/f2pgpMktcDCFTZPlpXgytzdnlHY6G42g=; b=H43TyDsNKs5rgYaKXo9d6A9JVh
 59W9CdpM5N7jZ6gJSoG5x5DeoL/Y9UeIeVlv5gMDJ0SolWPxUCY0NyCo6/RYhcv87lA2fd+KucqxD
 b1KL8OvZIK1dOmWTTZ2jV51f2/p2QN2CgRDhFaG3uV3O5TWzIi+wPLlpduryqcgLsNr8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VmM4ECMBjF/f2pgpMktcDCFTZPlpXgytzdnlHY6G42g=; b=dtmIMlfhN0mAdwyMrgep955XJc
 S8eLXp+iashKUN2//p/HaQ+a7KSmJjCci8sBH0qPszrYPj4E/xlB+9p8x8PLGrdfNt5n2iwYn1gMj
 CrgFHAD8oC3dw6hAHvFUSbMqxm5y51CLm8ED+s6kYByjSLQq5RIaOhLPQU+3eegOVEE4=;
Received: from mga01.intel.com ([192.55.52.88])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQySd-008s2j-Tu; Fri, 09 Oct 2020 19:54:06 +0000
IronPort-SDR: +IVFt7BdyqOssbCfR8Q4YUf8sDAYlsnJI/UvYsM4E0MQHs394ecNIUuxJ5CioHiscQbr0OcUAY
 V4Md8oP7UaYw==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="182976509"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="182976509"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:51 -0700
IronPort-SDR: V1KD7wTraPak1zxWaGCn8NDyAgfcS4zsKsBv4Z0vY7HUn25qjJm9u99gQjtiJGVT+R+oXmWyM0
 H2mADCd5/x5Q==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="462301148"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:50 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:50:27 -0700
Message-Id: <20201009195033.3208459-53-ira.weiny@intel.com>
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
 for more information. [URIs: intel.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [192.55.52.88 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kQySd-008s2j-Tu
Subject: [f2fs-dev] [PATCH RFC PKS/PMEM 52/58] mm: Utilize new kmap_thread()
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
 linux-bcache@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
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

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 mm/memory.c      | 8 ++++----
 mm/swapfile.c    | 4 ++--
 mm/userfaultfd.c | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index fcfc4ca36eba..75a054882d7a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4945,7 +4945,7 @@ int __access_remote_vm(struct task_struct *tsk, struct mm_struct *mm,
 			if (bytes > PAGE_SIZE-offset)
 				bytes = PAGE_SIZE-offset;
 
-			maddr = kmap(page);
+			maddr = kmap_thread(page);
 			if (write) {
 				copy_to_user_page(vma, page, addr,
 						  maddr + offset, buf, bytes);
@@ -4954,7 +4954,7 @@ int __access_remote_vm(struct task_struct *tsk, struct mm_struct *mm,
 				copy_from_user_page(vma, page, addr,
 						    buf, maddr + offset, bytes);
 			}
-			kunmap(page);
+			kunmap_thread(page);
 			put_page(page);
 		}
 		len -= bytes;
@@ -5216,14 +5216,14 @@ long copy_huge_page_from_user(struct page *dst_page,
 
 	for (i = 0; i < pages_per_huge_page; i++) {
 		if (allow_pagefault)
-			page_kaddr = kmap(dst_page + i);
+			page_kaddr = kmap_thread(dst_page + i);
 		else
 			page_kaddr = kmap_atomic(dst_page + i);
 		rc = copy_from_user(page_kaddr,
 				(const void __user *)(src + i * PAGE_SIZE),
 				PAGE_SIZE);
 		if (allow_pagefault)
-			kunmap(dst_page + i);
+			kunmap_thread(dst_page + i);
 		else
 			kunmap_atomic(page_kaddr);
 
diff --git a/mm/swapfile.c b/mm/swapfile.c
index debc94155f74..e3296ff95648 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3219,7 +3219,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 		error = PTR_ERR(page);
 		goto bad_swap_unlock_inode;
 	}
-	swap_header = kmap(page);
+	swap_header = kmap_thread(page);
 
 	maxpages = read_swap_header(p, swap_header, inode);
 	if (unlikely(!maxpages)) {
@@ -3395,7 +3395,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 		filp_close(swap_file, NULL);
 out:
 	if (page && !IS_ERR(page)) {
-		kunmap(page);
+		kunmap_thread(page);
 		put_page(page);
 	}
 	if (name)
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 9a3d451402d7..4d38c881bb2d 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -586,11 +586,11 @@ static __always_inline ssize_t __mcopy_atomic(struct mm_struct *dst_mm,
 			mmap_read_unlock(dst_mm);
 			BUG_ON(!page);
 
-			page_kaddr = kmap(page);
+			page_kaddr = kmap_thread(page);
 			err = copy_from_user(page_kaddr,
 					     (const void __user *) src_addr,
 					     PAGE_SIZE);
-			kunmap(page);
+			kunmap_thread(page);
 			if (unlikely(err)) {
 				err = -EFAULT;
 				goto out;
-- 
2.28.0.rc0.12.gb6a658bd00c9



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
