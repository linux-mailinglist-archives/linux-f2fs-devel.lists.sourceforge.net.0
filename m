Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E549C8975B8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 18:57:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rs3v9-0000et-UW;
	Wed, 03 Apr 2024 16:57:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bfoster@redhat.com>) id 1rs3v9-0000en-FQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 16:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u1iSn8bvEgGWCVXgdHv/OtOU9Q9NOuhKnF3ziO23kyo=; b=HKT7TN9wIkRaZCtCUepY986Iis
 76Y91QTyWo7JxiHodboH9fN6+N3uCIfdaVVcsUri47De3FjGYWCVf51yiSldLUn8c2EcSh2J1YDDH
 t2/uHOhwsvL2Nlqb242n6lxAWYs0C5xryI7mVuAnND5IPpiGgXQXDiRRW72m3HWT5ZVo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u1iSn8bvEgGWCVXgdHv/OtOU9Q9NOuhKnF3ziO23kyo=; b=lOFUknIpyHyw5CH7oMKzYrR7uk
 UrQUV2hpSlPklluSc/spwj2VcNBOecRbM1LS1hC/DpmyFFqIKZhX5aJ/ToyV3xKEyDgjEap0kLbZN
 +0qfi5yPAefhoKMdK0zliT2Bb1PhUH4Qv7P3DOrKtzTTnE4WFefAlMzZ0UpCLEeokTcw=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rs3v5-0006Mr-8k for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 16:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712163412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u1iSn8bvEgGWCVXgdHv/OtOU9Q9NOuhKnF3ziO23kyo=;
 b=friRP2WHBh5j/C1uT8chm8tKjLUw6N1qSaE5OE1UovsPgMuaVDH3c2WN4WJ43Ij1u0V9MW
 ksV5ecvt+hKHNfjKP00PRoyR/LRD1S/j1hekweIMHIJCr0sKw3HF1TWzFIz4E3BhBhWB/F
 IlukMDcZQ6sNctO8vlm0KmboCH4j7Kk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-169-iTU1m7Q5N7uP72lIIm9dzA-1; Wed,
 03 Apr 2024 12:56:45 -0400
X-MC-Unique: iTU1m7Q5N7uP72lIIm9dzA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A93CB383CD7F;
 Wed,  3 Apr 2024 16:56:42 +0000 (UTC)
Received: from bfoster (unknown [10.22.16.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFCA747FD;
 Wed,  3 Apr 2024 16:56:41 +0000 (UTC)
Date: Wed, 3 Apr 2024 12:58:40 -0400
From: Brian Foster <bfoster@redhat.com>
To: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Message-ID: <Zg2KwHF9qaWMgVsy@bfoster>
References: <cover.1712126039.git.sweettea-kernel@dorminy.me>
 <58f9c9eef8b0e33a8d46a3ad8a8db46890e1fbe8.1712126039.git.sweettea-kernel@dorminy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <58f9c9eef8b0e33a8d46a3ad8a8db46890e1fbe8.1712126039.git.sweettea-kernel@dorminy.me>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 03, 2024 at 03:22:43AM -0400, Sweet Tea Dorminy
 wrote: > Update the signature of fiemap_fill_next_extent() to allow passing
 a > physical length. Update all callers to pass a 0 physical len [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rs3v5-0006Mr-8k
Subject: Re: [f2fs-dev] [PATCH v3 02/13] fs: fiemap: update
 fiemap_fill_next_extent() signature
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

On Wed, Apr 03, 2024 at 03:22:43AM -0400, Sweet Tea Dorminy wrote:
> Update the signature of fiemap_fill_next_extent() to allow passing a
> physical length. Update all callers to pass a 0 physical length -- since
> none set the EXTENT_HAS_PHYS_LEN flag, this value doesn't matter.
> 
> Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
> ---
>  Documentation/filesystems/fiemap.rst | 3 ++-
>  fs/bcachefs/fs.c                     | 7 ++++---
>  fs/btrfs/extent_io.c                 | 4 ++--
>  fs/ext4/extents.c                    | 1 +
>  fs/f2fs/data.c                       | 8 +++++---
>  fs/f2fs/inline.c                     | 3 ++-
>  fs/ioctl.c                           | 9 +++++----
>  fs/iomap/fiemap.c                    | 2 +-
>  fs/nilfs2/inode.c                    | 6 +++---
>  fs/ntfs3/frecord.c                   | 7 ++++---
>  fs/ocfs2/extent_map.c                | 4 ++--
>  fs/smb/client/smb2ops.c              | 1 +
>  include/linux/fiemap.h               | 2 +-
>  13 files changed, 33 insertions(+), 24 deletions(-)
> 
...
> diff --git a/fs/ioctl.c b/fs/ioctl.c
> index 8afd32e1a27a..1830baca532b 100644
> --- a/fs/ioctl.c
> +++ b/fs/ioctl.c
> @@ -99,7 +99,8 @@ static int ioctl_fibmap(struct file *filp, int __user *p)
>   * @fieinfo:	Fiemap context passed into ->fiemap
>   * @logical:	Extent logical start offset, in bytes
>   * @phys:	Extent physical start offset, in bytes
> - * @len:	Extent length, in bytes
> + * @log_len:	Extent logical length, in bytes
> + * @phys_len:	Extent physical length, in bytes (optional)
>   * @flags:	FIEMAP_EXTENT flags that describe this extent
>   *
>   * Called from file system ->fiemap callback. Will populate extent
> @@ -110,7 +111,7 @@ static int ioctl_fibmap(struct file *filp, int __user *p)
>   * extent that will fit in user array.
>   */
>  int fiemap_fill_next_extent(struct fiemap_extent_info *fieinfo, u64 logical,
> -			    u64 phys, u64 len, u32 flags)
> +			    u64 phys, u64 log_len, u64 phys_len, u32 flags)
>  {
>  	struct fiemap_extent extent;
>  	struct fiemap_extent __user *dest = fieinfo->fi_extents_start;
> @@ -138,8 +139,8 @@ int fiemap_fill_next_extent(struct fiemap_extent_info *fieinfo, u64 logical,
>  	memset(&extent, 0, sizeof(extent));
>  	extent.fe_logical = logical;
>  	extent.fe_physical = phys;
> -	extent.fe_logical_length = len;
> -	extent.fe_physical_length = len;
> +	extent.fe_logical_length = log_len;
> +	extent.fe_physical_length = phys_len;

Another nit, but would it simplify things to let this helper set the
_HAS_PHYS_LEN flag on phys_len != 0 or something rather than require
callers to get it right?

Brian

>  	extent.fe_flags = flags;
>  
>  	dest += fieinfo->fi_extents_mapped;
> diff --git a/fs/iomap/fiemap.c b/fs/iomap/fiemap.c
> index 610ca6f1ec9b..013e843c8d10 100644
> --- a/fs/iomap/fiemap.c
> +++ b/fs/iomap/fiemap.c
> @@ -36,7 +36,7 @@ static int iomap_to_fiemap(struct fiemap_extent_info *fi,
>  
>  	return fiemap_fill_next_extent(fi, iomap->offset,
>  			iomap->addr != IOMAP_NULL_ADDR ? iomap->addr : 0,
> -			iomap->length, flags);
> +			iomap->length, 0, flags);
>  }
>  
>  static loff_t iomap_fiemap_iter(const struct iomap_iter *iter,
> diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
> index 7340a01d80e1..4d3c347c982b 100644
> --- a/fs/nilfs2/inode.c
> +++ b/fs/nilfs2/inode.c
> @@ -1190,7 +1190,7 @@ int nilfs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  			if (size) {
>  				/* End of the current extent */
>  				ret = fiemap_fill_next_extent(
> -					fieinfo, logical, phys, size, flags);
> +					fieinfo, logical, phys, size, 0, flags);
>  				if (ret)
>  					break;
>  			}
> @@ -1240,7 +1240,7 @@ int nilfs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  					flags |= FIEMAP_EXTENT_LAST;
>  
>  				ret = fiemap_fill_next_extent(
> -					fieinfo, logical, phys, size, flags);
> +					fieinfo, logical, phys, size, 0, flags);
>  				if (ret)
>  					break;
>  				size = 0;
> @@ -1256,7 +1256,7 @@ int nilfs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  					/* Terminate the current extent */
>  					ret = fiemap_fill_next_extent(
>  						fieinfo, logical, phys, size,
> -						flags);
> +						0, flags);
>  					if (ret || blkoff > end_blkoff)
>  						break;
>  
> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> index 7f27382e0ce2..ef0ed913428b 100644
> --- a/fs/ntfs3/frecord.c
> +++ b/fs/ntfs3/frecord.c
> @@ -1947,7 +1947,7 @@ int ni_fiemap(struct ntfs_inode *ni, struct fiemap_extent_info *fieinfo,
>  	if (!attr || !attr->non_res) {
>  		err = fiemap_fill_next_extent(
>  			fieinfo, 0, 0,
> -			attr ? le32_to_cpu(attr->res.data_size) : 0,
> +			attr ? le32_to_cpu(attr->res.data_size) : 0, 0,
>  			FIEMAP_EXTENT_DATA_INLINE | FIEMAP_EXTENT_LAST |
>  				FIEMAP_EXTENT_MERGED);
>  		goto out;
> @@ -2042,7 +2042,7 @@ int ni_fiemap(struct ntfs_inode *ni, struct fiemap_extent_info *fieinfo,
>  				flags |= FIEMAP_EXTENT_LAST;
>  
>  			err = fiemap_fill_next_extent(fieinfo, vbo, lbo, dlen,
> -						      flags);
> +						      0, flags);
>  			if (err < 0)
>  				break;
>  			if (err == 1) {
> @@ -2062,7 +2062,8 @@ int ni_fiemap(struct ntfs_inode *ni, struct fiemap_extent_info *fieinfo,
>  		if (vbo + bytes >= end)
>  			flags |= FIEMAP_EXTENT_LAST;
>  
> -		err = fiemap_fill_next_extent(fieinfo, vbo, lbo, bytes, flags);
> +		err = fiemap_fill_next_extent(fieinfo, vbo, lbo, bytes, 0,
> +					      flags);
>  		if (err < 0)
>  			break;
>  		if (err == 1) {
> diff --git a/fs/ocfs2/extent_map.c b/fs/ocfs2/extent_map.c
> index 70a768b623cf..eabdf97cd685 100644
> --- a/fs/ocfs2/extent_map.c
> +++ b/fs/ocfs2/extent_map.c
> @@ -723,7 +723,7 @@ static int ocfs2_fiemap_inline(struct inode *inode, struct buffer_head *di_bh,
>  					 id2.i_data.id_data);
>  
>  		ret = fiemap_fill_next_extent(fieinfo, 0, phys, id_count,
> -					      flags);
> +					      0, flags);
>  		if (ret < 0)
>  			return ret;
>  	}
> @@ -794,7 +794,7 @@ int ocfs2_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  		virt_bytes = (u64)le32_to_cpu(rec.e_cpos) << osb->s_clustersize_bits;
>  
>  		ret = fiemap_fill_next_extent(fieinfo, virt_bytes, phys_bytes,
> -					      len_bytes, fe_flags);
> +					      len_bytes, 0, fe_flags);
>  		if (ret)
>  			break;
>  
> diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
> index 87b63f6ad2e2..23a193512f96 100644
> --- a/fs/smb/client/smb2ops.c
> +++ b/fs/smb/client/smb2ops.c
> @@ -3779,6 +3779,7 @@ static int smb3_fiemap(struct cifs_tcon *tcon,
>  				le64_to_cpu(out_data[i].file_offset),
>  				le64_to_cpu(out_data[i].file_offset),
>  				le64_to_cpu(out_data[i].length),
> +				0,
>  				flags);
>  		if (rc < 0)
>  			goto out;
> diff --git a/include/linux/fiemap.h b/include/linux/fiemap.h
> index c50882f19235..17a6c32cdf3f 100644
> --- a/include/linux/fiemap.h
> +++ b/include/linux/fiemap.h
> @@ -16,6 +16,6 @@ struct fiemap_extent_info {
>  int fiemap_prep(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  		u64 start, u64 *len, u32 supported_flags);
>  int fiemap_fill_next_extent(struct fiemap_extent_info *info, u64 logical,
> -			    u64 phys, u64 len, u32 flags);
> +			    u64 phys, u64 log_len, u64 phys_len, u32 flags);
>  
>  #endif /* _LINUX_FIEMAP_H 1 */
> -- 
> 2.43.0
> 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
