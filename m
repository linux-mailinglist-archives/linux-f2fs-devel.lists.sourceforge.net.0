Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB6F2E7AB1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Dec 2020 16:51:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kudlO-0006NH-2t; Wed, 30 Dec 2020 15:51:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <greg@kroah.com>) id 1kudlM-0006N9-Lq
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Dec 2020 15:51:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TUh6I4m1JvbyJsLFtp/BvpmkKztUH2S21H/iXrSq0fM=; b=UFL277Zg4Hj7z1YFZ/v0fSrPha
 YBeMNYwXH650HFiUgLygs6Ya0tYDE5Ql8MzR31LW8R5nYbI0L4X61blCV92+ZxlqG4VvJKlKEarSY
 NlCAOGkd2+Y6IvbTsHIQAEiEC3dAkCL0OnwpsXWq2OQKWZKDbQzVEuyIqi9yyUwGvvVY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TUh6I4m1JvbyJsLFtp/BvpmkKztUH2S21H/iXrSq0fM=; b=GERzdunjmxfZrO54ot5kCNJQMg
 8yctB5Z1JMmu7PrCc7xYPHxLzsHjNJ7tjD43hVZ6ogBA7BE4JRe0qtV12LAc6CglGfcYTtl0YYkWc
 sFn70cHWcIy9nAA0nxopPCDT0K51c+XMISwzcuWlG9Jfyza0cHmM5N9yqFSFGx2RucwM=;
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kudl9-00DEFr-0p
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Dec 2020 15:51:48 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DDA835C0050;
 Wed, 30 Dec 2020 10:40:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 30 Dec 2020 10:40:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=TUh6I4m1JvbyJsLFtp/BvpmkKzt
 UH2S21H/iXrSq0fM=; b=fC2b8kuGxkYN25j38l4T1hM7YfsaWsYYnMdSd3YzAxh
 E+oK9iXfq7gSmAr0jUL9mXRC7ifw/CTSpgvS4ezzfuXC8B0W2kie/oF+Zpz5j2LC
 8fPuWEKibQWRTGIDU8FCJwbZa3erXonHicXVqU87mn3t3powtNWag+OG4KH7CmaS
 1Agl2p/ncBC7u4zOmvTsbse6j3vjaNSZpoOQf1txMc/az9zZGvIvpwmMPeef3ygz
 6mSa2pdf4cvAMMiLjwtH4SMZnsIj0GA0AUWL8qFaXKMRWLlE8cNVImC/iJC/j9S+
 Ht6Ed2l+m2mlxx7lHzcLA2oyin7xwkSFblLYPviypAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TUh6I4
 m1JvbyJsLFtp/BvpmkKztUH2S21H/iXrSq0fM=; b=HDUL2fOmiQDsI4ICwphH0r
 DuJBTY23LWvMzlF5ovC+UXhajqxYu4Z2FrS3t0BPOCa+/6FcUX3T8zZdFdoknMZ6
 ZeY0HRMsHAnYVbOCIhs/DrisKleu7Jg4jVilcgYYDs5IwevNLCXgzg6MgXfQV3aY
 OFRn4nmiYav9USHAn6yYl9uv5IRHl+QqY1WHUXi4urzVodcBYJ87hp7AZPm41ZvD
 rZOpA2tVKSX3tnSqrYsrm2SvLOHzvQssJGokWyUP3jpm+LYLRJxG7vmc6N086c5u
 r2FFwLYGC5ZnR2N5e4XeLE5eFZ4XBapQd7Qs6LBkW7NW5bEPPKDdTrJNteJbhTwA
 ==
X-ME-Sender: <xms:hZ_sXwHJUNPS0i4kHsH_QK8k8dgXc3pLL1vaMxUXpp2s82YD9luk_w>
 <xme:hZ_sX5WX3gDMQll5DiZPlFwVNLWpqS7IMzzU9uXKxQ_JFchrNjAzqFc_KkvN1QKm1
 NonB2jU2s3ALw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddvfedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
 fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
 rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:hZ_sX6LAskXaoKj4_vWCT_zBHoHsqIVU9VuHXVjL3p8DruujsfiIEA>
 <xmx:hZ_sXyH9aJw6NwnByZ266ILSTOuNylj6hEioPI-tJ_M__RuydFP9zQ>
 <xmx:hZ_sX2UxzyBJ03q7cqxEpEqYIHQhZLCIAPWhepxWG-T4GIS2R-kXuA>
 <xmx:hZ_sX1SfwLxtUsOueKFlLfxpnBexUpfVVeCxIrRkMMn5OSmMOaD37Q>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id EF6AE24005B;
 Wed, 30 Dec 2020 10:40:52 -0500 (EST)
Date: Wed, 30 Dec 2020 16:42:15 +0100
From: Greg KH <greg@kroah.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <X+yf12YbaUciBwwf@kroah.com>
References: <20201228191211.138300-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201228191211.138300-1-ebiggers@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [66.111.4.28 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kudl9-00DEFr-0p
Subject: Re: [f2fs-dev] [PATCH 4.19 0/4] fscrypt: prevent creating duplicate
 encrypted filenames
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Dec 28, 2020 at 11:12:07AM -0800, Eric Biggers wrote:
> Backport four commits from v5.11-rc1.  I resolved conflicts in the first
> two.
> 
> Eric Biggers (4):
>   fscrypt: add fscrypt_is_nokey_name()
>   ext4: prevent creating duplicate encrypted filenames
>   f2fs: prevent creating duplicate encrypted filenames
>   ubifs: prevent creating duplicate encrypted filenames
> 
>  fs/crypto/hooks.c               | 10 +++++-----
>  fs/ext4/namei.c                 |  3 +++
>  fs/f2fs/f2fs.h                  |  2 ++
>  fs/ubifs/dir.c                  | 17 +++++++++++++----
>  include/linux/fscrypt_notsupp.h |  5 +++++
>  include/linux/fscrypt_supp.h    | 29 +++++++++++++++++++++++++++++
>  6 files changed, 57 insertions(+), 9 deletions(-)
> 
> -- 
> 2.29.2
> 

All now queued up, thanks.

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
