Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3829DD05271
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 18:46:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/BCEnJZ+OQuBu3aUlXm7pnPraVee9gY7ADFstqquao=; b=QSfqydocDUlgoBx2xqn2VmBReC
	0cu8nrJpmErxT86cStXMiFVw+RrjtLv9/MetFiXiFCFgB6yy4J88QoNPbuoHmeyxj8aKC7hXkfxgN
	ckn/FmIAQyoJMxb2MmNYjl93mEKmBP3j5ldf8FmkS+UGvZvwziG5RQB66dhIJ9uv+VZk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdu5W-0002Nn-Ay;
	Thu, 08 Jan 2026 17:46:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vdu5U-0002Ne-RR
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jan 2026 17:46:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rc9QMKouyjzH45LZUhjCbf9iU6kNH1nER3QE4i7JiDM=; b=BoS9/wv5XP84bqn5KbjqQ2SNNh
 Wo7rRTKp+NcWSLlWJuPUgVRQXW5E37Qhq6lZWmDGfrWbRjYKnbEow4MLaTRs9UI/qTp/sTGIMbCeu
 ZQkjYygkxoIPY7O2YL8Y2UsyfL0yM+G46tcKIBYkaqvxsJ5WP33KVOdviTo/fdTYwE0s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rc9QMKouyjzH45LZUhjCbf9iU6kNH1nER3QE4i7JiDM=; b=FvEwI4DtkwCBoIu/3peGH1bASk
 ZepG+aol7OqkAVzZKip+hNOaCZ4Q+bSwxwbkuqUyJBObtGDeFYTkccjPZ33cD+Z+wHHKb9tyqJYsH
 Cwi3lxLDN3BEfAUy91YdVEJo2G9hmTXGLFhWOlIGlCRuU/ZvCzCmOX7gp4Up3/qXpSrg=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vdu5U-000101-9u for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jan 2026 17:46:20 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CACA55CBAA;
 Thu,  8 Jan 2026 17:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1767893515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rc9QMKouyjzH45LZUhjCbf9iU6kNH1nER3QE4i7JiDM=;
 b=SjGu8xWFvqvPTajUdrve/tkEoODH6+r/GTBr8gpUYcGrmBEYga3xqYG8St2+RFHlLn30ka
 0yohoC73wEYkhvbqwS6GnHxD2oBY4ZvgUnY3vkjJhl1qJIFpoH6YRxl7fWIBVymyiY2YLc
 XrvV8+PtnHJg7Upq20EtygKwXodCegM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1767893515;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rc9QMKouyjzH45LZUhjCbf9iU6kNH1nER3QE4i7JiDM=;
 b=2Wn9HqxA7CtfXS7UqvYpfju0o6PArRNvw1XQkBWAeQZIrv+GhiWrKHLx6Q09tcNVGlK0GJ
 JBYqc/CmjqnU7jCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1767893514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rc9QMKouyjzH45LZUhjCbf9iU6kNH1nER3QE4i7JiDM=;
 b=TrDPHqNzriwslUs1c+7umCElSUglJP1N5Zj45yrhcb6NcnNa3QZ5Xc/mz4AwHdFJrQrZ5I
 gnZXsNKVPzgxosuKgeRHqv2JCjP7sUHGP0yoiMJLfOjVfsqd7Szv1HtjxdoIlkHa8j+49C
 +/raVpT9Bb7uw3+ieXjOxGIBzIO8HwU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1767893514;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rc9QMKouyjzH45LZUhjCbf9iU6kNH1nER3QE4i7JiDM=;
 b=vHn8wQXB1vszOd1f6QtOMrupIQRL10p/S9F5NFMaGecrQrGdhlfSJO4pGhGt3J4bJUSYNF
 CzjlGQiF5MUsfcBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B7C4D3EA63;
 Thu,  8 Jan 2026 17:31:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 5NrWLArqX2npegAAD6G6ig
 (envelope-from <jack@suse.cz>); Thu, 08 Jan 2026 17:31:54 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 3B7FAA0B23; Thu,  8 Jan 2026 18:31:54 +0100 (CET)
Date: Thu, 8 Jan 2026 18:31:54 +0100
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <5dtyb6by4ujjnkjz6lu4rl2x3s5km6awilvrozuzmgq2wn7bl6@cxvq3jpviunf>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <20260108-setlease-6-20-v1-19-ea4dec9b67fa@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108-setlease-6-20-v1-19-ea4dec9b67fa@kernel.org>
X-Spamd-Result: default: False [-2.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCVD_TLS_LAST(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_COUNT_THREE(0.00)[3]; ARC_NA(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[kernel.org,gmail.com,fluxnic.net,infradead.org,suse.cz,alarsen.net,zeniv.linux.org.uk,suse.com,fb.com,linux.alibaba.com,google.com,huawei.com,vivo.com,mit.edu,dilger.ca,mail.parknet.co.jp,nod.at,dubeyko.com,paragon-software.com,fasheh.com,evilplan.org,omnibond.com,szeredi.hu,squashfs.org.uk,linux-foundation.org,samsung.com,sony.com,oracle.com,redhat.com,lwn.net,ionkov.net,codewreck.org,crudebyte.com,samba.org,manguebit.org,microsoft.com,talpey.com,vger.kernel.org,lists.ozlabs.org,lists.sourceforge.net,lists.infradead.org,lists.linux.dev,lists.orangefs.org,kvack.org,lists.samba.org];
 R_RATELIMIT(0.00)[to_ip_from(RLwapsqjcu3srfensh8n36bg4p)];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_GT_50(0.00)[86];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 MISSING_XM_UA(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:email]
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Spam-Level: 
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 08-01-26 12:13:14,
 Jeff Layton wrote: > Add the setlease
 file_operation pointing to generic_setlease to the > tmpfs file_operations
 structures. A future patch will change the > default behavior [...] 
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
X-Headers-End: 1vdu5U-000101-9u
Subject: Re: [f2fs-dev] [PATCH 19/24] tmpfs: add setlease file operation
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
 Alexander Aring <alex.aring@gmail.com>, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Sandeep Dhavale <dhavale@google.com>,
 Martin Brandenburg <martin@omnibond.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Anders Larsen <al@alarsen.net>, Amir Goldstein <amir73il@gmail.com>,
 jfs-discussion@lists.sourceforge.net, linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ilya Dryomov <idryomov@gmail.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Yue Hu <zbestahu@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, samba-technical@lists.samba.org,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 devel@lists.orangefs.org, Hugh Dickins <hughd@google.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, ntfs3@lists.linux.dev,
 Christoph Hellwig <hch@infradead.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 linux-mm@kvack.org, Viacheslav Dubeyko <slava@dubeyko.com>,
 linux-btrfs@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
 linux-ext4@vger.kernel.org, Salah Triki <salah.triki@gmail.com>,
 Carlos Maiolino <cem@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 Shyam Prasad N <sprasad@microsoft.com>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, Tom Talpey <tom@talpey.com>,
 ocfs2-devel@lists.linux.dev, Bharath SM <bharathsm@microsoft.com>,
 linux-nilfs@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, Hans de Goede <hansg@kernel.org>,
 gfs2@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 linux-erofs@lists.ozlabs.org, v9fs@lists.linux.dev,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 Trond Myklebust <trondmy@kernel.org>, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu 08-01-26 12:13:14, Jeff Layton wrote:
> Add the setlease file_operation pointing to generic_setlease to the
> tmpfs file_operations structures. A future patch will change the
> default behavior to reject lease attempts with -EINVAL when there is no
> setlease file operation defined. Add generic_setlease to retain the
> ability to set leases on this filesystem.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/libfs.c | 2 ++
>  mm/shmem.c | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/fs/libfs.c b/fs/libfs.c
> index 591eb649ebbacf202ff48cd3abd64a175daa291c..697c6d5fc12786c036f0086886297fb5cd52ae00 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -6,6 +6,7 @@
>  
>  #include <linux/blkdev.h>
>  #include <linux/export.h>
> +#include <linux/filelock.h>
>  #include <linux/pagemap.h>
>  #include <linux/slab.h>
>  #include <linux/cred.h>
> @@ -570,6 +571,7 @@ const struct file_operations simple_offset_dir_operations = {
>  	.iterate_shared	= offset_readdir,
>  	.read		= generic_read_dir,
>  	.fsync		= noop_fsync,
> +	.setlease	= generic_setlease,
>  };
>  
>  struct dentry *find_next_child(struct dentry *parent, struct dentry *prev)
> diff --git a/mm/shmem.c b/mm/shmem.c
> index ec6c01378e9d2bd47db9d7506e4d6a565e092185..88ef1fd5cd38efedbb31353da2871ab1d47e68a5 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -29,6 +29,7 @@
>  #include <linux/pagemap.h>
>  #include <linux/file.h>
>  #include <linux/fileattr.h>
> +#include <linux/filelock.h>
>  #include <linux/mm.h>
>  #include <linux/random.h>
>  #include <linux/sched/signal.h>
> @@ -5219,6 +5220,7 @@ static const struct file_operations shmem_file_operations = {
>  	.splice_read	= shmem_file_splice_read,
>  	.splice_write	= iter_file_splice_write,
>  	.fallocate	= shmem_fallocate,
> +	.setlease	= generic_setlease,
>  #endif
>  };
>  
> 
> -- 
> 2.52.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
