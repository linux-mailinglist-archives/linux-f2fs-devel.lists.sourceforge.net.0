Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E2040011F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Sep 2021 16:17:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mMA0H-0005iA-Nj; Fri, 03 Sep 2021 14:17:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <greg@kroah.com>) id 1mMA0G-0005i2-17
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Sep 2021 14:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ou2miFBf0Z/Mek7c6HsqgdNghxW0xkCyTnhz5o626Y8=; b=ex3LlqivZ3MfGI+U49u7lZFV6A
 +ssd4lxCWgDPH2PisiylFZVdzvIgedsOc/qajCREDlq7sFsynPi+8Eft7VifC7WDAzmD6FMmKji7w
 7n3AcOSUMPiivdaTp7of5LwOthzymsQoENbz9st8vjB6iF9120sDQAizddhkgj6BO0Ks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ou2miFBf0Z/Mek7c6HsqgdNghxW0xkCyTnhz5o626Y8=; b=EUb6ty9RYNMv9kZpzfhf15tnzg
 mucnNsRfWOb5SniCAqURfto4GlmfmHjsNa467veuwvK4/iUj1KPP9ug6T59Z/ondjw8k+pclvbM2r
 HlY3GUD7JUFrgOpTr3N1C67y+MgK8Xy9tVRpUuC9wUd2gU577Ibl0BfOWcLV0gjupbWY=;
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mMA0D-00086L-Qe
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Sep 2021 14:17:11 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id B69662B01266;
 Fri,  3 Sep 2021 09:57:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 03 Sep 2021 09:57:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ou2miFBf0Z/Mek7c6HsqgdNghxW
 0xkCyTnhz5o626Y8=; b=ujmvwFns1pMZ57Jl79UjlA3tREURGfhBIfb9nj7Xna8
 LCCZ4jAIls9dKj64uPgX3j6A2Eqhimi6wKQd7yXicr4bCgyWDkekkceVCjekx1dC
 jp4tQ35JTalEpBdn5S45k9r2kj9vQC/AMThtr6El6uKjz16BImd8xbkJxvh6G0KF
 tP5xUPYQwkOLrM5E8P/0cdcJFRhjWy8atNaLCsv9QR+l7ncMX2moOETnG1KEvRUF
 JLwPxYuGJl3aht2U4Y1hXwpUQreodEgTww7BsW+aO6Yn2lZB8vTDySnB38ZzdPBg
 7o+P2417ibAdq7D/ZU9xjjFfK5WhN8NccSoRwNh7qYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ou2miF
 Bf0Z/Mek7c6HsqgdNghxW0xkCyTnhz5o626Y8=; b=RfSgwpmViTbjmEQiDkUbqM
 DEU0pQCf+sDaSdLie8qCH3a8qkxA6uxumJlPny74Hcky7774It0TMrK2dWn1TFrw
 RN9Ny50Scw0acuFxJuKA2/cUokR27N3FdtP+Aa0nH093PSgzs500eYQDyYxXLTT1
 D618M0GTgjc3LgwgPsk6Gkdkp2NT09Fd2dp1uZ2lPYltQfaVM8jyqihPSmxM5lbu
 iDpbI0Ww7P2RdLt8fQTAQjLK960k+Amvp1i+xLzI3Jhigl770Pew4po6sZ7jAdU+
 jj7YzYU1I6EQlSpcIuKSOCcbq820bD6IHGF1fia4LzR5lZPGv2HyUf5ymCJYCkOg
 ==
X-ME-Sender: <xms:uCkyYf2a-zGiwsDzkrR3pjixUG_0I4bNcs-yKnPgre8rucTh6CI9ZA>
 <xme:uCkyYeFnkuRkQ1h0YchVeS7JfWgXtEwjUOid2OhnPiPcD-RuH7UrDJZ1y7TqJl-rB
 sZd60JpLJiBLg>
X-ME-Received: <xmr:uCkyYf64drTwrzWB2BXX4CBR3jP-q084OGpy4fMYNxakIQXbrBYuDQ2wTZnN72ejEoqIS0BuZwf8NjgG_8uM8izUzW6IzvcW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvjedgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
 fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
 drtghomh
X-ME-Proxy: <xmx:uCkyYU1kzJNRa0MFr0hspEjs0xuHuRuWYFVgrO2V9_Suo-8TN3gMQQ>
 <xmx:uCkyYSGnYwl5Q2AUUcgPJpO1bLT4Y_12Xx1PdiNVjtrlovwLoKz3fw>
 <xmx:uCkyYV9r6Lh_cUyVg9LJ62hfOuhpPJKeW69cXZlEIfnBdepf5V_-yQ>
 <xmx:uSkyYa9D9tQwAWiYU1pcksmD8tEVt3tsODE05e5cKq4_ViO9j_q-6qpGz6A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Sep 2021 09:57:11 -0400 (EDT)
Date: Fri, 3 Sep 2021 15:57:09 +0200
From: Greg KH <greg@kroah.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YTIptf2dFHf9sSIY@kroah.com>
References: <20210901164041.176238-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210901164041.176238-1-ebiggers@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mMA0D-00086L-Qe
Subject: Re: [f2fs-dev] [PATCH 5.4 0/4] backport fscrypt symlink fixes to 5.4
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

On Wed, Sep 01, 2021 at 09:40:37AM -0700, Eric Biggers wrote:
> This series backports some patches that failed to apply to 5.4-stable
> due to the prototype of inode_operations::getattr having changed in
> v5.12, as well several other conflicts.  Please apply to 5.4-stable.
> 
> Eric Biggers (4):
>   fscrypt: add fscrypt_symlink_getattr() for computing st_size
>   ext4: report correct st_size for encrypted symlinks
>   f2fs: report correct st_size for encrypted symlinks
>   ubifs: report correct st_size for encrypted symlinks
> 
>  fs/crypto/hooks.c       | 44 +++++++++++++++++++++++++++++++++++++++++
>  fs/ext4/symlink.c       | 11 ++++++++++-
>  fs/f2fs/namei.c         | 11 ++++++++++-
>  fs/ubifs/file.c         | 12 ++++++++++-
>  include/linux/fscrypt.h |  7 +++++++
>  5 files changed, 82 insertions(+), 3 deletions(-)
> 
> -- 
> 2.33.0
> 

All now queued up, thanks.

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
