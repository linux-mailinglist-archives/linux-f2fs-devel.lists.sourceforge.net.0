Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 274B670B320
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 May 2023 04:21:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q0vB7-0004tt-Eh;
	Mon, 22 May 2023 02:21:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <xiubli@redhat.com>) id 1q0vAz-0004tI-5e
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 May 2023 02:21:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pl1j2Mo02M1sQGfGs/DUFoRb8smUY2ZG1V4PFyySeOU=; b=YbmmLAkpmrXAWqk33OiuDfscTR
 NuTNktS095CjwBRK4UjcE7Iu4rKcFpNWHu1eLDMdW7xweoceaGU0nBP9i8NWDCMIp3qDZWWioh73K
 QGFraZ/Id/o2RGNTe+1pFdQd/WrnGrozoWgL5C9cB/HMLhUOugS2paSXpnAlx2cfWoWw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pl1j2Mo02M1sQGfGs/DUFoRb8smUY2ZG1V4PFyySeOU=; b=Y8Xzv5KmKPlDSc1hiXq8pLkM4l
 U85+yVyjeOPwHWpFUW0y1TeggteHHBVTnhhJEajZ0H5hgWuSy2B21xFdZiBHvqPDPc7nHhKzF5hi+
 BrAWL3T8aGbJO5r0bfZEfx3UfeUb+q/MH+PG96fMR1r+UWSFRON8fmwMdyxzDwepwRp0=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q0vAq-00FM11-2X for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 May 2023 02:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684722077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pl1j2Mo02M1sQGfGs/DUFoRb8smUY2ZG1V4PFyySeOU=;
 b=CharcndSSi8tqx5PZkuK1KOekq7kbzSzA6osZD3pRk88r+1YJzhqO1GqR9Go6P8cDviE1L
 iUKmN4MjI6tmFjF5g8v6b82ytpJ+yz2BqWUgkD/HlWZegIwLNo+/Uyodix69SlsV6wIHj5
 9lFPvlrzHryVm2MKUKAxBsJSLRPr6jg=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-dXxH2bOsPserIRnJxz79nQ-1; Sun, 21 May 2023 22:21:11 -0400
X-MC-Unique: dXxH2bOsPserIRnJxz79nQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-51b49840df8so2969992a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 21 May 2023 19:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684722070; x=1687314070;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pl1j2Mo02M1sQGfGs/DUFoRb8smUY2ZG1V4PFyySeOU=;
 b=Q3LRuBTcHE7wynwXJ8XagHT2hJqmF+4S9t8M3w/czBb92oW5dpykc/SL3XjTUWx38r
 uc//CBLRmlgoWD8cSMEqCtnpVJEaZUe7MRWtoYkypAg8Am/d8zMA1EeiDDNpHhki2F4F
 TPViqh2NNTvNpUOlZNcF0ZAqG/E+phNtQk8PuQ59HecyRCxgURFrxUsf0gN+k9MYAp5t
 jyWoIIAYxTIfB0XBjWoatE6yfWlDNWZngEMYZbGFjfFLGFzml2vPs59i8aEISFlkzP+q
 tpu1c+0WJ7Kg3HUvkSKYyKOkL4aEZFVuEFP1VSDo/HPRWCJdLG7ww2Yqfm4D62iyNWZY
 g1Cg==
X-Gm-Message-State: AC+VfDzQWUcSuZgmQ7JrXdT+M+uf3YT5R9btP/P2fsc25YSY+KZCa8kc
 PWX0VN60YCzJhyt3RQXGCfaroIJPJsrt8o6U7N9ulkhSPojlsEUhJ3AspksvUMwDdeTZVN8pUo8
 m9RN4UXyzilDHkTo+scadaxoEwvYhGS7vqqEgXg==
X-Received: by 2002:a17:902:ab14:b0:1ac:71a7:a1fb with SMTP id
 ik20-20020a170902ab1400b001ac71a7a1fbmr9172999plb.18.1684722070539; 
 Sun, 21 May 2023 19:21:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5vgpUHg5KMr5fvVKnKuCGiBu82Kta1T/m+fZ4YXIOR/n75V5hEd2a8qnobD9FuM9h7/ryidw==
X-Received: by 2002:a17:902:ab14:b0:1ac:71a7:a1fb with SMTP id
 ik20-20020a170902ab1400b001ac71a7a1fbmr9172986plb.18.1684722070171; 
 Sun, 21 May 2023 19:21:10 -0700 (PDT)
Received: from [10.72.12.68] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 az8-20020a170902a58800b001ae44cd96besm3520183plb.135.2023.05.21.19.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 May 2023 19:21:08 -0700 (PDT)
Message-ID: <745e2a68-ed19-dc3d-803a-a7d1d47903dd@redhat.com>
Date: Mon, 22 May 2023 10:20:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>
References: <20230519093521.133226-1-hch@lst.de>
 <20230519093521.133226-3-hch@lst.de>
From: Xiubo Li <xiubli@redhat.com>
In-Reply-To: <20230519093521.133226-3-hch@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/19/23 17:35, Christoph Hellwig wrote: > All callers of
 generic_perform_write need to updated ki_pos, move it into > common code.
 > > Signed-off-by: Christoph Hellwig <hch@lst.de> > --- > fs/ceph/ [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q0vAq-00FM11-2X
Subject: Re: [f2fs-dev] [PATCH 02/13] filemap: update ki_pos in
 generic_perform_write
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 5/19/23 17:35, Christoph Hellwig wrote:
> All callers of generic_perform_write need to updated ki_pos, move it into
> common code.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   fs/ceph/file.c | 2 --
>   fs/ext4/file.c | 9 +++------
>   fs/f2fs/file.c | 1 -
>   fs/nfs/file.c  | 1 -
>   mm/filemap.c   | 8 ++++----
>   5 files changed, 7 insertions(+), 14 deletions(-)
>
> diff --git a/fs/ceph/file.c b/fs/ceph/file.c
> index f4d8bf7dec88a8..feeb9882ef635a 100644
> --- a/fs/ceph/file.c
> +++ b/fs/ceph/file.c
> @@ -1894,8 +1894,6 @@ static ssize_t ceph_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   		 * can not run at the same time
>   		 */
>   		written = generic_perform_write(iocb, from);
> -		if (likely(written >= 0))
> -			iocb->ki_pos = pos + written;
>   		ceph_end_io_write(inode);
>   	}
>   
> diff --git a/fs/ext4/file.c b/fs/ext4/file.c
> index d101b3b0c7dad8..50824831d31def 100644
> --- a/fs/ext4/file.c
> +++ b/fs/ext4/file.c
> @@ -291,12 +291,9 @@ static ssize_t ext4_buffered_write_iter(struct kiocb *iocb,
>   
>   out:
>   	inode_unlock(inode);
> -	if (likely(ret > 0)) {
> -		iocb->ki_pos += ret;
> -		ret = generic_write_sync(iocb, ret);
> -	}
> -
> -	return ret;
> +	if (unlikely(ret <= 0))
> +		return ret;
> +	return generic_write_sync(iocb, ret);
>   }
>   
>   static ssize_t ext4_handle_inode_extension(struct inode *inode, loff_t offset,
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 5ac53d2627d20d..9e3855e43a7a63 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4522,7 +4522,6 @@ static ssize_t f2fs_buffered_write_iter(struct kiocb *iocb,
>   	current->backing_dev_info = NULL;
>   
>   	if (ret > 0) {
> -		iocb->ki_pos += ret;
>   		f2fs_update_iostat(F2FS_I_SB(inode), inode,
>   						APP_BUFFERED_IO, ret);
>   	}
> diff --git a/fs/nfs/file.c b/fs/nfs/file.c
> index f0edf5a36237d1..3cc87ae8473356 100644
> --- a/fs/nfs/file.c
> +++ b/fs/nfs/file.c
> @@ -658,7 +658,6 @@ ssize_t nfs_file_write(struct kiocb *iocb, struct iov_iter *from)
>   		goto out;
>   
>   	written = result;
> -	iocb->ki_pos += written;
>   	nfs_add_stats(inode, NFSIOS_NORMALWRITTENBYTES, written);
>   
>   	if (mntflags & NFS_MOUNT_WRITE_EAGER) {
> diff --git a/mm/filemap.c b/mm/filemap.c
> index b4c9bd368b7e58..4d0ec2fa1c7070 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3957,7 +3957,10 @@ ssize_t generic_perform_write(struct kiocb *iocb, struct iov_iter *i)
>   		balance_dirty_pages_ratelimited(mapping);
>   	} while (iov_iter_count(i));
>   
> -	return written ? written : status;
> +	if (!written)
> +		return status;
> +	iocb->ki_pos += written;
> +	return written;
>   }
>   EXPORT_SYMBOL(generic_perform_write);
>   
> @@ -4036,7 +4039,6 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   		endbyte = pos + status - 1;
>   		err = filemap_write_and_wait_range(mapping, pos, endbyte);
>   		if (err == 0) {
> -			iocb->ki_pos = endbyte + 1;
>   			written += status;
>   			invalidate_mapping_pages(mapping,
>   						 pos >> PAGE_SHIFT,
> @@ -4049,8 +4051,6 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   		}
>   	} else {
>   		written = generic_perform_write(iocb, from);
> -		if (likely(written > 0))
> -			iocb->ki_pos += written;
>   	}
>   out:
>   	current->backing_dev_info = NULL;

LGTM.

Reviewed-by: Xiubo Li <xiubli@redhat.com>

Thanks

- Xiubo




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
