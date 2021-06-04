Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D88739B533
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jun 2021 10:51:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lp5Y7-0005O4-38; Fri, 04 Jun 2021 08:51:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <greg@kroah.com>) id 1lp5Y1-0005NG-SI
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 08:51:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0QaX15AhSJWfHsnr5gihB3yVDuh8b9trAJVDVBkiUD4=; b=lj0YXl9Nf7og7ASUThHql1Ga75
 XNdPmI91zEP401563ntO6N6AKSa1jHqgmdNbujff1G9j2UxUB30JJAzwXmegSXAYiL9dXd2zdRSUe
 J6m+Y4zEjNGUxP+ylptaz+lNrAoaPrNwCosjGiQz+Vzfygi8RRD6sdE0QQsJbSQ3h+HA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0QaX15AhSJWfHsnr5gihB3yVDuh8b9trAJVDVBkiUD4=; b=Pw+VXFoiv3Efvl8xKcce6r6UN2
 44DXqwudTCr1zN8FF7F10h2UuX5RdkDRFpOG38IS+vVLrIMKhshAmaP9/WpmClzOd1P5KLZDVr941
 WPBTtei9C/xcdfj6bKeYHEXXENYDtiJ3MMZXjUMVqt/Kc9VWJnWyKCCoApRpUCQ/4ElY=;
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lp5Xt-00A3yV-6a
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 08:51:22 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 2FB4B10FD;
 Fri,  4 Jun 2021 04:33:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 04 Jun 2021 04:33:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=0QaX15AhSJWfHsnr5gihB3yVDuh
 8b9trAJVDVBkiUD4=; b=CnkrDlNGkGa4MOf2Cy06uaBzfIbQe7fGKLCuRMAGOi1
 n/iQBiw/FoYn/spSiV5q01C4jk+qfBhD8KvHHfvAlczcbcOgnddxWwrJTf02tbBf
 F1o+LC7edEtdOAjDfxL2sbObcArkCRl4O67uYtFkwmNULRCKbbV7VX9q3zyzqU4N
 oHzG14bnUgMPMJJ7acQqP70B4y/hHDZs80UvKbB2e4K2AXdZJF0qBW55A4VLyZjT
 oH7/8XZwc8FSXKU3CdxFt+J3yLWfi23B1XdWTPPXhXdGTinu+gJakGFiF53uBLLi
 02OlyFztYOsWt7G6aZdzBDoOf3oGft5z9nkp+KZl2HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0QaX15
 AhSJWfHsnr5gihB3yVDuh8b9trAJVDVBkiUD4=; b=G2rVdkeh8vMSGKkpyvbRJt
 5g3hydXtZI85c0lsB9xcDuc1M1HPQQ6F1EmAww/hE8x0nDodsLDrYl5bR+KIp2Ht
 h3TOTJdqCEuz3A2lR711pWzw10nEcRSvEh0D7nOKZz0sSaqb8f3qObGU/Gyx/g9k
 eJpcIIALi9p4nMm/AnoNP8pAfj+1fhJ9JrpM0iQn+zCvKxTCKInURsDhCDxkkscK
 vRue5NBD5qkOFVBD+1FBlqUBhTHAWjhJZD1M1Y2LiuMFPkLrQVQ6gsYgK1BpPDCI
 3aDTPQ1KYQD/pCaAwZYl2JYhTC+xRXPjiieHEDoB94dOqxZWPCJqQYkgXNMllnfQ
 ==
X-ME-Sender: <xms:QuW5YBMFfkAZpEeNW-Y9EAviOKSYjtxM7_J6HQ5i4fss82b3Ls66hA>
 <xme:QuW5YD9XsR3aV32Vx29taDVe7KJYazGG_SkEoEfs4wVkVl12NDfxCD_cBB6ehIsQb
 LG0trTl7Ah3oQ>
X-ME-Received: <xmr:QuW5YAQYWQBZ3fwBNvuGrVaWi_F6OVh6sa0-zGGObjPK7KQH_7MynB_gcbvtn9xgp8DbkLW1sXXEQiAm-pwdy5NCNztoop7r>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtuddgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
 fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
 drtghomh
X-ME-Proxy: <xmx:QuW5YNs9FhIFWoLNTZAMkssAER8XpFd1neOO87s5ONtSB60jIjgZeA>
 <xmx:QuW5YJfcMtvh1Jk2wNEsocJBuzr4bKgz1SNVnL7f94yzqLLPd5Le1w>
 <xmx:QuW5YJ0y8tRQTawilnv76UEWNBGYXis9TxNUUi4X19VxDTAlNbZAqw>
 <xmx:Q-W5YP-HI2XWXwWtpg-fcB6Mde4_azUEyCWDEeRLhhGZtERNLbWFJLxgBoY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jun 2021 04:33:06 -0400 (EDT)
Date: Fri, 4 Jun 2021 10:33:03 +0200
From: Greg KH <greg@kroah.com>
To: David Laight <David.Laight@aculab.com>
Message-ID: <YLnlPxfCVJD+p6/a@kroah.com>
References: <20210603095038.314949-1-drosen@google.com>
 <20210603095038.314949-3-drosen@google.com>
 <YLlj+h4RiT6FvyK6@sol.localdomain> <YLmv5Ykb3QUzDOlL@google.com>
 <4f56f2781fac4b8bac1a78b0fecc318d@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4f56f2781fac4b8bac1a78b0fecc318d@AcuMS.aculab.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lp5Xt-00A3yV-6a
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: Advertise encrypted casefolding
 in sysfs
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
Cc: Daniel Rosenberg <drosen@google.com>,
 "kernel-team@android.com" <kernel-team@android.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Eric Biggers <ebiggers@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 'Jaegeuk Kim' <jaegeuk@kernel.org>,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 04, 2021 at 08:27:32AM +0000, David Laight wrote:
> From: Jaegeuk Kim
> > Sent: 04 June 2021 05:45
> ...
> > > > @@ -161,6 +161,9 @@ static ssize_t features_show(struct f2fs_attr *a,
> > > >  	if (f2fs_sb_has_compression(sbi))
> > > >  		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
> > > >  				len ? ", " : "", "compression");
> > > > +	if (f2fs_sb_has_casefold(sbi) && f2fs_sb_has_encrypt(sbi))
> > > > +		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
> > > > +				len ? ", " : "", "encrypted_casefold");
> > > >  	len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
> > > >  				len ? ", " : "", "pin_file");
> > > >  	len += scnprintf(buf + len, PAGE_SIZE - len, "\n");
> 
> Looking at that pattern, why don't you just append "tag, "
> each time and then replace the final ", " with "\n" at the end.

Again PLEASE NO!

This is not how sysfs is supposed to work and do not perpetuate this
mess in any way.

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
