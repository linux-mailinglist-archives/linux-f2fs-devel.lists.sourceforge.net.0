Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 287E9EF1C1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2019 01:16:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iRmW6-0005VS-Lj; Tue, 05 Nov 2019 00:16:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+7c6de30aaaef4530855f+5917+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1iRmW5-0005VB-0c
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 00:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PB5HQUvvZxyBZb4Ejg+q/x3xzJuV7N+HQbCbu+unv+0=; b=RpL3p6P2uPtx5Vo0yiDyGF9Sdj
 /WaQu+3QzZd1mwTAJ+/TyvWKQkMmzb8NlAIP/+R8e70EF3fL7bEbCOyy+V8IJU6pKdXgMjINEno98
 cny8Zxz0djjKW3UvRS4JdgySKHXgQ4XXnOCRvoNMbjcA6LbvG01W9x8cGgbpBIIVtzOs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PB5HQUvvZxyBZb4Ejg+q/x3xzJuV7N+HQbCbu+unv+0=; b=OVqR1XwnD6vYxYoSW7y3rORGAU
 ej6mWLkRX/yqJ1w4alSxO+rfvOHImRPDJTndyimvyCEMLNpdQuVooLuT7rJ5bx1Fbdedx4ofp5lQv
 oQXdc3ZY5c0pjYcTF+1jBcS87D3SYR19N2/YjYVE6mt0+S977w1J/WKilpZQ6ttTAa8c=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iRmW3-000Be7-1Y
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 00:16:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PB5HQUvvZxyBZb4Ejg+q/x3xzJuV7N+HQbCbu+unv+0=; b=S9XLLNCE02ttojyiaFqQGJPd+
 3s84mPXpZI76hh/SNRn82LlHluiylXsGvGmjh4m4wCeVpr2UWyYPVjMz4ahc8Swt4TPUWCGU95Vg6
 jnud28rL1LRio73jpWH6qwUlTazS+gfzWm8Ey/WxekCHPIew8C7UBMRuf4I25xBaJMBmYfUNdgyLo
 Bj1Q5c0+Cak9K/JBkbW0qCcq2Xp8oUU+3yT008kxee+Whx1bMe6GySLfQPFeVo0G+gM5X9lAdQmf4
 uMOfHdjJ7q8BO8wOcprWDQ1MsgwqDh6cGwU+rhTstPOhZ3IDg3lWUSn59lFva9tf+T94GJ1LUz+ue
 7S8cJf3MA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iRmVm-0007jP-Nj; Tue, 05 Nov 2019 00:15:54 +0000
Date: Mon, 4 Nov 2019 16:15:54 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Christoph Hellwig <hch@infradead.org>,
 Satya Tangirala <satyat@google.com>, linux-scsi@vger.kernel.org,
 Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
Message-ID: <20191105001554.GA24056@infradead.org>
References: <20191028072032.6911-1-satyat@google.com>
 <20191028072032.6911-8-satyat@google.com>
 <20191031183217.GF23601@infradead.org>
 <20191031202125.GA111219@gmail.com>
 <20191031212103.GA6244@infradead.org>
 <20191031222500.GB111219@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191031222500.GB111219@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 RATWARE_EFROM          Bulk email fingerprint (envfrom) found
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iRmW3-000Be7-1Y
Subject: Re: [f2fs-dev] [PATCH v5 7/9] fscrypt: add inline encryption support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Oct 31, 2019 at 03:25:03PM -0700, Eric Biggers wrote:
> It's more important to clean up the IS_ENCRYPTED(inode) &&
> S_ISREG(inode->i_mode) checks that are duplicated in fs/{ext4,f2fs}/, so I've
> been thinking of adding a helper:
> 
> static inline bool fscrypt_needs_contents_encryption(const struct inode *inode)
> {
>         return IS_ENABLED(CONFIG_FS_ENCRYPTION) && IS_ENCRYPTED(inode) &&
>                S_ISREG(inode->i_mode);
> }

Sounds fine.

> I don't think combining these things is a good idea because it would restrict
> the use of inline encryption to filesystems that allow IV_INO_LBLK_64 encryption
> policies, i.e. filesystems that have stable inode numbers, 32-bit inodes, and
> 32-bit file logical block numbers.
> 
> The on-disk format (i.e. the type of encryption policy chosen) and the
> implementation (inline or filesystem-layer crypto) are really two separate
> things.  This was one of the changes in v4 => v5 of this patchset; these two
> things used to be conflated but now they are separate.  Now you can use inline
> encryption with the existing fscrypt policies too.
> 
> We could use two separate SB_* flags, like SB_INLINE_CRYPT and
> SB_IV_INO_LBLK_64_SUPPORT.

Yes, I think that is a good idea.

> However, the ->has_stable_inodes() and
> ->get_ino_and_lblk_bits() methods are nice because they separate the filesystem
> properties from the question of "is this encryption policy supported".
> Declaring the filesystem properties is easier to do because it doesn't require
> any fscrypt-specific knowledge.  Also, fs/crypto/ could use these properties in
> different ways in the future, e.g. if another IV generation scheme is added.

I don't really like writing up method boilerplates for something that
is a simple boolean flag.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
