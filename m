Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2354DB068A3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Jul 2025 23:36:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nvZ5LjSVaEwq0DWWAPkTv/ZV48A3nQ81GO64vidOag=; b=MupaincAiGIKZNB/CuQWIfzoE7
	hv6feX8RD6wO3/mvXKOv7cOP9pUWkxTI+21SzC5djG9K2edgU6D4lJ0AAnu6WiVXbin6pteRdRRnm
	ZSY4rHlMHn0ptVf/+gK704za1NfzvT5Uc/dckI8lC8or5grCYOWhiQYdeTxi1Sw4djCY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ubnK5-00030Y-Ha;
	Tue, 15 Jul 2025 21:36:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <boris@bur.io>) id 1ubnK3-00030F-Ap
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Jul 2025 21:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UYHWhle+vhSoss1fvdZ2btqEJcq1ge5i+HAEGBVMw8w=; b=ajNFAa5H288OWaEMEqY94ezbol
 Qmwkb6H3/zNkx2ytfl1WarN3IXdDtrXAUNwOYNZFRANk2lxoOQPUYwCp20Gvj9r/UVWOckwxJIRxa
 B/IpujsI1rgKJUb6LWbBw/nZ49NkyF5DYDj+Tb2B8c03l1ZR/OhaiBpR1LA6e6FA55NE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UYHWhle+vhSoss1fvdZ2btqEJcq1ge5i+HAEGBVMw8w=; b=dgTGxIjaaVTGLRPYNRJ1srqrfH
 nQ8L5EbKN+5k+KWDffH8GimQHuiT8itJmtyy8JFpm9n0frRloxyKytqmKZzIY4uGL2H49oClATh6b
 IAoKEXcUqROqDSwVaoSYVkm7nSh5PHtoebG5HchIXP7qPDOQmLDoJeysjs2Cru1wT2po=;
Received: from flow-b5-smtp.messagingengine.com ([202.12.124.140])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ubnK3-00049o-2K for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Jul 2025 21:36:24 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailflow.stl.internal (Postfix) with ESMTP id 62E9B1300E65;
 Tue, 15 Jul 2025 17:21:01 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-10.internal (MEProxy); Tue, 15 Jul 2025 17:21:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bur.io; h=cc:cc
 :content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm3; t=1752614461; x=1752621661; bh=UYHWhle+vh
 Soss1fvdZ2btqEJcq1ge5i+HAEGBVMw8w=; b=lRkCdsfVtMWMwLHZr39F7f/8mX
 921zmhadMTq7JcDH40jPOUA3zEj3R8hvQ31WXo8U+bDofR3ATiX4rwN3fcki5uL8
 IVnPSyWwglK5YOStOSWQGsJlswe1a/bgW4B6uDqK+n0gpg8LHvZFjWWUcG7ZIsD5
 DxuALrsh3O1VydYoDvs9AOccGag8gaCIl8ND1nBlAyE/w+1pho7we6cRkuD9WWhE
 xvf2bWjKL1ux0lIVVQDBG+eZ6QqsFwW0BaE/VyP+OkDaIWye4XLGehVLoILn5kDJ
 +xXs4v++Br2DKNV3PlvDZcRaf9VjLw6d6OD6ws8kKE331gCAlGxUn4d88x9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1752614461; x=1752621661; bh=UYHWhle+vhSoss1fvdZ2btqEJcq1ge5i+HA
 EGBVMw8w=; b=Ce9F+IH1uvDNbsSwJIOP/rG/i042S/gMBWsX56WO7ElW3Brcxmj
 c1JjYLwvXBU+k0VWWkBnSh50U7X4rUP8GAZWPiuGETvDoibxN2/HRM1Plm8bl8qY
 vu50j3amKiU4VMH4HzDgz05hzNo5aTorV31PNArsuFQBCWB6HMYcxYwQ+jobOedV
 NtLRKYyUhzppcTmuTu6k1K/7xHIEtx1/XKMnqfGHQQN6ixZ5iJGW4nMdFVcc4zMi
 eK+JRLEKsiUH6f6pZTdSS6m/cJmNYwKQ9XszzgDD598L05RWFPyW0ezHAewLufF9
 C1jEE3fzp1bmaBf72mOvXoP8C7TURS3nvUw==
X-ME-Sender: <xms:O8Z2aBb2o3WSeJkNDpvVK_1CfhO4HXwOqnefRuxSnSagyMaVbJ7BrQ>
 <xme:O8Z2aGPom1oJq26vkt0eDfcvv5b9IgnfKOZSLKeR1XIUY2ArbYSHbT7-Yl8HRO6Pg
 CPMcXGd7bN_Xioq4Do>
X-ME-Received: <xmr:O8Z2aE1jUd0BIG6M25PzLxIX8T39DGUUxYmmeFZKMyQVOs9BWD3JTG-OHP0aibjjwSIvQ21iW1vsIlJSisds4TExpqs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehheeklecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhrihhsuceu
 uhhrkhhovhcuoegsohhrihhssegsuhhrrdhioheqnecuggftrfgrthhtvghrnhepkedvke
 ffjeellefhveehvdejudfhjedthfdvveeiieeiudfguefgtdejgfefleejnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghorhhishessghurh
 drihhopdhnsggprhgtphhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
 ohepfihilhhlhiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegtlhhmsehfsg
 drtghomhdprhgtphhtthhopehjohhsvghfsehtohigihgtphgrnhgurgdrtghomhdprhgt
 phhtthhopegushhtvghrsggrsehsuhhsvgdrtghomhdprhgtphhtthhopehlihhnuhigqd
 gsthhrfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitghosehf
 lhhugihnihgtrdhnvghtpdhrtghpthhtohepgihirghngheskhgvrhhnvghlrdhorhhgpd
 hrtghpthhtoheptghhrghosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
 qdgvrhhofhhssehlihhsthhsrdhoiihlrggsshdrohhrgh
X-ME-Proxy: <xmx:O8Z2aKl8sgIcZ83waB3ooxuEhOSaVUsZcdWFiIg6hl8aj7u3eVSUsg>
 <xmx:O8Z2aC6he-On3LWoKqy9AnQ59r2GaSw5CGT9VR3Z3zM5QWA25DXqJA>
 <xmx:O8Z2aLnJYp_POSGdFf9OLum21MHWKvZ7zEj6d5IqEt_FNGLQPwIRKA>
 <xmx:O8Z2aMRfslUUz8n58RzMU71E6Do8GJBcqd7ZWglxBBPvoJasm0MSFw>
 <xmx:PcZ2aBt1WhpTWdR5pXv9pupYXwxThC7C0L11zr9gt1KsmEnOtMWynpYe>
Feedback-ID: i083147f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Jul 2025 17:20:58 -0400 (EDT)
Date: Tue, 15 Jul 2025 14:22:33 -0700
From: Boris Burkov <boris@bur.io>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20250715212233.GA1680311@zen.localdomain>
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aHa8ylTh0DGEQklt@casper.infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jul 15, 2025 at 09:40:42PM +0100,
 Matthew Wilcox wrote:
 > I've started looking at how the page cache can help filesystems handle
 > compressed data better. Feedback would be appreciated! I'll p [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1ubnK3-00049o-2K
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
Cc: Jan Kara <jack@suse.cz>, Paulo Alcantara <pc@manguebit.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
 linux-cifs@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Gao Xiang <xiang@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Phillip Lougher <phillip@squashfs.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Howells <dhowells@redhat.com>,
 Nicolas Pitre <nico@fluxnic.net>, David Woodhouse <dwmw2@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 15, 2025 at 09:40:42PM +0100, Matthew Wilcox wrote:
> I've started looking at how the page cache can help filesystems handle
> compressed data better.  Feedback would be appreciated!  I'll probably
> say a few things which are obvious to anyone who knows how compressed
> files work, but I'm trying to be explicit about my assumptions.
> 
> First, I believe that all filesystems work by compressing fixed-size
> plaintext into variable-sized compressed blocks.  This would be a good
> point to stop reading and tell me about counterexamples.

As far as I know, btrfs with zstd does not used fixed size plaintext. I
am going off the btrfs logic itself, not the zstd internals which I am
sadly ignorant of. We are using the streaming interface for whatever
that is worth.

Through the following callpath, the len is piped from the async_chunk\
through to zstd via the slightly weirdly named total_out parameter:

compress_file_range()
  btrfs_compress_folios()
    compression_compress_pages()
      zstd_compress_folios()
        zstd_get_btrfs_parameters() // passes len
        zstd_init_cstream() // passes len
        for-each-folio:
          zstd_compress_stream() // last folio is truncated if short
  
# bpftrace to check the size in the zstd callsite
$ sudo bpftrace -e 'fentry:zstd_init_cstream {printf("%llu\n", args.pledged_src_size);}'
Attaching 1 probe...
76800

# diff terminal, write a compressed extent with a weird source size
$ sudo dd if=/dev/zero of=/mnt/lol/foo bs=75k count=1

We do operate in terms of folios for calling zstd_compress_stream, so
that can be thought of as a fixed size plaintext block, but even so, we
pass in a short block for the last one:
$ sudo bpftrace -e 'fentry:zstd_compress_stream {printf("%llu\n", args.input->size);}'
Attaching 1 probe...
4096
4096
4096
4096
4096
4096
4096
4096
4096
4096
4096
4096
4096
4096
4096
4096
4096
4096
3072

> 
> From what I've been reading in all your filesystems is that you want to
> allocate extra pages in the page cache in order to store the excess data
> retrieved along with the page that you're actually trying to read.  That's
> because compressing in larger chunks leads to better compression.
> 
> There's some discrepancy between filesystems whether you need scratch
> space for decompression.  Some filesystems read the compressed data into
> the pagecache and decompress in-place, while other filesystems read the
> compressed data into scratch pages and decompress into the page cache.
> 
> There also seems to be some discrepancy between filesystems whether the
> decompression involves vmap() of all the memory allocated or whether the
> decompression routines can handle doing kmap_local() on individual pages.
> 
> So, my proposal is that filesystems tell the page cache that their minimum
> folio size is the compression block size.  That seems to be around 64k,

btrfs has a max uncompressed extent size of 128K, for what it's worth.
In practice, many compressed files are comprised of a large number of
compressed extents each representing a 128k plaintext extent.

Not sure if that is exactly the constant you are concerned with here, or
if it refutes your idea in any way, just figured I would mention it as
well.

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


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
