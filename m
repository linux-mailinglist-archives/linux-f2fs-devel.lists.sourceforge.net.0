Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7210B06A0E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Jul 2025 01:48:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGBMWHYjGHIzpFo7hv+QcQl4fq3dz/nI29puOiNX9PQ=; b=S0pXvTLJ4DkKEowQpKEVmo4WMc
	KIqGgCUEHTP1xJeH2DjVKO9eQg9ipxJy21f/iXxgjPyKDi2kRSG0ISdy3bj8XPd7haRijFq1268ag
	mtOhA6TYAWQTZ/lB8TRwzYyAzH/LwWD5JeQabHBmqyo5+otQta8JtVIpTgZBQO1Fl0kg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ubpNJ-0001xJ-LE;
	Tue, 15 Jul 2025 23:47:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hsiangkao@linux.alibaba.com>) id 1ubpNH-0001xC-PF
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Jul 2025 23:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nUy4PEMS4CazYHiywIu/1adtHnlC3QRDbiuwxgypLnQ=; b=W6pdDcEgaTSkVtaSOtGjXDKqHF
 wIOhgXYosZc2U6xVa5fi40NT9V7P3rC/r5Gt5iv26whTP6CcuFPDVLTQj1yXJ+Iw3zOk1Ph+HWW5V
 Gc1YJ2O0lMMq29Xq3jeoqa3oAWYE2eKxe1DPirhaPTPLRrN/3QyeN+0xQvpOEQS9Lt9Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nUy4PEMS4CazYHiywIu/1adtHnlC3QRDbiuwxgypLnQ=; b=NpppTNQ0gc0irSNLMOuHo24Mat
 XbNY3te/aKGMieagfV7NchaWHunhyIOiaD1zcLq9RVcBotsmPvI69eBIm+0IdhkTl+91SvNS7Ey7W
 yne2gNRiQk+qBiwj14lVqx4IVowI9c5JL0MaNKNvmDGvVvDAQoK7A2MDDoVUTd/2Af8g=;
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ubpNG-0001vA-Tm for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Jul 2025 23:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1752623264; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 bh=nUy4PEMS4CazYHiywIu/1adtHnlC3QRDbiuwxgypLnQ=;
 b=KG9JueQ2QKlTjHmFYQq42zH7xjY3r6YXEUvEUjycZn5fO90MpjOjwL2UY2hbbHRSoDrNxwN+VL132oZOEa69+rsik1rWDyEoi++HETlcQb6RAK+9qo6bqboIZZyzPESUpw5OPYYUoMi/WtuaDHa0c8Erby98enbScMZoBdR/juk=
Received: from 30.170.233.0(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0Wj1gQiN_1752622331 cluster:ay36) by smtp.aliyun-inc.com;
 Wed, 16 Jul 2025 07:32:12 +0800
Message-ID: <e5165052-ead3-47f4-88f6-84eb23dc34df@linux.alibaba.com>
Date: Wed, 16 Jul 2025 07:32:10 +0800
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
 linux-cifs@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Hailong Liu <hailong.liu@oppo.com>, Barry Song <21cnbao@gmail.com>
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <aHa8ylTh0DGEQklt@casper.infradead.org>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Matthew, On 2025/7/16 04:40, Matthew Wilcox wrote: > I've
 started looking at how the page cache can help filesystems handle > compressed
 data better. Feedback would be appreciated! I'll probably > say a few th
 [...] Content analysis details:   (-7.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1ubpNG-0001vA-Tm
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

Hi Matthew,

On 2025/7/16 04:40, Matthew Wilcox wrote:
> I've started looking at how the page cache can help filesystems handle
> compressed data better.  Feedback would be appreciated!  I'll probably
> say a few things which are obvious to anyone who knows how compressed
> files work, but I'm trying to be explicit about my assumptions.
> 
> First, I believe that all filesystems work by compressing fixed-size
> plaintext into variable-sized compressed blocks.  This would be a good
> point to stop reading and tell me about counterexamples.

At least the typical EROFS compresses variable-sized plaintext (at least
one block, e.g. 4k, but also 4k+1, 4k+2, ...) into fixed-sized compressed
blocks for efficient I/Os, which is really useful for small compression
granularity (e.g. 4KiB, 8KiB) because use cases like Android are usually
under memory pressure so large compression granularity is almost
unacceptable in the low memory scenarios, see:
https://erofs.docs.kernel.org/en/latest/design.html

Currently EROFS works pretty well on these devices and has been
successfully deployed in billions of real devices.

> 
>  From what I've been reading in all your filesystems is that you want to
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
> so not an unreasonable minimum allocation size.  That removes all the
> extra code in filesystems to allocate extra memory in the page cache.> It means we don't attempt to track dirtiness at a sub-folio granularity
> (there's no point, we have to write back the entire compressed bock
> at once).  We also get a single virtually contiguous block ... if you're
> willing to ditch HIGHMEM support.  Or there's a proposal to introduce a
> vmap_file() which would give us a virtually contiguous chunk of memory
> (and could be trivially turned into a noop for the case of trying to
> vmap a single large folio).

I don't see this will work for EROFS because EROFS always supports
variable uncompressed extent lengths and that will break typical
EROFS use cases and on-disk formats.

Other thing is that large order folios (physical consecutive) will
caused "increase the latency on UX task with filemap_fault()"
because of high-order direct reclaims, see:
https://android-review.googlesource.com/c/kernel/common/+/3692333
so EROFS will not set min-order and always support order-0 folios.

I think EROFS will not use this new approach, vmap() interface is
always the case for us.

Thanks,
Gao Xiang

> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
