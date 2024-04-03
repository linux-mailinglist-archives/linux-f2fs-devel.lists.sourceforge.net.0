Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBE38975C1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 18:58:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rs3wR-0000j0-8u;
	Wed, 03 Apr 2024 16:58:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bfoster@redhat.com>) id 1rs3wP-0000iq-NV
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 16:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M0vlp5zqKNWczSf5uwQPJWCYRlyw0wuDQPwNGC+8xK8=; b=M0TEa9uKJ6pDhDrCmkkTOgqpSD
 xu7QaU686U0Ctv8pYSnGtPa2exXLz0r6pR4JUV0/sXE5y9nLszphW8j+B3suhwAfJiUoAJn89jKiy
 xRl57SMov9WSoGtP2bTcV1Q4dnt0JXvIcEdneG9NK6ztwPt8KjVwtngXu2YKzqKpxn44=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M0vlp5zqKNWczSf5uwQPJWCYRlyw0wuDQPwNGC+8xK8=; b=a4gF3zok4FIGcI98zqilPvtuAX
 0rz2VS41OXGO7gAkM5I3/FPqVeTu+NBkfGJbQWwGTt9oOibcsKTglD1diuiXIzGfGZg7SJddJAKjZ
 g7MoKUcYcaXsjK/JDSdIUv+1C9pbAow/TCHPgYDcjB+vS868f5vNNv95/Bj7t9wyE5Go=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rs3wM-0006Sr-4S for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 16:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712163496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M0vlp5zqKNWczSf5uwQPJWCYRlyw0wuDQPwNGC+8xK8=;
 b=WmUMB7rih5zScqXx3NjFJenYdCUD6STBJ7zTbt0aBiLtRzj1j/n4iWWzLAKktgpge/XH6Q
 Xsk62WWqSgSwNUtjWNY0oeHJbZltMLJby7orr/Qlj3z5BYUsdCTLt368SCdm14gwRrnyFm
 Mt61j+dJYq+6ACpxFNqTJfKhMxRQVLk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-b9Sqe5VQNbSAgN0m4F60cA-1; Wed,
 03 Apr 2024 12:58:14 -0400
X-MC-Unique: b9Sqe5VQNbSAgN0m4F60cA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6496A383CD7A;
 Wed,  3 Apr 2024 16:58:13 +0000 (UTC)
Received: from bfoster (unknown [10.22.16.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6F3C40C6CB5;
 Wed,  3 Apr 2024 16:58:12 +0000 (UTC)
Date: Wed, 3 Apr 2024 13:00:11 -0400
From: Brian Foster <bfoster@redhat.com>
To: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Message-ID: <Zg2LG1_2-ac1GlsG@bfoster>
References: <cover.1712126039.git.sweettea-kernel@dorminy.me>
 <b9b795987a485afa0fdb8f0decc09405691d9320.1712126039.git.sweettea-kernel@dorminy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b9b795987a485afa0fdb8f0decc09405691d9320.1712126039.git.sweettea-kernel@dorminy.me>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 03, 2024 at 03:22:52AM -0400, Sweet Tea Dorminy
 wrote: > Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me> >
 --- > fs/bcachefs/fs.c | 18 ++++++++++++------ > 1 file changed, 12 [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rs3wM-0006Sr-4S
Subject: Re: [f2fs-dev] [PATCH v3 11/13] bcachefs: fiemap: return correct
 extent physical length
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
Cc: linux-bcachefs@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-btrfs@vger.kernel.org,
 Kent Overstreet <kent.overstreet@linux.dev>, linux-doc@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org,
 Chris Mason <clm@fb.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@meta.com,
 =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 03, 2024 at 03:22:52AM -0400, Sweet Tea Dorminy wrote:
> Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
> ---
>  fs/bcachefs/fs.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/bcachefs/fs.c b/fs/bcachefs/fs.c
> index f830578a9cd1..d2793bae842d 100644
> --- a/fs/bcachefs/fs.c
> +++ b/fs/bcachefs/fs.c
> @@ -913,15 +913,17 @@ static int bch2_fill_extent(struct bch_fs *c,
>  			flags |= FIEMAP_EXTENT_SHARED;
>  
>  		bkey_for_each_ptr_decode(k.k, ptrs, p, entry) {
> -			int flags2 = 0;
> +			int flags2 = FIEMAP_EXTENT_HAS_PHYS_LEN;
> +			u64 phys_len = k.k->size << 9;
>  			u64 offset = p.ptr.offset;
>  
>  			if (p.ptr.unwritten)
>  				flags2 |= FIEMAP_EXTENT_UNWRITTEN;
>  
> -			if (p.crc.compression_type)
> +			if (p.crc.compression_type) {
>  				flags2 |= FIEMAP_EXTENT_ENCODED;
> -			else
> +				phys_len = p.crc.compressed_size << 9;
> +			} else
>  				offset += p.crc.offset;
>  
>  			if ((offset & (block_sectors(c) - 1)) ||
> @@ -931,7 +933,7 @@ static int bch2_fill_extent(struct bch_fs *c,
>  			ret = fiemap_fill_next_extent(info,
>  						bkey_start_offset(k.k) << 9,
>  						offset << 9,
> -						k.k->size << 9, 0,
> +						k.k->size << 9, phys_len,
>  						flags|flags2);
>  			if (ret)
>  				return ret;
> @@ -941,14 +943,18 @@ static int bch2_fill_extent(struct bch_fs *c,
>  	} else if (bkey_extent_is_inline_data(k.k)) {
>  		return fiemap_fill_next_extent(info,
>  					       bkey_start_offset(k.k) << 9,
> -					       0, k.k->size << 9, 0,
> +					       0, k.k->size << 9,
> +					       bkey_inline_data_bytes(k.k),

Question for Kent perhaps, but what's the functional difference between
bkey_inline_data_bytes() and k->size in this particular case?

FWIW that and the other couple nitty questions aside, this all LGTM.
Thanks.

Brian

>  					       flags|
> +					       FIEMAP_EXTENT_HAS_PHYS_LEN|
>  					       FIEMAP_EXTENT_DATA_INLINE);
>  	} else if (k.k->type == KEY_TYPE_reservation) {
>  		return fiemap_fill_next_extent(info,
>  					       bkey_start_offset(k.k) << 9,
> -					       0, k.k->size << 9, 0,
> +					       0, k.k->size << 9,
> +					       k.k->size << 9,
>  					       flags|
> +					       FIEMAP_EXTENT_HAS_PHYS_LEN|
>  					       FIEMAP_EXTENT_DELALLOC|
>  					       FIEMAP_EXTENT_UNWRITTEN);
>  	} else {
> -- 
> 2.43.0
> 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
