Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BF015B598
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Feb 2020 01:02:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KuwHSjVN1SgX9Csj55cpG1Kac7K3rRFqBiXtJq+ibo=; b=IMOuL7b0uQlMm5Ab8AxWW0Iie8
	AU8IkYDbBP55c4dXXBWqNDzkCqgtUr2b93lPJS7VxrqoYUW3GGsK+ZqRPVKX6nEtdmyl2pkT8xOBI
	wGV6ndDAnqRYI/KkMfxD9crVuh+ke1w/BNLUGYPtofAraI6unI1pvjNFcC1aL3Y49f14=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j21xS-00056q-6x; Thu, 13 Feb 2020 00:02:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <drosen@google.com>) id 1j21xQ-00056j-40
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Feb 2020 00:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1cKEY5t+7UGLMNY+kX0FLiVY/W040LvYDjzlGdRgdPU=; b=fuxw9NGu4R8ktPf73AcmYqpt5z
 rUA9kRdTuebjIC4VIJUfG+0f3X5/iXP6q9Z+sDjLRKxjknPYCC2MlfrEqj8npaYL7ZB3khRfu34Un
 E2EM5p+SyZoh9MRm8F4Zgq/y/TOKvgpAEG6K32MTej6ESoaRHZ8kBG+GCP7z2b+yVnAo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1cKEY5t+7UGLMNY+kX0FLiVY/W040LvYDjzlGdRgdPU=; b=VngjfhUb4WEFJQX94YFBs1v6qX
 /44D3MdoYzlcf8SQWoDDeAAkawppFway2FBLSo/sIwz296MD1scdnpdp3JqCPMt45YPym3GVjN2w+
 MMDw0UD1wF7t7+LCrU7xWxnuKwiFmMAkdt9UXwdiNBcf6VSm8SSnX6mGGqMfQd/cgMdQ=;
Received: from mail-lf1-f67.google.com ([209.85.167.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1j21xO-00AIrU-9m
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Feb 2020 00:02:16 +0000
Received: by mail-lf1-f67.google.com with SMTP id y19so2877194lfl.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Feb 2020 16:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1cKEY5t+7UGLMNY+kX0FLiVY/W040LvYDjzlGdRgdPU=;
 b=RWMKeXpeGH42+rpaTBaY7XsCjlCSDu3yJVkKUXDmdy4hkiakoosIZZ+d6uVCYzDWDO
 5iDnrZGxcIKb+OHP+CZIph9gqmrhIvdOCh83QjoFOz+7B10tPAayX01fsmMvjpokoX0b
 AH5PlkrZr2ScnDuRrZT5ZrELJuBK0rOOsQit0eMG6DfcghkgL8Ve4+nywycY5ATpb5+M
 RAGz01B0puB+TR2LJREbJOM+s0lFCZ+xPZHUVcuAJgdJ5cIfZFz846DWzIe8TbgqLBsY
 xjCVqGIlPd6DqGjVSKCe+3wczgidrU0xrXzv+jjs0MJ23BXdYAAGrVrkYUFxaxA76ALS
 dbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1cKEY5t+7UGLMNY+kX0FLiVY/W040LvYDjzlGdRgdPU=;
 b=Gq38NTVXJwM21roYafecbi0A+eQ/EoZEiBYeGvHInkQV6QyhYhAXDSYv56bhYnHi0q
 l36dZ2qwwBX9giVfGJg568aT3kG8S8SI7qe2+cLI1KVfokuuKMl2Pd3Xrac8rAZtftmH
 kBScbEav+U5LLgmHW0dSshKdzAkiS2S9hvKYTIWz30EtGU7rnnUXcdW7kKgtM59+ha2F
 hNl3fXb9k+a8bPu9h9R/5RtaHe40I3WtZND3KShPyFskl9yPuPI4RIWy/2B45Y6W1nwf
 E/zMNFwpyRbEqVhglGJxiXe4otGYIafXYDCdxnDTsWbIWI2iIDZlWX1uaFLj1VAL+Lw2
 KAKA==
X-Gm-Message-State: APjAAAUpGTJMkLbgkf6cdrjVEQiBdW3YeJ3dzdFfX6hV18ky4khHtHob
 CLhY/yeISavLKq0zcDmVD4PLLrpNSTslZMlPtauF9A==
X-Google-Smtp-Source: APXvYqx8tFG5jjHLonQJ8VXqCYuU/q3EHBj9Gtz8fRGkf+RG/SmbKainaG6ZMk409GO5DMimCh3Q4tyg2oufzLGpEck=
X-Received: by 2002:a05:6512:2035:: with SMTP id
 s21mr7421997lfs.99.1581552127242; 
 Wed, 12 Feb 2020 16:02:07 -0800 (PST)
MIME-Version: 1.0
References: <20200208013552.241832-1-drosen@google.com>
 <20200212061217.GK870@sol.localdomain>
In-Reply-To: <20200212061217.GK870@sol.localdomain>
Date: Wed, 12 Feb 2020 16:01:56 -0800
Message-ID: <CA+PiJmTS2fnCPwFnDimvTxZynaxAB1_mrYeTWySVvpbW_wA-mA@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -15.8 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.67 listed in wl.mailspike.net]
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j21xO-00AIrU-9m
Subject: Re: [f2fs-dev] [PATCH v7 0/8] Support fof Casefolding and Encryption
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: kernel-team@android.com, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Feb 11, 2020 at 10:12 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Feb 07, 2020 at 05:35:44PM -0800, Daniel Rosenberg wrote:
> > Support fof Casefolding and Encryption
>
> You should fix the typo in the subject in the next version.  I assumed you'd
> notice, but both v6 and v7 have this...
>
> - Eric

Yeah, noticed just after I sent v7 :'(


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
