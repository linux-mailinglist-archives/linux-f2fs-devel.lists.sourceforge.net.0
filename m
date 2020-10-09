Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA60E28943C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Oct 2020 21:53:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQySd-0006c7-KC; Fri, 09 Oct 2020 19:53:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>)
 id 1kQySY-0006an-TB; Fri, 09 Oct 2020 19:53:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3KEW3zXc5GbTvG5uENTyww8N5+1C4+LT4mZhrk7rL8k=; b=kKWDbOsKxdWOkfjUIwCMT+Yzcy
 cmdDhQoBpqmICoM5cCaUY0D7UeSRBuCi50Dwy66mp7pV3aDcqMkSKYOorel6LHN6bnACUvDD0VdwV
 TRk4PAFGdH4gAWbEVB7eNtBLlG8aXeGlcY1AVElJdHH90hzlo640C0Wcqca41OOti8x4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3KEW3zXc5GbTvG5uENTyww8N5+1C4+LT4mZhrk7rL8k=; b=CkyGqWMxBMAxErBC/S0NV6yAcN
 tlvLNRMkAzCesdi6yB7su3iw3kvGP3UEt4AIdiT4a2tJ8D+iiUQJb0Uuhfphb0MSf+3TzaDKpRKP/
 TcmbTTK0Bnpl7l/BE3DslL8KXns2VldcxG3cQg1MmB2zEvjCoErO+bYMpMbDMs8jtGW8=;
Received: from mga01.intel.com ([192.55.52.88])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQySP-008s2j-OD; Fri, 09 Oct 2020 19:53:46 +0000
IronPort-SDR: sceQ87XxSIAxeA9YBiQSbpvW5cFiyM3APfgS6blv2c9ZAEzfzsAEPnAyH7rqzIa1fFgSztW9J2
 KJwo/bVQ677w==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="182976453"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="182976453"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:28 -0700
IronPort-SDR: BOVOU8SHaQbMr+qBBSrCzuqbJHuQd4ndzwss05aaSC7o5I30ANXdekITPCnqmJ5xtHPcWbAp0e
 1H/r6jgeLwtA==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="298419945"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:28 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:50:20 -0700
Message-Id: <20201009195033.3208459-46-ira.weiny@intel.com>
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [192.55.52.88 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kQySP-008s2j-OD
Subject: [f2fs-dev] [PATCH RFC PKS/PMEM 45/58] drivers/firmware: Utilize new
 kmap_thread()
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
 Ard Biesheuvel <ardb@kernel.org>, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 ceph-devel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-afs@lists.infradead.org, cluster-devel@redhat.com,
 linux-cachefs@redhat.com, intel-wired-lan@lists.osuosl.org,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, linux-um@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, io-uring@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 netdev@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Ira Weiny <ira.weiny@intel.com>

These kmap() calls are localized to a single thread.  To avoid the over
head of global PKRS updates use the new kmap_thread() call.

Cc: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/firmware/efi/capsule-loader.c | 6 +++---
 drivers/firmware/efi/capsule.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/efi/capsule-loader.c b/drivers/firmware/efi/capsule-loader.c
index 4dde8edd53b6..aa2e0b5940fd 100644
--- a/drivers/firmware/efi/capsule-loader.c
+++ b/drivers/firmware/efi/capsule-loader.c
@@ -197,7 +197,7 @@ static ssize_t efi_capsule_write(struct file *file, const char __user *buff,
 		page = cap_info->pages[cap_info->index - 1];
 	}
 
-	kbuff = kmap(page);
+	kbuff = kmap_thread(page);
 	kbuff += PAGE_SIZE - cap_info->page_bytes_remain;
 
 	/* Copy capsule binary data from user space to kernel space buffer */
@@ -217,7 +217,7 @@ static ssize_t efi_capsule_write(struct file *file, const char __user *buff,
 	}
 
 	cap_info->count += write_byte;
-	kunmap(page);
+	kunmap_thread(page);
 
 	/* Submit the full binary to efi_capsule_update() API */
 	if (cap_info->header.headersize > 0 &&
@@ -236,7 +236,7 @@ static ssize_t efi_capsule_write(struct file *file, const char __user *buff,
 	return write_byte;
 
 fail_unmap:
-	kunmap(page);
+	kunmap_thread(page);
 failed:
 	efi_free_all_buff_pages(cap_info);
 	return ret;
diff --git a/drivers/firmware/efi/capsule.c b/drivers/firmware/efi/capsule.c
index 598b7800d14e..edb7797b0e4f 100644
--- a/drivers/firmware/efi/capsule.c
+++ b/drivers/firmware/efi/capsule.c
@@ -244,7 +244,7 @@ int efi_capsule_update(efi_capsule_header_t *capsule, phys_addr_t *pages)
 	for (i = 0; i < sg_count; i++) {
 		efi_capsule_block_desc_t *sglist;
 
-		sglist = kmap(sg_pages[i]);
+		sglist = kmap_thread(sg_pages[i]);
 
 		for (j = 0; j < SGLIST_PER_PAGE && count > 0; j++) {
 			u64 sz = min_t(u64, imagesize,
@@ -265,7 +265,7 @@ int efi_capsule_update(efi_capsule_header_t *capsule, phys_addr_t *pages)
 		else
 			sglist[j].data = page_to_phys(sg_pages[i + 1]);
 
-		kunmap(sg_pages[i]);
+		kunmap_thread(sg_pages[i]);
 	}
 
 	mutex_lock(&capsule_mutex);
-- 
2.28.0.rc0.12.gb6a658bd00c9



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
