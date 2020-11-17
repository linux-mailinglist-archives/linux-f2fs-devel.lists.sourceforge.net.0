Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 729202B6B03
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Nov 2020 18:04:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kf4PQ-0006YR-U9; Tue, 17 Nov 2020 17:04:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kf4PP-0006YJ-4B
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 17:04:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LgH0rII62okEeBVRpbUIaAa4lZCIAFlax3ntlfKVzNk=; b=fObN1UBcVAEC3oBUclE4vAVCoV
 dXTRF7M3PUD6GQlZsJyN+QqZfdhteKrY4ckItWo8MOoHRdZdXK/5JBny0Vt6xgKEaO0Q6vNmocWwL
 HHh9KNPjGuSytkGO2Nl25tmYGusPtUtSSgsPuilg3IULN3+rFp08PiX6r24F9zTjCeQw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LgH0rII62okEeBVRpbUIaAa4lZCIAFlax3ntlfKVzNk=; b=iLY0EkzPi5DupCseE6WFQHkgfz
 Eu036JVgR6E3dyGKCyoUoHK2xM1h/IKD1P76K0liGP7iYxsZ/fsTvx3ngTu1xSdJlinP0k1WcD30z
 28Vtvb/Fqn4CeDIMF+6Rk8M6Hy9hOFvG4b29ehZzAR5hZoK259UK6oc2exB2HnLPkqgU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kf4P8-00ApiI-82
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 17:04:46 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9438122447;
 Tue, 17 Nov 2020 17:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605632654;
 bh=RI02fUAgmCDGR1I9KhbEZKJySeezxBuuog/z0BglPjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DBjGqfkcNFh7VnYo3RQNdBge1TQ+YYC4YKNDLYI8nPndHth5oUkMgNCidgSm2Hu0u
 KLA2crWMx3LsXcgN+T8C26/Kt+F8ujLobWFjlbLjJfxmDID5V1znx5uEEnL0pL3olq
 21GDqIO5jmYr1HGyy4Cx80uxW0RI1rifflYbZMYQ=
Date: Tue, 17 Nov 2020 09:04:11 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20201117170411.GC1636127@google.com>
References: <20201117040315.28548-1-drosen@google.com>
 <20201117040315.28548-3-drosen@google.com>
 <20201117140326.GA445084@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117140326.GA445084@mit.edu>
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 2.4 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kf4P8-00ApiI-82
Subject: Re: [f2fs-dev] [PATCH v2 2/3] fscrypt: Have filesystems handle
 their d_ops
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
Cc: kernel-team@android.com, Daniel Rosenberg <drosen@google.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/17, Theodore Y. Ts'o wrote:
> On Tue, Nov 17, 2020 at 04:03:14AM +0000, Daniel Rosenberg wrote:
> > This shifts the responsibility of setting up dentry operations from
> > fscrypt to the individual filesystems, allowing them to have their own
> > operations while still setting fscrypt's d_revalidate as appropriate.
> > 
> > Most filesystems can just use generic_set_encrypted_ci_d_ops, unless
> > they have their own specific dentry operations as well. That operation
> > will set the minimal d_ops required under the circumstances.
> > 
> > Since the fscrypt d_ops are set later on, we must set all d_ops there,
> > since we cannot adjust those later on. This should not result in any
> > change in behavior.
> > 
> > Signed-off-by: Daniel Rosenberg <drosen@google.com>
> 
> Acked-by: Theodore Ts'o <tytso@mit.edu>

Hi Ted/Richard,

I'd like to pick this patch series in f2fs/dev for -next, so please let me know
if you have any concern.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
