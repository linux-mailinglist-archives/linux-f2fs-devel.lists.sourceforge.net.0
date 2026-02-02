Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCjbMHsmgWnsEQMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 23:34:35 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 11799D2388
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 23:34:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxyfkHlN/anolSDwjPhWuyT4uj4PO47jN5fUim0U39o=; b=YntZ+1G8GVq83B1Zb/lBa5vZre
	gkD3r2kGh6EqtOgy0LwDHBW6ttSpGnAn0P63CRrj+vmIAnU+mzGAYkViGum8IKx8m39dV9gxTKj+E
	CoOEAbROfIWvDCaAa+YvT3aoaB6Ofh1buX9UjxnJT+g8SPePixCp0mD90lTnNIvnCfGw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vn2Uu-0003Ep-77;
	Mon, 02 Feb 2026 22:34:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vn2Ut-0003Ei-Ej
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 22:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FlfY8AKzYA+0GZbWT7sCO76FIqNibBygFSG2lciHNnw=; b=Q0qzDpJgxhrfzJYq+c4cTecoNc
 WRyBU/iiTuhU8LxDiiPXgBQDiNdzQC/t+4xn4BwjhOOzv9uwCn7wHaZAxFQ5rZfDcvtZIxgV6Zb1i
 20UcSYnrVYEargmkp/LHhf8uhZcnRBJIeGAcJr0c2VHhfa98EfBHmS8HHelbdpVwwPPE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FlfY8AKzYA+0GZbWT7sCO76FIqNibBygFSG2lciHNnw=; b=nGaLsbfilTOPyNnoa4CQEt+bF+
 QpHaFgxK+s7hDQgQ/UZzli+FOM4BL+Zd7wSY6E9VqtcdhN/lsakNu01HMw4YQWfW4HJ9OAnw22cGY
 LGJHT38BvgCQB5FAsUCUS/LkLgsVxOGUT3P290TgvrQVeZefyuyDL8cXDSPyuhvG/les=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vn2Us-0004wx-Dx for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 22:34:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0BE9343834;
 Mon,  2 Feb 2026 22:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2840C116C6;
 Mon,  2 Feb 2026 22:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770071647;
 bh=2BLw8V36q4ZcoZntEthTMAW+cHIrT5ib6z9TbOGuvgM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ss2zz3/zaUboc6X/2TuV+KFtnflhkrpnIr6d8/rxpr8ixW69zHo15BSkfX7C+GrrG
 3dxxe8R18qUeUaWY6nisKn2wmrZy9dl4o1heG4kk/K8kzQwV31QMPww5ZQis+db3y1
 sUNB3MzBBKSAX/TifSu+FMYAccP/HfGZvUCLqmtopz3b9AU+rS3GnhInsnw4q7GRNU
 0qwPxcnVei484r2+HKkAN3+ed4bSRmzSErbAbjvNW8U/46uXtDcaJiilALdBmk+n+Z
 EqNcbKlhmyF7FQNNK+sDUH/6bc91lQLmusrhVPXRnKkh41P6MBg+RtcfyL5f5q7jeX
 20vZJrM+KKiLg==
Date: Mon, 2 Feb 2026 14:34:04 -0800
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
Message-ID: <20260202223404.GA173552@quark>
References: <20260202060754.270269-1-hch@lst.de> <20260202211423.GB4838@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202211423.GB4838@quark>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Feb 02, 2026 at 01:14:23PM -0800, Eric Biggers wrote:
 > On Mon, Feb 02, 2026 at 07:06:29AM +0100, Christoph Hellwig wrote: > >
 Hi all, > > > > this series has a hodge podge of fsverity enhance [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vn2Us-0004wx-Dx
Subject: Re: [f2fs-dev] fsverity speedup and memory usage optimization v5
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.71 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:jaegeuk@kernel.org,m:chao@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 11799D2388
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 01:14:23PM -0800, Eric Biggers wrote:
> On Mon, Feb 02, 2026 at 07:06:29AM +0100, Christoph Hellwig wrote:
> > Hi all,
> > 
> > this series has a hodge podge of fsverity enhances that I looked into as
> > part of the review of the xfs fsverity support series.
> > 
> > The first part optimizes the fsverity read path by kicking off readahead
> > for the fsverity hashes from the data read submission context, which in my
> > simply testing showed huge benefits for sequential reads using dd.
> > I haven't been able to get fio to run on a preallocated fio file, but
> > I expect random read benefits would be significantly better than that
> > still.
> > 
> > The second part avoids the need for a pointer in every inode for fsverity
> > and instead uses a rhashtable lookup, which is done once per read_folio
> > or ->readahead invocation plus for btrfs only for each bio completion.
> > Right now this does not increse the number of inodes in
> > each slab, but for ext4 we are getting very close to that (within
> > 16 bytes by my count).
> > 
> > Changes since v5:
> >  - drop already merged patches
> >  - fix a bisection hazard for non-ENOENT error returns from
> >    generic_read_merkle_tree_page
> >  - don't recurse on invalidate_lock
> >  - refactor page_cache_ra_unbounded locking to support the above
> >  - refactor ext4 and f2fs fsverity readahead to remove the need for the
> >    first_folio branch in the main readpages loop
> 
> Applied to https://git.kernel.org/pub/scm/fs/fsverity/linux.git/log/?h=for-next
> 
> (Though it's getting late for v6.20 / v7.0.  So if there are any
> additional issues reported, I may have to drop it.)

Unfortunately this silently conflicts with changes in the f2fs tree.
Resolution doesn't look too bad, but we'll need to handle this.
Christoph, Jaegeuk, and Chao, let me know if this looks okay:

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d9085d1236d97..081c441c59e71 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2449,11 +2449,13 @@ static void ffs_detach_free(struct folio *folio)
 	WARN_ON_ONCE(ffs->read_pages_pending != 0);
 	kmem_cache_free(ffs_entry_slab, ffs);
 }
 
 static int f2fs_read_data_large_folio(struct inode *inode,
-		struct readahead_control *rac, struct folio *folio)
+				      struct fsverity_info *vi,
+				      struct readahead_control *rac,
+				      struct folio *folio)
 {
 	struct bio *bio = NULL;
 	sector_t last_block_in_bio = 0;
 	struct f2fs_map_blocks map = {0, };
 	pgoff_t index, offset, next_pgofs = 0;
@@ -2519,13 +2521,12 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 				ret = -EFSCORRUPTED;
 				goto err_out;
 			}
 		} else {
 			folio_zero_range(folio, offset << PAGE_SHIFT, PAGE_SIZE);
-			if (f2fs_need_verity(inode, index) &&
-			    !fsverity_verify_page(folio_file_page(folio,
-								index))) {
+			if (vi && !fsverity_verify_page(
+					  vi, folio_file_page(folio, index))) {
 				ret = -EIO;
 				goto err_out;
 			}
 			continue;
 		}
@@ -2552,14 +2553,14 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 submit_and_realloc:
 			f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
 			bio = NULL;
 		}
 		if (bio == NULL)
-			bio = f2fs_grab_read_bio(inode, block_nr,
-					max_nr_pages,
-					f2fs_ra_op_flags(rac),
-					index, false);
+			bio = f2fs_grab_read_bio(inode, vi, block_nr,
+						 max_nr_pages,
+						 f2fs_ra_op_flags(rac), index,
+						 false);
 
 		/*
 		 * If the page is under writeback, we need to wait for
 		 * its completion to see the correct decrypted data.
 		 */
@@ -2627,11 +2628,11 @@ static int f2fs_mpage_readpages(struct inode *inode, struct fsverity_info *vi,
 	struct address_space *mapping = rac ? rac->mapping : folio->mapping;
 	unsigned max_nr_pages = nr_pages;
 	int ret = 0;
 
 	if (mapping_large_folio_support(mapping))
-		return f2fs_read_data_large_folio(inode, rac, folio);
+		return f2fs_read_data_large_folio(inode, vi, rac, folio);
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	if (f2fs_compressed_file(inode)) {
 		index = rac ? readahead_index(rac) : folio->index;
 		max_nr_pages = round_up(index + nr_pages, cc.cluster_size) -


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
