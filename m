Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F61A949E94
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Aug 2024 05:46:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sbXdH-0006tm-LK;
	Wed, 07 Aug 2024 03:46:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1sbXdG-0006tR-57;
 Wed, 07 Aug 2024 03:46:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jy5sBXXGr2voNP18guOdqKk17MKFMl8ptCuzk1nlp0Q=; b=N1SW6z63RenxgiO8rEsxLhDf33
 TfFtF4OeT3TgDEZez0f4Xk0oe+gcMkEZu1DJSrDL5ufZnzK8dkwFzclVmK3BlPWlXdsTUzBIij4yK
 2+2zOYnLubFQQAk093pqSAUJn4AGmQB280rgkWtMNAMaOZSPSlWcCBc3kAW9BSgANafk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jy5sBXXGr2voNP18guOdqKk17MKFMl8ptCuzk1nlp0Q=; b=aOLsL2s4SFHkxoine04O2BVo/r
 PiUjjKiOkPtwPcDcOJ5XNSGJs4LmHsdTvmNrXKb1BrSVKG+FHG4B73ZXIcOita5EN4+oQzyA6VUoD
 uHQO7qvNv4RcZYKeOaXMurnAGFB4zjOqhQIP7vuvv+NSmsLqUWV8u4GLFtWhZuNy7z8w=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sbXdF-00039d-Aq; Wed, 07 Aug 2024 03:46:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Jy5sBXXGr2voNP18guOdqKk17MKFMl8ptCuzk1nlp0Q=; b=kBpsMhbZ+1Pgy99WHBD3YzI4XG
 Hqy0KiWbREOfNTGd4D85Ztw2vyfymYiId0v/fTjNdlVAQK/i5x/NoKEy/QsyytCQ29qGuUAPcq9Qm
 vjWq9+4BtI6nienJ8u7m7JMTT8t8SpdKlmHFaOFuyV61i2voDWVr/HNRi6uBFNEFEKkv5wF5jsRT4
 QsFXi0/Oqo98Wx1ic4RCpOZYs5IrLeuD9EiwRoO7eiq16UpiiqcAEe8uXB9oQygLNDqEwGOxHUSal
 larh/IiUtXsxc/JN3FDf2sNmqYdwc6o9DNqJ+ZGljoforqQ0namjXayDrOo23zksSQNAh0C4Om5cd
 UgGbrBrg==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sbXct-00000006gRT-3Off;
 Wed, 07 Aug 2024 03:46:16 +0000
Date: Wed, 7 Aug 2024 04:46:15 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <oliver.sang@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Christian Brauner <brauner@kernel.org>
Message-ID: <ZrLuBz1eBdgFzIyC@casper.infradead.org>
References: <202408062249.2194d51b-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202408062249.2194d51b-lkp@intel.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Aug 06, 2024 at 10:26:17PM +0800, kernel test robot
 wrote: > kernel test robot noticed "kernel_BUG_at_include/linux/page-flags.h"
 on: > > commit: cdc4ad36a871b7ac43fcc6b2891058d332ce60ce ("fs: [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sbXdF-00039d-Aq
Subject: Re: [f2fs-dev] [linux-next:master] [fs] cdc4ad36a8:
 kernel_BUG_at_include/linux/page-flags.h
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
Cc: jfs-discussion@lists.sourceforge.net,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-mtd@lists.infradead.org, linux-nilfs@vger.kernel.org, lkp@intel.com,
 linux-bcachefs@vger.kernel.org, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-um@lists.infradead.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, oe-lkp@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-karma-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Aug 06, 2024 at 10:26:17PM +0800, kernel test robot wrote:
> kernel test robot noticed "kernel_BUG_at_include/linux/page-flags.h" on:
> 
> commit: cdc4ad36a871b7ac43fcc6b2891058d332ce60ce ("fs: Convert aops->write_begin to take a folio")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> [test failed on linux-next/master 1e391b34f6aa043c7afa40a2103163a0ef06d179]
> 
> in testcase: boot

This patch should fix it.

Christian, can you squash the fix in?


diff --git a/mm/shmem.c b/mm/shmem.c
index 7d28304aea0f..66ff87417090 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2904,7 +2904,8 @@ shmem_write_begin(struct file *file, struct address_space *mapping,
 	if (ret)
 		return ret;
 
-	if (folio_test_has_hwpoisoned(folio)) {
+	if (folio_test_hwpoison(folio) ||
+	    (folio_test_large(folio) && folio_test_has_hwpoisoned(folio))) {
 		folio_unlock(folio);
 		folio_put(folio);
 		return -EIO;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
