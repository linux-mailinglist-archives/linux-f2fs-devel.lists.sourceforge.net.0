Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EB270B25F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 May 2023 02:17:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q0tEX-0003IA-VN;
	Mon, 22 May 2023 00:17:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1q0tEX-0003I4-1i
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 May 2023 00:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BI96jBpMNhYORRa/BJuhrUinBsb8UIUmPFVsaftuGrc=; b=XRnRJeIDfwG/psRhnEUsSaO/dj
 SlBoU2vGY4dWE7edTarB0oDoeVElwbbsEplq0eTNV5xNOdZlqTId2QH41kobSOvTbGvAGrjRfuk4c
 rIxzsqMgOA8rz/9SrSZSmRHVpJJkIXuvVRE3fryLjzbsAfSOb1SQIbi3VBcp5iJaZTBk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BI96jBpMNhYORRa/BJuhrUinBsb8UIUmPFVsaftuGrc=; b=Ea8SnIG6UK4AVsKILIe5g426Uj
 eRPWxBkGIM9iKLZJqpPqdsGKKBsYaKG2bMHoWOO+vQG8mG3p+JWqROjomG5fVP+A4biXsoT3XR8WL
 gMIj1wekcbjHQiKZD4VZ36oO172ZSQO6kusrRSJdBMw0I44WMq/5YzEUu8TnH8kPV2Ek=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q0tEW-00FIGv-Dz for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 May 2023 00:17:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA56060EBD;
 Mon, 22 May 2023 00:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4DBC433D2;
 Mon, 22 May 2023 00:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684714618;
 bh=pynMqTKclwPIt+cST9RZwiWCLVo4HSNzTZHy4TzJIsc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BXAriNGxpa+JuaO2vxwOc9RNJOKNUssZmct2fcZwWAWp3X0h0H6VbL8sSHwWS4Nlz
 4FFrrfLZBOK1xbCl0c1T84fG3aCpvtIPLwDvQzrlNxDwJfLv9BoGEpX1hZmWMVH90/
 dCZXRY3nh+vkQyvlEnLs3BwteEN+wNZb3bwJHXJ1Wh6zmCmoh60OUOzjMfheU+87DF
 MtWTLuia8tNf1tD4dLRjHDec5dxMHfNkmfksktoiwmUe4k2hWaELWrz+GqPuNs9Zw5
 8kiY+kVYzuuVS7cmiIzONousu4OZfEQyxVy6h9qY1nQPLDSUdpM78qRyPx4NabhlFy
 D6sDWIqYSxOIw==
Message-ID: <c989fa29-3e5e-e367-8d79-2bf10758dff3@kernel.org>
Date: Mon, 22 May 2023 09:16:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>
References: <20230519093521.133226-1-hch@lst.de>
 <20230519093521.133226-11-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20230519093521.133226-11-hch@lst.de>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/19/23 18:35, Christoph Hellwig wrote: > Add a helper
 dealing with handling the syncing of a buffered write fallback > for direct
 I/O. > > Signed-off-by: Christoph Hellwig <hch@lst.de> Looks OK. One comment
 below. Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q0tEW-00FIGv-Dz
Subject: Re: [f2fs-dev] [PATCH 10/13] fs: factor out a direct_write_fallback
 helper
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
 linux-block@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/19/23 18:35, Christoph Hellwig wrote:
> Add a helper dealing with handling the syncing of a buffered write fallback
> for direct I/O.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks OK. One comment below.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

> +	/*
> +	 * We need to ensure that the page cache pages are written to disk and
> +	 * invalidated to preserve the expected O_DIRECT semantics.
> +	 */
> +	end = pos + buffered_written - 1;
> +	err = filemap_write_and_wait_range(mapping, pos, end);
> +	if (err < 0) {
> +		/*
> +		 * We don't know how much we wrote, so just return the number of
> +		 * bytes which were direct-written
> +		 */
> +		return err;
> +	}
> +	invalidate_mapping_pages(mapping, pos >> PAGE_SHIFT, end >> PAGE_SHIFT);
> +	return direct_written + buffered_written;

Why not adding here something like:

	if (buffered_written != iov_iter_count(from))
		return -EIO;

	return direct_written + buffered_written;

to have the same semantic as plain DIO ?

-- 
Damien Le Moal
Western Digital Research



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
