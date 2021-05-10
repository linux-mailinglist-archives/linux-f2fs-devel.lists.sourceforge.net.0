Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D20993790AE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 16:26:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg6rY-0003PB-5n; Mon, 10 May 2021 14:26:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <me@benboeckel.net>)
 id 1lg6rU-0003Os-Kx; Mon, 10 May 2021 14:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fwXudyHn8IUNsmfHA12W5pUxFzrIcUsJJs6niPOOwGc=; b=eaCIJ0NpIdfpymyPzlILfl5fc2
 E6TxCxvWCP4laqr+aMukk12yb3wopQiW2wvVAscORmmtgbk/L0WlC/rLRr8oKUVTlwWM3+f/gx97Z
 DNF4W1wdFy1iHwfGs1/h4Gy2gPH+8vAQwpbTHTgGk7kfLYdjOLrFfaZMre+2wIG2NyMc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fwXudyHn8IUNsmfHA12W5pUxFzrIcUsJJs6niPOOwGc=; b=mPr1qzuRWWf/YDHzrPy0hJXfbm
 GYREn+oSphHfA8VEnBXJVN0WGC7a+6W9JdDvdAt2a5quLmhpUiDxqwdh97c7huR19LF4bmXGepvDC
 rrdheDqJbxlGr+XTqEJQVB+ZEp2f0p8sVvXoIY7+tp7BVuH0OyMFaQHOBV0CgT15O1UY=;
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lg6rJ-0003N2-MV; Mon, 10 May 2021 14:26:20 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 14AAD5807B2;
 Mon, 10 May 2021 10:00:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 10 May 2021 10:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=fwXudyHn8IUNsmfHA12W5pUxFzr
 IcUsJJs6niPOOwGc=; b=gQh6u0zhPsG//1fbjCgHH3SUq5OZEixVi+ckcNcOvNr
 8f8S6u6OqczboxIeZQzxpdw3AUy1t45vyyuSQKDA1+yJJEqv0Na0yFB8YXQoxGQa
 A5mz/uekXLKQlXSBVpDzZgWHaTwxLQ8cfd/84Seg6MJA86M+DwrG/rxkfmjHnsDx
 Vsn+We4G3Oh5Yvv4HNwlluWEHPMQsGoYqOZqIpzyUGPfcSXaDfcxgaoBasafO20O
 Nia4uZb9+lsHdBKwEogjjnykkTJJzKThWOeq3e2hyjT/F/nLvkiGpnFJ0uMYCJ5w
 yhbph4b45d/9JdizeckN5aTq6WAACtGxOiZQK1Svtuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fwXudy
 Hn8IUNsmfHA12W5pUxFzrIcUsJJs6niPOOwGc=; b=FkYLunR8+bNyojGntZzlTv
 lNhoU5Ih8GFYdgqBiM9GEeBgkR7PC0rd49vKxgNK2oVHYiwvnJ0pFHee6wyNEefG
 07iyoKlPp2/47lNX2/0a3w6XYC3Muan3VrHn9DIyh2AJDD/sq19lwcD+nClmgOGW
 3kjTJut/WH9S1nO20R6vTeVSVeiFhLK/oh1ul5trEQZynTCu46HI2dcf9dXPVKk9
 sOjDpOdiQFUH6B6gq1Emr8rDL+S3scV3gAHdetS1J2hIDO0dgu0hscWNc8fHxaey
 25F3JvGPZJisNAQmAtq62YqH7TCAIzVvBqJwx8rI9Oyho2YDtxrFPxf1S0VsKOTA
 ==
X-ME-Sender: <xms:hDyZYCqZ48w__j-3J2DdcFFyCNO8Px1wZAdweI2vgyXQ5g_1A_avfw>
 <xme:hDyZYAoPMp-2hhXE5dIuFZVKJLDFR-LeVjsu56BtdhTJGnUi8Md4Pqb1pnf9Vqqdn
 t02Gw-Ku9S6gnwxX4I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegkedgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttderjeenucfhrhhomhepuegvnhcu
 uehovggtkhgvlhcuoehmvgessggvnhgsohgvtghkvghlrdhnvghtqeenucggtffrrghtth
 gvrhhnpeevffdtteetgfdttdekueefgedttddtueeugeekgeetffeuteffjeduieehhfek
 tdenucfkphepvdegrdduieelrddvtddrvdehheenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmvgessggvnhgsohgvtghkvghlrdhnvght
X-ME-Proxy: <xmx:hDyZYHO7a0I2ObO3iNQCJFMynfyvzQSxH3x8A4ShPc13xjvG6wh63A>
 <xmx:hDyZYB6OL9_iqJiCXEkFvw1uMnu0UHjkSyxn6Irx0qOidEFWAmkwbA>
 <xmx:hDyZYB472gSq8MYTawlNh6oofIzwaZQvJxltEegElvbnNVF17UiCaA>
 <xmx:hjyZYNFuZhUi4dOrdPamnliiTh3owe6Tf-ewK9C2k9SXGvHlGfVlTg>
Received: from localhost (unknown [24.169.20.255])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 10 May 2021 10:00:35 -0400 (EDT)
Date: Mon, 10 May 2021 10:00:34 -0400
From: Ben Boeckel <me@benboeckel.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <YJk8gkMlk8dtaEsz@erythro.dev.benboeckel.internal>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
 <20210510135518.305cc03d@coco.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210510135518.305cc03d@coco.lan>
User-Agent: Mutt/2.0.5 (2021-01-21)
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
X-Headers-End: 1lg6rJ-0003N2-MV
Subject: Re: [f2fs-dev] [PATCH 00/53] Get rid of UTF-8 chars that can be
 mapped as ASCII
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, keyrings@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, x86@kernel.org, linux-acpi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-sgx@vger.kernel.org, coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-integrity@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, May 10, 2021 at 13:55:18 +0200, Mauro Carvalho Chehab wrote:
>     $ git grep "CPU 0 has been" Documentation/RCU/
>       Documentation/RCU/Design/Data-Structures/Data-Structures.rst:| #. CPU 0 has been in dyntick-idle mode for quite some time. When it   |
>       Documentation/RCU/Design/Data-Structures/Data-Structures.rst:|    notices that CPU 0 has been in dyntick idle mode, which qualifies  |

The kernel documentation uses hard line wraps, so such a naive grep is
going to always fail unless such line wraps are taken into account. Not
saying this isn't an improvement in and of itself, but smarter searching
strategies are likely needed anyways.

--Ben


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
