Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLq5KnwCxmnQFAUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Mar 2026 05:07:24 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D7233F041
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Mar 2026 05:07:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JLFu4tSkJYvfNvN/3e3eKzl8dYBH15gejByjxbc720=; b=OiCMwOfj+YyUirUzF7NPV7Ylp+
	lSMCjz5FTbFpOFlKajf8qQOX9cVVH/aiZ4JU4cTagyIk5k3Ybt4IZjw1EvID4qcLSZFKyJa9AjDUC
	OMR4BjkUgSfJa/n+rKcUy5MS3xEaTCaPIffCqMVE3Lk+x5e6LmcIqCgiuzRWg3TSqCIg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w5yTV-0003DL-Kj;
	Fri, 27 Mar 2026 04:07:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1w5yTM-0003Cr-8m
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Mar 2026 04:07:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZRzLisarKDgIULE9UN0uFX99eWBEhht2D1M326Yz3Js=; b=WErYTSR3ljajmBY+loDvjT6gKy
 hmaUxmoY6ucHCsM4NXqINdFcTSroTQ+4j7XWhJlsW6xSyVx8rYqI9x65hB5RKh90Ub2RPVGath3mV
 loP2wEerVepiCiJ5v4KHtRhyV1ZnUzJBx9YB80jJRgEeHRs4pVVjqMnxCA83FYTd5XGg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZRzLisarKDgIULE9UN0uFX99eWBEhht2D1M326Yz3Js=; b=D3qAvUx3FfSKkjj7tN78UkS08g
 gsJh/R+TKJ+wFGlO9qcFVk+Htj1xM/ROXFFwprdLUVtgN+LkJvNLkgUXwC/CE8EDrBJpWCpDjQSnC
 cFIDjtUmVJaOAgxxkI0DQmA+P9PjCXZzeXOpyBKMFl2Nzjot2fGjj4/N7qOpES/vfGAw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w5yTL-0001m0-5F for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Mar 2026 04:07:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4A4CF60128;
 Fri, 27 Mar 2026 04:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB3F6C19423;
 Fri, 27 Mar 2026 04:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774584408;
 bh=tIY9vtGvQtrHsVf/k9IQzMmcpXC2pXdd3oxAVOuUFoA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LInRXNJ9EILSWQDe5rdt3ly0emXQMSY0DP2BDrJCNO6sim1C5DiEV/lKpC/9KtwSc
 ws7bwdtHDOug7YHTFrnMvekaUr7i8JFlVs8ctNPxqMYEf87C7DcEJiDXx02wtFqR45
 C/+YCXwO2B6vlY3AyMHrpOu0MSXMF530YnYexAURiCjNGYx/R5xtWz24eYa2aetoI2
 K47UklyzpngfkOcvdTWOZD3Dld8ptjWK7iLGPZHoFC3yUgG/gMP5Sln5dtqQ+9j56L
 54wgG8jKBpeoHRpkSINoG7wwIIAQ3OiYtRHPtlo+ma70vcI0FMu5i/Wn4Clhz0Ga/j
 t/jcV1pWlZZwA==
Date: Thu, 26 Mar 2026 21:06:47 -0700
To: Chao Yu <chao@kernel.org>
Message-ID: <20260327040647.GG6254@frogsfrogsfrogs>
References: <20260323090344.219267-1-chao@kernel.org>
 <7ae25eae-19ce-4290-9156-7fff7c379705@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ae25eae-19ce-4290-9156-7fff7c379705@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Mar 25, 2026 at 02:32:31PM +0800, Chao Yu wrote: >
 +Cc Darrick and fsdevel > > On 3/23/26 17:03, Chao Yu wrote: > > This patch
 supports to report fserror, it provides another way to let > > us [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w5yTL-0001m0-5F
Subject: Re: [f2fs-dev] [PATCH] f2fs: support to report fserror
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>, jaegeuk@kernel.org,
 Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:hch@infradead.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[djwong@kernel.org]
X-Rspamd-Queue-Id: A1D7233F041
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 02:32:31PM +0800, Chao Yu wrote:
> +Cc Darrick and fsdevel
> 
> On 3/23/26 17:03, Chao Yu wrote:
> > This patch supports to report fserror, it provides another way to let
> > userspace to monitor filesystem level error. In addition, it exports
> > /sys/fs/f2fs/features/fserror once f2fs kernel module start to support
> > the new feature, then generic/791 of fstests can notice the feature,
> > and verify validation of fserror report.
> > 
> > Signed-off-by: Chao Yu <chao@kernel.org>
> > ---
> >  Documentation/ABI/testing/sysfs-fs-f2fs |  3 ++-
> >  fs/f2fs/compress.c                      |  2 ++
> >  fs/f2fs/data.c                          | 13 ++++++++++++-
> >  fs/f2fs/dir.c                           |  2 ++
> >  fs/f2fs/inline.c                        |  3 +++
> >  fs/f2fs/inode.c                         |  5 +++++
> >  fs/f2fs/node.c                          |  8 ++++++++
> >  fs/f2fs/recovery.c                      |  2 ++
> >  fs/f2fs/segment.c                       |  2 ++
> >  fs/f2fs/super.c                         | 26 +++++++++++++++++++++++++
> >  fs/f2fs/sysfs.c                         |  2 ++
> >  fs/f2fs/verity.c                        |  2 ++
> >  fs/f2fs/xattr.c                         |  6 ++++++
> >  13 files changed, 74 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> > index 423ec40e2e4e..27d5e88facbe 100644
> > --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> > +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> > @@ -270,7 +270,8 @@ Description:	Shows all enabled kernel features.
> >  		inode_checksum, flexible_inline_xattr, quota_ino,
> >  		inode_crtime, lost_found, verity, sb_checksum,
> >  		casefold, readonly, compression, test_dummy_encryption_v2,
> > -		atomic_write, pin_file, encrypted_casefold, linear_lookup.
> > +		atomic_write, pin_file, encrypted_casefold, linear_lookup,
> > +		fserror.
> >  
> >  What:		/sys/fs/f2fs/<disk>/inject_rate
> >  Date:		May 2016
> > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > index 8c76400ba631..d1650b763e1f 100644
> > --- a/fs/f2fs/compress.c
> > +++ b/fs/f2fs/compress.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/lz4.h>
> >  #include <linux/zstd.h>
> >  #include <linux/pagevec.h>
> > +#include <linux/fserror.h>
> >  
> >  #include "f2fs.h"
> >  #include "node.h"
> > @@ -760,6 +761,7 @@ void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task)
> >  
> >  		/* Avoid f2fs_commit_super in irq context */
> >  		f2fs_handle_error(sbi, ERROR_FAIL_DECOMPRESSION);
> > +		fserror_report_file_metadata(dic->inode, ret, GFP_NOFS);
> >  		goto out_release;
> >  	}
> >  
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 9ade0669d615..6d8bcb0d15bc 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/sched/signal.h>
> >  #include <linux/fiemap.h>
> >  #include <linux/iomap.h>
> > +#include <linux/fserror.h>
> >  
> >  #include "f2fs.h"
> >  #include "node.h"
> > @@ -179,6 +180,11 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
> >  				folio, folio->index, NODE_TYPE_REGULAR, true))
> >  			bio->bi_status = BLK_STS_IOERR;
> >  
> > +		if (bio->bi_status == BLK_STS_IOERR)
> > +			fserror_report_io(folio->mapping->host,
> > +				FSERR_BUFFERED_READ, folio_pos(folio),
> > +				folio_size(folio), -EIO, GFP_NOWAIT);
> > +
> >  		if (finished)
> >  			folio_end_read(folio, bio->bi_status == BLK_STS_OK);
> >  	}
> > @@ -377,9 +383,13 @@ static void f2fs_write_end_io(struct bio *bio)
> >  
> >  		if (unlikely(bio->bi_status != BLK_STS_OK)) {
> >  			mapping_set_error(folio->mapping, -EIO);
> > -			if (type == F2FS_WB_CP_DATA)
> > +			fserror_report_io(folio->mapping->host,
> > +				FSERR_BUFFERED_WRITE, folio_pos(folio),
> > +				folio_size(folio), -EIO, GFP_NOWAIT);

Hrm.  fserror_report_* can't be called from interrupt context because it
calls igrab, which in turn takes a spin_lock() (aka the non-irqsave
variant).  So far we've worked around it by fixing callers to ensure
that they're always running in process context.  I think that's not
necessarily the case for these two callsites?  But it's definitely
something to check.

(We could change the spin_lock to the irqsave version, but it's rather
odd to be messing around with inode state from inside interrupt
handlers.)

The metadata corruption reporting looks ok.

--D

> > +			if (type == F2FS_WB_CP_DATA) {
> >  				f2fs_stop_checkpoint(sbi, true,
> >  						STOP_CP_REASON_WRITE_FAIL);
> > +			}
> >  		}
> >  
> >  		if (is_node_folio(folio)) {
> > @@ -1725,6 +1735,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
> >  			err = -EFSCORRUPTED;
> >  			f2fs_handle_error(sbi,
> >  					ERROR_CORRUPTED_CLUSTER);
> > +			fserror_report_file_metadata(inode, err, GFP_NOFS);
> >  			goto sync_out;
> >  		}
> >  
> > diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> > index f70092e231f0..e8d2e27e8cec 100644
> > --- a/fs/f2fs/dir.c
> > +++ b/fs/f2fs/dir.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/filelock.h>
> >  #include <linux/sched/signal.h>
> >  #include <linux/unicode.h>
> > +#include <linux/fserror.h>
> >  #include "f2fs.h"
> >  #include "node.h"
> >  #include "acl.h"
> > @@ -1020,6 +1021,7 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
> >  			set_sbi_flag(sbi, SBI_NEED_FSCK);
> >  			err = -EFSCORRUPTED;
> >  			f2fs_handle_error(sbi, ERROR_CORRUPTED_DIRENT);
> > +			fserror_report_file_metadata(d->inode, err, GFP_NOFS);
> >  			goto out;
> >  		}
> >  
> > diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> > index 86d2abbb40ff..cfeb50d46d8d 100644
> > --- a/fs/f2fs/inline.c
> > +++ b/fs/f2fs/inline.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/fs.h>
> >  #include <linux/f2fs_fs.h>
> >  #include <linux/fiemap.h>
> > +#include <linux/fserror.h>
> >  
> >  #include "f2fs.h"
> >  #include "node.h"
> > @@ -179,6 +180,7 @@ int f2fs_convert_inline_folio(struct dnode_of_data *dn, struct folio *folio)
> >  		f2fs_warn(fio.sbi, "%s: corrupted inline inode ino=%lx, i_addr[0]:0x%x, run fsck to fix.",
> >  			  __func__, dn->inode->i_ino, dn->data_blkaddr);
> >  		f2fs_handle_error(fio.sbi, ERROR_INVALID_BLKADDR);
> > +		fserror_report_file_metadata(dn->inode, -EFSCORRUPTED, GFP_NOFS);
> >  		return -EFSCORRUPTED;
> >  	}
> >  
> > @@ -435,6 +437,7 @@ static int f2fs_move_inline_dirents(struct inode *dir, struct folio *ifolio,
> >  			  __func__, dir->i_ino, dn.data_blkaddr);
> >  		f2fs_handle_error(F2FS_F_SB(folio), ERROR_INVALID_BLKADDR);
> >  		err = -EFSCORRUPTED;
> > +		fserror_report_file_metadata(dn.inode, err, GFP_NOFS);
> >  		goto out;
> >  	}
> >  
> > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > index e7942e6e312c..43cb4d9fc039 100644
> > --- a/fs/f2fs/inode.c
> > +++ b/fs/f2fs/inode.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/sched/mm.h>
> >  #include <linux/lz4.h>
> >  #include <linux/zstd.h>
> > +#include <linux/fserror.h>
> >  
> >  #include "f2fs.h"
> >  #include "node.h"
> > @@ -480,6 +481,7 @@ static int do_read_inode(struct inode *inode)
> >  		f2fs_folio_put(node_folio, true);
> >  		set_sbi_flag(sbi, SBI_NEED_FSCK);
> >  		f2fs_handle_error(sbi, ERROR_CORRUPTED_INODE);
> > +		fserror_report_file_metadata(inode, -EFSCORRUPTED, GFP_NOFS);
> >  		return -EFSCORRUPTED;
> >  	}
> >  
> > @@ -541,6 +543,7 @@ static int do_read_inode(struct inode *inode)
> >  	if (!sanity_check_extent_cache(inode, node_folio)) {
> >  		f2fs_folio_put(node_folio, true);
> >  		f2fs_handle_error(sbi, ERROR_CORRUPTED_INODE);
> > +		fserror_report_file_metadata(inode, -EFSCORRUPTED, GFP_NOFS);
> >  		return -EFSCORRUPTED;
> >  	}
> >  
> > @@ -583,6 +586,7 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
> >  			trace_f2fs_iget_exit(inode, ret);
> >  			iput(inode);
> >  			f2fs_handle_error(sbi, ERROR_CORRUPTED_INODE);
> > +			fserror_report_file_metadata(inode, ret, GFP_NOFS);
> >  			return ERR_PTR(ret);
> >  		}
> >  
> > @@ -787,6 +791,7 @@ void f2fs_update_inode_page(struct inode *inode)
> >  		if (err == -ENOMEM || ++count <= DEFAULT_RETRY_IO_COUNT)
> >  			goto retry;
> >  stop_checkpoint:
> > +		fserror_report_file_metadata(inode, -EFSCORRUPTED, GFP_NOFS);
> >  		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_UPDATE_INODE);
> >  		return;
> >  	}
> > diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> > index 0de41526f28a..bb302fae75c2 100644
> > --- a/fs/f2fs/node.c
> > +++ b/fs/f2fs/node.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/blkdev.h>
> >  #include <linux/pagevec.h>
> >  #include <linux/swap.h>
> > +#include <linux/fserror.h>
> >  
> >  #include "f2fs.h"
> >  #include "node.h"
> > @@ -1267,6 +1268,8 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
> >  		if (err == -ENOENT) {
> >  			set_sbi_flag(F2FS_F_SB(folio), SBI_NEED_FSCK);
> >  			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
> > +			fserror_report_file_metadata(dn.inode, -EFSCORRUPTED,
> > +								GFP_NOFS);
> >  			f2fs_err_ratelimited(sbi,
> >  				"truncate node fail, ino:%lu, nid:%u, "
> >  				"offset[0]:%d, offset[1]:%d, nofs:%d",
> > @@ -1558,6 +1561,8 @@ int f2fs_sanity_check_node_footer(struct f2fs_sb_info *sbi,
> >  		next_blkaddr_of_node(folio));
> >  
> >  	f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
> > +	fserror_report_file_metadata(folio->mapping->host,
> > +			-EFSCORRUPTED, in_irq ? GFP_NOWAIT : GFP_NOFS);
> >  	return -EFSCORRUPTED;
> >  }
> >  
> > @@ -1779,6 +1784,7 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
> >  
> >  	if (f2fs_sanity_check_node_footer(sbi, folio, nid,
> >  					NODE_TYPE_REGULAR, false)) {
> > +		fserror_report_metadata(sbi->sb, -EFSCORRUPTED, GFP_NOFS);
> >  		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_CORRUPTED_NID);
> >  		goto redirty_out;
> >  	}
> > @@ -2696,6 +2702,8 @@ bool f2fs_alloc_nid(struct f2fs_sb_info *sbi, nid_t *nid)
> >  			spin_unlock(&nm_i->nid_list_lock);
> >  			f2fs_err(sbi, "Corrupted nid %u in free_nid_list",
> >  								i->nid);
> > +			fserror_report_metadata(sbi->sb, -EFSCORRUPTED,
> > +								GFP_NOFS);
> >  			f2fs_stop_checkpoint(sbi, false,
> >  					STOP_CP_REASON_CORRUPTED_NID);
> >  			return false;
> > diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> > index a26071f2b0bc..b127dfc91338 100644
> > --- a/fs/f2fs/recovery.c
> > +++ b/fs/f2fs/recovery.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/fs.h>
> >  #include <linux/f2fs_fs.h>
> >  #include <linux/sched/mm.h>
> > +#include <linux/fserror.h>
> >  #include "f2fs.h"
> >  #include "node.h"
> >  #include "segment.h"
> > @@ -679,6 +680,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
> >  			  ofs_of_node(folio));
> >  		err = -EFSCORRUPTED;
> >  		f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
> > +		fserror_report_file_metadata(dn.inode, err, GFP_NOFS);
> >  		goto err;
> >  	}
> >  
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index 0bf25786667f..ee5c35ce5a0f 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/freezer.h>
> >  #include <linux/sched/signal.h>
> >  #include <linux/random.h>
> > +#include <linux/fserror.h>
> >  
> >  #include "f2fs.h"
> >  #include "segment.h"
> > @@ -2886,6 +2887,7 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
> >  	/* set it as dirty segment in free segmap */
> >  	if (test_bit(segno, free_i->free_segmap)) {
> >  		ret = -EFSCORRUPTED;
> > +		fserror_report_metadata(sbi->sb, -EFSCORRUPTED, GFP_NOFS);
> >  		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_CORRUPTED_FREE_BITMAP);
> >  		goto out_unlock;
> >  	}
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index 5b552f08fe7b..5330ef981340 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -29,6 +29,7 @@
> >  #include <linux/lz4.h>
> >  #include <linux/ctype.h>
> >  #include <linux/fs_parser.h>
> > +#include <linux/fserror.h>
> >  
> >  #include "f2fs.h"
> >  #include "node.h"
> > @@ -4632,6 +4633,8 @@ static void f2fs_record_stop_reason(struct f2fs_sb_info *sbi)
> >  		f2fs_err_ratelimited(sbi,
> >  			"f2fs_commit_super fails to record stop_reason, err:%d",
> >  			err);
> > +
> > +	fserror_report_shutdown(sbi->sb, GFP_NOFS);
> >  }
> >  
> >  void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag)
> > @@ -4646,6 +4649,27 @@ void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag)
> >  	spin_unlock_irqrestore(&sbi->error_lock, flags);
> >  }
> >  
> > +static void f2fs_report_fserror(struct f2fs_sb_info *sbi, unsigned char error)
> > +{
> > +	switch (error) {
> > +	case ERROR_INVALID_BLKADDR:
> > +	case ERROR_CORRUPTED_INODE:
> > +	case ERROR_INCONSISTENT_SUMMARY:
> > +	case ERROR_INCONSISTENT_SUM_TYPE:
> > +	case ERROR_CORRUPTED_JOURNAL:
> > +	case ERROR_INCONSISTENT_NODE_COUNT:
> > +	case ERROR_INCONSISTENT_BLOCK_COUNT:
> > +	case ERROR_INVALID_CURSEG:
> > +	case ERROR_INCONSISTENT_SIT:
> > +	case ERROR_INVALID_NODE_REFERENCE:
> > +	case ERROR_INCONSISTENT_NAT:
> > +		fserror_report_metadata(sbi->sb, -EFSCORRUPTED, GFP_NOFS);
> > +		break;
> > +	default:
> > +		return;
> > +	}
> > +}
> > +
> >  void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error)
> >  {
> >  	f2fs_save_errors(sbi, error);
> > @@ -4655,6 +4679,8 @@ void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error)
> >  	if (!test_bit(error, (unsigned long *)sbi->errors))
> >  		return;
> >  	schedule_work(&sbi->s_error_work);
> > +
> > +	f2fs_report_fserror(sbi, error);
> >  }
> >  
> >  static bool system_going_down(void)
> > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > index 969e06b65b04..5c1358e48206 100644
> > --- a/fs/f2fs/sysfs.c
> > +++ b/fs/f2fs/sysfs.c
> > @@ -1396,6 +1396,7 @@ F2FS_FEATURE_RO_ATTR(pin_file);
> >  F2FS_FEATURE_RO_ATTR(linear_lookup);
> >  #endif
> >  F2FS_FEATURE_RO_ATTR(packed_ssa);
> > +F2FS_FEATURE_RO_ATTR(fserror);
> >  
> >  #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
> >  static struct attribute *f2fs_attrs[] = {
> > @@ -1563,6 +1564,7 @@ static struct attribute *f2fs_feat_attrs[] = {
> >  	BASE_ATTR_LIST(linear_lookup),
> >  #endif
> >  	BASE_ATTR_LIST(packed_ssa),
> > +	BASE_ATTR_LIST(fserror),
> >  	NULL,
> >  };
> >  ATTRIBUTE_GROUPS(f2fs_feat);
> > diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
> > index 92ebcc19cab0..39f482515445 100644
> > --- a/fs/f2fs/verity.c
> > +++ b/fs/f2fs/verity.c
> > @@ -25,6 +25,7 @@
> >   */
> >  
> >  #include <linux/f2fs_fs.h>
> > +#include <linux/fserror.h>
> >  
> >  #include "f2fs.h"
> >  #include "xattr.h"
> > @@ -243,6 +244,7 @@ static int f2fs_get_verity_descriptor(struct inode *inode, void *buf,
> >  		f2fs_warn(F2FS_I_SB(inode), "invalid verity xattr");
> >  		f2fs_handle_error(F2FS_I_SB(inode),
> >  				ERROR_CORRUPTED_VERITY_XATTR);
> > +		fserror_report_file_metadata(inode, -EFSCORRUPTED, GFP_NOFS);
> >  		return -EFSCORRUPTED;
> >  	}
> >  	if (buf_size) {
> > diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> > index 941dc62a6d6f..3ef1e5df0036 100644
> > --- a/fs/f2fs/xattr.c
> > +++ b/fs/f2fs/xattr.c
> > @@ -19,6 +19,7 @@
> >  #include <linux/f2fs_fs.h>
> >  #include <linux/security.h>
> >  #include <linux/posix_acl_xattr.h>
> > +#include <linux/fserror.h>
> >  #include "f2fs.h"
> >  #include "xattr.h"
> >  #include "segment.h"
> > @@ -371,6 +372,7 @@ static int lookup_all_xattrs(struct inode *inode, struct folio *ifolio,
> >  		err = -ENODATA;
> >  		f2fs_handle_error(F2FS_I_SB(inode),
> >  					ERROR_CORRUPTED_XATTR);
> > +		fserror_report_file_metadata(inode, err, GFP_NOFS);
> >  		goto out;
> >  	}
> >  check:
> > @@ -590,6 +592,8 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
> >  			set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> >  			f2fs_handle_error(F2FS_I_SB(inode),
> >  						ERROR_CORRUPTED_XATTR);
> > +			fserror_report_file_metadata(inode,
> > +						-EFSCORRUPTED, GFP_NOFS);
> >  			break;
> >  		}
> >  
> > @@ -677,6 +681,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
> >  		error = -EFSCORRUPTED;
> >  		f2fs_handle_error(F2FS_I_SB(inode),
> >  					ERROR_CORRUPTED_XATTR);
> > +		fserror_report_file_metadata(inode, error, GFP_NOFS);
> >  		goto exit;
> >  	}
> >  
> > @@ -705,6 +710,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
> >  			error = -EFSCORRUPTED;
> >  			f2fs_handle_error(F2FS_I_SB(inode),
> >  						ERROR_CORRUPTED_XATTR);
> > +			fserror_report_file_metadata(inode, error, GFP_NOFS);
> >  			goto exit;
> >  		}
> >  		last = XATTR_NEXT_ENTRY(last);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
