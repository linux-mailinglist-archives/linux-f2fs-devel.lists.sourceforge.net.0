Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 376AD28930C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Oct 2020 21:52:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQyR0-0001Na-0k; Fri, 09 Oct 2020 19:52:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>)
 id 1kQyQy-0001N3-DI; Fri, 09 Oct 2020 19:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xRvGR0eBD0WcAnlMGNwryqwVocpCArAK6mw1NefMA5k=; b=GI5Pv8ZYsZS+/IMmo1vppFRE1j
 8r3ukHsaNcoZ8E2qFwJE3oIRvymHXkCuxjLmJfuC4IahlQmaCdadlLZOuuoqhiuzIDUWqqyNUQv1q
 6q86AcpNCcjrZHzN8MdsfXQoT8wSz2ZmvbytqyCMEjqRhGxZfEFhoaQUfZ3drYxcRF6A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xRvGR0eBD0WcAnlMGNwryqwVocpCArAK6mw1NefMA5k=; b=GVwjM+dQqJYvYUHQfVl9rwxt17
 REsg0O1cALb1wDxsjGbUI5ZmW/TuukuXbheDCqaUiF9w+yUqLf7MIy8pVeqD3qPWwrmFG7UqKQTWJ
 l6p0UVCUR4gUW1dEhs8EAn8wmqA51R06XQM2OO+Te6SZNXIqtivHT0KPfCkxXzcQw+Xk=;
Received: from mga14.intel.com ([192.55.52.115])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQyQs-004aLw-50; Fri, 09 Oct 2020 19:52:08 +0000
IronPort-SDR: jJZLjaOdp2tWrSgg4XdZObk5Xy1ujOaPI1pPphgKqUcUN/YPj1jXPl+NdLQO44YnqC7j1vNiXr
 fxMOPGg9MHhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="164743844"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="164743844"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:52:01 -0700
IronPort-SDR: tVhE30/49ehqkoc80ZCcDXB4dMTZze5YTnWPIjaBRWP4P6o/AEUDuRNENWQluyt3yOqCx99fob
 q9C+vTCoMURQ==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="519846944"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:52:01 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:49:56 -0700
Message-Id: <20201009195033.3208459-22-ira.weiny@intel.com>
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
X-Headers-End: 1kQyQs-004aLw-50
Subject: [f2fs-dev] [PATCH RFC PKS/PMEM 21/58] fs/nfs: Utilize new
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
 ceph-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, io-uring@vger.kernel.org,
 cluster-devel@redhat.com, linux-cachefs@redhat.com,
 intel-wired-lan@lists.osuosl.org, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 linux-afs@lists.infradead.org, linux-um@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Ira Weiny <ira.weiny@intel.com>

The kmap() calls in this FS are localized to a single thread.  To avoid
the over head of global PKRS updates use the new kmap_thread() call.

Cc: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: Anna Schumaker <anna.schumaker@netapp.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/nfs/dir.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index cb52db9a0cfb..fee321acccb4 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -213,7 +213,7 @@ int nfs_readdir_make_qstr(struct qstr *string, const char *name, unsigned int le
 static
 int nfs_readdir_add_to_array(struct nfs_entry *entry, struct page *page)
 {
-	struct nfs_cache_array *array = kmap(page);
+	struct nfs_cache_array *array = kmap_thread(page);
 	struct nfs_cache_array_entry *cache_entry;
 	int ret;
 
@@ -235,7 +235,7 @@ int nfs_readdir_add_to_array(struct nfs_entry *entry, struct page *page)
 	if (entry->eof != 0)
 		array->eof_index = array->size;
 out:
-	kunmap(page);
+	kunmap_thread(page);
 	return ret;
 }
 
@@ -347,7 +347,7 @@ int nfs_readdir_search_array(nfs_readdir_descriptor_t *desc)
 	struct nfs_cache_array *array;
 	int status;
 
-	array = kmap(desc->page);
+	array = kmap_thread(desc->page);
 
 	if (*desc->dir_cookie == 0)
 		status = nfs_readdir_search_for_pos(array, desc);
@@ -359,7 +359,7 @@ int nfs_readdir_search_array(nfs_readdir_descriptor_t *desc)
 		desc->current_index += array->size;
 		desc->page_index++;
 	}
-	kunmap(desc->page);
+	kunmap_thread(desc->page);
 	return status;
 }
 
@@ -602,10 +602,10 @@ int nfs_readdir_page_filler(nfs_readdir_descriptor_t *desc, struct nfs_entry *en
 
 out_nopages:
 	if (count == 0 || (status == -EBADCOOKIE && entry->eof != 0)) {
-		array = kmap(page);
+		array = kmap_thread(page);
 		array->eof_index = array->size;
 		status = 0;
-		kunmap(page);
+		kunmap_thread(page);
 	}
 
 	put_page(scratch);
@@ -669,7 +669,7 @@ int nfs_readdir_xdr_to_array(nfs_readdir_descriptor_t *desc, struct page *page,
 		goto out;
 	}
 
-	array = kmap(page);
+	array = kmap_thread(page);
 
 	status = nfs_readdir_alloc_pages(pages, array_size);
 	if (status < 0)
@@ -691,7 +691,7 @@ int nfs_readdir_xdr_to_array(nfs_readdir_descriptor_t *desc, struct page *page,
 
 	nfs_readdir_free_pages(pages, array_size);
 out_release_array:
-	kunmap(page);
+	kunmap_thread(page);
 	nfs4_label_free(entry.label);
 out:
 	nfs_free_fattr(entry.fattr);
@@ -803,7 +803,7 @@ int nfs_do_filldir(nfs_readdir_descriptor_t *desc)
 	struct nfs_cache_array *array = NULL;
 	struct nfs_open_dir_context *ctx = file->private_data;
 
-	array = kmap(desc->page);
+	array = kmap_thread(desc->page);
 	for (i = desc->cache_entry_index; i < array->size; i++) {
 		struct nfs_cache_array_entry *ent;
 
@@ -827,7 +827,7 @@ int nfs_do_filldir(nfs_readdir_descriptor_t *desc)
 	if (array->eof_index >= 0)
 		desc->eof = true;
 
-	kunmap(desc->page);
+	kunmap_thread(desc->page);
 	dfprintk(DIRCACHE, "NFS: nfs_do_filldir() filling ended @ cookie %Lu; returning = %d\n",
 			(unsigned long long)*desc->dir_cookie, res);
 	return res;
-- 
2.28.0.rc0.12.gb6a658bd00c9



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
