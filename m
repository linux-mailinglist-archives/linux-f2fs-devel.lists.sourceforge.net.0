Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA1A289485
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Oct 2020 21:54:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQyT0-0002Ag-Hi; Fri, 09 Oct 2020 19:54:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>)
 id 1kQySy-0002AD-HX; Fri, 09 Oct 2020 19:54:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cds4+JszdD6fKEWddCf/cFxVEOgX+d1DlbrAjq4X3vE=; b=kXUkE3SI84Rw4WfD5DrLKvLAMI
 im/6OCrggDgkvgZbBo/LrMHisgOQGHYTqR/f83fHEHSXkELZCuc1W+aGqkOasm9ptOO6mwru2D1ZF
 4NvlBypyiJ32gOm1JwJBSiWhEzSRiuVWeIXDfrwSeZkJUpj0Z70tOToNnSkjN1YtJVX4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cds4+JszdD6fKEWddCf/cFxVEOgX+d1DlbrAjq4X3vE=; b=H6B1XIMFQjzrvv95D/ajivs7nz
 ijC/Vgc0MNzHkun6E9pWL+tiSVyRW+cPPL3y8E9gR2ZNVhv8TwWobEusU4/z11Sm51zqq6Uap2EIJ
 sLeZ4GbiZsWlkF/w3cHuCVjXI9MW8SfkKkKZQ+Kn5Ta9NACj31yWhboQO/tBbZGTD5BE=;
Received: from mga04.intel.com ([192.55.52.120])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQySw-004abB-9d; Fri, 09 Oct 2020 19:54:12 +0000
IronPort-SDR: ekdguEddnGkqTPTYfUBlaWeco5UyZUoisKcSwYchwOf042tTiHCX2xmQxsMFJajlWRc5AAsHlo
 gZMKq2vJnHIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="162893720"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="162893720"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:54:04 -0700
IronPort-SDR: NEiErKYZfPZGqrWyxIZ0z43ef9+IKjrcXd9NJIRckxXQwdDEMd5poh/dknsqhifod6Ym/UoaZd
 Mu4h9c7DJvbA==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="462301216"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:54:03 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:50:31 -0700
Message-Id: <20201009195033.3208459-57-ira.weiny@intel.com>
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
X-Headers-End: 1kQySw-004abB-9d
Subject: [f2fs-dev] [PATCH RFC PKS/PMEM 56/58] dax: Stray access protection
 for dax_direct_access()
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

dax_direct_access() is a special case of accessing pmem via a page
offset and without a struct page.

Because the dax driver is well aware of the special protections it has
mapped memory with, call dev_access_[en|dis]able() directly instead of
the unnecessary overhead of trying to get a page to kmap.

Similar to kmap, we leverage existing functions, dax_read_[un]lock(),
because they are already required to surround the use of the memory
returned from dax_direct_access().

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/dax/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dax/super.c b/drivers/dax/super.c
index e84070b55463..0ddb3ee73e36 100644
--- a/drivers/dax/super.c
+++ b/drivers/dax/super.c
@@ -30,6 +30,7 @@ static DEFINE_SPINLOCK(dax_host_lock);
 
 int dax_read_lock(void)
 {
+	dev_access_enable(false);
 	return srcu_read_lock(&dax_srcu);
 }
 EXPORT_SYMBOL_GPL(dax_read_lock);
@@ -37,6 +38,7 @@ EXPORT_SYMBOL_GPL(dax_read_lock);
 void dax_read_unlock(int id)
 {
 	srcu_read_unlock(&dax_srcu, id);
+	dev_access_disable(false);
 }
 EXPORT_SYMBOL_GPL(dax_read_unlock);
 
-- 
2.28.0.rc0.12.gb6a658bd00c9



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
