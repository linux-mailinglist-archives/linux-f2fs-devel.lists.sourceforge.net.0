Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C4678A1E3
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 27 Aug 2023 23:33:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qaNNa-0006sI-T7;
	Sun, 27 Aug 2023 21:33:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1qaNNZ-0006sB-Qd
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Aug 2023 21:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/6hpsLsV03ieW4vELbhOk4pxiCIUuyn6Bpw1V8QuWjA=; b=Me8MofQy9/7ZQHf8Yjbc3K7KJv
 VwVn1lvqHN5ZoiWjvkiEpCBTjTzwhKUbsY+sEweymtRVMggbKFQ2ZVwMDKIwo3LandLhxbcbTnAaY
 C7NuEnkPeOn/f2qdyPUKkqsyXCrMI7KCc2vIUA9km68tXMZoq0JviY6SGxLm4y6+Lj2I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/6hpsLsV03ieW4vELbhOk4pxiCIUuyn6Bpw1V8QuWjA=; b=BRgSdJAWFN69Gqto6BrkBP1h+o
 W9KC7tZ0hxWS1Ts5lFfCCBUaz66yd9cElYI+q6531zXKqv/sIk3BsFc7O7zsmcjQydMnjaifvFa+D
 LBigAv7DzkmfOX1W7fQfJcrXv12mXgsEG/kY7vWGG9aHSgiHsbH6H9NAUtWO7RbVJQxY=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qaNNV-00HNMF-Pi for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Aug 2023 21:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/6hpsLsV03ieW4vELbhOk4pxiCIUuyn6Bpw1V8QuWjA=; b=vTYL9F6nmyMC1z4vgUQ57UMuze
 c8bgt9vFOKWzPspRsbeTFLgLHz/hKRnLtd9UWTyKshqJF7eN4C3F+EMjcufK9pmtU6JnMc8dQv1Vt
 5InC4HIkUznFa/hnNRczUUX7xHbrfZD4svYR9Kg0wslB46dSko8l2iAdkLRH/H5iWuiyt8iN5XazN
 QityxWl2yb3p6DSle3T84m2jiGMPG15FtuhdmZtjHlUbcKD8n1NBcGDOexBbj8JBeLDTA1BEKmInL
 888FPoRnfrZ00U1GiFcxw/e4IZGsn0ijlmA9d45AXC5VifFlQ9hZQtQ/XxGEdq6/5qdn+lFw1Ut3Y
 +YmC6jBQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qaNMq-00DvXM-Sy; Sun, 27 Aug 2023 21:32:21 +0000
Date: Sun, 27 Aug 2023 22:32:20 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZOvA5DJDZN0FRymp@casper.infradead.org>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-8-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827132835.1373581-8-hao.xu@linux.dev>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Aug 27, 2023 at 09:28:31PM +0800, Hao Xu wrote: >
 From: Hao Xu <howeyxu@tencent.com> > > Add a boolean parameter for
 file_accessed()
 to support nowait semantics. > Currently it is true only wi [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1qaNNV-00HNMF-Pi
Subject: Re: [f2fs-dev] [PATCH 07/11] vfs: add nowait parameter for
 file_accessed()
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org,
 Pavel Begunkov <asml.silence@gmail.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Aug 27, 2023 at 09:28:31PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> Add a boolean parameter for file_accessed() to support nowait semantics.
> Currently it is true only with io_uring as its initial caller.

So why do we need to do this as part of this series?  Apparently it
hasn't caused any problems for filemap_read().

> +++ b/mm/filemap.c
> @@ -2723,7 +2723,7 @@ ssize_t filemap_read(struct kiocb *iocb, struct iov_iter *iter,
>  		folio_batch_init(&fbatch);
>  	} while (iov_iter_count(iter) && iocb->ki_pos < isize && !error);
>  
> -	file_accessed(filp);
> +	file_accessed(filp, false);
>  
>  	return already_read ? already_read : error;
>  }
> @@ -2809,7 +2809,7 @@ generic_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
>  		retval = kiocb_write_and_wait(iocb, count);
>  		if (retval < 0)
>  			return retval;
> -		file_accessed(file);
> +		file_accessed(file, false);
>  
>  		retval = mapping->a_ops->direct_IO(iocb, iter);
>  		if (retval >= 0) {
> @@ -2978,7 +2978,7 @@ ssize_t filemap_splice_read(struct file *in, loff_t *ppos,
>  
>  out:
>  	folio_batch_release(&fbatch);
> -	file_accessed(in);
> +	file_accessed(in, false);
>  
>  	return total_spliced ? total_spliced : error;
>  }


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
