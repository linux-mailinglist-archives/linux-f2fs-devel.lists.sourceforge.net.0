Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D981D7F2F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 May 2020 18:51:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jaiym-00062V-UX; Mon, 18 May 2020 16:51:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+7f3f0d050cea55e022da+6112+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1jaiyj-00061t-WD
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 May 2020 16:51:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kZ1kt/vvSWLV22qkWN7aKlxZz7wcX+WgFj2oUslFSoQ=; b=aPvHimpg2RmlRBB/0L0QBR7SrS
 u76FNgKZ7qMAsWQJiS349IlazkdiERNnO5b1aN9Gsh3kwcPNJfbhoL8M2BzOBQDYmlVsdqHOyZPMl
 XJS79FFqjhoBz41acwI2XKAZYafS5UpEZhRE0BbpzC+QiIQABCrLVTC1fiKtsVdNd+ZI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kZ1kt/vvSWLV22qkWN7aKlxZz7wcX+WgFj2oUslFSoQ=; b=EofemdYVdltHBS4YLQCFmsJPqF
 yvs6+7PuH6e5BQuG6nY2mwLmXp+FzaTv3MsCZmGTLft4hLK54g6bXvs5xy9tl0hVb9LtC0YLNDbVH
 zVEbZ2RVKfX2AneUw1QjXQBlfu4h6QfT/O4bRHInih0RFSDrh+kufvBxFrIU5xBos2TM=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jaiyh-00EA8X-U2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 May 2020 16:51:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kZ1kt/vvSWLV22qkWN7aKlxZz7wcX+WgFj2oUslFSoQ=; b=j3ozo5YHhZD8k6To6Kx6JYBtFf
 3ro7WFhgIcFxk9sM8YyXJMP1ljUysW3CEYKqKWLP2qaP1VCDz6hG1+RO2o48RMHX57B2pgMWsTRHm
 6qBznsPTqj9W41MCa36Vj34K2scnpByyAH9hk4n4QgEXgqPsfPMqKctkdvqZ7CGVT9Kiu7m2eG0Xg
 Z2S552l1JSMN6/ihF5mjDfESDw9j42b5Dk/ljZbE4GQkDocvWkFANRe792+jf+a62b7+a2MOwkY6h
 9rT/3ag8Svxuei5DS+/8LTm1jF4aabP4NRraZDwyB4/0lNAIu6kjG/Hr6ujWcERiWB5IZCd5yGJ4J
 yiJHceqg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jaiyS-0000NI-EH; Mon, 18 May 2020 16:50:44 +0000
Date: Mon, 18 May 2020 09:50:44 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200518165044.GA23230@infradead.org>
References: <20200514003727.69001-1-satyat@google.com>
 <20200514051053.GA14829@sol.localdomain>
 <8fa1aafe-1725-e586-ede3-a3273e674470@kernel.dk>
 <20200515074127.GA13926@infradead.org>
 <20200515122540.GA143740@google.com>
 <20200515144224.GA12040@infradead.org>
 <20200515170059.GA1009@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515170059.GA1009@sol.localdomain>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jaiyh-00EA8X-U2
Subject: Re: [f2fs-dev] [PATCH v13 00/12] Inline Encryption Support
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-scsi@vger.kernel.org,
 Kim Boojin <boojin.kim@samsung.com>, Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Satya Tangirala <satyat@google.com>, Christoph Hellwig <hch@infradead.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 15, 2020 at 10:00:59AM -0700, Eric Biggers wrote:
> The fallback is actually really useful.  First, for testing: it allows all the
> filesystem code that uses inline crypto to be tested using gce-xfstests and
> kvm-xfstests, so that it's covered by the usual ext4 and f2fs regression testing
> and it's much easier to develop patches for.  It also allowed us to enable the
> inlinecrypt mount option in Cuttlefish, which is the virtual Android device used
> to test the Android common kernels.  So, it gets the kernel test platform as
> similar to a real Android device as possible.
> 
> Ideally we'd implement virtualized inline encryption as you suggested.  But
> these platforms use a mix of VMM's (QEMU, GCE, and crosvm) and storage types
> (virtio-blk, virtio-scsi, and maybe others; none of these even have an inline
> encryption standard defined yet).  So it's not currently feasible.

Not that you don't need to implement it in the hypervisor.  You can
also trivially wire up for things like null_blk.

> Second, it creates a clean design where users can just use blk-crypto, and not
> have to implement a second encryption implementation.

And I very much disagree about that being a clean implementation.  It is
fine if the user doesn't care, but you should catch this before hitting
the block stack and do the encryption there without hardware blk-crypt
support.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
