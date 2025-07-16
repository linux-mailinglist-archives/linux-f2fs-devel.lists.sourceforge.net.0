Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CA0B080C1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Jul 2025 00:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OCajIFscO0K4Tnce00wdBx1CpWQP0c4Z3w5Nu0eGUU=; b=fU8MosAnk1EAInnucL4M6HaICk
	iUTHQdM4NZHvOBuyNwLbvxM+IRGyKC6AMwOdqzATaAh7eOBKr4sV9h9SWPa4LjKECEtS+VRFoVlnk
	Scji4M8JITPnzO4xhk/PPUWPrkt3c0PYEcqiVO9YjIZbJbpsxCD9c07ElGFbKpkOgkAU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ucB4D-0003KR-Gc;
	Wed, 16 Jul 2025 22:57:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phillip@squashfs.org.uk>) id 1ucB4C-0003KL-8w
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Jul 2025 22:57:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LXw6ldY+YQgvzasUoEe9Ha+WGxfEFTQd/LtLVKR9rZI=; b=M0q0wNpchglAFUNPkGOjkMlkWW
 EwQU1DC6r8Mt+qaeOSC8nizWoE3l+ynPXttw7f9TFFn3YUCfPb/QNm8JPlY0CsSZ/bnDhov4bX2Pg
 /HveJISjrojUITIojiW9OBTbUI9iTMdligiGU+fjNdlvpCHzhU0FdBBiSBeH4P0GC2rE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LXw6ldY+YQgvzasUoEe9Ha+WGxfEFTQd/LtLVKR9rZI=; b=gaDEDRlx0BWOAHbFwln6O9w1hW
 +1vOOdEgkWcECTKZllPXoQ5srszTH0YoQDqOhM1C2pNn5tgri0KcnogEk1E7F6pkMsh8D5Ef4G15j
 yoYLY3rb/Gz8O6HiESyBYHjhrNv5yntdxcv/+mXPOvjpyb/UeUSyw5tFDJMSrkads+fg=;
Received: from sxb1plsmtpa01-04.prod.sxb1.secureserver.net ([92.204.81.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ucB4C-00075r-G6 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Jul 2025 22:57:36 +0000
Received: from [192.168.178.95] ([82.69.79.175]) by :SMTPAUTH: with ESMTPSA
 id cAlKuoVr96J4FcAlNu4Dmt; Wed, 16 Jul 2025 15:38:10 -0700
X-CMAE-Analysis: v=2.4 cv=TYmWtQQh c=1 sm=1 tr=0 ts=687829d2
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=IkcTkHD0fZMA:10 a=Z9je9KOXq8erZ9ix0VAA:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Message-ID: <f4b9faf9-8efd-4396-b080-e712025825ab@squashfs.org.uk>
Date: Wed, 16 Jul 2025 23:37:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 linux-btrfs@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-erofs@lists.ozlabs.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Howells <dhowells@redhat.com>, netfs@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, Steve French <sfrench@samba.org>,
 linux-cifs@vger.kernel.org
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
Content-Language: en-US
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <aHa8ylTh0DGEQklt@casper.infradead.org>
X-CMAE-Envelope: MS4xfF7PhqfDTvf0GLbE+ZqPgfM1AhwOJlHSpsMzx6XOcDZuT9YqsTaq8QVlGaLYbZSCACkmupuX6+moDnsLw8z6oXo/oW+NBiLgU6y5TBJWXg6tV88e5Euj
 1giZ2fZsoopVdzm/v4Tlp3z0KvSwDUxO6m0SnvjOtH9zvReYNZLA2FNMM+DrFEJFaiIkCvRrmoBmbv4h3OnUHX5sclo1/Wezm+BEj6dLaDXAyuKVHku8Kvy6
 3A9SkS3ZtrCtIQcuDoAamTotabkyq8u+NbETcu+wgZcHz79D2Cqa4hBUqSAxUGPLdjqjvKdz0Y+w0IVDS3aE1LUKcnIDytVIxDas6bwTbJD2/Yz7PsjwtKtl
 JoRL1DOXscuVOLxBvw+0xQnpDotzu0Vo1GrTRn1rfHJKD4Exmb3wOCyCD+h2AYMKaGBCjBVgXvf5G6DK3/s3MVbkLRjH09uolqpyyQAsKggrC2Moa3qwKWia
 tBwCIdLZWPpQOFc2HOlLjv7vmcMVwr97TODyoKXcYSBdRG5Aj19H80t7Vc1kPbVELOFd5EDHNfQ8ATDugkZBq2J/V21dERsOluc2pak7RNmbJyOzrPcIwalB
 Nf6fEekDRHicDoV2q2tew6sPotWewTjdjMw9iwbRhZpamiZqsp/XI9f5XhZcOQoUdsCy/ey/U995vHBeMMo6H0yRk9BNVCMpINAVKCtQmjIv7xNp+Ioo2Sxs
 gPnTBcUD++qhM8KfplNiTcJXoQ96eTIssdBe+BMWUXv1qhpWQ9GKojXGcX8mKMvEG7sKSgFMNrc3J5Xm28GieZWCzy/+ZDv2I7VwecP2j5T1w/WLBfHEUgk5
 gufg4AqEMh/tWtnL4rvSfpFcA6zbEUbuBjvPEzIYLlyjogb7n+266BU1vQZO72XCtgIJOh/KDHsuteA4LS7mxuWjWepHBR+R1mjV5Mwu
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 15/07/2025 21:40, Matthew Wilcox wrote: > I've started
 looking at how the page cache can help filesystems handle > compressed data
 better. Feedback would be appreciated! I'll probably > say a few t [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1ucB4C-00075r-G6
Subject: Re: [f2fs-dev] Compressed files & the page cache
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 15/07/2025 21:40, Matthew Wilcox wrote:
> I've started looking at how the page cache can help filesystems handle
> compressed data better.  Feedback would be appreciated!  I'll probably
> say a few things which are obvious to anyone who knows how compressed
> files work, but I'm trying to be explicit about my assumptions.
> 
> First, I believe that all filesystems work by compressing fixed-size
> plaintext into variable-sized compressed blocks.  This would be a good
> point to stop reading and tell me about counterexamples.

For Squashfs Yes.

> 
>>From what I've been reading in all your filesystems is that you want to
> allocate extra pages in the page cache in order to store the excess data
> retrieved along with the page that you're actually trying to read.  That's
> because compressing in larger chunks leads to better compression.
> 

Yes.

> There's some discrepancy between filesystems whether you need scratch
> space for decompression.  Some filesystems read the compressed data into
> the pagecache and decompress in-place, while other filesystems read the
> compressed data into scratch pages and decompress into the page cache.
> 

Squashfs uses scratch pages.

> There also seems to be some discrepancy between filesystems whether the
> decompression involves vmap() of all the memory allocated or whether the
> decompression routines can handle doing kmap_local() on individual pages.
> 

Squashfs does both, and this depends on whether the decompression
algorithm implementation in the kernel is multi-shot or single-shot.

The zlib/xz/zstd decompressors are multi-shot, in that you can call them
multiply, giving them an extra input or output buffer when it runs out.
This means you can get them to output into a 4K page at a time, without
requiring the pages to be contiguous.  kmap_local() can be called on each
page before passing it to the decompressor.

The lzo/lz4 decompressors are single-shot, they expect to be called once,
with a single contiguous input buffer containing the data to be
decompressed, and a single contiguous output buffer large enough to hold
all the uncompressed data.

> So, my proposal is that filesystems tell the page cache that their minimum
> folio size is the compression block size.  That seems to be around 64k,
> so not an unreasonable minimum allocation size.  That removes all the
> extra code in filesystems to allocate extra memory in the page cache.
> It means we don't attempt to track dirtiness at a sub-folio granularity
> (there's no point, we have to write back the entire compressed bock
> at once).  We also get a single virtually contiguous block ... if you're
> willing to ditch HIGHMEM support.  Or there's a proposal to introduce a
> vmap_file() which would give us a virtually contiguous chunk of memory
> (and could be trivially turned into a noop for the case of trying to
> vmap a single large folio).
> 

The compression block size in Squashfs can be 4K to 1M in size.

Phillip


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
